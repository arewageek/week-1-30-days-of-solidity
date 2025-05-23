# Interface

- Interfaces allows you call a contract without the contract code itself
- Interface names usually start with `I` (e.g IERC20, IERC721)
- Interfaces are used to interact with contracts that are not deployed yet
- You can pass custom contract address when using an interface in your code. This allows single interface to be used on multiple smart contracts with similar structure
- A `view` function cannot emit an event. Event emition requires updating data on the blockchain
