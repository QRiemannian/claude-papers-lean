# G5-Bc

## 1 · Header

row: G5-Bc
unit: U4
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T10:06:09Z)
locus: `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 "The θ bound: HOLDS, exact constant identified" (l. 94, l. 101, l. 103, l. 105, l. 109, l. 113, l. 114); TA transcript §1 Theorem B corollary "The true cone" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` l. 47); `Claude-Papers/No1-G5/candidates/LEDGER.md` row TA-0 (l. 28, the θ clause); STATEMENTS.md row G5-B (l. 16; pointer) and its Lean note (the θ bound as an exact ℤ[φ] inequality, the M seat names the order's definition); U1's real order `ZPhi.instLE` (spec G5-U1-DEFS) — the SPLIT third part of G5-B; this unit owns the absolute value `ZPhi.rabs`
spec_clock: 2026-10-30T10:17:51Z

## 2 · Printed statement, verbatim

> - **The true cone.** θ := t^σ/t = (x − y/φ)/(x + yφ) is increasing in x/y. On the sector, −φ^{−2} ≤ θ ≤ (y/φ² + 2)/(yφ² + 2), the upper bound decreasing in y to φ^{−4}. So **|t^σ| ≤ 0.5158…·|t| for every hyperbolic t**, the maximum attained exactly at t = 3 + φ (the class (1,4), the unique sector point with y = 1, x = 3 — realized)
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` l. 47

> - **Maximum.** The maximum of |θ| over the sector with y ≥ 1 is attained only at (x, y) = (3, 1):
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 101

>   g(1) = (4 − φ)/(3 + φ) = (17 − 7φ)/11 = 0.5157965…
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 103

>   The equality uses N(3 + φ) = 11 and (4 − φ)² = 17 − 7φ. The float is for printing only.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 105

> - (3, 1) is realized by (1, 4), since P₁P₄ has trace 2 + φ² = 3 + φ.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 109

> - 11·t^σ ≤ (17 − 7φ)·t and −11·t^σ ≤ (17 − 7φ)·t were tested by the tree's own exact sign routine. Both had 0 violations.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 113

> - Upper equality holds on exactly 2 words, (1, 4) and (4, 1), both with value (3, 1).
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 114

> the θ bound is exactly (4 − φ)/(3 + φ) = (17 − 7φ)/11 ≈ 0.5158, reached only at 3 + φ
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` l. 28

The statement list's row (pointer, not authority), with its Lean note:

> |t^σ| ≤ ((4 − φ)/(3 + φ))·t = ((17 − 7φ)/11)·t, the maximum attained only at t = 3 + φ.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` l. 16

> the θ bound as an exact ℤ[φ] inequality (no reals needed if stated as 11·|t^σ| ≤ (17 − 7φ)·t in the ring with the real order defined by sign of a + b√5 — the M seat chooses and names the order's definition)
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` l. 16

## 3 · Formal reading

- Words: `w : List ℕ` with `IsWord w` (U1: non-empty, syllables in {1, 2, 3, 4}); k = `w.length`. Statements are about LISTS (STATEMENTS.md §2 note 4: words, not classes); the record's "cyclic word" is a list read up to rotation, and every statement below is rotation-invariant in content.
- t = `ntr w` (U1: the trace of P_{a₁} ⋯ P_{a_k}, the NORMALIZED trace; the literal trace is (−1)^k t by `g5_u1_trace`); x = `(ntr w).x`, y = `(ntr w).y`, integers.
- "Hyperbolic", read at the word level: the word is not (1^k) and not (4^k) — hypotheses `h1 : ∃ a ∈ w, a ≠ 1` and `h4 : ∃ a ∈ w, a ≠ 4`, stated inline (no predicate defined). This is the population the record's own proofs quantify over: Theorem A (G5-A) separates exactly the constant words (1^k), (4^k) ("y = 0 if and only if a₁ = ⋯ = a_k ∈ {1, 4}", AM-1-second-head l. 261), and TA's proof of Theorem B takes y ≥ 1 from it. That every such word is hyperbolic (|t| > 2), and that hyperbolic CLASSES are represented by such words, is not claimed here (G5-A / G5-LAD / U7).
- t^σ = `conj (ntr w)` (U1's σ: ⟨x, y⟩ ↦ ⟨x + y, −y⟩).
- The order is U1's REAL order on `ZPhi` (`instLE`: s ≤ t iff `RealNonneg (t − s)`, the exact sign of 2x + y + y√5 by the `sign_ab5` test); no real numbers enter. The absolute value is `ZPhi.rabs t := if RealNonneg t then t else −t` (defined here: t when t ≥ 0 in the real order, else −t), so `rabs t` is the element of ℤ[φ] whose real value is |t|.
- "|t^σ| ≤ ((17 − 7φ)/11)·t" is read with the denominator cleared, as STATEMENTS.md's Lean note prescribes: 11·|t^σ| ≤ (17 − 7φ)·t; multiplying by 11 > 0 preserves the real order both ways. (TA's |t| becomes t: t = `ntr w` is the normalized trace, t > 0.)
- "The maximum attained only at t = 3 + φ" is read as two facts: equality in the bound holds iff t = 3 + φ (on the hyperbolic words), and t = 3 + φ is attained, by the word (1, 4) (SH-P2-1 l. 109).
- The printed identity "(4 − φ)/(3 + φ) = (17 − 7φ)/11" is read cross-multiplied in ℤ[φ]: (4 − φ)·11 = (17 − 7φ)·(3 + φ) (both sides 44 − 11φ; SH-P2-1 l. 105's "N(3 + φ) = 11" is the reason).
- Three declarations: `g5_u4_bc` (bound + equality case), `g5_u4_bc_id` (the identity), `g5_u4_bc_att` (attainment).

## 4 · Target mathlib declarations

```
Matrix.trace_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:220
Matrix.mul_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Notation.lean:479
rabs	NOT FOUND
```

- `rabs` NOT FOUND, as intended: it is this unit's own definition `ZPhi.rabs` (no mathlib `abs` is used — `ZPhi` carries no `Lattice`/`LinearOrder` instance, and U1 deliberately defined none).
- `Matrix.trace_fin_two`, `Matrix.mul_fin_two`: proof aids for `g5_u4_bc_att` (tr P₁P₄ = 3 + φ). `g5_u4_bc_id` is ring arithmetic in `ZPhi` (U1's `instCommRing`); a proof may close it by `decide` or `ext`.

## 5 · Intended Lean statement

In prose: for every word w that is neither (1^k) nor (4^k), 11·|t^σ| ≤ (17 − 7φ)·t in the real order, with equality if and only if t = 3 + φ; the identity (4 − φ)·11 = (17 − 7φ)(3 + φ) holds in ℤ[φ]; and the word (1, 4) has t = 3 + φ.

Probe: `<scratchpad>/M-U4/probe.lean` (U1's final probe, sha256 `f15f320065142f9533d7c775430280434d4ec3533a27927dd740d2210e04af63`, copied whole and unedited as the prefix, then this unit's block). NOT RUN by this seat (brief amendment 2026-10-30T10:05:25Z: no `lake` from the M seats); the orchestrator elaborates it serially. The text below is the probe's text byte for byte.

```lean
namespace ZPhi

/-- The real absolute value: `t` if `t ≥ 0` in the real order (`RealNonneg`), else `−t`. -/
def rabs (t : ZPhi) : ZPhi := if RealNonneg t then t else -t

end ZPhi

theorem g5_u4_bc (w : List ℕ) (hw : IsWord w) (h1 : ∃ a ∈ w, a ≠ 1)
    (h4 : ∃ a ∈ w, a ≠ 4) :
    11 * rabs (conj (ntr w)) ≤ (17 - 7 * phi) * ntr w ∧
      (11 * rabs (conj (ntr w)) = (17 - 7 * phi) * ntr w ↔ ntr w = 3 + phi) := by sorry

theorem g5_u4_bc_id : (4 - phi) * 11 = (17 - 7 * phi) * (3 + phi) := by sorry

theorem g5_u4_bc_att : ntr [1, 4] = 3 + phi := by sorry
```

Count line (the template's one-liner, run on this file): see `_UNIT-U4.md` §"Line counts".

## 6 · What the row does not claim

- Not the lower side as a separate statement (θ ≥ −φ⁻², equality iff x = 0; "the negative side never comes close"): the bound with |·| covers both signs of t^σ, and its equality case is the upper one only; the x = 0 characterization is the φ-line row G5-PHI, not on this unit.
- Not the asymptotic slope φ⁻⁴, not the monotonicity of θ in x or of g(y), not the decimal 0.5157965… (floats for printing only, SH-P2-1 l. 105).
- Not that the realized words attaining equality are exactly (1, 4) and (4, 1) (SH-P2-1 l. 114, a census fact); the row's equality case is stated on the value t, as the record's "attained only at t = 3 + φ" is.
- No order-theoretic structure (`Preorder`, `LinearOrder`) on `ZPhi`, and no lemma about `rabs`.
- Nothing for the constant words (1^k), (4^k): there t = 2, t^σ = 2 and 11·2 > (17 − 7φ)·2 in the real order, so the hyperbolic hypotheses are necessary.

## 7 · Status

SPEC-DRAFT 2026-10-30T10:17:51Z
