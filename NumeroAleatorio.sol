// SPDX_License-Identifier: MIT
pragma solidity ^0.6.6;

import "smartcontractkit/chainlink-brownie-contracts@1.0.2/contracts/src/v0.6/VRFConsumerBase.sol";


contract NumeroAleatorio is VRFConsumerBase {

    // Chainlink node.
    bytes32 internal key_hash;

    // Fee in LINK for Chainlink use.
    uint256 internal fee;

    // Random number we get from Chainlink smart contract.
    uint256 public random_number;


    // --------------------------------------------------------------------------------
    // Constructor padre. Es el constructor del contrato de Chainlink VRFConsumerBase
    // --------------------------------------------------------------------------------
    /* 
    * @param _vrfCoordinator address of VRFCoordinator contract
    * @param _link address of LINK token contract
    *
    * @dev https://docs.chain.link/docs/link-token-contracts
    */
    /* 
    constructor(address _vrfCoordinator, address _link) public {
        vrfCoordinator = _vrfCoordinator;
        LINK = LinkTokenInterface(_link);
    } 
    */
    // --------------------------------------------------------------------------------
    


    // El constructor de nuestro contrato, llama al constructor del contrato de Chainlink que importamos.

    /* 
    Aquí están los parámetros a pasar para la red Rinkeby:
    https://docs.chain.link/docs/vrf-contracts/ 
    */

    constructor() VRFConsumerBase(0xb3dCcb4Cf7a26f6cf6B120Cf5A73875B7BBc655B, 0x01BE23585060835E02B77ef475b0Cc51aA1e0709) public {
        key_hash = 0x2ed0feb3e7fd2022120aa84fab1945545a9f2ffc9076fd6156fa96eaff4c1311;
        fee = 0.1 * 10 ** 18; // 0.1 LINK
    }



    /* 
    ---------------------------------------------------------------------------------------------------------------------------------
    Esta es la función que hace la solicitud al contrato de Chainlink, 
    para que dicho contrato mande un número aleatorio a este contrato, llamando a la función callback (más abajo) fulfillRandomness. 
    ---------------------------------------------------------------------------------------------------------------------------------
    */
    
    function requestRandomNumber(uint256 userProvidedSeed) public returns (bytes32 requestId) {
        // Para hacer la llamada al contrato de Chainlink es necesario que este contrato tenga una cantidad de tokens LINK mínima,
        // que debe ser al menos lo que vale la fee.

        // LINK = address of LINK token contract. 
        require(LINK.balanceOf(address(this)) >= fee, "No hay suficiente cantidad de Token LINK en este contrato para hacer la llamada a Chainlink.");

        // Se llama a la función del contrato de Chainlink que halla un número aleatorio.
        return requestRandomness(key_hash, fee, userProvidedSeed);
    }



    /* 
    ---------------------------------------------------------------------------------------------------------------------------------
    Callback function used by VRF Coordinator.
    ---------------------------------------------------------------------------------------------------------------------------------
   
    The function that receives and does something with verified randomness. 
    */
    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        random_number = randomness;
    }

    
}