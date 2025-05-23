# Events

Events allow you log data on the blockchain - they can only be read from outside the smart contract

## Syntax

- Creating events: `event Transfer(address sender, address receiver, uint256 amount);`
- Emitting events: `emit Transfer(msg.sender, _receiver, msg.value);`

## Indexed Logs

- Allows you search for specific keys/fields in an event
- Syntax: `event Transfer(address indexed sender, address receiver, uint256 amount);`
- Only 3 parameters can be marked as indexed fields in an event
