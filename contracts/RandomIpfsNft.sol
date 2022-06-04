// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.7; 

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol"; 
 
contract RandomIpfsNft is ERC721URIStorage {
    
    // i_ reminds that it's an immutable variable, gax inexpensive 
    // immutable: defines one time, not again 
    VRFCoordinatorV2Interface immutable i_vrfCoordinator;
    bytes32 immutable i_gasLane;
    uint64 immutable i_subscriptionId; 
    uint32 immutable i_callbackGasLimit; 

    // how many additional blocks to be completed 
    uint16 constant REQUEST_CONFIRMATIONS = 3;
    uint32 constant NUM_WORDS = 1; // number of random numbers to get (per puppy call)
    uint256 MAX_CHANCE_VALUE = 100; 

    mapping(uint256 => address) s_requestIdToSender; 
    string[3] s_dogTokenUris; 

    uint256 s_tokenCounter;

    constructor(
        address vrfCoordinatorV2, 
        bytes32 gasLane, 
        uint64 subscriptionId, 
        uint32 callbackGasLimit, 
        string[3] memory dogTokenUris
    ) ERC721("Random IPFS NFT", "RIN") VRFConsumerBaseV2(vrfCoordinatorV2){
        i_vrfCoordinator = VRFCoordinatorV2Interface(vrfCoordinatorV2); 
        i_gasLane = gasLane;
        i_subscriptionId = subscriptionId; 
        i_callbackGasLimit = callbackGasLimit;
        s_tokenCounter = 0; 
        s_dogTokenUris = dogTokenUris;
        // 0 st. bernard
        // 1 pug 
        // 2 shiba inu 
    }

    // mint a random puppy
    function requestDoggie() public returns (uint256 requestId){
        requestId = i_vrfCoordinator.requestRandomWords(
           // price per gas
           i_gasLane,
           i_subscriptionId,
           REQUEST_CONFIRMATIONS,
           // max gas amount
           i_callbackGasLimit,
           NUM_WORDS
        );
        s_requestIdToSender[requestId] = msg.sender; 
    }

    // callback 
    function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords) internal override{
        // owner of the dog
        address dogOwner = s_requestIdToSender[requestId]; 
        // assign this NFT a tokenId
        uint256 newTokenId = s_tokenCounter; 
        s_tokenCounter = s_tokenCounter + 1;
        // did we get a random dog? 
        // is it super random? 
        // random # % 100
        // get the breed? 
        // 0 - 99 
        uint256 moddedRng = randomWords[0] % MAX_CHANCE_VALUE; 
        uint256 breed = getBreedFromModdedRng(moddedRng);
        _safeMint(dogOwner, newTokenId);
        // set tokenURI 
        _setTokenURI(newTokenId, s_dogTokenUris[breed]); 
    }

    function getChanceArray() public pure returns(uint256[3] memory){

        // 0-9 = st. bernard
        // 10-29 = pug 
        // 30-99 = shiba inu 
        return [10, 30, MAX_CHANCE_VALUE]; 
    }

    function getBreedFromModdedRng(uint256 moddedRng) public pure returns (uint256){
        uint256 cumulativeSum = 0; 
        uint256[3] memory chanceArray = getChanceArray();
        for(uint256 i = 0; i < chanceArray.length; i++){
            if(moddedRng >= cumulativeSum && moddedRng < cumulativeSum + chanceArray[i]){
                // 0 = st. bernard
                // 1 = pug
                // 2 = shiba inu
                return i; 
            } 
            cumulativeSum = cumulativeSum + chanceArray[i];
        }
    }

} 