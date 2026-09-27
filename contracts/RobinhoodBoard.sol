// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

contract RobinhoodBoard is ERC721, Ownable, ReentrancyGuard {
    uint256 public constant MAX_BLOCKS=10_000;
    uint256 public immutable blockPrice;
    string private _baseTokenURI;

    event BlockPurchased(address indexed buyer,uint256 indexed blockId,uint256 price);

    constructor(uint256 _blockPrice,string memory baseURI_,address treasury_)
        ERC721("Robinhood Board","RHBOARD") Ownable(treasury_) {
        require(_blockPrice>0,"Price must be > 0");
        blockPrice=_blockPrice;
        _baseTokenURI=baseURI_;
    }

    function buyBlocks(uint256[] calldata blockIds) external payable nonReentrant {
        require(blockIds.length>0,"No blocks selected");
        require(msg.value==blockPrice*blockIds.length,"Incorrect ETH amount");

        for(uint256 i=0;i<blockIds.length;i++){
            uint256 id=blockIds[i];
            require(id>=1 && id<=MAX_BLOCKS,"Invalid block");
            require(_ownerOf(id)==address(0),"Block already owned");
            _safeMint(msg.sender,id);
            emit BlockPurchased(msg.sender,id,blockPrice);
        }
    }

    function withdraw() external onlyOwner nonReentrant {
        (bool ok,)=payable(owner()).call{value:address(this).balance}("");
        require(ok,"Withdraw failed");
    }

    function setBaseURI(string calldata newBaseURI) external onlyOwner {
        _baseTokenURI=newBaseURI;
    }

    function _baseURI() internal view override returns(string memory){
        return _baseTokenURI;
    }
}
