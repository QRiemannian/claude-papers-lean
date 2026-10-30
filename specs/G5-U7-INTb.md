# G5-U7-INTb

## 1 · Header

row: G5-U7-INTb
unit: U7
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T10:13:11Z; §4 Errata included)
locus: `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` "Theorem as I would print it" Corollary, last sentence (l. 267) and §4 (l. 73–76); `Claude-Papers/No1-G5/candidates/LEDGER.md` row AM-1 (l. 12); STATEMENTS.md row G5-A (l. 15, pointer). SPLIT of the brief's G5-U7-INT: half b, the inclusion {0, ±2} ⊆ Θ ∩ ℤ
spec_clock: 2026-10-30T10:17:01Z

## 2 · Printed statement, verbatim

> In particular no hyperbolic element of G(5) has a rational-integer trace, and Θ(G(5)) ∩ ℤ = {0, ±2}: 0 from the elliptic involution, ±2 from the identity and the parabolic elements.
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 267

> - **The non-hyperbolic traces.**
>   - Elliptic: 0 (±S), and ±φ, ±φ⁻¹ (±R^a, from the table in §1).
>   - Identity and parabolic: ±2.
>   - Of these, only 0 and ±2 are integers.
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 73–76

## 3 · Formal reading

- **Claim.** Each of 0, 2, −2 (the pairs ⟨0, 0⟩, ⟨2, 0⟩, ⟨−2, 0⟩) is the trace of some element of `HeckeGrp` — the ⊇ half of the record's equality Θ(G(5)) ∩ ℤ = {0, ±2}, kept as its own row so the equality is not silently weakened to an inclusion.
- The record's witnesses (l. 267, l. 74–75): 0 from the elliptic involution (±S), 2 from the identity, −2 from −I = S² (and ±2 from the parabolic elements, e.g. ±T). The statement names no witness.

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
Subgroup.subset_closure	FOUND Subgroup Mathlib/Algebra/Group/Subgroup/Lattice.lean:341
Subgroup.one_mem	FOUND Subgroup Mathlib/Algebra/Group/Subgroup/Defs.lean:433
Subgroup.mul_mem	FOUND Subgroup Mathlib/Algebra/Group/Subgroup/Defs.lean:438
Matrix.trace_one	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:146
Matrix.trace_neg	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:136
```

- All FOUND; proof aids only (the witnesses S, 1, S·S lie in the closure).
- No row is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: each of 0, 2 and −2 is the trace of some element of ⟨S, T⟩.

Probe: `<scratchpad>/M-U7/probe.lean` (U1's final probe, sha256 `f15f3200…af63`, whole and unedited, then the U7 block; the probe's sha256 is recorded in `_UNIT-U7.md`). **NOT RUN by this seat** (the brief's amendment 2026-10-30T10:05:25Z: no `lake` from an M seat); the orchestrator elaborates it and returns any error to the row. The text below is the probe's text byte for byte.

Read after `open G5 ZPhi` and the U7 definitions block (`HeckeGrp`, `IsNF`; spec G5-U7-NF §5).

```lean
theorem g5_u7_int_b (t : ZPhi)
    (ht : t = 0 ∨ t = (⟨2, 0⟩ : ZPhi) ∨ t = (⟨-2, 0⟩ : ZPhi)) :
    ∃ g ∈ HeckeGrp, (g : M2).trace = t := by sorry
```

## 6 · What the row does not claim

- Nothing about which elements realize them, beyond existence; nothing about non-integer traces.
- Not the inclusion (G5-U7-INTa).

## 7 · Status

SPEC-DRAFT 2026-10-30T10:17:01Z

V1: V1-GREEN 2026-10-30T10:26:49Z — both §2 cites match verbatim (script). It is the ⊇ half of the record's EQUALITY Θ(G(5)) ∩ ℤ = {0, ±2} (second head l. 267, LEDGER l. 12, AM l. 128); 0 from the involution S, 2 from I, −2 from −I = S² (l. 72, l. 74–75), all in the group, so it is true. V1-SPLIT-OK on G5-U7-INT → INTa + INTb: the split keeps the equality whole, where the brief's half alone would have weakened it to an inclusion. Parse: 0 Lean line(s) over 100 code points

V2: V2-GREEN 2026-10-30T10:56:50Z — the ⊇ half (AM-1-second-head l. 267, l. 74–75): each of 0, 2, −2 is the trace of some element of ⟨S, T⟩; with INTa the record's equality stays whole. Existence only, no witness named. Byte-identical to §5 (script).
