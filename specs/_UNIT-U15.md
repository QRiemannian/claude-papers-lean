# Unit U15 `G5/CensusSearch` — G5-SRCH, Cor. 5.11's cap and search family (Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)*) — unit summary

*Seat M-ADD3 (statement author, step 2 of the lean-papers loop, closing-lane scope addition), opened 2026-10-30T21:16:29Z, first artefact 21:19:01Z, closed 2026-10-30T21:39:12Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-M-ADD3-u14-u15.md` (BRIEF READY 2026-10-30T21:16:05Z), with every rule of `SEAT-P4-LEAN-M-ADD2-u12-u13.md`, `SEAT-P4-LEAN-M-ADD-u9-u10-u11.md` and `SEAT-P3-LEAN-M-U8-group-level-legs.md`. No git, no web, no `lake` command of any kind, no Lean compiled, nothing under `NMC-Phase-1-Research/`.*

source_sha256: 4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f · source_bytes: 30598 — `Orchestrator/Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` and `wc -c` read at 2026-10-30T21:19:01Z and again at 21:37:29Z; equal to the brief's edition pair. **The edition EXTENDS the two before it:** `head -c 25981` reproduces `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47` (U12/U13's pin) and `head -c 21568` reproduces `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` (the frozen eleven's pin), both read at 21:19:01Z and 21:37:29Z. The row is §6 (l. 73). Mathlib pin `db584cd6d46c92f209a44c0f1c829460d327499d` (`lake-manifest.json`), toolchain `leanprover/lean4:v4.33.0`.

**depends_on (each the `statement_sha256` of its `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 21:19:01Z and 21:37:29Z matches):**
- U1 `G5.Ring.Challenge` — `863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c` (`ZPhi`, `phi`, the real order `instLE`/`instLT`, `IsWord`, `ntr`)
- U5 `G5.Ladder.Challenge` — `ea6b4aedd3021843c9399543ebbac30b625aeae4cdd18a0b9042b6b33513d11a` (the non-constancy form `hc`, byte for byte; the route's `g5_u5_mono_a`, `g5_u5_mono_prod`, `g5_u5_lad_a_ge3`)
- U11 `G5.Census.Challenge` — `ee958447349e411d839a595dd2057af8d284daedcb410f4a71a4eca3d2c2b76c` (the census pieces; imported per the row)
- U13 `G5.CensusCap.Challenge` — `d10844cbc16f2b02706d4f35d5d9d232d4809812e9ecbdb6265f1339387b067e` (`g5_u13_cap_a`, the X ≥ 3φ case of SRCHa)

U3 `G5/WordLevel` is NOT imported by the statement (no word lemma is needed to state it); the Solution may import `G5.WordLevel.Solution` on the prelude rule for `g5_u3_a_y_eq_zero` (SRCHc's route).

**U15's ONE definition, for V₁'s signature: `Visited (X : ZPhi) (v : List ℕ) : Prop`** — `∀ p : List ℕ, p <+: v → p ≠ [] → ntr p ≤ X ∧ (p.length ≤ 2 ∨ ((p.length : ZPhi) + 1) * phi ≤ X)`: every non-empty prefix passes both rules of the pruned search (trace ≤ X; length within the all-X cap). "Prefix" is core's `List.IsPrefix` (`<+:`), not a new definition. Equivalent to "every non-empty prefix has trace ≤ X and v's own length is within the cap" by the cap rule's downward monotonicity (SRCHb §3).

## Rows

| id | state | proposed declaration(s) |
|---|---|---|
| G5-SRCHa | SPEC-DRAFT | `g5_u15_srch_cap (X : ZPhi) (w : List ℕ) (hw : IsWord w) (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) (ht : ntr w ≤ X) : w.length ≤ 2 ∨ ((w.length : ZPhi) + 1) * phi ≤ X` |
| G5-SRCHb | SPEC-DRAFT | the definition `Visited`; `g5_u15_srch_visit (X : ZPhi) (w : List ℕ) (hw : IsWord w) (hc : …) (ht : ntr w ≤ X) (v : List ℕ) (hv : List.IsRotated w v) : Visited X v` |
| G5-SRCHc | SPEC-DRAFT | `g5_u15_srch_const (j : ℕ) (hj : 1 ≤ j) : ntr (List.replicate j 1) = 2 ∧ ntr (List.replicate j 4) = 2`; `g5_u15_srch_inf (X : ZPhi) (hX : 2 ≤ X) : Set.Infinite {v : List ℕ \| IsWord v ∧ ∀ p : List ℕ, p <+: v → p ≠ [] → ntr p ≤ X}` |

Specced 3 · **split 1** (G5-SRCH → SRCHa clause (i), SRCHb clause (ii), SRCHc clause (iii) — the row's own numbering, for V₁'s sign-off) · stopped 0. No CC-CANDIDATE.
- **Non-constancy is part of SRCHa and SRCHb, not a weakening:** the constant words keep t = 2 at every length (SH-P2-1 l. 191), so both clauses are FALSE on them (own arithmetic: 776 (constant word, X) pairs break the cap; (1, 1, 1, 1, 1) at X = 2).
- **"Class" = every rotation** (SRCHb): the row's "for every rotation of the word", the print's "Every prefix of a rotation of w" (l. 519).
- **"Required" (SRCHc) read as necessity** — the infinite family; the sufficiency half "under the cap the search is finite" is the record's (SH-P2-1 l. 192) and not a sentence of the print (whole-record grep in SRCHc §6) — offered, not specced.
- **`hj : 1 ≤ j` carried unused** in `g5_u15_srch_const` (the row's "j ≥ 1"; true at j = 0 too) — V₁ may strike it.

Own exact arithmetic (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/check.py`, output `check.out` beside it), the brief's range "words of length ≤ 6 against a grid of X, and the prefix rule": every word of length ≤ 6 against every X = ⟨x, y⟩, −6 ≤ x, y < 30 (657,760 (word, X) pairs with t ≤ X): **(i) 0 violations; (ii) 0 violations** (every rotation, both rules on every non-empty prefix); prefix dominance on every non-empty prefix of every word k ≤ 6: 0 violations; rotation invariance of `ntr`, k ≤ 6: 0; the floor-free cap against max(2, ⌊X/φ⌋ − 1) with ⌊X/φ⌋ decided exactly, k < 40 over the grid: 0 mismatches; the cap rule downward-monotone: 0 violations; **(iii)** j = 1, …, 40: `ntr` of 1^j and 4^j both ⟨2, 0⟩, 0 violations; no word of length ≤ 6 has t < 2 (so `2 ≤ X` is the exact threshold); at X = 25 the largest capped length is 14 = ⌊25/φ⌋ − 1 (impl-a l. 101).

## Mathlib names (classifier of record, `tools/ledger_names.py`, plain form, at the pin)

One hit with its namespace: `List.IsRotated	FOUND List Mathlib/Data/List/Rotate.lean:362`.

- G5-SRCHa: `Nat.cast_ofNat`, `le_trans` (not applicable to `ZPhi`: no `Preorder`), `Int.floor`, `Nat.floor` (FOUND, deliberately not used — the floor-free reading) FOUND; `List.replicate`, `List.length` NOT FOUND (core).
- G5-SRCHb: `List.IsRotated`, `List.IsRotated.perm`, `List.IsRotated.symm`, `List.isRotated_iff_mod`, `Nat.cast_ofNat` FOUND; `List.IsPrefix`, `List.IsPrefix.length_le`, `List.take_prefix`, `List.prefix_refl`, `List.replicate` NOT FOUND (core).
- G5-SRCHc: `Set.Infinite` (`Set`, `Mathlib/Data/Finite/Defs.lean:205`), `Set.infinite_of_injective_forall_mem`, `Set.infinite_of_not_bddAbove`, `Matrix.trace_fin_two` FOUND; `List.replicate`, `List.length_replicate`, `List.IsPrefix` NOT FOUND (core).
- **Every name NOT FOUND, and why:** `List.replicate` (toolchain `src/lean/Init/Data/List/Basic.lean:706`), `List.length_replicate` (`:713`), `List.length`, `List.IsPrefix` with its `<+:` notation (`:1140–1142`), `List.IsPrefix.length_le` (`Init/Data/List/Sublist.lean:797`), `List.take_prefix` (`:1112`), `List.prefix_refl` (`:696`) — Lean core, not mathlib. No row is NEEDS-DEVELOPMENT.

## Probe

`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/probe-U15.lean`, **sha256 `e2bca91958af2cb0c3707115eda61e737640be54a5933b9da1ca74d49e438400`**, 60 lines, longest line 90 code points: `import Mathlib`, `import G5.Ring.Challenge`, `import G5.Ladder.Challenge`, `import G5.Census.Challenge`, `import G5.CensusCap.Challenge`, `open G5 ZPhi`, `namespace G5`, the four theorems `:= by sorry` and the one definition, `end G5`. Assembled by `genprobe.py` from the parts `srcha.lean`, `def_visited.lean`, `srchb.lean`, `srchc.lean`; each spec's §5 block is a byte-for-byte substring of the probe (asserted by `genprobe.py` and again by `gen.py`). **NOT RUN by this seat.** Expected: 4 `declaration uses 'sorry'` warnings (and unused-variable lines), no error — not observed. Built: `G5/{Ring,Ladder,Census,CensusCap}/Challenge.olean` present (CensusCap 18:44).

**Elaboration risks I see:**
1. `p <+: v` — core's `infixl:50 " <+: "` for `List.IsPrefix`; inside `∀ p : List ℕ, p <+: v → p ≠ [] → …` it binds tighter than `→`. Used in a `def` body and in a set-builder.
2. `Visited` is a new name in `namespace G5` (no clash: no `G5.Visited` in the frozen units; mathlib has no root `Visited` in scope that `open G5 ZPhi` would shadow ambiguously — if one exists the namespaced `G5.Visited` still wins inside `namespace G5`).
3. `2 ≤ X` and `ntr … = 2` — the numeral `(2 : ZPhi)` through mathlib's `instOfNat` (NatCast + `Nat.AtLeastTwo`) on U1's `CommRing`, as U5's `2 * phi` elaborated; `≤` is U1's `instLE`, the only one.
4. `Set.Infinite {v : List ℕ | …}` with a typed binder — standard set-builder; `IsWord v` is a `Prop`, no decidability is required anywhere (no `decide` in a statement).
5. `((p.length : ZPhi) + 1) * phi` — U5's form with `p` for `w`.
6. `List.IsRotated w v` with `v` explicit after `ht` — U5's `List.IsRotated w v` shape.

## Line counts (the template's one-liner, per spec)

- `specs/G5-SRCHa.md`: 0 Lean line(s) over 100 code points
- `specs/G5-SRCHb.md`: 0 Lean line(s) over 100 code points
- `specs/G5-SRCHc.md`: 0 Lean line(s) over 100 code points

## The one thing V₁ should look hardest at, per row

- **G5-SRCHa:** the floor-free conclusion `w.length ≤ 2 ∨ ((w.length : ZPhi) + 1) * phi ≤ X` against the print's k ≤ max(2, ⌊X/φ⌋ − 1) — the chain in SRCHa §3 (k ≤ ⌊X/φ⌋ − 1 ⟺ (k + 1)φ ≤ X for integer k, with the record's own ⌊X/φ⌋ "the largest n with nφ ≤ X").
- **G5-SRCHb:** the definition `Visited` — that "both rules on every non-empty prefix" is the search's visited set (reached and kept), and that "visits every class" is "every rotation is visited" (stronger than "some rotation").
- **G5-SRCHc:** whether "the cap is needed for the search to end" is fully stated by the infinite family `g5_u15_srch_inf` (necessity), with the record's sufficiency "under the cap the search is finite" left off as not printed; and the `hj` hypothesis.

## Not rows (the record's, off the lane by the wall's rule)

- **ta4's cap ⌊X/φ⌋** (its sufficiency; `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` l. 55): NOT PRINTED as an assertion — named only in Record 9.5 as kept off (the sweep item 6, l. 28), so NOT-ON-THE-LANE.
- **The counting corollary** (4^k + 4)/5 belongs to U14's family and is listed there.

## Offered, not specced

- **"Under the cap the search is finite"** (SH-P2-1 l. 192) — the sufficiency half of "required": the record's sentence, not the print's (SRCHc §6, with its grep: "search is finite" 1 hit over `Claude-Papers/No1-G5/`, that line). Statable cheaply as `Set.Finite {v | IsWord v ∧ Visited X v}`, if the wall reads Cor. 5.11's "needed for the search to end" as carrying it.

## Files

Specs under `~/Claude/projects/claude-papers-lean/specs/`: `G5-SRCHa.md`, `G5-SRCHb.md`, `G5-SRCHc.md`, `_UNIT-U15.md` (this file).
Scratch a later stage must read: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/probe-U15.lean`. Also there: `srcha.lean`, `def_visited.lean`, `srchb.lean`, `srchc.lean` (the probe's parts), `genprobe.py`, `gen.py`, `check.py`, `check.out`.

## Status

SPEC-DRAFT 2026-10-30T21:39:12Z — U15 on disk; V₁ may open against it.
