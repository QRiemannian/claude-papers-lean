# Unit U7 — the group-level corollaries and the φ-line (Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)*) — unit summary

*Seat M-U7 (statement author, step 2 of the lean-papers loop), opened 2026-10-30T10:06:37Z, closed 2026-10-30T10:18:54Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-M-U7.md` (BRIEF READY 2026-10-30T10:04:41Z; probe amendment 10:05:25Z). No git, no web, nothing under `NMC-Phase-1-Research/`, no `lake` command of any kind.*

source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 — `Orchestrator/Claude-Papers/No1-G5/phase-3/STATEMENTS.md` (§4 Errata included), `shasum -a 256` at 2026-10-30T10:06:37Z and again at 10:13:11Z; it matches the brief's digest. Mathlib pin `db584cd6d46c92f209a44c0f1c829460d327499d` (`lake-manifest.json`), toolchain `leanprover/lean4:v4.33.0`.

## Rows

| id | state | proposed declaration |
|---|---|---|
| G5-U7-NF | SPEC-DRAFT | defs `G5.HeckeGrp : Subgroup M2ˣ` (closure of the units with underlying matrix S or T), `G5.IsNF`; `g5_u7_nf (g : M2ˣ) (hg : g ∈ HeckeGrp) : ∃ h ∈ HeckeGrp, IsNF ((h * g * h⁻¹ : M2ˣ) : M2)` |
| G5-U7-INTa | SPEC-DRAFT (SPLIT, half a) | `g5_u7_int_a (g) (hg : g ∈ HeckeGrp) (hy : phiCoeff (g : M2).trace = 0) : (g : M2).trace = 0 ∨ … = ⟨2, 0⟩ ∨ … = ⟨-2, 0⟩` |
| G5-U7-INTb | SPEC-DRAFT (SPLIT, half b) | `g5_u7_int_b (t) (ht : t = 0 ∨ t = ⟨2, 0⟩ ∨ t = ⟨-2, 0⟩) : ∃ g ∈ HeckeGrp, (g : M2).trace = t` |
| G5-PHIa | SPEC-DRAFT (SPLIT, half a; ONE HAND on the record) | `g5_u7_phi_a (w) (hw : IsWord w) : (ntr w).x = 0 ↔ (List.IsRotated w (List.replicate (w.length - 1) 1 ++ [2]) ∨ List.IsRotated w (3 :: List.replicate (w.length - 1) 4))` |
| G5-PHIb | SPEC-DRAFT (SPLIT, half b; ONE HAND on the record) | `g5_u7_phi_b (w) (hw : IsWord w) (hx : (ntr w).x = 0) : ntr w = ⟨0, w.length + 1⟩` |
| G5-PHIc | SPEC-DRAFT (SPLIT, half c; DERIVED by the RPA, restated by SH-P2-1) | `g5_u7_phi_c (k) (hk : 1 ≤ k) : ∃ w, IsWord w ∧ w.length = k ∧ ntr w = ⟨0, k + 1⟩` |

Specced 6 · split 2 (G5-U7-INT → INTa/INTb; G5-PHI → PHIa/PHIb/PHIc) · stopped 0 (no CC-CANDIDATE: every U7 statement is true as recorded).

**The splits, for V₁'s sign-off.**
- **G5-U7-INT → INTa + INTb.** The record's sentence is an EQUALITY, "Θ(G(5)) ∩ ℤ = {0, ±2}" (ledger AM-1 l. 12; second head l. 267; AM l. 128). The brief names its ⊆ half ("t ∈ ℤ ⟹ t ∈ {0, 2, −2}"); INTa states that half, INTb the ⊇ half (0, 2, −2 each realized: S, I, −I = S² on the record, l. 267), so the equality is not silently weakened. "No hyperbolic element has an integer trace" is subsumed by INTa (no hyperbolic predicate is defined).
- **G5-PHI → PHIa + PHIb + PHIc.** PHIa: x = 0 iff a rotation of (1^{k−1}, 2) or (3, 4^{k−1}) (SH-P2-1 l. 120–128); PHIb: the value, x = 0 ⟹ t = (k + 1)φ (the row's "(trace (k + 1)φ)"; SH-P2-1 l. 126; ledger R-4 "the only pure-φ trace is (−1)^k (k+1)φ", literal sign removed by U1's `g5_u1_trace`); PHIc: realization at every k ≥ 1 (RPA l. 37 [HD, DERIVED HERE]; SH-P2-1 l. 110). PHIb + PHIc together are the row's "the pure-φ traces … are exactly nφ, n ≥ 3 (and 2φ at k = 1), each realized"; the set-level sentence is not specced separately.
- **PHIa's domain is every word**, as the record's remark states it; the brief's "for every non-constant word" is implied (a constant word has x = 2 and is no rotation of either family), not added.

**Defined by this unit (only what U7 alone needs), in `namespace G5`:** `HeckeGrp : Subgroup M2ˣ` := `Subgroup.closure {u : M2ˣ | (u : M2) = S ∨ (u : M2) = T}` (the set form keeps every inverse proof out of the definition; since S and T are invertible in `M2` the set is exactly the two units S, T) and `IsNF (m : M2) : Prop` (±I, ±S, ±R^a for 1 ≤ a ≤ 4, ±W w for IsWord w — the record's four forms). Everything else is U1's (`ZPhi`, `phiCoeff`, `M2`, `S`, `T`, `R`, `IsWord`, `W`, `ntr`). Rotation is mathlib's `List.IsRotated`. Theorem names follow the offered pattern `g5_u7_*`.

**Citation of U3 (hypothesis-free; the L seat imports).** INTa carries no hypothesis from U3; its proof route on the record runs G5-U7-NF → trace is a class function → `g5_u1_trace` → U3's `g5_u3_a_y_eq_zero` (`specs/G5-Ab.md`, U3 closed 2026-10-30T10:15:14Z) → traces of ±I, ±S, ±R^a. The L seat uses U3's name as frozen.

**Locus note.** The brief points G5-U7-NF at "`candidates/checks/AM-1-second-head.md` §3 (the group corollary)"; in that file §3 (l. 42–63) is positivity and the y = 0 case, and the normal-form paragraph is **§4 "Scope" (l. 65–72)**, the Corollary in "Theorem as I would print it" (l. 263–267). The specs quote from where the text is.

**On the record, outside the brief's cut (OPEN, not specced, for V₁):** the printed Corollary's stronger containment "Every element of G(5) has trace in {±2, 0, ±φ, ±φ⁻¹} ∪ {±(x + yφ) : x ≥ 0, y ≥ 1}" (`AM-1-second-head.md` l. 263–265). INTa is its "In particular". Should V₁ want it as a lemma leg, it is a new row.

## Mathlib names (classifier of record, `tools/ledger_names.py`, plain form, at the pin)

One hit with its namespace: `Subgroup.closure	FOUND Subgroup Mathlib/Algebra/Group/Subgroup/Lattice.lean:329`.

Declarations per row (verdict lines pasted whole in each spec's §4):
- G5-U7-NF: `Subgroup.closure`, `Units`, `Units.ext`, `Subgroup.subset_closure`, `Subgroup.closure_induction`, `Subgroup.mul_mem`, `Subgroup.inv_mem`, `IsConj` (FOUND; `IsConj` weighed, not used); `Units.val` (NOT FOUND — a structure FIELD, `Mathlib/Algebra/Group/Units/Defs.lean:51`, `attribute [coe]` l. 59; present, the coercion).
- G5-U7-INTa: `Matrix.trace`, `Matrix.trace_mul_cycle`, `Matrix.trace_mul_comm`, `Units.val_mul`, `Units.val_inv_eq_inv_val`, `Matrix.trace_neg`, `Matrix.trace_one` (FOUND).
- G5-U7-INTb: `Subgroup.subset_closure`, `Subgroup.one_mem`, `Subgroup.mul_mem`, `Matrix.trace_one`, `Matrix.trace_neg` (FOUND).
- G5-PHIa: `List.IsRotated`, `List.IsRotated.symm`, `List.IsRotated.refl`, `List.rotate_eq_drop_append_take`, `List.isRotated_iff_mod`, `Matrix.trace_mul_comm` (FOUND); `List.rotate` (NOT FOUND — BATTERIES, `.lake/packages/batteries/Batteries/Data/List/Basic.lean:653`); `List.replicate` (NOT FOUND — Lean core, `Init/Data/List/Basic.lean:706`).
- G5-PHIb: `Matrix.trace_mul_comm`, `List.IsRotated`, `List.rotate_eq_drop_append_take` (FOUND); `List.replicate`, `List.length_replicate`, `List.length_append` (NOT FOUND — Lean core, `Init/Data/List/Basic.lean:706`, `:713`, `:631`).
- G5-PHIc: `Matrix.trace` (FOUND); `List.replicate`, `List.length_replicate`, `List.length_append` (NOT FOUND — Lean core, as above).

**Every name NOT FOUND, and why:** `Units.val` (structure field, present); `List.rotate` (Batteries, present); `List.replicate`, `List.length_replicate`, `List.length_append` (Lean core, present). Also tried and not found, NOT targeted by any row: `List.isRotated_iff_mem_cyclicPermutations`, `List.prod_rotate`. No row is NEEDS-DEVELOPMENT.

## Probe

`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-U7/probe.lean`, sha256 `ea2c9fb5f4a2704bd0626c848b8f24f5239650dfbb87aac013501959f1a8301c`, 194 lines: U1's final probe (sha256 `f15f320065142f9533d7c775430280434d4ec3533a27927dd740d2210e04af63`, copied whole and unedited, checked by digest; also at `prefix.lean` beside it) followed by the U7 block (`block.lean`: `open G5 ZPhi`, the two definitions in `namespace G5`, six theorems `:= by sorry`). **NOT RUN by this seat** (the brief's amendment 2026-10-30T10:05:25Z: no `lake` command of any kind from an M seat); for the orchestrator's serial elaboration. Every spec's §5 Lean text is a byte-for-byte substring of the probe (checked by script). Expected on elaboration: six `declaration uses 'sorry'` warnings beyond U1's five, no error — not yet observed.

## Line counts (the template's one-liner, per spec)

- `specs/G5-U7-NF.md`: 0 Lean line(s) over 100 code points
- `specs/G5-U7-INTa.md`: 0 Lean line(s) over 100 code points
- `specs/G5-U7-INTb.md`: 0 Lean line(s) over 100 code points
- `specs/G5-PHIa.md`: 0 Lean line(s) over 100 code points
- `specs/G5-PHIb.md`: 0 Lean line(s) over 100 code points
- `specs/G5-PHIc.md`: 0 Lean line(s) over 100 code points

## The one thing V₁ should look hardest at, per row

- **G5-U7-NF:** the definition `HeckeGrp` — closure of the UNITS whose underlying matrix is S or T is ⟨S, T⟩ only because S and T are invertible in `M2` (were either not a unit the set would shrink and the theorem weaken silently); and that `IsNF` is exactly the record's four forms (l. 68–71) with `IsWord`'s k ≥ 1, and the conjugation inside the subgroup (h ∈ `HeckeGrp`).
- **G5-U7-INTa:** the reading of "t ∈ ℤ" as `phiCoeff t = 0` and of 2, −2 as the pairs ⟨2, 0⟩, ⟨−2, 0⟩; that the domain is every element (not classes), and that the companion "no hyperbolic element has an integer trace" is fairly subsumed rather than dropped.
- **G5-U7-INTb:** only that it is the ⊇ half of the record's equality and is kept so the equality is whole.
- **G5-PHIa:** the STANDING — one hand on the record (SH-P2-1 "beyond the brief"), no second head; V₁ may ask for a second head before freezing. Then the list encoding of the two families (`List.replicate (k - 1) 1 ++ [2]`, `3 :: List.replicate (k - 1) 4`) and the domain of every word (the brief's "non-constant" implied, not added).
- **G5-PHIb:** that ⟨0, k + 1⟩ is the NORMALIZED trace (the ledger's "(−1)^k (k+1)φ" is literal); same one-hand standing as PHIa, on which it rests.
- **G5-PHIc:** the per-k form (a word of length exactly k with t = (k + 1)φ) against the row's "nφ, n ≥ 3 (and 2φ at k = 1), each realized" — the per-k form is what the record derives (the RPA's witness (1^{k−1}, 2) at count k), and fixes the length; V₁ to judge it no stronger than the record.

## Files

Specs (write path): `~/Claude/projects/claude-papers-lean/specs/` — `G5-U7-NF.md`, `G5-U7-INTa.md`, `G5-U7-INTb.md`, `G5-PHIa.md`, `G5-PHIb.md`, `G5-PHIc.md`, `_UNIT-U7.md` (this file).

Scratch a later stage must read: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-U7/probe.lean` (the probe for the orchestrator's elaboration, the source of every §5 block). Also there: `block.lean` (the U7 block alone), `prefix.lean` (U1's probe, copied), `gen.py` (the script that wrote the specs, pulling every §2 quote by file and line from the record and every §5 block from the probe), `clock.txt`.

## Status

SPEC-DRAFT 2026-10-30T10:18:54Z — U7 on disk; V₁ may open against it.

## Probe elaboration (the orchestrator's serial run, 2026-10-30T10:26:22Z)

`lake env lean <scratchpad>/M-U7/probe.lean`: exit 0; errors 0; `declaration uses sorry` warnings 11 (U1's five plus this unit's 6 theorems); maximum resident set size 5210619904 bytes; 22 s (10:24:31Z → 10:24:53Z) wall. Log: `<scratchpad>/M-U7/probe-orch-run.log`.
