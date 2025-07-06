🧠 Solidity Gas Optimization: Dynamic vs Fixed Arrays
This repository demonstrates and benchmarks gas usage differences between dynamic and fixed-size arrays of structs in Solidity smart contracts.

📂 Contracts
1️⃣ DynamicArrayDeposits.sol

Uses a dynamic array (Deposit[]) to store deposits.

Allows unlimited growth of the array.

2️⃣ FixedArrayDeposits.sol

Uses a fixed-size array (Deposit[10]) to store deposits.

Limits the total number of deposits to 10.

🔬 What I Tested
I deployed both contracts and performed the same actions:

✅ Added deposits with amounts 1000 and 2000.
✅ Retrieved the first deposit (index 0) to measure read gas costs.

📊 Gas Usage Comparison
Operation	DynamicArrayDeposits Gas	FixedArrayDeposits Gas
addDeposit(1000)	Transaction: 88,234
Execution: 67,018	Transaction: 88,526
Execution: 67,310
addDeposit(2000)	Transaction: 71,134
Execution: 49,918	Transaction: 71,426
Execution: 50,210
getDeposit(0)	7,328	5,080

🧩 Observations
Insertion Costs:
Very similar between dynamic and fixed arrays, as storing structs with multiple fields (address, uint256) requires similar slot writes.

Read Costs:
Fixed-size arrays are slightly cheaper to read because Solidity can calculate their storage location without needing to read array length.

Practical Implications:

Use dynamic arrays when you need unbounded growth.

Use fixed arrays when you want predictable storage layout and enforced limits.

🛠️ How to Run It Yourself
Clone this repository.

Open Remix IDE.

Compile DynamicArrayDeposits.sol and FixedArrayDeposits.sol.

Deploy each contract.

Call:

addDeposit(amount) with 1000 and 2000.

getDeposit(0) to retrieve the first record.

Observe the gas usage shown in Remix.

🎯 Learning Goal
This exercise is part of a Solidity Gas Optimization Practice Series aimed at understanding how data structures impact gas cost. It helps you:

✅ Make informed choices when designing storage.
✅ Understand how Solidity organizes array and struct storage.
✅ Benchmark real differences in gas usage.

