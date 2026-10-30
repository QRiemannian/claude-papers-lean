CC-CANDIDATE — read as "P_a − I has entries in ℕ[φ]", the record's wording "P_a ≥ I entrywise over ℕ[φ]" is FALSE for a = 2, 3: the top-left entry of P₂ − I (Lean entry (0, 0)) is φ − 1 = (−1, 1) ∉ ℕ[φ] (the record says so itself, AM §1.1 and the §1.2 correction note).

# G5-U1-GEb

## 1 · Header

row: G5-U1-GEb
unit: U1
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 64a12aa2fe2609a5c1ad8776ec01c5584daf8f292b3b8748871e80455867d034 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, digest read 2026-10-30T09:45:42Z)
locus: `phase-2/PHASE-2-DEFINITIONS.md` §1 "Monotonicity lemma" (l. 11); STATEMENTS.md row G5-MONO, first clause ("Every P_a ≥ I entrywise over ℕ[φ]"), and the brief's U1 list; against AM transcript §1.1 (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 34) and the §1.2 correction note (l. 52)
spec_clock: 2026-10-30T09:59:55Z

## 2 · Printed statement, verbatim

> Every P_a ≥ I entrywise over ℕ[φ], so for any products A, B of the P's, tr(A P_a B) ≥ tr(A B) as real numbers;
>
> — `Claude-Papers/No1-G5/phase-2/PHASE-2-DEFINITIONS.md` l. 11

The record's own correction of the ℕ[φ] reading:

> (P_a − I does NOT have entries in ℕ[φ] for a = 2, 3, since φ − 1 = −1 + φ; see the correction note in §1.2.)
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 34

> *Correction note (written as found, 2026-10-29T22:2xZ):* a first draft of §1.1 said "P_a ≥ I entrywise in ℕ[φ]"; that is false for a = 2, 3. Nothing in §3 uses it: the proofs use only (i) entries of P_a in ℕ[φ] and (ii) the path expansion; §5.1's pruning uses only the real order (P_a − I real-nonnegative).
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 52

## 3 · Formal reading (of the stopped reading)

- "P_a ≥ I entrywise over ℕ[φ]" read in the ℕ[φ] (semiring, coefficientwise) order: for each a ∈ {1, 2, 3, 4} and entry (i, j), `nonneg (P a i j − (1 : M2) i j)`.
- At a = 2, (i, j) = (0, 0): P₂(0, 0) − 1 = φ − 1 = ⟨−1, 1⟩, x = −1 < 0. The same at a = 3 and at the (1, 1) entries. So the reading is false at a = 2, 3 and true only at a = 1, 4.
- The same sentence of `PHASE-2-DEFINITIONS.md` continues "so … tr(A P_a B) ≥ tr(A B) as real numbers", which uses only the real reading — that reading is G5-U1-GEa, true and specced. The defect is the phrase "over ℕ[φ]" when it is read as the order, not the mathematics the record uses.

## 4 · Target mathlib declarations

None targeted (the row is stopped). The witness below uses only G5-U1-DEFS's names.

## 5 · Intended Lean statement

None proposed (CC-CANDIDATE: the row stays OPEN and uncounted, and is not repaired here). The defect witness, which the probe elaborates with both `decide`s closing (the ℕ[φ]-order reading fails at a = 2, (0, 0); the real-order reading holds there):

Probe: `<scratchpad>/M-U1/probe.lean` (sha256 recorded in `_UNIT-U1.md`), run 3 of 3, exit 0, no error; the text below is the probe's text byte for byte.

```lean
/- G5-U1-GEb, the defect witness (not a statement for freezing): -/
example : ¬ nonneg (P 2 0 0 - (1 : M2) 0 0) := by decide
example : (1 : M2) 0 0 ≤ P 2 0 0 := by decide
```

## 6 · What the row does not claim

- Nothing beyond the defect. The record's mathematics is unaffected: AM §1.2's note says "Nothing in §3 uses it", and the monotonicity proofs (AM §5.1, TA Lemma 3, DO L1, SH-P2-1 §3) use the real order (G5-U1-GEa). The repair, if any, is the wording of `PHASE-2-DEFINITIONS.md` §1 and STATEMENTS.md's G5-MONO row ("over ℕ[φ]" → "with entries in ℕ[φ], in the real order"); that is the wall's and the sheet-holder's to make, not this seat's.

## 7 · Status

SPEC-DRAFT 2026-10-30T09:59:55Z — CC-CANDIDATE, row stopped
