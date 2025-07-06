// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Fixed Array Deposits
/// @notice Demonstrates fixed-size array vs dynamic
contract FixedArrayDeposits {
    struct Deposit {
        uint256 amount;
        address depositor;
    }

    // Fixed-size array of 10 deposits
    Deposit[10] public deposits;

    // Track which slot to fill next
    uint256 public currentIndex;

    /// @notice Add a new deposit to the array
    /// @param amount The amount deposited
    function addDeposit(uint256 amount) external {
        require(currentIndex < deposits.length, "Array full");
        deposits[currentIndex] = Deposit(amount, msg.sender);
        currentIndex++;
    }

    /// @notice Get a deposit by index
    /// @param index Index to read
    function getDeposit(uint256 index) external view returns (uint256 amount, address depositor) {
        Deposit storage d = deposits[index];
        return (d.amount, d.depositor);
    }
}
