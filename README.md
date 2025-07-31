# Swap Security Trap 🛡️

This is a custom Drosera Trap designed to monitor token transactions — specifically swaps or bridge transfers — and detect suspicious slippage.

## 🔍 What it does

- Monitors the difference between the **expected amount** and the **actual amount received**.
- Triggers an **on-chain alert** when the slippage exceeds a defined threshold (e.g., 5%).
- Useful for detecting:
  - Exploits in DeFi protocols
  - Malicious front-running
  - Bridge inconsistencies or failures

## 🧠 Contracts

- `Trap.sol` — Implements `collect()` and `shouldRespond()` to monitor value discrepancies.
- `ResponseContract.sol` — Stores alerts and ensures only the authorized trap can trigger them.
- `ITrap.sol` — Interface for trap standardization.

## 🛠️ Setup

Built with Foundry and runs as part of the Drosera Network testnet trap system.

---

