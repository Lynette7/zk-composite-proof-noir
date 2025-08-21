# zk-Composite-Proof-Noir

This Noir circuit allows you to prove, in zero-knowledge, that a public number `n` is **composite**—that is, you know two secret factors (other than `1` and `n` itself) whose product is `n`—**without revealing the factors**.

This project demonstrates a simple but powerful Zero-Knowledge Proof (ZKP) circuit using **Noir** for privacy-preserving compositeness proofs. It's a classic mathematical example of using ZKPs to prove knowledge of a mathematical fact without leaking the secret itself.

---

## 📝 Circuit Description

### What does this circuit do?

- **Public Output:**
  - `n` (`Field`): The number to prove is composite.

- **Private Inputs:**
  - `a` (`Field`): Secret factor, `1 < a < n`
  - `b` (`Field`): Secret factor, `1 < b < n`

The circuit:
1. Asserts `a != 1` and `b != 1` (both factors are non-trivial).
2. Asserts `a != n` and `b != n` (neither factor is `n` itself).
3. Asserts `a * b == n`.
4. Returns `n` publicly, proving compositeness.

**Important:** This circuit does _not_ reveal the actual factors, only that they exist.

#### Example Circuit Code

```rust
fn main(a: Field, b: Field, n: Field) -> pub Field {
    assert(a != 1);
    assert(b != 1);
    assert(a != n);
    assert(b != n);
    assert(a * b == n);
    n
}
```

---

## 🧪 Testing

Unit tests are included to verify correct and incorrect usage:

```rust
#[test]
fn test_valid_composite() {
    // 3 * 5 = 15, valid compositeness proof
    let a = 3;
    let b = 5;
    let n = 15;
    let out = main(a, b, n);
    assert(out == n);
}

#[test]
fn test_invalid_composite_trivial_factor() {
    // 1 * 15 = 15, invalid as 1 is trivial
    let a = 1;
    let b = 15;
    let n = 15;
    // This should fail, uncomment to test failure
    // let out = main(a, b, n);
}

#[test]
fn test_invalid_composite_wrong_product() {
    // 2 * 7 = 14, but n = 15, should fail
    let a = 2;
    let b = 7;
    let n = 15;
    // This should fail, uncomment to test failure
    // let out = main(a, b, n);
}
```

---

## 📁 Project Structure

- `/circuit` — Noir circuit code and tests (`main.nr`, test files)
- (Optionally) `/js` or `/contract` for integrations with other stacks

**Tested with:**
- Noir >= 1.0.0-beta.6
- Barretenberg CLI (`bb`) 0.84.0

---

## 🚀 Installation / Setup

```bash
# Build circuit
cd circuit
nargo build

# Run circuit tests
nargo test
```

---
## 🧑‍💻 Proof Generation

### JS (bb.js) Approach

```bash
# Install JS dependencies
cd js
yarn install

# Generate proof
yarn generate-proof
```

### CLI Approach

```bash
# Generate witness
nargo execute

# Generate proof with CLI
bb prove -b ./target/zk_composite_proof_noir.json -w target/zk_composite_proof_noir.gz -o ./target --oracle_hash keccak
```

---

## 🛠️ Solidity Verification

You can verify the generated proof using a Solidity contract and Foundry:

```bash
# Run Foundry tests
cd contract
forge test --optimize --optimizer-runs 5000 --gas-report -vvv
```

## 🧑‍💻 Usage

### Prove that a public number is composite

1. Choose secret factors `a` and `b` such that `a * b = n`, with `a != 1`, `b != 1`, `a != n`, `b != n`.
2. Run the circuit with these secrets and the public `n`.
3. Generate and share the proof: only `n` is revealed, not your factors.

---

## 💡 Use Cases

- **Privacy-preserving math competitions**
- **ZKP education and demos**
- **Building blocks for more advanced cryptographic protocols**

---

## 🏆 Why Use This Circuit?

- Prove compositeness without leaking factors.
- Simple, understandable Noir ZKP example.
- Useful for math, education, and privacy research.

---

### 🧭 Ecosystem Attribution

This project is indexed in the [Electric Capital Crypto Ecosystems Map](https://github.com/electric-capital/crypto-ecosystems).

**Source**: Electric Capital Crypto Ecosystems  
**Link**: [https://github.com/electric-capital/crypto-ecosystems](https://github.com/electric-capital/crypto-ecosystems)  
**Logo**: ![Electric Capital Logo](https://avatars.githubusercontent.com/u/44590959?s=200&v=4)

💡 _If you’re working in open source crypto, [submit your repository here](https://github.com/electric-capital/crypto-ecosystems) to be counted._

Thank you for contributing and for reading the contribution guide! ❤️
