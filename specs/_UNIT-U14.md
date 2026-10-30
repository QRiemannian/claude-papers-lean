# Unit U14 `G5/EvenKRemark` — G5-EVKR, Rem. 4.4's remark family (Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)*) — unit summary

*Seat M-ADD3 (statement author, step 2 of the lean-papers loop, closing-lane scope addition), opened 2026-10-30T21:16:29Z, first artefact 21:19:01Z, closed 2026-10-30T21:39:12Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-M-ADD3-u14-u15.md` (BRIEF READY 2026-10-30T21:16:05Z), with every rule of `SEAT-P4-LEAN-M-ADD2-u12-u13.md`, `SEAT-P4-LEAN-M-ADD-u9-u10-u11.md` and `SEAT-P3-LEAN-M-U8-group-level-legs.md`. No git, no web, no `lake` command of any kind, no Lean compiled, nothing under `NMC-Phase-1-Research/`.*

source_sha256: 4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f · source_bytes: 30598 — `Orchestrator/Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` and `wc -c` read at 2026-10-30T21:19:01Z and again at 21:37:29Z; equal to the brief's edition pair. **The edition EXTENDS the two before it:** `head -c 25981` reproduces `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47` (U12/U13's pin) and `head -c 21568` reproduces `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` (the frozen eleven's pin), both read at 21:19:01Z and 21:37:29Z. The row is §6 (l. 72). Mathlib pin `db584cd6d46c92f209a44c0f1c829460d327499d` (`lake-manifest.json`), toolchain `leanprover/lean4:v4.33.0`.

**depends_on (each the `statement_sha256` of its `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 21:19:01Z and 21:37:29Z matches):**
- U1 `G5.Ring.Challenge` — `863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c` (`ZPhi`, `IsWord`, `W`)
- U2 `G5.ModTwo.Challenge` — `c342ab92ba8ef07e5a9fba82422968b9de4410974583210dc1dcded53354c78c` (`F4`, `F4M`, `red2M`, `Rbar`; the route's `g5_u2_red_hom`, `g5_u2_d5_gens`, `g5_u2_d5_image`)
- U12 `G5.EvenK.Challenge` — `321dfbf5abdc78157328a8f7d1c53d40ae09a60b6a5cf027824d09da8f967565` (`A`; `g5_u12_evk_a` available)

**U14 defines nothing.** The imports are the row's (STATEMENTS.md l. 72: U1, U2, U12). The U14 Solution, on the prelude rule, imports `G5.EvenK.Solution`, where the mechanism is already private (`g5_u12_aux_red2M_W` + `g5_u12_aux_pair`, `g5_u12_aux_f j = Rbar ^ j.val`) — the route, not the statement.

## Rows

| id | state | proposed declaration(s) |
|---|---|---|
| G5-EVKRa | SPEC-DRAFT | `g5_u14_evkr_mech (w : List ℕ) (hw : IsWord w) (hk : Even w.length) : red2M (W w) = Rbar ^ (A w : ZMod 5).val` |
| G5-EVKRb | SPEC-DRAFT | `g5_u14_evkr_one (w) (hw) (hk) : (5 : ℤ) ∣ A w ↔ red2M (W w) = 1`; `g5_u14_evkr_ord (w) (hw) (hk) (h5 : ¬ (5 : ℤ) ∣ A w) : orderOf (red2M (W w)) = 5`; `g5_u14_evkr_b (w) (hw) (hk) : (5 : ℤ) ∣ A w ↔ orderOf (red2M (W w)) ≠ 5` |
| G5-EVKRc | SPEC-DRAFT | `g5_u14_evkr_rot (a : ℕ) (l : List ℕ) (hk : Even (a :: l).length) : A (l ++ [a]) = -A (a :: l)` |

Specced 3 · **split 1** (G5-EVKR → EVKRa clause (1), EVKRb clause (2), EVKRc clause (3) — the row's own numbering, for V₁'s sign-off) · stopped 0. No CC-CANDIDATE: all three clauses hold on own arithmetic and on the record's proof.
- **Five theorems where the row has three clauses:** clause (2) carries two legs and its consequence (EVKRb §3); V₁ may strike `g5_u14_evkr_b` as derivable — it is kept because the row and the record state (a) ⟺ (b) as the clause's point.
- **No `IsWord` in EVKRc** — the brief's instruction ("pure list arithmetic, no `IsWord` needed (say so)"), said in EVKRc §3: a widening of the record's domain on an identity true everywhere.

Own exact arithmetic (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/check.py`, output `check.out` beside it), the brief's range "all words of even length ≤ 8": the 69,904 words of length 2, 4, 6, 8 — (1) the mechanism matrix by matrix over 𝔽₄, (2) the three order statements, (3) the rotation identity: **0 violations each**; orders met {1, 5}. Controls: at odd k ≤ 3 the mechanism holds on 0 of 68 words; at odd k ≤ 5 the rotation identity fails on all 1,092 words — both `Even` hypotheses carry content. The rotation identity also on 420,099 lists over {0, …, 6} (no `IsWord`): 0 violations.

## Mathlib names (classifier of record, `tools/ledger_names.py`, plain form, at the pin)

One hit with its namespace: `ZMod.val	FOUND ZMod Mathlib/Data/ZMod/Basic.lean:57`.

- G5-EVKRa: `ZMod`, `ZMod.val`, `ZMod.val_intCast`, `Matrix.map`, `IsSquare`, `RingHom.mapMatrix`, `map_list_prod` FOUND; `Even` AMBIGUOUS (the root `Even` is `@[to_additive]` of `IsSquare`, `Mathlib/Algebra/Group/Even.lean:55–57`; keyword sites `Function.Even`, `DirichletCharacter.Even` not meant); `Int.cast`, `List.length` NOT FOUND (core).
- G5-EVKRb: `orderOf` (`_root_`, `Mathlib/GroupTheory/OrderOfElement.lean:180`), `orderOf_eq_prime`, `orderOf_eq_one_iff`, `pow_orderOf_eq_one`, `orderOf_eq_iff`, `ZMod.intCast_zmod_eq_zero_iff_dvd`, `IsSquare` FOUND; `Even` AMBIGUOUS (as above); `Dvd.dvd` NOT FOUND (core).
- G5-EVKRc: `Nat.even_add_one`, `List.rotate_cons_succ`, `IsSquare` FOUND; `Even` AMBIGUOUS; `List.length_append`, `List.length_cons` NOT FOUND (core).
- **Every name NOT FOUND, and why:** `Int.cast` (core `class IntCast`, toolchain `src/lean/Init/Data/Int/Basic.lean:451`), `Dvd.dvd` (core `class Dvd`, `src/lean/Init/Prelude.lean:1561`), `List.length`, `List.length_append` (`src/lean/Init/Data/List/Basic.lean:631`), `List.length_cons` (`:89`) — Lean core, not mathlib. No row is NEEDS-DEVELOPMENT.

## Probe

`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/probe-U14.lean`, **sha256 `aa833b713f0422613c5f356ba4d08090061a3d95977d7f58cb36fd866c396f2d`**, 50 lines, longest line 89 code points: `import Mathlib`, `import G5.Ring.Challenge`, `import G5.ModTwo.Challenge`, `import G5.EvenK.Challenge`, `open G5 ZPhi`, `namespace G5`, the five theorems `:= by sorry`, `end G5`. Assembled by `genprobe.py` from the parts `evkra.lean`, `evkrb.lean`, `evkrc.lean`; each spec's §5 block is a byte-for-byte substring of the probe (asserted by `genprobe.py` and again by `gen.py`). **NOT RUN by this seat.** Expected: 5 `declaration uses 'sorry'` warnings (and unused-variable lines for `hw`/`hk`), no error — not observed. Built: `G5/{Ring,ModTwo,EvenK}/Challenge.olean` present (EvenK 18:43).

**Elaboration risks I see:**
1. `Rbar ^ (A w : ZMod 5).val` — the type ascription casts `A w : ℤ` through `IntCast (ZMod 5)`; `.val` must resolve to `ZMod.val` on the ascribed type (U12's Solution writes `j.val` with `j : ZMod 5`, which elaborated); the power is `Monoid.npow` on `F4M` with a natural exponent.
2. `orderOf (red2M (W w))` needs `Monoid F4M` — the matrix semiring over U2's `F4.instCommRing`; U2's frozen Challenge already elaborates `Rbar ^ 5 = 1` and `Submonoid.closure` on `F4M`, so the instance path exists.
3. `red2M (W w) = 1` — `1 : F4M` is the matrix one (`DecidableEq (Fin 2)`), as in U2's `Sbar * Sbar = 1`.
4. `A` resolves to U12's `G5.A` inside `namespace G5`; no other `A` is in scope after `open G5 ZPhi` (U1/U2 declare none).
5. `-A (a :: l)` parses as `-(A (a :: l))` (application binds tighter than prefix negation); `Even (a :: l).length` uses dot notation on a parenthesized cons.
6. The import of `G5.EvenK.Challenge` brings its two `sorry` theorems into the environment — harmless (warnings belong to that module's own build, not re-emitted).

## Line counts (the template's one-liner, per spec)

- `specs/G5-EVKRa.md`: 0 Lean line(s) over 100 code points
- `specs/G5-EVKRb.md`: 0 Lean line(s) over 100 code points
- `specs/G5-EVKRc.md`: 0 Lean line(s) over 100 code points

## The one thing V₁ should look hardest at, per row

- **G5-EVKRa:** the exponent convention `Rbar ^ (A w : ZMod 5).val` for the record's r^{A(W)} with A a possibly negative integer (A(1, 2) = −1 ↦ R̄⁴) — the row says "M's shape, V₁ signs it"; and the reading of "the image in PSL(2, 𝔽₄)" as the reduced matrix itself (SL = PSL in characteristic 2).
- **G5-EVKRb:** that `orderOf` in the monoid `F4M` is the record's "order of the image in PSL(2, 𝔽₄)", and whether the third theorem `g5_u14_evkr_b` (the consequence (a) ⟺ (b)) stays beside its two legs.
- **G5-EVKRc:** the dropped `IsWord` (the statement holds for every list of naturals of even length; the record's sentence is about words) and the explicit display `l ++ [a]` for "a one-step rotation" (rather than `List.rotate`).

## Not rows (the record's, off the lane by the wall's rule)

- **The counting corollary** — "the number of even-k sequences with A ≡ 0 (mod 5) … is (4^k + 4)/5" (SH-P4-LW-A l. 64; controlled l. 69): NOT PRINTED (the sweep `phase-4/close/L1-printed-uncarried-sweep.md` item 4, l. 26: "no hit for the formula or any variant in any landed file"), so NOT-ON-THE-LANE.
- Also not specced: the print's "order 1 or 2" reading (EVKRb §3); the rotation-invariance consequence, reversal and flip (EVKRc §6).

## Files

Specs under `~/Claude/projects/claude-papers-lean/specs/`: `G5-EVKRa.md`, `G5-EVKRb.md`, `G5-EVKRc.md`, `_UNIT-U14.md` (this file).
Scratch a later stage must read: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/probe-U14.lean`. Also there: `evkra.lean`, `evkrb.lean`, `evkrc.lean` (the probe's parts), `genprobe.py`, `gen.py`, `check.py`, `check.out`.

## Status

SPEC-DRAFT 2026-10-30T21:39:12Z — U14 on disk; V₁ may open against it.
