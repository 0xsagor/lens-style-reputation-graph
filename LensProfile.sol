// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title LensProfile
 * @dev Represents a user's identity and social standing.
 */
contract LensProfile is ERC721Enumerable, Ownable {
    uint256 public nextProfileId;
    
    struct Profile {
        string handle;
        string imageURI;
        uint256 followCount;
    }

    mapping(uint256 => Profile) public profiles;
    mapping(string => uint256) public handleToId;

    event ProfileCreated(uint256 indexed id, string handle);

    constructor() ERC721("Social Profile NFT", "PROF") Ownable(msg.sender) {}

    function createProfile(string calldata _handle, string calldata _imageURI) external {
        require(handleToId[_handle] == 0, "Handle taken");
        
        uint256 id = ++nextProfileId;
        profiles[id] = Profile(_handle, _imageURI, 0);
        handleToId[_handle] = id;
        
        _safeMint(msg.sender, id);
        emit ProfileCreated(id, _handle);
    }

    function incrementFollowers(uint256 _id) external {
        // In production, restricted to FollowModule
        profiles[_id].followCount++;
    }
}
