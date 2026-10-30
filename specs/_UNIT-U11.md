# Unit U11 `G5/Census` — G5-LADc′, census completeness, the two-case law (Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)*) — unit summary

*Seat M-ADD (statement author, step 2 of the lean-papers loop, Phase 4 addendum), opened 2026-10-30T12:55:06Z, closed 2026-10-30T13:05:19Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-M-ADD-u9-u10-u11.md` (BRIEF READY 2026-10-30T12:54:29Z), with every rule of `SEAT-P3-LEAN-M-U8-group-level-legs.md`. No git, no web, no `lake` command of any kind, nothing under `NMC-Phase-1-Research/`.*

source_sha256: a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731 · source_bytes: 21568 — `Orchestrator/Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` and `wc -c` read in one act at 2026-10-30T12:55:06Z and again at 13:02:59Z; equal to the brief's edition pair `sha256:a84cecdd… · 21568 B` (no bytes appended since — none touch this unit). Mathlib pin `db584cd6d46c92f209a44c0f1c829460d327499d` (`lake-manifest.json`), toolchain `leanprover/lean4:v4.33.0`.

**depends_on (each the `statement_sha256` of its `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 12:57Z and 13:02:59Z matches):**
- U1 `G5.Ring.Challenge` — `863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c` (`ZPhi`, `phi`, the real order `instLE`/`instLT`, `IsWord`, `ntr`)
- U5 `G5.Ladder.Challenge` — `ea6b4aedd3021843c9399543ebbac30b625aeae4cdd18a0b9042b6b33513d11a` (the non-constancy form `hc`, byte for byte; the pieces `g5_u5_lad_a_one`, `_two`, `_ge3`, `g5_u5_lad_b_two`)

**U11 defines nothing.** The imports are the row's (STATEMENTS.md l. 26: U1, U5).

## Rows

| id | state | proposed declaration |
|---|---|---|
| G5-LADc′a | SPEC-DRAFT | `g5_u11_census_a (K : ℕ) (hK : K = 0 ∨ 2 ≤ K) (w : List ℕ) (hw : IsWord w) (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) (ht : ntr w < ((K : ZPhi) + 2) * phi) : w.length ≤ K` |
| G5-LADc′b | SPEC-DRAFT | `g5_u11_census_b (w : List ℕ) (hw : IsWord w) (hc : …) (ht : ntr w < 3 * phi) (hk : 1 < w.length) : List.IsRotated w [1, 4] ∧ ntr w = 3 + phi`; `g5_u11_census_b_wit : ntr [1, 4] < 3 * phi` |

Specced 2 · **split 1** (G5-LADc′ → G5-LADc′a, part (a); G5-LADc′b, part (b) — the row's own (a)/(b), for V₁'s sign-off) · stopped 0. No CC-CANDIDATE. **K = 0 is vacuously true by design** (no non-constant word has t < 2φ); the record states it so and the K ≥ 2 half carries the content — said in G5-LADc′a §6; not the vacuous-statement class. Own exact arithmetic (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD/check.py`): 0 violations of (a) and (b) over every non-constant word of length ≤ 8 (K ∈ {0, 2, …, 11}); the sixteen length-2 traces listed, only (1, 4), (4, 1) non-constant below 3φ; 3 + φ < 3φ in U1's order.

**Three theorems where the brief lists two — for V₁'s signature:** `g5_u11_census_b_wit` (the word (1, 4) has t < 3φ) is the existence half of the record's "the law FAILS at exactly one value"; `g5_u11_census_b` is the at-most-one-value half. On the frozen units the existence is in pieces (U4's `g5_u4_bc_att` or U5's `g5_u5_lad_b_two`, plus 3 + φ < 3φ, which is on no unit). V₁ may strike the witness clause, leaving "fails" to the paper's register; U11's import list would not change.

**Strict inequalities:** U5's frozen Challenge carries no `<`; it writes the cast `((w.length : ZPhi) + 1) * phi`, and U11 writes `((K : ZPhi) + 2) * phi` and `3 * phi` the same way, compared by U1's `instLT` (`s ≤ t ∧ s ≠ t`).

## Mathlib names (classifier of record, `tools/ledger_names.py`, plain form, at the pin)

One hit with its namespace: `List.IsRotated	FOUND List Mathlib/Data/List/Rotate.lean:362`.

- G5-LADc′a: `List.replicate` NOT FOUND, `List.length` NOT FOUND (both Lean core: `List.replicate` at the toolchain's `src/lean/Init/Data/List/Basic.lean:706`, `leanprover/lean4:v4.33.0`; `List.length` core; both used verbatim by U5's frozen Challenge); `Nat.cast_ofNat` FOUND (proof aid).
- G5-LADc′b: `List.IsRotated` FOUND (targeted); `List.IsRotated.refl`, `List.IsRotated.symm`, `List.isRotated_iff_mod` FOUND (proof aids); `List.replicate`, `List.length` NOT FOUND (core, as above).
- **Every name NOT FOUND, and why:** `List.replicate`, `List.length` — Lean core, not mathlib; present in the toolchain. No row is NEEDS-DEVELOPMENT.

## Probe

`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD/probe-U11.lean`, sha256 `47e238dd18b9a6f4b546a4d4c591eb9461f3e78381c0f00d254cfa87666918e4`, 36 lines, longest line 86 code points: `import Mathlib`, `import G5.Ring.Challenge`, `import G5.Ladder.Challenge`, `open G5 ZPhi`, `namespace G5`, the three theorems `:= by sorry`, `end G5`. **NOT RUN by this seat.** Each spec's §5 block is a byte-for-byte substring (asserted by `gen.py`). Expected: 3 `declaration uses 'sorry'` warnings, no error — not observed.

**Elaboration risks I see:**
1. `((K : ZPhi) + 2) * phi` with `K : ℕ`: the `NatCast ZPhi` from U1's `CommRing`, exactly U5's `(w.length : ZPhi)` (elaborated).
2. `ntr w < …`: U1's `instLT` is the only `LT ZPhi` in scope (no `Preorder` instance), so `<` cannot pick a second instance.
3. `ntr [1, 4]`: the list literal takes type `List ℕ` from `ntr`'s argument; `List.IsRotated w [1, 4]` takes it from `w`. U4's `g5_u4_bc_att : ntr [1, 4] = 3 + phi` elaborated in the same shape.
4. The prime in docstrings (`G5-LADc′a`) is inside comments only; no Lean identifier carries it. The spec FILE names do carry U+2032 (`specs/G5-LADc′a.md`, `specs/G5-LADc′b.md`), matching the STATEMENTS.md row id; a tool that wants ASCII names would need them renamed (no lane tool reads `specs/` file names as far as `tools/check.sh` shows).
5. Built imports: `G5/{Ring,Ladder}/Challenge.olean` present at 13:03:44Z.

## Line counts (the template's one-liner, per spec)

- `specs/G5-LADc′a.md`: 0 Lean line(s) over 100 code points
- `specs/G5-LADc′b.md`: 0 Lean line(s) over 100 code points

## The one thing V₁ should look hardest at, per row

- **G5-LADc′a:** the case split `hK : K = 0 ∨ 2 ≤ K` against the record's "For K = 0 and for every K ≥ 2" — K = 1 must be excluded (it is false there: (1, 4)), and K = 0 is the vacuous case the record states on purpose; and the strict `<` with the cast written U5's way.
- **G5-LADc′b:** the witness clause `g5_u11_census_b_wit` — keep (the record says the law FAILS, which is existence) or strike (the brief lists two statements; the existence is in pieces on U4/U5 plus 3 + φ < 3φ on no unit); and that `List.IsRotated w [1, 4]` with `1 < w.length` is the record's "syllable count > 1 is a rotation of (1, 4)" (length is forced to 2 by the rotation).

## Files

Specs under `~/Claude/projects/claude-papers-lean/specs/`: `G5-LADc′a.md`, `G5-LADc′b.md`, `_UNIT-U11.md` (this file).
Scratch a later stage must read: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD/probe-U11.lean`. Also there: `lca.lean`, `lcb.lean` (the probe's parts), `gen.py`, `check.py`.

## Status

SPEC-DRAFT 2026-10-30T13:05:19Z — U11 on disk; V₁ may open against it.
