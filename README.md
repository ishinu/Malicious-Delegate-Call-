# Malicious Delegate Call Sample Project

Purpose is to aware dev of misuse or delegate call opcode and a sample of how a contract delegating calls to implementation can lead to monetary loss.

## Terminal commands to execute the project

- Clone the repository by `git clone https://github.com/ishinu/Malicious-Delegate-Call-`
- Run `npm install` to install all dependencies.
- Easily deploy it on public testnet Ropsten, Goerli, Rinkeby etc. [guidetodeploy](https://github.com/ishinu/Re-Entrancy-Hack-Upgradeable-)

- Option 2 : Deploy and Test using [Remix-IDE](https://remix.ethereum.org/) 

## Concept behind the project

`Logic.sol` is the 'implementation' which is supposed to perform all the functionality by Dev. `DelegateCall.sol` is the contract which is having a `fallback()` which delegates all call with `msg.data` to `Logic.sol`. 
As we know, delegate call opcodes preserves the context.
Delegatecall opcode is performed by `DelegateCall.sol` which means all changes will happen in `DelegateCall.sol` but logic will be of `Logic.sol`.

In `Attack.sol`, we are having instance of `DelegateCall.sol` and sending a call opcode through `attack()` which means changes due to this function call will happen in called contract. 

We are doing explicit conversion of address to uint as the function argument is uint. But as function `changeNum()` executes, it implicitely converts uint to address and assigns to logic in `DelegateCall.sol`. This gives `DelegateCall.sol` a new implementation for delegate call that is our `Attack.sol`.

We again call `attack()` which now delegates call to `Attack.sol` and assigns new owner and rest is history!

## Conclusion 

Make wise use of delegate calls.