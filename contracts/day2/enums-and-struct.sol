// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract EnumAndStruct {
    enum Status {
        None,
        Pending,
        Shipped,
        Completed,
        Rejected,
        Canceled
    }

    Status public status;

    struct Order {
        address buyer;
        Status status;
    }

    mapping (uint => Order) public orders;
    uint public orderIndex;

    function createOrder (address _buyer) external {
        orders[orderIndex] = Order({
            buyer: _buyer,
            status: Status.Pending
        });
    }

    function cancelOrder (uint _orderId) external {
        orders[_orderId].status = Status.Canceled;
    }

    function shipOrder (uint _orderId) external {
        orders[_orderId].status = Status.Shipped;
    }

    function updateOrder (uint _orderId, Status _status) external {
        orders[_orderId].status = _status;
    }
}