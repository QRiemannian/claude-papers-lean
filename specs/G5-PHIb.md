# G5-PHIb

## 1 · Header

row: G5-PHIb
unit: U7
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T10:13:11Z; §4 Errata included)
locus: `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 Remark, step 6 (l. 126) and l. 128; `Claude-Papers/No1-G5/candidates/LEDGER.md` row R-4, statement and disposition columns (l. 37); STATEMENTS.md row G5-PHI parenthetical "(trace (k + 1)φ)" (l. 23, pointer). SPLIT of G5-PHI: half b, the value on the x = 0 words
spec_clock: 2026-10-30T10:17:01Z

## 2 · Printed statement, verbatim

> 6. Conversely, both families have F = (k + 1)λ.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 126

> The non-mixed traces are exactly 0, ±2, ±φ, ±φ⁻¹ and the φ-line points; at syllable count k the only pure-φ trace is (−1)^k (k+1)φ, by (1^{k−1}, 2) and its inverse class.
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` l. 37

> the y = 0 half is Theorem A; the pure-φ exclusivity at each k follows.
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` l. 37

## 3 · Formal reading

- **Hypotheses.** `IsWord w`, and x = `(ntr w).x` = 0.
- **Claim.** The normalized trace is (k + 1)φ = `⟨0, k + 1⟩` with k = `w.length` (cast to ℤ).
- **Normalized vs literal.** The ledger's "(−1)^k (k+1)φ" is the LITERAL trace tr W; the normalized t = (−1)^k tr W (U1 `g5_u1_trace`) is (k + 1)φ, which is the STATEMENTS.md row's "(trace (k + 1)φ)" and SH-P2-1's "F = (k + 1)λ" at λ = φ.
- **Route on the record** (not part of the statement): G5-PHIa (x = 0 ⟹ a rotation of a family) → t is rotation-invariant (cyclic trace) → the families' t is (k + 1)φ (l. 126; at the family itself P₁^{k−1}P₂ has trace kφ + φ).
- **Standing as the record carries it: ONE HAND.** The x = 0 characterization is SH-P2-1's remark "beyond the brief … worked out here, one hand" (l. 120), carried to the wall as "Beyond the brief, one hand each, for the wall" (l. 355); ledger R-4: "x = 0 EXCLUSIVITY PROVED … (SH-P2-1 beyond the brief, one hand)"; STATEMENTS.md row G5-PHI: "PROVED (one hand beyond the brief; the realization half derived by the RPA)" and "a fresh V₁ reads it as new and may ask for a second head first". No second head on this clause is on the record at this clock. V₁ may ask for one before freezing.

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
Matrix.trace_mul_comm	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:158
List.IsRotated	FOUND List Mathlib/Data/List/Rotate.lean:362
List.rotate_eq_drop_append_take	FOUND List Mathlib/Data/List/Rotate.lean:127
List.replicate	NOT FOUND
List.length_replicate	NOT FOUND
List.length_append	NOT FOUND
```

- `List.replicate`, `List.length_replicate`, `List.length_append` read NOT FOUND in Mathlib: Lean CORE at `leanprover/lean4:v4.33.0` (`Init/Data/List/Basic.lean:706`, `:713`, `:631`). Resolve under `import Mathlib`; not gaps.
- No row is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for every word whose normalized trace has x = 0, the normalized trace equals (k + 1)φ, k the syllable count.

Probe: `<scratchpad>/M-U7/probe.lean` (U1's final probe, sha256 `f15f3200…af63`, whole and unedited, then the U7 block; the probe's sha256 is recorded in `_UNIT-U7.md`). **NOT RUN by this seat** (the brief's amendment 2026-10-30T10:05:25Z: no `lake` from an M seat); the orchestrator elaborates it and returns any error to the row. The text below is the probe's text byte for byte.

Read after `open G5 ZPhi` and the U7 definitions block (`HeckeGrp`, `IsNF`; spec G5-U7-NF §5).

```lean
theorem g5_u7_phi_b (w : List ℕ) (hw : IsWord w) (hx : (ntr w).x = 0) :
    ntr w = (⟨0, (w.length : ℤ) + 1⟩ : ZPhi) := by sorry
```

## 6 · What the row does not claim

- Not the characterization of the x = 0 words (G5-PHIa) and not the realization (G5-PHIc).
- Nothing about the literal sign beyond U1's identity; nothing about classes.
- **Standing as the record carries it: ONE HAND.** The x = 0 characterization is SH-P2-1's remark "beyond the brief … worked out here, one hand" (l. 120), carried to the wall as "Beyond the brief, one hand each, for the wall" (l. 355); ledger R-4: "x = 0 EXCLUSIVITY PROVED … (SH-P2-1 beyond the brief, one hand)"; STATEMENTS.md row G5-PHI: "PROVED (one hand beyond the brief; the realization half derived by the RPA)" and "a fresh V₁ reads it as new and may ask for a second head first". No second head on this clause is on the record at this clock. V₁ may ask for one before freezing.

## 7 · Status

SPEC-DRAFT 2026-10-30T10:17:01Z
