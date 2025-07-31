// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.12;

import { ITrap } from "./ITrap.sol";

contract SwapSecurityTrap is ITrap {
    struct CollectOutput {
        uint256 expected;
        uint256 actual;
    }

    function collect() external view override returns (bytes memory) {
        return abi.encode(
            CollectOutput({
                expected: 1000 ether,
                actual: 850 ether
            })
        );
    }

    function shouldRespond(bytes[] calldata data) external pure override returns (bool, bytes memory) {
        CollectOutput memory txData = abi.decode(data[0], (CollectOutput));
        uint256 slippage = ((txData.expected - txData.actual) * 100) / txData.expected;

        bool alert = slippage >= 5;

        return (alert, abi.encode(txData.expected, txData.actual, slippage));
    }
}
