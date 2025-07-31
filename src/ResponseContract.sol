// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SwapSecurityResponse {
    address public authorizedCaller;
    mapping(address => string[]) public alerts;

    constructor(address _authorizedCaller) {
        authorizedCaller = _authorizedCaller;
    }

    function respondWithAlert(string calldata message) external {
        require(msg.sender == authorizedCaller, "Not authorized");
        alerts[tx.origin].push(message);
    }

    function respond(bytes memory data) external {
        require(msg.sender == authorizedCaller, "Not authorized");
        string memory message = abi.decode(data, (string));
        alerts[tx.origin].push(message);
    }

    function getAlerts(address user) external view returns (string[] memory) {
        return alerts[user];
    }
}
