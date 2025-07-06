// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Dynamic Array of Deposits
/// @notice Stores deposits in a dynamic array to illustrate gas costs
contract DynamicArrayDeposits {
    /// @notice Represents a single deposit
    struct Deposit {
        uint256 amount;
        address depositor;
    }

    /// @notice Dynamic array to hold all deposits
    Deposit[] public deposits;

    /// @notice Add a deposit to the array
    /// @param amount Amount deposited
    function addDeposit(uint256 amount) external {
        deposits.push(Deposit({
            amount: amount,
            depositor: msg.sender
        }));
    }

        /// @notice Get the total number of deposits
    function getDepositCount() external view returns (uint256) {
        return deposits.length;
    }

    /// @notice Retrieve a deposit by index
    /// @param index The index in the array
    /// @return amount Amount deposited
    /// @return depositor Address of depositor
    function getDeposit(uint256 index) external view returns (uint256 amount, address depositor) {
        require(index < deposits.length, "Index out of bounds");
        Deposit storage dep = deposits[index];
        return (dep.amount, dep.depositor);
    }
}
