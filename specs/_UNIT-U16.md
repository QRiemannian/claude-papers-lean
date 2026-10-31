# Unit U16 `G5/ClassSep` — G5-CSEP, Corollary 3.7 at element level (the composition unit) (Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)*) — unit summary

*Seat M-ADD4 (statement author, step 2 of the lean-papers loop, the closing Lean wave), opened 2026-10-31T11:03:38Z, first artefact 11:04:29Z (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/SEAT-LOG.md`), this summary written 2026-10-31T11:21:54Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-M-ADD4-u16-u17-u18.md` (BRIEF READY 2026-10-31T11:02:25Z), with every rule of `SEAT-P4-LEAN-M-ADD3-u14-u15.md`, `SEAT-P4-LEAN-M-ADD2-u12-u13.md`, `SEAT-P4-LEAN-M-ADD-u9-u10-u11.md`, `SEAT-P3-LEAN-M-U8-group-level-legs.md` and the template `reputation-play/lean-scoping/seats/TEMPLATE-M-statement-author.md` with its addenda through sitting 81; the wall's final-read word `priority/inbox/WORD-wall-2026-10-31-g5-final-read.md` (sha256 `6f61ef78c28c301b755d3e3e2ba0cb53431b06eba36e061a88b5691614724dc9` · 12384 B, read at 11:05Z) §5. No git, no web, no `lake` command of any kind, no Lean compiled, nothing under `NMC-Phase-1-Research/`.*

source_sha256: 9ebf30048d9d246295226f9f8aa7ac86da0d72956e1c1d6e0c45d4eda57c79b3 · source_bytes: 31612 — `Orchestrator/Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` and `wc -c` read at 2026-10-31T11:03:56Z and again at 2026-10-31T11:21:54Z; equal to the brief's edition pair. **The edition EXTENDS the three before it:** `head -c 30598` reproduces `4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f` (U14/U15's pin), `head -c 25981` reproduces `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47` (U12/U13's pin), `head -c 21568` reproduces `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` (the frozen eleven's pin), each read at both clocks. `tail -c +30599` (1014 B) is §6's errata paragraph of 2026-10-30T21:53:55Z — it touches G5-EVKR and G5-SRCH only; **none touch U16 `G5/ClassSep`**. Row G5-CSEP is new with this wave (the wall's final-read word §5, "U16 — the composition unit (Corollary 3.8's class-level lift, over U3 + U9 on the prelude rule)"; the print's draft id Cor. 3.7 = read-copy 3.8 = final 3.9); its sheet line is in §"Sheet lines" below. The orchestrator appends §7 with this wave's sheet lines after the specs land (the fourth extending edition); these specs are written against the record, not the sheet. Mathlib pin `db584cd6d46c92f209a44c0f1c829460d327499d` (`lake-manifest.json`), toolchain `leanprover/lean4:v4.33.0`.

**depends_on (each the `statement_sha256` of its `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-31T11:21:54Z matches):**
- U1 `G5.Ring.Challenge` — `863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c` (`ZPhi` and its fields, `phi`, `conj`, the real order, `M2`)
- U7 `G5.Group.Challenge` — `689c36e6c026a1ce151dd2ab84243a5f8f76bb20a11304c9065cdb358ed410ae` (`HeckeGrp`)
- U4 `G5.Sector.Challenge` — `df5fdf79df09a7dd097a8d3102c96b644458d2fcde98856b16de002cf910996f` (`ZPhi.rabs`)
- U3 `G5.WordLevel.Challenge` — `69533d2d17c4ed2dc569c1de6ddb5e92e42b85099901370bb946ea0ed7a13735` (the word-level separation `g5_u3_sep_lin`, `g5_u3_sep_sq`, Theorem A's `g5_u3_a_nonneg` — for the legs the proof composes with)
- U9 `G5.SectorGroup.Challenge` — `c6a43405c82a8b43218854dc605d0b9952332b82681dfb03a9008e6e3195d6a8` (`g5_u9_bg_a` (y ≥ 1 for t = |tr g| under the same hyperbolicity hypothesis) — for the legs)

**U16 defines nothing.** The Challenge's names are U1's, U7's and U4's; U3 and U9 are imported for the legs (the U10 precedent: units imported "for the legs the proof composes with"). The Solution, on the prelude rule, imports the Solutions of U1, U7, U4, U3, U9 (U9's Solution already carries the five-prelude chain and its private `g5_u9_aux_*` lifts) — the route, not the statement.

## Rows

| id | state | proposed declaration |
|---|---|---|
| G5-CSEPa | SPEC-DRAFT | `g5_u16_csep_lin (g : M2ˣ) (hg : g ∈ HeckeGrp) (hh : 2 < rabs (g : M2).trace) : t − conj t = t.y • (2 * phi − 1) ∧ 2 * phi − 1 ≤ t − conj t` with `t := rabs (g : M2).trace` written out |
| G5-CSEPb | SPEC-DRAFT | `g5_u16_csep_sq (g) (hg) (hh) : (t − conj t) ^ 2 = ⟨5 * t.y ^ 2, 0⟩ ∧ (5 : ZPhi) ≤ (t − conj t) ^ 2`, same `t` |

Specced 2 · **split 1** (G5-CSEP → CSEPa the linear clause "t − t^σ = y√5 ≥ √5", CSEPb the distance clause "≥ √(5/2) from the diagonal", squared — both are printed (S3 l. 386–388) and both are in the record (TA l. 49, DO l. 47, SH-P2-1 l. 198–200); the split mirrors U3's frozen SEPa/SEPb, for V₁'s sign-off) · stopped 0. **No CC-CANDIDATE:** the record's sentence is true as recorded at element level — own arithmetic below and the record's one-line proof (y ≥ 1 for a hyperbolic element by Theorem A through the normal form; U9 has it on a frozen theorem).

Own exact arithmetic (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/check.py`, output `check.out` beside it): every word of length ≤ 10 (1,398,100), both signs: `rabs (tr (±W)) = ntr w` on all 2,796,200 signed words (0 exceptions — the class normalization is the word normalization); on the 2,796,160 hyperbolic ones both clauses hold (0 violations); on the 40 signed constant words the inequality fails (the hyperbolicity hypothesis carries content); ±I, ±S, ±R^a: none hyperbolic.

## Mathlib names (classifier of record, `tools/ledger_names.py`, plain form, at the pin)

One hit with its namespace: `Matrix.trace_mul_comm	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:158`.

- `Matrix.trace`, `Units`, `Subgroup.closure`, `SubNegMonoid`, `zsmul_eq_mul`, `Matrix.trace_mul_comm` FOUND. `SubNegMonoid.SMulInt` NOT FOUND — the `•` is `SubNegMonoid`'s `zsmul` field (through U1's `CommRing`, `zsmul := zsmulRec`), not a declaration; the statement writes `•` exactly as U3's frozen `g5_u3_sep_lin`. No row is NEEDS-DEVELOPMENT.

## Probe

`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/probe-U16.lean`, **sha256 `367c1902bb4fb128671d7fee4b546e85dd7872b9c28bd8f214d4d794b3645ae4`**, 35 lines, longest line 92 code points; assembled by `genprobe.py` from the part files; every spec's §5 block is a byte-for-byte substring of the probe (asserted by `genprobe.py` and again by `gen.py`). **NOT RUN by this seat.** Imports: `Mathlib`, `G5.Ring.Challenge`, `G5.Group.Challenge`, `G5.Sector.Challenge`, `G5.WordLevel.Challenge`, `G5.SectorGroup.Challenge`.

**Elaboration risks I see:**
1. `rabs` resolves to U4's `ZPhi.rabs` through `open ZPhi` (U9's frozen statements use it so).
2. `(rabs (g : M2).trace).y • (2 * phi - 1)` — ℤ acting on `ZPhi` by `zsmul`; U3's frozen `g5_u3_sep_lin` elaborates the same shape with `(ntr w).y`.
3. `2 < rabs (g : M2).trace` — the numeral `2 : ZPhi` through U1's `CommRing`, `<` U1's `instLT`; U9's frozen hypothesis, character for character.
4. `(⟨5 * (rabs (g : M2).trace).y ^ 2, 0⟩ : ZPhi)` and `(5 : ZPhi) ≤ … ^ 2` — U3's `g5_u3_sep_sq` forms with `ntr w` replaced.
5. The repeated subterm `rabs (g : M2).trace` (no `let`, as U9 writes it) — long but plain; every line ≤ 92 code points.
6. The imports of `G5.WordLevel.Challenge` and `G5.SectorGroup.Challenge` bring their `sorry` theorems into the environment — harmless. Expected: 2 `declaration uses 'sorry'` warnings (and unused-variable notes for `hg`/`hh`, if the linter set reports them), no error — not observed.

## Line counts (the template's one-liner, per spec)

- `specs/G5-CSEPa.md`: 0 Lean line(s) over 100 code points
- `specs/G5-CSEPb.md`: 0 Lean line(s) over 100 code points

## The one thing V₁ should look hardest at, per row

- **G5-CSEPa:** the reading of the record's "normalized trace" of a hyperbolic class as `rabs (g : M2).trace` (agreeing with `ntr w` on every signed word, §3), and the absence of a `1 ≤ y` hypothesis — `y ≥ 1` is the row's content at element level, not an assumption.
- **G5-CSEPb:** the squared ring form `(t − t^σ)² = 5y² ∧ 5 ≤ (t − t^σ)²` as the record's distance clause "≥ √(5/2) from the diagonal" (U3's convention, the row's Lean-notes cell).

## Sheet lines (for the orchestrator's §7 append; the sheet's five columns)

| **G5-CSEP** (Corollary 3.7 at element level, the Minkowski separation — U16, the closing Lean wave; U3 + U9's territory) | For every hyperbolic element g of G(5) (|tr g| > 2), with normalized trace t = |tr g| = x + yφ: t − t^σ = y√5 ≥ √5, and the point (t, t^σ) lies at distance ≥ √(5/2) from the diagonal of ℝ² (in the ring: (t − t^σ)² = 5y² ≥ 5). | TA transcript §1 "E2, sharpened" l. 49; DO transcript §1.3 l. 47; `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §4 l. 197–200; `candidates/LEDGER.md` D-E2 l. 26; the print `phase-4/draft/S3-theorem-a.md` Cor. 3.7 l. 384–388, proof l. 392–395 | PROVED from Theorem A, two heads (SH-P2-1 item 4 HOLDS); word level on U3 (G5-SEPa/b), y ≥ 1 at element level on U9 (G5-BGa); the composition on no row before U16 (CLAIM-INVENTORY row 14 "pieces", I-32; V₃-U9 UNCARRIED) | New unit U16 `G5/ClassSep`, imports U1, U7, U4 Challenges (names) and U3, U9 (legs); defines nothing; hyperbolicity U9's `2 < rabs (g : M2).trace`, t = `rabs (g : M2).trace`, √5 = `2 * phi − 1` (U3); split CSEPa (linear) / CSEPb (distance, squared) |

## Files

Specs under `~/Claude/projects/claude-papers-lean/specs/`: `G5-CSEPa.md`, `G5-CSEPb.md`, `_UNIT-U16.md` (this file).
Scratch a later stage must read: the probe named above. Also under `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/`: the part files (`csepa.lean`, `csepb.lean`, `tsym.lean`, `phiinv.lean`, `rungdefs.lean`, `runga.lean`, `rungb.lean`, `rungc.lean`), `genprobe.py`, `gen.py`, `check.py`, `check.out` (length ≤ 10, rungs n ≤ 40), `check8.out` (length ≤ 8, n ≤ 30), `names.out` (the classifier's verdicts), `SEAT-LOG.md`.

## Status

SPEC-DRAFT 2026-10-31T11:21:54Z — U16 on disk; V₁ may open against it.
