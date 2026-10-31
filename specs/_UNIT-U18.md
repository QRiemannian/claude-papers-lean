# Unit U18 `G5/EveryRung` — G5-RUNG, Corollary 3.6′ (every rung of the golden ladder) in pair form (Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)*) — unit summary

*Seat M-ADD4 (statement author, step 2 of the lean-papers loop, the closing Lean wave), opened 2026-10-31T11:03:38Z, first artefact 11:04:29Z (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/SEAT-LOG.md`), this summary written 2026-10-31T11:21:54Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-M-ADD4-u16-u17-u18.md` (BRIEF READY 2026-10-31T11:02:25Z), with every rule of `SEAT-P4-LEAN-M-ADD3-u14-u15.md`, `SEAT-P4-LEAN-M-ADD2-u12-u13.md`, `SEAT-P4-LEAN-M-ADD-u9-u10-u11.md`, `SEAT-P3-LEAN-M-U8-group-level-legs.md` and the template `reputation-play/lean-scoping/seats/TEMPLATE-M-statement-author.md` with its addenda through sitting 81; the wall's final-read word `priority/inbox/WORD-wall-2026-10-31-g5-final-read.md` (sha256 `6f61ef78c28c301b755d3e3e2ba0cb53431b06eba36e061a88b5691614724dc9` · 12384 B, read at 11:05Z) §5. No git, no web, no `lake` command of any kind, no Lean compiled, nothing under `NMC-Phase-1-Research/`.*

source_sha256: 9ebf30048d9d246295226f9f8aa7ac86da0d72956e1c1d6e0c45d4eda57c79b3 · source_bytes: 31612 — `Orchestrator/Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` and `wc -c` read at 2026-10-31T11:03:56Z and again at 2026-10-31T11:21:54Z; equal to the brief's edition pair. **The edition EXTENDS the three before it:** `head -c 30598` reproduces `4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f` (U14/U15's pin), `head -c 25981` reproduces `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47` (U12/U13's pin), `head -c 21568` reproduces `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` (the frozen eleven's pin), each read at both clocks. `tail -c +30599` (1014 B) is §6's errata paragraph of 2026-10-30T21:53:55Z — it touches G5-EVKR and G5-SRCH only; **none touch U18 `G5/EveryRung`**. Row G5-RUNG is new with this wave (the wall's final-read word §5, "U18 — the every-rung corollary (Corollary 3.7, in the pair form of (3.12) …)"; the print's draft id Cor. 3.6′ = read-copy 3.7 = final 3.7); its sheet line is in §"Sheet lines" below. The orchestrator appends §7 with this wave's sheet lines after the specs land (the fourth extending edition); these specs are written against the record, not the sheet. Mathlib pin `db584cd6d46c92f209a44c0f1c829460d327499d` (`lake-manifest.json`), toolchain `leanprover/lean4:v4.33.0`.

**depends_on (each the `statement_sha256` of its `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-31T11:21:54Z matches):**
- U1 `G5.Ring.Challenge` — `863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c` (`ZPhi` and its fields, `phi`, `M2`)
- U7 `G5.Group.Challenge` — `689c36e6c026a1ce151dd2ab84243a5f8f76bb20a11304c9065cdb358ed410ae` (`HeckeGrp`)
- U10 `G5.Containment.Challenge` — `34608245fb7cc62c538d6e5cab0592061649df8857ae133221b289e37e56b288` (`g5_u10_cor` (the containment, the record's route "in the containment's form, Cor. 3.5", l. 79) — for the legs)

**U18 defines TWO things — `fibZ : ℕ → ℤ` and `lucasZ : ℕ → ℤ`** (the brief: "Fibonacci and Lucas are NOT on any frozen unit: DEFINE them in the Challenge … restated byte for byte in the Solution per the prelude rule"). Both by structural recursion with the brief's base values; the record's (C-5) states the same recursions (l. 25). Every other name is U1's or U7's (U10 imported for the legs) or mathlib's (`Ring.inverse`, `Even`, `Odd`). The Solution, on the prelude rule, imports the Solutions of U1, U7, U10 and restates the two definitions byte for byte.

## Rows

| id | state | proposed declaration |
|---|---|---|
| G5-RUNGa | SPEC-DRAFT | `g5_u18_rung_a (n : ℕ) (hn : 1 ≤ n) (he : Even n) (g : M2ˣ) (hg : g ∈ HeckeGrp) : tr ≠ ⟨lucasZ n, 0⟩ ∧ tr ≠ -⟨lucasZ n, 0⟩` |
| G5-RUNGb | SPEC-DRAFT | `g5_u18_rung_b (n : ℕ) (ho : Odd n) (g) (hg) : tr ≠ ⟨-fibZ n, 2 * fibZ n⟩ ∧ tr ≠ -⟨-fibZ n, 2 * fibZ n⟩` |
| G5-RUNGc | SPEC-DRAFT | `g5_u18_rung_c (n : ℕ) (hn : 1 ≤ n) (g) (hg) : tr ≠ phi ^ n + Ring.inverse phi ^ n ∧ tr ≠ -(phi ^ n + Ring.inverse phi ^ n)` |

(`tr` abbreviates `(g : M2).trace`.) Specced 3 · **split 1** (G5-RUNG → RUNGa the even leg `(L_n, 0)`, RUNGb the odd leg `±(−F_n, 2F_n)` — the brief's "allowed and expected" split, the proofs differing (Step 2 by x ≥ 0 and y = 0 ⟹ x = 2; Step 3 by x ≥ 0 alone) — and **RUNGc, the printed sentence in φⁿ + φ⁻ⁿ, added by this seat** so that the unit carries Cor. 3.6′ whole and not through the unstated (3.12); V₁ signs the split and may strike RUNGc) · stopped 0. **No CC-CANDIDATE:** the record's statement is true as recorded (own arithmetic; two heads). **Nothing weakened:** each leg states the record's exclusion of both signs at its parity, for every n the record ranges over; the wall's rule for this unit ("if the proofs seat later hits a genuine wall, the unit is flagged, not forced") is noted here for the L seat.
- **The parity keying** (RUNGa/b §3): each pair at the parity (3.12) gives it. The unkeyed reading of the wall's phrase is also true (0 hits) but excludes pairs that are not rungs; the spec states the record. V₁ weighs.

Own exact arithmetic (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/check.py`, output `check.out` beside it): every word of length ≤ 10 (1,398,100) with both signs and the 12 non-word forms against ±t_n, n ≤ 40: 0 hits; against the unkeyed reading's further 160 pairs: 0 hits; known positives found. (3.12) with φ⁻¹ = φ − 1, φ·(φ − 1) = 1, F_n ≥ 1, L_n ≥ 3 (n ≥ 2), t_n > 2, L_n = F_{n−1} + F_{n+1}: n ≤ 500, 0 exceptions; t₀ = (2, 0) = tr I (the `1 ≤ n` hypotheses carry content).

## Mathlib names (classifier of record, `tools/ledger_names.py`, plain form, at the pin)

One hit with its namespace: `Ring.inverse	FOUND Ring Mathlib/Algebra/GroupWithZero/Units/Basic.lean:84`.

- `Matrix.trace`, `Units`, `Subgroup.closure`, `IsSquare`, `Odd`, `Nat.even_or_odd`, `Nat.fib`, `Nat.fib_add_two`, `Nat.le_induction`, `Ring.inverse`, `Ring.inverse_unit`, `Ring.inverse_of_isUnit`, `IsUnit` FOUND; `Even` AMBIGUOUS (the root `Even` is `@[to_additive]` of `IsSquare`, `Mathlib/Algebra/Group/Even.lean:55–57`; the keyword sites `Function.Even`, `DirichletCharacter.Even` not meant); `fibZ`, `lucasZ`, `G5.fibZ` NOT FOUND (the new names; no collision); `Nat.lucas` NOT FOUND (mathlib has no Lucas sequence at the pin — the reason `lucasZ` is defined; `Nat.fib` could replace `fibZ`, V₁'s call). No row is NEEDS-DEVELOPMENT.

## Probe

`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/probe-U18.lean`, **sha256 `677dc13876b5bab370791f94b9b754bbc442a134ab04716bdd323aaddaecad52`**, 52 lines, longest line 92 code points; assembled by `genprobe.py` from the part files; every spec's §5 block is a byte-for-byte substring of the probe (asserted by `genprobe.py` and again by `gen.py`). **NOT RUN by this seat.** Imports: `Mathlib`, `G5.Ring.Challenge`, `G5.Group.Challenge`, `G5.Containment.Challenge`.

**Elaboration risks I see:**
1. The two `def`s by structural recursion on `ℕ` with the patterns `0`, `1`, `n + 2` — Lean's structural recursion (no `termination_by` needed); each carries a docstring (the linter set's docstring rule).
2. `Ring.inverse phi ^ n` parses as `(Ring.inverse phi) ^ n` (application binds tighter than `^`); `Ring.inverse` needs `MonoidWithZero ZPhi`, from U1's `CommRing`. It is `noncomputable` — harmless in a theorem statement.
3. `Ring.inverse` resolves to mathlib's inside `namespace G5` after `open G5 ZPhi`: no `G5.Ring` or `ZPhi.Ring` namespace exists (`/usr/bin/grep -rn 'namespace Ring' ~/Claude/projects/claude-papers-lean/G5/` — 0 hits; the module path `G5.Ring.Challenge` is a file, not a namespace).
4. `Even n`, `Odd n` on `ℕ` — mathlib's root predicates (U12/U14 froze `Even` on list lengths).
5. `(⟨-fibZ n, 2 * fibZ n⟩ : ZPhi)` — `-fibZ n` parses as `-(fibZ n)`; both fields `ℤ`.
6. The import of `G5.Containment.Challenge` pulls U8's and U3's Challenges (and through U8 the ModTwo/Congruence names) into scope — no name reused here; `fibZ`, `lucasZ` collide with nothing (classifier; grep of `G5/`). Expected: 3 `declaration uses 'sorry'` warnings, no error — not observed.

## Line counts (the template's one-liner, per spec)

- `specs/G5-RUNGa.md`: 0 Lean line(s) over 100 code points
- `specs/G5-RUNGb.md`: 0 Lean line(s) over 100 code points
- `specs/G5-RUNGc.md`: 0 Lean line(s) over 100 code points

## The one thing V₁ should look hardest at, per row

- **G5-RUNGa:** the parity keying (each pair at the parity (3.12) gives it) against the wall's unkeyed phrase, and `lucasZ` as the record's L (the recursion form of (C-5) in place of the sum F_{n−1} + F_{n+1}).
- **G5-RUNGb:** the same keying, and `fibZ` against the record's F with its unused extension F₋₁ = 1 (or `Nat.fib` cast to ℤ in its place).
- **G5-RUNGc:** `Ring.inverse phi` as the record's φ⁻¹ (against the lane's notation reading `phi − 1`), and whether this third theorem — the printed sentence itself — stays beside the two legs.

## Sheet lines (for the orchestrator's §7 append; the sheet's five columns)

| **G5-RUNG** (Corollary 3.6′, every rung of the golden ladder, in the pair form of (3.12) — U18, the closing Lean wave; U10's territory) | For every integer n ≥ 1, no element of G(5) has trace ±t_n = ±(φⁿ + φ⁻ⁿ), where t_n is the pair (L_n, 0) for n even and (−F_n, 2F_n) = F_n√5 for n odd (F, L the Fibonacci and Lucas numbers, F₀ = 0, F₁ = 1, L₀ = 2, L₁ = 1). (The geodesic reading — no closed geodesic of length 2n ln φ — rests on the trace–length relation and is not a row.) | `phase-4/proofs/RUNG/COROLLARY-RUNG.md` §1 l. 13, 15, (C-5) l. 25, Lemma R.1 l. 29–33, §5 Steps 2–3 l. 77, 79; second head `candidates/checks/SH-P4-RUNG-every-rung.md` l. 37; SKELETON row Cor. 3.6′ l. 121; the print `phase-4/draft/S3-theorem-a.md` (3.10) l. 260, Cor. 3.6′ l. 265–267, (3.12) l. 281 | PROVED two heads (P4-RUNG; SH-P4-RUNG HOLDS); on no row before U18 (record l. 63; print l. 314) | New unit U18 `G5/EveryRung`, imports U1, U7 Challenges (names) and U10 (legs: `g5_u10_cor`); defines `fibZ`, `lucasZ` (ℕ → ℤ recursions); split RUNGa (even, (L_n, 0)) / RUNGb (odd, ±(−F_n, 2F_n)) / RUNGc (as printed, φ⁻¹ = `Ring.inverse phi`) |

## Files

Specs under `~/Claude/projects/claude-papers-lean/specs/`: `G5-RUNGa.md`, `G5-RUNGb.md`, `G5-RUNGc.md`, `_UNIT-U18.md` (this file).
Scratch a later stage must read: the probe named above. Also under `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/`: the part files (`csepa.lean`, `csepb.lean`, `tsym.lean`, `phiinv.lean`, `rungdefs.lean`, `runga.lean`, `rungb.lean`, `rungc.lean`), `genprobe.py`, `gen.py`, `check.py`, `check.out` (length ≤ 10, rungs n ≤ 40), `check8.out` (length ≤ 8, n ≤ 30), `names.out` (the classifier's verdicts), `SEAT-LOG.md`.

## Status

SPEC-DRAFT 2026-10-31T11:21:54Z — U18 on disk; V₁ may open against it.
