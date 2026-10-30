# G5-SEPb

## 1 · Header

row: G5-SEPb
unit: U3
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, digest read 2026-10-30T10:12:04Z; first read 2026-10-30T10:06Z, same digest; §4 Errata included)
locus: `candidates/LEDGER.md` row D-E2 (l. 26), statement column and the second-head note; DO transcript §1.3 "E2 sharpened" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` l. 47); TA transcript §1 "E2, sharpened" (`…/transcript/topological-analysis.md` l. 49); `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §4 "Item 4" (l. 198–200, l. 203, l. 208); `phase-2/PHASE-2-DEFINITIONS.md` §1 (l. 9, "hyperbolic ⟺ y ≥ 1"); STATEMENTS.md row G5-SEP (pointer; its Lean notes name the ring form) — the DISTANCE clause "distance of (t, t^σ) from the diagonal ≥ √(5/2)", in the ring form (SPLIT, half b; the linear clause is G5-SEPa)
spec_clock: 2026-10-30T10:14:20Z

## 2 · Printed statement, verbatim

The ledger row and its second-head note:

> E2 sharpened: Prop. 11.1's "no separation" holds only in the real embedding; in the Minkowski plane every hyperbolic trace sits at distance ≥ √(5/2) from the diagonal where the integers live.
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` l. 26

> **SECOND HEAD HOLDS 2026-10-30T00:08:03Z (SH-P2-1 item 4):** t − t^σ = y√5 ≥ √5; distance ≥ √(5/2); the scoping of Prop. 11.1 (Atlas l. 3437–3459, single real embedding) holds; the separation restates non-integrality, its content is Theorem A.
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` l. 26

The second head, by hand (SH-P2-1 §4):

> - t − t^σ = (x + yφ) − ((x + y) − yφ) = y(2φ − 1) = y√5.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 198

> - y ≥ 1 by Theorem A, so t − t^σ ≥ √5.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 199

> - The distance of (t, t^σ) from the line t^σ = t is |t − t^σ|/√2 = y√(5/2) ≥ √(5/2).
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 200

> **Census.** t − t^σ computed in the tree's arithmetic equals (−y, 2y) with y ≥ 1 on every non-constant word: 0 violations.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 203

The two seats that stated it:

> every hyperbolic trace has t − t^σ = y√5 ≥ √5, a uniform distance ≥ √(5/2) from the rational diagonal t^σ = t on which ℤ sits.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` l. 49

> The distance to the diagonal is |t − t^σ|/√2 = √(5/2)·|y| ≥ √(5/2) for every hyperbolic class
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` l. 47

The population ("every hyperbolic class") on the law sheet, and the scope note:

> **The normalized trace** of a class is t := tr(P_{a₁} ⋯ P_{a_k}) = x + yφ > 0; hyperbolic ⟺ y ≥ 1.
>
> — `Claude-Papers/No1-G5/phase-2/PHASE-2-DEFINITIONS.md` l. 9

> The separation from the diagonal is a restatement of non-integrality, not a second route to it. Every point of ℤ[φ] \ ℤ has |y| ≥ 1 and so lies ≥ √(5/2) from the diagonal automatically. All the content is y ≠ 0, which is Theorem A's positivity.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 208

## 3 · Formal reading

- **Hypotheses:** `IsWord w` and `1 ≤ (ntr w).y`. The record's population is "every hyperbolic class" (TA l. 49; DO l. 47; SH-P2-1 l. 199 "y ≥ 1 by Theorem A"); the law sheet records "hyperbolic ⟺ y ≥ 1" for the normalized trace (l. 9). The brief directs the hypothesis y ≥ 1, so that the row is a corollary leg of G5-A and does not re-prove it (SH-P2-1 l. 208: "All the content is y ≠ 0, which is Theorem A's positivity"). No hyperbolic predicate is defined.
- **t and t^σ:** t = `ntr w` (the normalized trace, U1); t^σ = `conj (ntr w)` (U1's σ, ⟨x, y⟩ ↦ ⟨x + y, −y⟩, the record's (x + yφ)^σ = (x + y) − yφ).
- **No √ (STATEMENTS.md row G5-SEP, Lean notes; brief).** Everything is stated in `ZPhi`; the inequalities use U1's exact real order `≤` (`instLE`: s ≤ t ⟺ `RealNonneg (t − s)`, the exact sign of a + b√5).
- **The distance, squared.** The distance of (t, t^σ) ∈ ℝ² from the diagonal t^σ = t is |t − t^σ|/√2 (SH-P2-1 l. 200; DO l. 47). Both sides being non-negative, "≥ √(5/2)" is equivalent to (t − t^σ)²/2 ≥ 5/2, i.e. (t − t^σ)² ≥ 5; and "= y√(5/2)" squares to (t − t^σ)² = 5y². This is the form the brief and STATEMENTS.md row G5-SEP's Lean notes name: y ≥ 1 ⟹ (t − t^σ)² = 5y² ≥ 5.
- **Claim, two conjuncts:** (i) (t − t^σ)² = ⟨5y², 0⟩, the rational integer 5y² as a pair (the record's "= 5y²"; U1 writes integers of ℤ[φ] as pairs (n, 0)); (ii) 5 ≤ (t − t^σ)² in the real order (`(5 : ZPhi)` = ⟨5, 0⟩ by the numeral instance).
- **The split, for V₁.** See G5-SEPa §3: the squared form carries the distance clause exactly and loses the sign of t − t^σ, which SEPa carries.

## 4 · Target mathlib declarations (classifier of record, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`)

```
pow_two	FOUND _root_ Mathlib/Algebra/Group/Defs.lean:716
sq	FOUND _root_ Mathlib/Algebra/Group/Defs.lean:719
instOfNatAtLeastTwo	NOT FOUND
Nat.AtLeastTwo	FOUND Nat Mathlib/Data/Nat/Init.lean:425
```

Notes: `pow_two` / `sq` (`a ^ 2 = a * a`) reduce the square to U1's `mul_x` / `mul_y`; the numeral `5 : ZPhi` is `instOfNatAtLeastTwo`, at `_root_` in `Mathlib/Data/Nat/Cast/Defs.lean:42` (read by hand; the classifier reads NOT FOUND because of the priority attribute before the name — see G5-SEPa §4). The anonymous constructor carries the ascription `(… : ZPhi)` so that it elaborates against U1's structure. No row of this spec is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for every word (k ≥ 1, syllables in {1, 2, 3, 4}) whose normalized trace t has φ-coefficient y ≥ 1, (t − t^σ)² is the rational integer 5y², and it is ≥ 5 in the real order.

Probe: `<scratchpad>/M-U3/probe.lean` (U1's final probe, sha256 `f15f3200…af63`, copied whole and unedited as the prefix, then this unit's block). **NOT RUN BY THIS SEAT** (brief amendment 2026-10-30T10:05:25Z: the orchestrator elaborates the six probes serially after the fan lands). The text below is the probe's text byte for byte.

```lean
theorem g5_u3_sep_sq (w : List ℕ) (hw : IsWord w) (hy : 1 ≤ (ntr w).y) :
    (ntr w - conj (ntr w)) ^ 2 = (⟨5 * (ntr w).y ^ 2, 0⟩ : ZPhi) ∧
      (5 : ZPhi) ≤ (ntr w - conj (ntr w)) ^ 2 := by sorry
```

## 6 · What the row does not claim

- Not the sign of t − t^σ, nor t − t^σ = y√5 (G5-SEPa).
- Not y ≥ 1 for hyperbolic words (G5-A); the row assumes it.
- No point of ℝ², no Euclidean distance, no √: the distance clause enters only through its square, as §3 says.
- Not the scoping of Prop. 11.1 nor the near-miss illustration (interpretive, the record's own reading, SH-P2-1 l. 205–208).

## 7 · Status

SPEC-DRAFT 2026-10-30T10:14:20Z

V1: V1-GREEN 2026-10-30T10:20:20Z — all ten §2 cites match their source lines verbatim. The squared form is exactly the record's distance clause. Both sides are ≥ 0, so |t − t^σ|/√2 ≥ √(5/2) ⟺ (t − t^σ)² ≥ 5, and "= y√(5/2)" squares to (t − t^σ)² = 5y² (SH-P2-1 l. 200; DO l. 47). It is also the ring form STATEMENTS.md row G5-SEP's Lean notes direct. 5y² as the pair ⟨5y², 0⟩ follows U1's integers-as-pairs convention, and `(5 : ZPhi)` is ⟨5, 0⟩. By hand: ⟨−y, 2y⟩² = ⟨5y², 0⟩, and ⟨5y² − 5, 0⟩ is real-nonnegative for |y| ≥ 1. y ≥ 1 is in hypothesis position, as in SEPa, so G5-A is neither re-proved nor silently assumed. The sign of t − t^σ, lost by squaring, is carried by SEPa: V1-SPLIT-OK. Own arithmetic: 0 violations on k ≤ 8. Parse: 0 Lean line(s) over 100 code points
