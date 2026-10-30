import Mathlib
import G5.Ring.Challenge

/-!
# Unit U3 (`G5/WordLevel`) — Theorem A at the word level, and the separation: statements

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Source of record: `Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, sha256 prefix `51324441`.
Rows stated: G5-Aa, G5-Ab, G5-SEPa, G5-SEPb. This unit defines nothing: every name is
unit U1's, imported from `G5.Ring.Challenge`.
Every proof here is `sorry`; the proofs live in `G5/WordLevel/Solution.lean`.
-/

open G5 ZPhi

namespace G5

/-- G5-Aa (Theorem A, positivity). For every word (`k ≥ 1`), the normalized trace
`t = x + y φ` has `x, y ≥ 0`.
Locus: `candidates/checks/AM-1-second-head.md` "Theorem as I would print it"
(l. 253–259); `candidates/LEDGER.md` row AM-1 (l. 12).
STATEMENTS.md sha256 prefix `51324441`. -/
theorem g5_u3_a_nonneg (w : List ℕ) (hw : IsWord w) : nonneg (ntr w) := by sorry

/-- G5-Ab (Theorem A, `y = 0`). For every word, `y = 0` iff `a₁ = ⋯ = a_k ∈ {1, 4}`,
in which case `x = 2`.
Locus: `candidates/checks/AM-1-second-head.md` "Theorem as I would print it"
(l. 257–261) and §3 "Constant words" (l. 60).
STATEMENTS.md sha256 prefix `51324441`. -/
theorem g5_u3_a_y_eq_zero (w : List ℕ) (hw : IsWord w) :
    ((ntr w).y = 0 ↔ (∀ a ∈ w, a = 1) ∨ (∀ a ∈ w, a = 4)) ∧
      ((∀ a ∈ w, a = 1) ∨ (∀ a ∈ w, a = 4) → (ntr w).x = 2) := by sorry

/-- G5-SEPa (separation, linear clause). For every word with `y ≥ 1`,
`t − t^σ = y √5 ≥ √5`, with `√5` the ring element `2φ − 1`.
Locus: `candidates/LEDGER.md` row D-E2 (l. 26);
`candidates/checks/SH-P2-1-sector-ladder-pruning.md` §4 "Item 4" (l. 198–200).
STATEMENTS.md sha256 prefix `51324441`. -/
theorem g5_u3_sep_lin (w : List ℕ) (hw : IsWord w) (hy : 1 ≤ (ntr w).y) :
    ntr w - conj (ntr w) = (ntr w).y • (2 * phi - 1) ∧
      2 * phi - 1 ≤ ntr w - conj (ntr w) := by sorry

/-- G5-SEPb (separation, distance clause, squared). For every word with `y ≥ 1`,
`(t − t^σ)² = 5 y² ≥ 5`.
Locus: `candidates/LEDGER.md` row D-E2 (l. 26);
`candidates/checks/SH-P2-1-sector-ladder-pruning.md` §4 "Item 4" (l. 198–200).
STATEMENTS.md sha256 prefix `51324441`. -/
theorem g5_u3_sep_sq (w : List ℕ) (hw : IsWord w) (hy : 1 ≤ (ntr w).y) :
    (ntr w - conj (ntr w)) ^ 2 = (⟨5 * (ntr w).y ^ 2, 0⟩ : ZPhi) ∧
      (5 : ZPhi) ≤ (ntr w - conj (ntr w)) ^ 2 := by sorry

end G5
