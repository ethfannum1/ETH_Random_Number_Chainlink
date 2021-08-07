# This is an example of using Chainlink to get a random number. 

Remember I accept BAT Token tips. Use Brave Browser! Thanks.


[![](https://github.com/ethfannum1/ETH_Random_Number_Chainlink/blob/main/1.png)](https://github.com/ethfannum1/ETH_Random_Number_Chainlink/blob/main/1.png)

[Chainlink Doc](https://docs.chain.link/docs/chainlink-vrf/ "Chainlink Doc")

To generate random numbers in the smart contract, the Chainlink VRF (Verifiable Random Function) function is used,
which is basically another smart contract that coordinates the information from different nodes that provide random numbers.

The Rinkeby testnet will be used.
To do this, you must have access to a Rinkeby node.


------------

We will use Brownie framework to compile and deploy our smart contract.

[![](https://github.com/ethfannum1/ETH_Random_Number_Chainlink/blob/main/2.png)](https://github.com/ethfannum1/ETH_Random_Number_Chainlink/blob/main/2.png)


------------

This contract has to have a minimum amount of LINK token in order to work: to be able to call the Chainklink contract and make it work.

First we access Rinkeby Testnet using Brownie.

[![](https://github.com/ethfannum1/ETH_Random_Number_Chainlink/blob/main/paso1.jpg)](https://github.com/ethfannum1/ETH_Random_Number_Chainlink/blob/main/paso1.jpg)

Next we need to declare a variable that holds our account data we are gonna use to deploy our contract NumeroAleatorio.sol.

[![](https://github.com/ethfannum1/ETH_Random_Number_Chainlink/blob/main/paso2.jpg)](https://github.com/ethfannum1/ETH_Random_Number_Chainlink/blob/main/paso2.jpg)
