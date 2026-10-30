# G5-SEPa

## 1 · Header

row: G5-SEPa
unit: U3
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, digest read 2026-10-30T10:12:04Z; first read 2026-10-30T10:06Z, same digest; §4 Errata included)
locus: `candidates/LEDGER.md` row D-E2 (l. 26), statement column and the second-head note; DO transcript §1.3 "E2 sharpened" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` l. 47); TA transcript §1 "E2, sharpened" (`…/transcript/topological-analysis.md` l. 49); `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §4 "Item 4" (l. 198–200, l. 203, l. 208); `phase-2/PHASE-2-DEFINITIONS.md` §1 (l. 9, "hyperbolic ⟺ y ≥ 1"); STATEMENTS.md row G5-SEP (pointer; its Lean notes name the ring form) — the LINEAR clause "t − t^σ = y√5 ≥ √5" (SPLIT, half a; the distance clause is G5-SEPb)
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
- **√5 as a ring element.** The record writes t − t^σ = y(2φ − 1) = y√5 (SH-P2-1 l. 198). With φ = (1 + √5)/2 (`phase-0/DEFINITIONS.md` §1, l. 10), √5 = 2φ − 1 lies in ℤ[φ] itself, as the pair ⟨−1, 2⟩; the row writes it `2 * phi - 1`. (That (2φ − 1)² = 5 and 2φ − 1 > 0 in the real order is the reason the reading is the record's √5; it is not part of the claim, and U1 defines no real embedding.)
- **Claim, two conjuncts:** (i) t − t^σ = y • (2φ − 1), the ℤ-multiple in `ZPhi` (`•` is the ring's ℤ-scalar action, = (y : ZPhi) * (2φ − 1) by `zsmul_eq_mul`) — the record's "t − t^σ = y√5" (in coordinates (−y, 2y), SH-P2-1 l. 203); (ii) 2φ − 1 ≤ t − t^σ in the real order — the record's "≥ √5".
- **The split, for V₁.** The brief's ring form (y ≥ 1 ⟹ (t − t^σ)² = 5y² ≥ 5) loses the sign of t − t^σ: it holds equally for t^σ − t. The record's first clause (t − t^σ = y√5 ≥ √5) is stronger, and its second clause (distance ≥ √(5/2)) is exactly the squared form. So the row is split by clause — both halves fully checkable — into SEPa (this spec, the linear clause, exactly) and SEPb (the distance clause, in the brief's squared form). Clause (i) holds for every t ∈ ℤ[φ]; it is stated under the row's hypotheses as the record states it.

## 4 · Target mathlib declarations (classifier of record, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`)

```
zsmul_eq_mul	FOUND _root_ Mathlib/Data/Int/Cast/Lemmas.lean:104
ZSMul	FOUND _root_ Mathlib/Algebra/Group/Defs.lean:959
ZPow.toPow	FOUND ZPow Mathlib/Algebra/Group/Defs.lean:972
instOfNatAtLeastTwo	NOT FOUND
Nat.AtLeastTwo	FOUND Nat Mathlib/Data/Nat/Init.lean:425
```

Notes: the `SMul ℤ ZPhi` instance behind `•` is `ZSMul.toSMul`, generated by `@[to_additive toSMul]` from `ZPow.toPow` (FOUND above, `Mathlib/Algebra/Group/Defs.lean:971–972`), reached through the `SubNegMonoid` of U1's `CommRing` (its `zsmul := zsmulRec`). The numeral `2 : ZPhi` is `instOfNatAtLeastTwo` (`[NatCast R] [Nat.AtLeastTwo n] → OfNat R n`), declared at `_root_` in `Mathlib/Data/Nat/Cast/Defs.lean:42` — the classifier reads NOT FOUND because the declaration is written `instance (priority := 100) instOfNatAtLeastTwo`, the name after the priority attribute; the site was read by hand (`/usr/bin/grep -n instOfNatAtLeastTwo`, first `namespace` of the file at l. 74, so the root). Neither `•` on `ZPhi` nor a numeral ≥ 2 in `ZPhi` appears in U1's probe: V₁ and the orchestrator's elaboration should look at both. No row of this spec is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for every word (k ≥ 1, syllables in {1, 2, 3, 4}) whose normalized trace t has φ-coefficient y ≥ 1, t − t^σ equals y times 2φ − 1 (= √5), and 2φ − 1 ≤ t − t^σ in the real order.

Probe: `<scratchpad>/M-U3/probe.lean` (U1's final probe, sha256 `f15f3200…af63`, copied whole and unedited as the prefix, then this unit's block). **NOT RUN BY THIS SEAT** (brief amendment 2026-10-30T10:05:25Z: the orchestrator elaborates the six probes serially after the fan lands). The text below is the probe's text byte for byte.

```lean
theorem g5_u3_sep_lin (w : List ℕ) (hw : IsWord w) (hy : 1 ≤ (ntr w).y) :
    ntr w - conj (ntr w) = (ntr w).y • (2 * phi - 1) ∧
      2 * phi - 1 ≤ ntr w - conj (ntr w) := by sorry
```

## 6 · What the row does not claim

- Not y ≥ 1 for hyperbolic words (G5-A: G5-Aa with G5-Ab); the row assumes it. Not the hyperbolic ⟺ y ≥ 1 equivalence.
- Not the distance clause (G5-SEPb).
- No real embedding: "√5" is the ring element 2φ − 1, and (2φ − 1)² = 5 is not stated.
- Not the scoping of Prop. 11.1 (single real embedding) nor the near-miss illustration (DO's 75023 + 121393φ): interpretive, the record's own reading (SH-P2-1 l. 205–208).

## 7 · Status

SPEC-DRAFT 2026-10-30T10:14:20Z

V1: V1-GREEN 2026-10-30T10:20:20Z — all ten §2 cites match their source lines verbatim. The linear clause is part of the record's STATEMENT, not only a derivation step. It is the first clause of STATEMENTS.md row G5-SEP itself ("t − t^σ = y√5 ≥ √5; the distance …"), of the ledger's second-head note (l. 26), and of TA's printed sentence (l. 49). √5 = 2φ − 1 = ⟨−1, 2⟩ is the record's own identification (SH-P2-1 l. 198). Its real value is √5 exactly, so ≥ in U1's real order (the identity embedding, φ ≈ 1.618) is the record's "≥ √5". Hypothesis y ≥ 1: STATEMENTS.md's own Lean notes put y ≥ 1 in hypothesis position, and it is stated, not silently assumed. G5-A is not re-proved. With Aa and Ab, the record's "every hyperbolic class" is covered: a hyperbolic word is not constant (Ab gives t = 2 on constant words), so y ≠ 0 (Ab) and y ≥ 1 (Aa). Clause (i) holds for every t, and `hw` and, in (i), `hy` are unused; that is harmless. Own arithmetic: 0 violations on k ≤ 8. Split SEP → SEPa/SEPb: V1-SPLIT-OK. Parse: 0 Lean line(s) over 100 code points
V2: V2-GREEN 2026-10-30T10:39:11Z — t − t^σ = y • (2φ − 1) and 2φ − 1 ≤ t − t^σ in U1's real order, on y ≥ 1, is SH-P2-1 l. 198–199 / LEDGER l. 26 / TA l. 49 "t − t^σ = y√5 ≥ √5", with √5 the ring element 2φ − 1 = ⟨−1, 2⟩; clause (ii) reduces to NonnegAB5(0, 2y − 2), false at y = 0, so hy carries it; byte-identical in Challenge.lean inside `namespace G5`.
