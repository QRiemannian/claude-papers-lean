# Unit U10 `G5/Containment` — G5-COR, the printed Corollary's containment (Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)*) — unit summary

*Seat M-ADD (statement author, step 2 of the lean-papers loop, Phase 4 addendum), opened 2026-10-30T12:55:06Z, closed 2026-10-30T13:05:19Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-M-ADD-u9-u10-u11.md` (BRIEF READY 2026-10-30T12:54:29Z), with every rule of `SEAT-P3-LEAN-M-U8-group-level-legs.md`. No git, no web, no `lake` command of any kind, nothing under `NMC-Phase-1-Research/`.*

source_sha256: a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731 · source_bytes: 21568 — `Orchestrator/Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` and `wc -c` read in one act at 2026-10-30T12:55:06Z and again at 13:02:59Z; equal to the brief's edition pair `sha256:a84cecdd… · 21568 B` (no bytes appended since — none touch this unit). Mathlib pin `db584cd6d46c92f209a44c0f1c829460d327499d` (`lake-manifest.json`), toolchain `leanprover/lean4:v4.33.0`.

**depends_on (each the `statement_sha256` of its `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 12:57Z and 13:02:59Z matches):**
- U1 `G5.Ring.Challenge` — `863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c` (`ZPhi`, its anonymous constructor, `M2`)
- U7 `G5.Group.Challenge` — `689c36e6c026a1ce151dd2ab84243a5f8f76bb20a11304c9065cdb358ed410ae` (`HeckeGrp`; the route's `g5_u7_nf`)
- U8 `G5.GroupLevel.Challenge` — `bf7316f7eae415f48781199ebd28706dfc940633d484ca5ef2aae997dcb08ccd` (the route's `g5_u8_ell`)
- U3 `G5.WordLevel.Challenge` — `69533d2d17c4ed2dc569c1de6ddb5e92e42b85099901370bb946ea0ed7a13735` (the route's `g5_u3_a_nonneg`, `g5_u3_a_y_eq_zero`)

**U10 defines nothing.** The imports are the row's (STATEMENTS.md l. 25: U1, U7, U8, U3). The statement itself uses only U1's and U7's names; U8 and U3 are imported for the pieces the row names (and U1's `g5_u1_trace`).

## Rows

| id | state | proposed declaration |
|---|---|---|
| G5-COR | SPEC-DRAFT | `g5_u10_cor (g : M2ˣ) (hg : g ∈ HeckeGrp) : (tr = ⟨2, 0⟩ ∨ tr = ⟨-2, 0⟩ ∨ tr = 0 ∨ tr = ⟨0, 1⟩ ∨ tr = ⟨0, -1⟩ ∨ tr = ⟨-1, 1⟩ ∨ tr = ⟨1, -1⟩) ∨ ∃ x y : ℤ, 0 ≤ x ∧ 1 ≤ y ∧ (tr = ⟨x, y⟩ ∨ tr = -⟨x, y⟩)`, tr := `(g : M2).trace` (each pair annotated `: ZPhi` in the Lean text) |

Specced 1 · split 0 · stopped 0. No CC-CANDIDATE: true as recorded (the non-word traces are U8's `g5_u8_ell` values and their negatives; ±W w by Theorem A's positivity and the y = 0 case).

**±φ⁻¹ as pairs:** the record's φ⁻¹ is ⟨−1, 1⟩ = φ − 1, −φ⁻¹ is ⟨1, −1⟩ (spec §3); no inverse theorem is stated — "φ − 1 = φ⁻¹" is notation, not on the lane (STATEMENTS.md §2 item 7, l. 39; struck from U8 by V₁, §4 l. 55).

## Mathlib names (classifier of record, `tools/ledger_names.py`, plain form, at the pin)

One hit with its namespace: `Matrix.trace_neg	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:136`.

G5-COR: `Matrix.trace` (targeted), `Matrix.trace_mul_comm`, `Matrix.trace_mul_cycle`, `Matrix.trace_neg`, `Units.val_mul`, `Units.mul_inv`, `Units.val_inv_eq_inv_val` (proof aids), all FOUND. **Not found: none.** Not NEEDS-DEVELOPMENT.

## Probe

`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD/probe-U10.lean`, sha256 `3e75573d0a2b1ac43178a4a9493e0e5d2349458520f73d6445fc32e967182106`, 24 lines, longest line 89 code points: `import Mathlib`, `import G5.Ring.Challenge`, `import G5.Group.Challenge`, `import G5.GroupLevel.Challenge`, `import G5.WordLevel.Challenge`, `open G5 ZPhi`, `namespace G5`, the one theorem `:= by sorry`, `end G5`. **NOT RUN by this seat.** The spec's §5 block is a byte-for-byte substring (asserted by `gen.py`). Expected: 1 `declaration uses 'sorry'` warning, no error — not observed.

**Elaboration risks I see:**
1. Transitive imports through U8: `G5.ModTwo.Challenge` (`G5.F4`, its instances, `red2`, …) and `G5.Congruence.Challenge` (`ZPhi.red4`, `ZPhi.red3`, `G5.H4`) come in under `open G5 ZPhi`; U10's text names none of them and no new name collides (`G5.g5_u10_cor` is new). U8's own probe opened the same set and elaborated.
2. `-(⟨x, y⟩ : ZPhi)` with `x y : ℤ` bound by `∃`: the anonymous constructor under an explicit type ascription, then `Neg ZPhi` (U1's `instNeg` or the ring's — either elaborates; a diamond is a proof concern only).
3. `(⟨-2, 0⟩ : ZPhi)`, `(⟨0, -1⟩ : ZPhi)`, `(⟨1, -1⟩ : ZPhi)`: negative integer literals in the constructor, as U7's `⟨-2, 0⟩` and U8's `⟨1, -1⟩` (elaborated).
4. The nested disjunction's parenthesization: the finite part is one parenthesized seven-way `∨`, then `∨ ∃ …` — the `∃` extends to the end of the statement, as intended.
5. Built imports: `G5/{Ring,Group,GroupLevel,WordLevel}/Challenge.olean` present at 13:03:44Z.

## Line counts (the template's one-liner, per spec)

- `specs/G5-COR.md`: 0 Lean line(s) over 100 code points

## The one thing V₁ should look hardest at

- **G5-COR:** the seven-pair transcription of {±2, 0, ±φ, ±φ⁻¹} — φ⁻¹ read as ⟨−1, 1⟩ = φ − 1 with no inverse theorem behind it (the wall ruled the identity notation, §2 item 7), and that the seven pairs are exactly U8's `g5_u8_ell` values closed under negation; and that x, y in "{±(x + yφ) : x ≥ 0, y ≥ 1}" are integers (`∃ x y : ℤ`), not naturals or reals.

## Files

Specs under `~/Claude/projects/claude-papers-lean/specs/`: `G5-COR.md`, `_UNIT-U10.md` (this file).
Scratch a later stage must read: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD/probe-U10.lean`. Also there: `cor.lean` (the probe's part), `gen.py`, `check.py`.

## Status

SPEC-DRAFT 2026-10-30T13:05:19Z — U10 on disk; V₁ may open against it.
