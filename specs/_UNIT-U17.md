# Unit U17 `G5/TraceSet` — G5-TSYM and G5-PHIINV, the trace-set family (Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)*) — unit summary

*Seat M-ADD4 (statement author, step 2 of the lean-papers loop, the closing Lean wave), opened 2026-10-31T11:03:38Z, first artefact 11:04:29Z (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/SEAT-LOG.md`), this summary written 2026-10-31T11:21:54Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-M-ADD4-u16-u17-u18.md` (BRIEF READY 2026-10-31T11:02:25Z), with every rule of `SEAT-P4-LEAN-M-ADD3-u14-u15.md`, `SEAT-P4-LEAN-M-ADD2-u12-u13.md`, `SEAT-P4-LEAN-M-ADD-u9-u10-u11.md`, `SEAT-P3-LEAN-M-U8-group-level-legs.md` and the template `reputation-play/lean-scoping/seats/TEMPLATE-M-statement-author.md` with its addenda through sitting 81; the wall's final-read word `priority/inbox/WORD-wall-2026-10-31-g5-final-read.md` (sha256 `6f61ef78c28c301b755d3e3e2ba0cb53431b06eba36e061a88b5691614724dc9` · 12384 B, read at 11:05Z) §5. No git, no web, no `lake` command of any kind, no Lean compiled, nothing under `NMC-Phase-1-Research/`.*

source_sha256: 9ebf30048d9d246295226f9f8aa7ac86da0d72956e1c1d6e0c45d4eda57c79b3 · source_bytes: 31612 — `Orchestrator/Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` and `wc -c` read at 2026-10-31T11:03:56Z and again at 2026-10-31T11:21:54Z; equal to the brief's edition pair. **The edition EXTENDS the three before it:** `head -c 30598` reproduces `4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f` (U14/U15's pin), `head -c 25981` reproduces `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47` (U12/U13's pin), `head -c 21568` reproduces `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` (the frozen eleven's pin), each read at both clocks. `tail -c +30599` (1014 B) is §6's errata paragraph of 2026-10-30T21:53:55Z — it touches G5-EVKR and G5-SRCH only; **none touch U17 `G5/TraceSet`**. Rows G5-TSYM and G5-PHIINV are new with this wave (the wall's final-read word §5, "U17 — the trace-set family (the sign-symmetry of Θ; ±φ⁻¹ realized): the two of Record 9.5's printed four that stand on our own rows"); their sheet lines are in §"Sheet lines" below. The orchestrator appends §7 with this wave's sheet lines after the specs land (the fourth extending edition); these specs are written against the record, not the sheet. Mathlib pin `db584cd6d46c92f209a44c0f1c829460d327499d` (`lake-manifest.json`), toolchain `leanprover/lean4:v4.33.0`.

**depends_on (each the `statement_sha256` of its `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-31T11:21:54Z matches):**
- U1 `G5.Ring.Challenge` — `863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c` (`ZPhi`, `M2`, `S`, `T`, `R`)
- U7 `G5.Group.Challenge` — `689c36e6c026a1ce151dd2ab84243a5f8f76bb20a11304c9065cdb358ed410ae` (`HeckeGrp`)
- U8 `G5.GroupLevel.Challenge` — `bf7316f7eae415f48781199ebd28706dfc940633d484ca5ef2aae997dcb08ccd` (`g5_u8_ell` (tr R² = ⟨−1, 1⟩, tr R³ = ⟨1, −1⟩) — for the legs)

**U17 defines nothing.** The Challenge's names are U1's and U7's; U8 is imported for the leg PHIINV composes with. The Solution, on the prelude rule, imports the Solutions of U1, U7, U8 — the route, not the statement.

## Scope

**The element-level exclusion of the non-zero integer multiples of √5 is not a row of U17:** the print carries it by way of the cited Theorem 3.2 — "The same inequality excludes the non-zero integer multiples of $\sqrt5$ a second way" (S3 l. 57–58, quoted below), an application of the literature theorem — so it is literature-carried, as the orchestrator confirmed from the printed sentence and the wall's final-read word §5 rules.

> embedding is $\sigma$ of §2.1. A rational integer $m$ satisfies $\sigma(m) = m$, so (3.2) excludes it
> as the trace of a hyperbolic element: no hyperbolic element of $G(5)$ has a rational-integer trace.
> The same inequality excludes the non-zero integer multiples of $\sqrt5$ a second way, since
> $\sigma(m\sqrt5) = -m\sqrt5$ and $|m\sqrt5| > 2$ for $m \ne 0$. If the original should show a
>
> — `Claude-Papers/No1-G5/phase-4/draft/S3-theorem-a.md` l. 55–58 (§3.1, after Theorem 3.2, the PRINT — the √5-multiple sentence)

## Rows

| id | state | proposed declaration |
|---|---|---|
| G5-TSYM | SPEC-DRAFT | `g5_u17_tsym (g : M2ˣ) (hg : g ∈ HeckeGrp) : ∃ h ∈ HeckeGrp, (h : M2).trace = -(g : M2).trace` |
| G5-PHIINV | SPEC-DRAFT | `g5_u17_phiinv (t : ZPhi) (ht : t = ⟨-1, 1⟩ ∨ t = ⟨1, -1⟩) : ∃ g ∈ HeckeGrp, (g : M2).trace = t` |

Specced 2 · split 0 · stopped 0. **No CC-CANDIDATE:** both record sentences are true as recorded (S² = −I; tr R², tr R³ are U8's frozen values; R = T·S lies in ⟨S, T⟩).
- **Both signs in PHIINV** — the record's "±φ⁻¹" and the row name; the brief's parenthesis names the + case (R²). V₁ may narrow (PHIINV §3).

Own exact arithmetic (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/check.py`, output `check.out` beside it): S·S = −I exactly; tr R^a for a = 1, …, 4 = ⟨0, 1⟩, ⟨−1, 1⟩, ⟨1, −1⟩, ⟨0, −1⟩ (the record's table, AM-1-second-head l. 26); the traces of ±W are negatives on all 2,796,200 signed words of length ≤ 10.

## Mathlib names (classifier of record, `tools/ledger_names.py`, plain form, at the pin)

One hit with its namespace: `Subgroup.subset_closure	FOUND Subgroup Mathlib/Algebra/Group/Subgroup/Lattice.lean:341`.

- `Matrix.trace`, `Units`, `Subgroup.closure`, `Subgroup.subset_closure`, `Subgroup.mul_mem`, `Subgroup.pow_mem`, `Matrix.trace_neg`, `Matrix.trace_fin_two`, `Units.val_mul`, `Units.val_neg`, `Units.val_pow_eq_pow_val` FOUND. No name NOT FOUND among those the specs target; no row is NEEDS-DEVELOPMENT.

## Probe

`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/probe-U17.lean`, **sha256 `dc8fd763f625d7ff5e3284cf0529060b454470d812ae675e3a00e276a14ac20f`**, 29 lines, longest line 92 code points; assembled by `genprobe.py` from the part files; every spec's §5 block is a byte-for-byte substring of the probe (asserted by `genprobe.py` and again by `gen.py`). **NOT RUN by this seat.** Imports: `Mathlib`, `G5.Ring.Challenge`, `G5.Group.Challenge`, `G5.GroupLevel.Challenge`.

**Elaboration risks I see:**
1. `∃ h ∈ HeckeGrp, (h : M2).trace = -(g : M2).trace` — the bounded existential over a `Subgroup` (`SetLike` membership), the form U7's frozen `g5_u7_int_b` elaborates; the binder `h : M2ˣ` is inferred from the membership.
2. `-(g : M2).trace` — U1's `instNeg` on `ZPhi`, applied to the parenthesized coercion.
3. `(⟨-1, 1⟩ : ZPhi)`, `(⟨1, -1⟩ : ZPhi)` — negative integer literals in the anonymous constructor, as U10's frozen `g5_u10_cor`.
4. The import of `G5.GroupLevel.Challenge` pulls `G5.ModTwo.Challenge` and `G5.Congruence.Challenge` with it — their names (`red2`, `red4`, `H4`, `F4`, …) enter scope; none is reused here. Expected: 2 `declaration uses 'sorry'` warnings, no error — not observed.

## Line counts (the template's one-liner, per spec)

- `specs/G5-TSYM.md`: 0 Lean line(s) over 100 code points
- `specs/G5-PHIINV.md`: 0 Lean line(s) over 100 code points

## The one thing V₁ should look hardest at, per row

- **G5-TSYM:** that closure of the literal trace set under negation (one direction, the other being the same statement at `h`) is the whole of "symmetric under t ↦ −t", and that `−I ∈ G(5)` stays the reason, not a clause.
- **G5-PHIINV:** the two-sign statement against the brief's + case, and φ⁻¹ read as the pair ⟨−1, 1⟩ (the lane's notation reading, STATEMENTS §2 item 7; U10).

## Sheet lines (for the orchestrator's §7 append; the sheet's five columns)

| **G5-TSYM** (the sign-symmetry of the trace set — U17, the closing Lean wave; U10's territory) | Since −I ∈ G(5), the set of literal traces is symmetric under t ↦ −t: for every g ∈ G(5) there is h ∈ G(5) with tr h = −tr g. | `candidates/checks/AM-1-second-head.md` §4 l. 72; the print `phase-4/draft/S2-preliminaries.md` §2.1 l. 66–68 | stated by the second head on Theorem A (§4 CONFIRMED); on no row before U17 (V₃-U10 UNCARRIED l. 35; L4b item 1 printed) | New unit U17 `G5/TraceSet`, imports U1, U7 Challenges (names) and U8 (legs); defines nothing; witness S·S·g (S² = −I, U1 arithmetic) |
| **G5-PHIINV** (±φ⁻¹ realized — U17, the closing Lean wave; U10's territory) | Each of ±φ⁻¹ (the pairs ±⟨−1, 1⟩) is the trace of an element of G(5) (R², R³). | `candidates/checks/AM-1-second-head.md` §1 l. 26, §4 l. 73–74; AM transcript §3.2 l. 130; the print S2 Prop. 2.5 l. 196–199, l. 210–212, S3 l. 51–53 | the second head's table and scope note; the matrix traces on U8 (G5-U8-ELL); membership on no row before U17 (V₃-U10 UNCARRIED l. 36; L4b item 2 printed in substance) | same unit; U7's `g5_u7_int_b` form; route T, S ∈ HeckeGrp, R = T·S, U8's `g5_u8_ell`. The element-level √5-multiple exclusion is literature-carried (S3 l. 57–58, by Theorem 3.2), not a row |

## Files

Specs under `~/Claude/projects/claude-papers-lean/specs/`: `G5-TSYM.md`, `G5-PHIINV.md`, `_UNIT-U17.md` (this file).
Scratch a later stage must read: the probe named above. Also under `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/`: the part files (`csepa.lean`, `csepb.lean`, `tsym.lean`, `phiinv.lean`, `rungdefs.lean`, `runga.lean`, `rungb.lean`, `rungc.lean`), `genprobe.py`, `gen.py`, `check.py`, `check.out` (length ≤ 10, rungs n ≤ 40), `check8.out` (length ≤ 8, n ≤ 30), `names.out` (the classifier's verdicts), `SEAT-LOG.md`.

## Status

SPEC-DRAFT 2026-10-31T11:21:54Z — U17 on disk; V₁ may open against it.
