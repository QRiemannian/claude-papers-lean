# Unit U13 `G5/CensusCap` — G5-CAP, the census cap clause (Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)*) — unit summary

*Seat M-ADD2 (statement author, step 2 of the lean-papers loop, Phase 4 scope addition), opened 2026-10-30T18:17:12Z, closed 2026-10-30T18:27:24Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-M-ADD2-u12-u13.md` (BRIEF READY 2026-10-30T18:16:51Z), with every rule of `SEAT-P4-LEAN-M-ADD-u9-u10-u11.md` and `SEAT-P3-LEAN-M-U8-group-level-legs.md`. No git, no web, no `lake` command of any kind, nothing under `NMC-Phase-1-Research/`.*

source_sha256: 1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47 · source_bytes: 25981 — `Orchestrator/Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` and `wc -c` read at 2026-10-30T18:17:12Z and again at 18:24:39Z; equal to the brief's edition pair. The edition EXTENDS the frozen units' edition: `head -c 21568` reproduces `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` (read 18:17:12Z). The row is §5 (l. 64). Mathlib pin `db584cd6d46c92f209a44c0f1c829460d327499d` (`lake-manifest.json`), toolchain `leanprover/lean4:v4.33.0`.

**depends_on (each the `statement_sha256` of its `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-30T18:21:21Z matches):**
- U1 `G5.Ring.Challenge` — `863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c` (`ZPhi`, `phi`, the real order `instLE`/`instLT`, `IsWord`, `ntr`)
- U5 `G5.Ladder.Challenge` — `ea6b4aedd3021843c9399543ebbac30b625aeae4cdd18a0b9042b6b33513d11a` (the non-constancy form `hc`, byte for byte; `g5_u5_lad_b_two` for the converse's t = 3 + φ)
- U11 `G5.Census.Challenge` — `ee958447349e411d839a595dd2057af8d284daedcb410f4a71a4eca3d2c2b76c` (the route's `g5_u11_census_a`, `g5_u11_census_b`; `g5_u11_census_b_wit` available)

**U13 defines nothing.** The imports are the row's (STATEMENTS.md l. 64: U1, U5, U11). The statements use no U5/U11 declaration; U5 supplies the non-constancy FORM and U11 the proof's pieces.

## Rows

| id | state | proposed declaration |
|---|---|---|
| G5-CAPa | SPEC-DRAFT | `g5_u13_cap_a (X : ZPhi) (hX : 3 * phi ≤ X) (w : List ℕ) (hw : IsWord w) (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) (ht : ntr w ≤ X) : ((w.length : ZPhi) + 1) * phi ≤ X` |
| G5-CAPb | SPEC-DRAFT | `g5_u13_cap_b (X : ZPhi) (w : List ℕ) (hw : IsWord w) (hc : …) (ht : ntr w ≤ X) (hX : X < ((w.length : ZPhi) + 1) * phi) : List.IsRotated w [1, 4] ∧ 3 + phi ≤ X ∧ X < 3 * phi`; `g5_u13_cap_b_conv (X : ZPhi) (w : List ℕ) (hr : List.IsRotated w [1, 4]) (h1 : 3 + phi ≤ X) (h2 : X < 3 * phi) : ntr w ≤ X ∧ X < ((w.length : ZPhi) + 1) * phi` |

Specced 2 · **split 1** (G5-CAP → G5-CAPa, part (a); G5-CAPb, part (b) — the row's own (a)/(b), for V₁'s sign-off) · stopped 0. No CC-CANDIDATE.
- **Non-constancy is part of the statement, not a weakening:** the constant words have t = 2 for every k (SH-P2-1 l. 191), so the cap is FALSE on them; the record's "class" is a hyperbolic class (CAPa §3).
- **Three theorems where the brief lists two — for V₁'s signature:** `g5_u13_cap_b_conv` is the existence half of the record's "fails only … when 3 + φ ≤ X < 3φ" (l. 193; slip 4 l. 353) and the row's "exactly"; `g5_u13_cap_b` is the "only" half. The interval is non-empty in ℤ[φ] (3 + φ itself). U11's precedent: its witness `g5_u11_census_b_wit` was kept and froze. V₁ may strike it; nothing else changes.
- **ℤ[φ]-valued X (the row) against the record's real X:** no weaker — for real X the ℤ[φ] form gives the record's statement back through X′ := max(t, 3φ) in (a) and X′ := t in (b) (CAPa/CAPb §3, my reasoning, not the record's).

Own exact arithmetic (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD2/check.py`): every word of length ≤ 6 against every X = ⟨x, y⟩, −6 ≤ x, y < 30 (657,760 pairs with t ≤ X): (a) 0 violations, (b) 0 violations, the cap failing only on (1, 4) and (4, 1); the converse at every grid X in [3 + φ, 3φ) (⟨−5, 6⟩, ⟨3, 1⟩, ⟨8, −2⟩) for both rotations: 0 violations.

## Mathlib names (classifier of record, `tools/ledger_names.py`, plain form, at the pin)

One hit with its namespace: `List.IsRotated	FOUND List Mathlib/Data/List/Rotate.lean:362`.

- G5-CAPa: `List.replicate`, `List.length` NOT FOUND (core); `Nat.cast_ofNat` FOUND (proof aid); `le_trans` FOUND but not applicable to `ZPhi` as it stands (U1 declares `LE`/`LT` only, no `Preorder`) — named so no seat reaches for it blind.
- G5-CAPb: `List.IsRotated` FOUND (targeted); `List.IsRotated.perm`, `List.IsRotated.symm`, `List.isRotated_iff_mod`, `Nat.cast_ofNat` FOUND (proof aids); `List.replicate`, `List.length` NOT FOUND (core).
- **Every name NOT FOUND, and why:** `List.replicate` (toolchain `src/lean/Init/Data/List/Basic.lean:706`), `List.length` — Lean core, not mathlib; both used verbatim by the frozen U5/U11 Challenges. No row is NEEDS-DEVELOPMENT.

## Probe

`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD2/probe-U13.lean`, sha256 `95ab2bb02d82d14aa86d716c6cebddde8fa4cd61ba8233372d7bdf581dd50a87`, 40 lines, longest line 87 code points: `import Mathlib`, `import G5.Ring.Challenge`, `import G5.Ladder.Challenge`, `import G5.Census.Challenge`, `open G5 ZPhi`, `namespace G5`, the three theorems `:= by sorry`, `end G5`. **NOT RUN by this seat.** Each spec's §5 block is a byte-for-byte substring (asserted by `gen.py`). Expected: 3 `declaration uses 'sorry'` warnings, no error — not observed.

**Elaboration risks I see:**
1. `3 * phi ≤ X`, `ntr w ≤ X`: U1's `instLE`; `X < … `: U1's `instLT` — the only order instances on `ZPhi` in scope (no `Preorder`), so neither `≤` nor `<` can pick a second instance; the same shapes elaborated in U5 (`≤`) and U11 (`<`).
2. `((w.length : ZPhi) + 1) * phi` — U5's `g5_u5_lad_a_ge3` form, byte for byte; `3 + phi`, `3 * phi` numerals as U5/U11.
3. `List.IsRotated w [1, 4]` takes `List ℕ` from `w` (U11's `g5_u11_census_b` shape). In `g5_u13_cap_b_conv` the hypothesis `hr` precedes any use of `w.length`; `w : List ℕ` is explicit.
4. The name `hX` means `3 * phi ≤ X` in `cap_a` and `X < (k + 1) * phi` in `cap_b` — different theorems, cosmetic only.
5. Imports: `G5.Census.Challenge` already imports Ring and Ladder; the explicit triple is the row's list and redundant-harmless. Built: `G5/{Ring,Ladder,Census}/Challenge.olean` present at 18:21:21Z.

## Line counts (the template's one-liner, per spec)

- `specs/G5-CAPa.md`: 0 Lean line(s) over 100 code points
- `specs/G5-CAPb.md`: 0 Lean line(s) over 100 code points

## The one thing V₁ should look hardest at, per row

- **G5-CAPa:** the quantification over `X : ZPhi` (the row's "X ∈ ℤ[φ]") against the record's real threshold — check the max(t, 3φ) argument that nothing of the record is lost — and the reading "k ≤ X/φ − 1" as `((w.length : ZPhi) + 1) * phi ≤ X`.
- **G5-CAPb:** the converse clause `g5_u13_cap_b_conv` — keep (the record's "fails … for X ∈ [3 + φ, 3φ)" is existence; the row says "exactly") or strike (the brief lists (b) as the implication only).

## Offered, not specced

The printed "for every X the same holds with the cap max(2, ⌊X/φ⌋ − 1)" (Cor. 5.11, print l. 511–512): the source of record (SH-P2-1 §3.4, slip 4) does not carry it, so it is print-only; statable without reals as `w.length ≤ 2 ∨ ((w.length : ZPhi) + 1) * phi ≤ X` for every `X` with `ntr w ≤ X` (k ≤ ⌊X/φ⌋ − 1 ⟺ (k + 1)φ ≤ X for integer k), a cheap leg from (a) and (b) — the brief's optional leg; not added, because the spec says what the record says and this sentence's record is the print. Also not specced: the §3.4 instrument sentences (V3-UNCARRIED 5 of U11) and the grid remark (X ≥ 25).

## Files

Specs under `~/Claude/projects/claude-papers-lean/specs/`: `G5-CAPa.md`, `G5-CAPb.md`, `_UNIT-U13.md` (this file).
Scratch a later stage must read: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD2/probe-U13.lean`. Also there: `capa.lean`, `capb.lean` (the probe's parts), `gen.py`, `check.py`.

## Status

SPEC-DRAFT 2026-10-30T18:27:24Z — U13 on disk; V₁ may open against it.
