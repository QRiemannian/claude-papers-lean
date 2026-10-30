# G5-PHIc

## 1 · Header

row: G5-PHIc
unit: U7
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T10:13:11Z; §4 Errata included)
locus: `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/rpa.md` PHASE 1 — OCCUPY ("RPA §1"), the non-mixed bullet, the [HD, DERIVED HERE] sentence (l. 37); `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 "Realization" (l. 110); `Claude-Papers/No1-G5/candidates/LEDGER.md` row R-4 (l. 37, "realization DERIVED (tr T^nS = nφ)"); STATEMENTS.md row G5-PHI "each realized" (l. 23, pointer). SPLIT of G5-PHI: half c, the realization
spec_clock: 2026-10-30T10:17:01Z

## 2 · Printed statement, verbatim

> [HD, DERIVED HERE] M₁ = RS = TS² = −T and M₂ = R²S = −TST, so the word (1^{k−1}, 2) is (−1)^k T^k S T, trace (−1)^k tr(T^{k+1}S) = (−1)^k (k+1)φ. Up to sign, tr(T^nS) = nφ realizes the whole line φℤ (n = ±1 being the elliptic R).
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/rpa.md` l. 37

> - The φ-line x = 0 is realized at every nφ with n ≥ 2, by (1^{n−2}, 2).
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 110

> realization DERIVED (tr T^nS = nφ)
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` l. 37

## 3 · Formal reading

- **Claim.** For every syllable count k ≥ 1 there is a word of length k with normalized trace (k + 1)φ = `⟨0, k + 1⟩`. With n = k + 1 this is the record's "nφ, n ≥ 3 (and 2φ at k = 1), each realized": n = 2 at k = 1, n ≥ 3 at k ≥ 2.
- **The per-k form** fixes the length (n = k + 1); it is what the record derives — the RPA's witness (1^{k−1}, 2) at syllable count k (l. 37), SH-P2-1's (1^{n−2}, 2) for nφ (l. 110, the same word with k = n − 1). The statement names no witness.
- **Normalized vs literal.** The RPA's "(−1)^k (k+1)φ" is the literal trace; the normalized trace (U1 `g5_u1_trace`) is (k + 1)φ. The RPA's "up to sign, tr(T^nS) = nφ realizes the whole line φℤ" (n = ±1 the elliptic R, outside the words) is a group-level reading not stated here.
- **Standing as the record carries it:** the realization half is DERIVED by the RPA (l. 37; ledger R-4 "realization DERIVED"), re-stated by SH-P2-1 (l. 110); one derivation plus one restatement; STATEMENTS.md row G5-PHI: "the realization half derived by the RPA".

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
List.replicate	NOT FOUND
List.length_replicate	NOT FOUND
List.length_append	NOT FOUND
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
```

- `List.replicate`, `List.length_replicate`, `List.length_append` read NOT FOUND in Mathlib: Lean CORE at `leanprover/lean4:v4.33.0` (`Init/Data/List/Basic.lean:706`, `:713`, `:631`); not gaps.
- No row is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for every k ≥ 1 some word of syllable count k has normalized trace (k + 1)φ.

Probe: `<scratchpad>/M-U7/probe.lean` (U1's final probe, sha256 `f15f3200…af63`, whole and unedited, then the U7 block; the probe's sha256 is recorded in `_UNIT-U7.md`). **NOT RUN by this seat** (the brief's amendment 2026-10-30T10:05:25Z: no `lake` from an M seat); the orchestrator elaborates it and returns any error to the row. The text below is the probe's text byte for byte.

Read after `open G5 ZPhi` and the U7 definitions block (`HeckeGrp`, `IsNF`; spec G5-U7-NF §5).

```lean
theorem g5_u7_phi_c (k : ℕ) (hk : 1 ≤ k) :
    ∃ w : List ℕ, IsWord w ∧ w.length = k ∧ ntr w = (⟨0, (k : ℤ) + 1⟩ : ZPhi) := by sorry
```

## 6 · What the row does not claim

- Not exclusivity (G5-PHIa, G5-PHIb); not "the whole line φℤ up to sign" (the RPA's group-level remark, which includes the elliptic n = ±1 and negative n); not T^nS as a group element.
- **Standing as the record carries it: ONE HAND.** The x = 0 characterization is SH-P2-1's remark "beyond the brief … worked out here, one hand" (l. 120), carried to the wall as "Beyond the brief, one hand each, for the wall" (l. 355); ledger R-4: "x = 0 EXCLUSIVITY PROVED … (SH-P2-1 beyond the brief, one hand)"; STATEMENTS.md row G5-PHI: "PROVED (one hand beyond the brief; the realization half derived by the RPA)" and "a fresh V₁ reads it as new and may ask for a second head first". No second head on this clause is on the record at this clock. V₁ may ask for one before freezing.

## 7 · Status

SPEC-DRAFT 2026-10-30T10:17:01Z
