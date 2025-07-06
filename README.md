# 🧠 Solidity Gas Optimization: Dynamic vs Fixed Arrays

This repository demonstrates and benchmarks gas usage differences between dynamic and fixed-size arrays of structs in Solidity smart contracts.

---

## 📂 Contracts

### 1️⃣ `DynamicArrayDeposits.sol`
- Uses a dynamic array (`Deposit[]`) to store deposits.
- Allows unlimited growth of the array.

### 2️⃣ `FixedArrayDeposits.sol`
- Uses a fixed-size array (`Deposit[10]`) to store deposits.
- Limits the total number of deposits to 10.

---

## 🔬 What We Tested

We deployed both contracts and performed the same actions:

✅ Added deposits with amounts 1000 and 2000  
✅ Retrieved the first deposit (index 0) to measure read gas costs

---

## 📊 Gas Usage Comparison

| Operation         | Dynamic Transaction Gas | Dynamic Execution Gas | Fixed Transaction Gas | Fixed Execution Gas |
|-------------------|------------------------:|----------------------:|----------------------:|---------------------:|
| addDeposit(1000)  | 88,234                  | 67,018                | 88,526                | 67,310               |
| addDeposit(2000)  | 71,134                  | 49,918                | 71,426                | 50,210               |
| getDeposit(0)     | 7,328                   | -                     | 5,080                 | -                    |

---

## 🧩 Observations

### Insertion Costs:
Very similar between dynamic and fixed arrays, as storing structs with multiple fields (address, uint256) requires similar slot writes.

### Read Costs:
Fixed-size arrays are slightly cheaper to read because Solidity can calculate their storage location without needing to read array length.

---

## 📌 Practical Implications

- Use **dynamic arrays** when you need unbounded growth.
- Use **fixed arrays** when you want predictable storage layout and enforced limits.

---

## 🛠️ How to Run It Yourself

1. Clone this repository  
2. Open [Remix IDE](https://remix.ethereum.org)  
3. Compile `DynamicArrayDeposits.sol` and `FixedArrayDeposits.sol`  
4. Deploy each contract  
5. Call:  
   - `addDeposit(amount)` with `1000` and `2000`  
   - `getDeposit(0)` to retrieve the first record  
6. Observe the gas usage shown in Remix

---

## 🎯 Learning Goal

This exercise is part of a **Solidity Gas Optimization Practice Series** aimed at understanding how data structures impact gas cost. It helps you:

✅ Make informed choices when designing storage  
✅ Understand how Solidity organizes array and struct storage  
✅ Benchmark real differences in gas usage
