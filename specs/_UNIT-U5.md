# Unit U5 — monotonicity (the pruning lemma, real-order reading) and the exact ladder (Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)*) — unit summary

*Seat M-U5 (statement author, step 2 of the lean-papers loop), opened 2026-10-30T10:06:17Z, closed 2026-10-30T10:20:51Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-M-U5.md` (BRIEF READY 2026-10-30T10:04:41Z; probe amendment 10:05:25Z). No git, no web, nothing under `NMC-Phase-1-Research/`, no `lake` command of any kind.*

source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 — `Orchestrator/Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T10:06:17Z; it matches the brief's digest, and every spec header carries it. **The file changed during the seat:** at 2026-10-30T10:19:49Z it reads `3a9e54001ea1f84e4945df3c1350e5b7c1a5c63042243045370df3c4d108c209` — one §4 erratum appended at l. 45 (stamped 10:18:27Z, found by M-U6, on §2 note 3's state counts). It touches no U5 row; the lines the U5 specs quote (l. 18, l. 19, l. 44) are unchanged. Mathlib pin `db584cd6d46c92f209a44c0f1c829460d327499d`, toolchain `leanprover/lean4:v4.33.0`.

## Rows

| id | state | proposed declarations |
|---|---|---|
| G5-MONOa | SPEC-DRAFT | `g5_u5_mono_prod` (products of blocks: entries in ℕ[φ] and ≥ I in the real order — the record's hypothesis made explicit) · `g5_u5_mono_a` (tr(A B) ≤ tr(A P_a B), A, B products of blocks, possibly empty) |
| G5-MONOb | SPEC-DRAFT | `g5_u5_mono_b_rot` (a non-constant word has a rotation opening with 2, 3 or (1, 4)) · `g5_u5_mono_b_ge1` (such a word's product has all four entries ≥ 1) · `g5_u5_mono_b_step` (`ntr p + phi ≤ ntr (p ++ [a])`) |
| G5-LADa | SPEC-DRAFT | `g5_u5_lad_a_one` (2φ ≤ t) · `g5_u5_lad_a_two` (3 + φ ≤ t) · `g5_u5_lad_a_ge3` ((k + 1)φ ≤ t) |
| G5-LADb | SPEC-DRAFT | `g5_u5_lad_b_one` (t = 2φ ↔ w = [2] ∨ w = [3]) · `g5_u5_lad_b_two` (t = 3 + φ ↔ w a rotation of [1, 4]) · `g5_u5_lad_b_ge3` (t = (k + 1)φ ↔ w a rotation of 1^{k−1}2 or of 3 4^{k−1}) |
| G5-LADc | **CC-CANDIDATE**, stopped, OPEN and uncounted | none (defect witness only) |

**Specced 4 · split 0 beyond the brief's own cut · stopped 1.** The cut is the brief's: G5-MONO → MONOa (the second clause) + MONOb (the strong clause), the first clause being U1's `g5_u1_ge_a` (cited, not restated); G5-LAD → LADa (the minimum) + LADb (attainment and uniqueness) + LADc (the census consequence). Within a row, each clause is its own declaration (eleven theorems in all), so V₁ can freeze or drop them one by one.

**The stop, for V₁ and the wall.** G5-LADc — "a depth-K census is complete exactly below (K + 2)φ" (TA §1 l. 55; STATEMENTS.md l. 18), as the brief's word-corollary "every word of length > K has t ≥ (K + 2)φ" — is **FALSE at K = 1**: (1, 4) has length 2 > 1 and t = 3 + φ (SH-P2-1 l. 109) < 3φ, since 3φ − (3 + φ) = −3 + 2φ = −2 + √5 > 0 exactly. The ladder excepts k = 2 from (k + 1)φ; the consequence does not print that exception. It holds at K = 0 and every K ≥ 2 (so the record's K = 12 numbers stand). The record's own second head found the same boundary in the census-cap sentence (SH-P2-1 §3.4 l. 193: "for X ≥ 3φ") but not in this sentence; nor do the audit, synthesis or FOLD-LOG, which repeat it. Not repaired; the repair (K ≠ 1, or the k = 2 exception carried) is the wall's, and if it enters it enters as a NEW unit (STATEMENTS.md §3). The witness is in the probe as two `example`s.

## Conventions this unit fixes for V₁ (all inherited; U5 DEFINES NOTHING)

- Every name is U1's (`ZPhi`, `phi`, `nonneg`, `instLE`, `M2`, `P`, `IsWord`, `blockProd`, `ntr`) or mathlib's / core's. No new `def`.
- **Constant words** are the record's (1^k), (4^k) only (`phase-0/DEFINITIONS.md` l. 21), written inline `w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4`. The record defines "hyperbolic class" as exactly the non-constant words (same line), so the ladder is stated with this hypothesis, not with `2 < ntr w` (which would route the row through Theorem A, U3).
- **Rotations** are mathlib's `List.IsRotated w v` (∃ n, w.rotate n = v), named, not by the infix `~r`. U4 (the floor's minimizers) will need rotations and constant words too; using mathlib's name and an inline predicate leaves no U5 definition for U4 to collide with.
- **Openings** (MONOb): `p.head? = some 2 ∨ p.head? = some 3 ∨ p.take 2 = [1, 4]`, inline in three statements.
- Possibly-empty products carry `∀ b ∈ u, 1 ≤ b ∧ b ≤ 4` (U1's `IsWord` is non-empty); `blockProd [] = 1 = I`.
- Every inequality is U1's exact real order; nothing uses the coefficientwise order, per STATEMENTS.md §4.

## Mathlib names (classifier of record, `tools/ledger_names.py`, plain form, at the pin)

One hit with its namespace: `List.IsRotated	FOUND List Mathlib/Data/List/Rotate.lean:362`.

FOUND (verdict lines pasted whole in each spec's §4): `List.IsRotated`, `List.IsRotated.perm`, `List.IsRotated.map`, `Matrix.trace`, `Matrix.trace_mul_comm`, `Matrix.trace_mul_cycle`, `Matrix.trace_add`, `Matrix.trace_fin_two`, `Matrix.trace_fin_two_of`, `Matrix.mul_fin_two`, `Matrix.one_fin_two`.

**NOT FOUND at the pin, every one resolved outside Mathlib/ (none is a gap):** `List.replicate` (core `Init/Data/List/Basic.lean:706`), `List.head?` (core `:381`), `List.take` (core `:912`), `List.prod_append` (core `Init/Data/List/Lemmas.lean:1883`), `List.map_append` (core `:1853`), `List.rotate` (Batteries `Batteries/Data/List/Basic.lean:653`). Also tried and not found under these names, NOT targeted by any row: `List.isRotated_iff`, `List.prod_nil` / `List.prod_cons` / `List.replicate_succ` (all core, `Init/Data/List/Basic.lean:2086`, `:2087`, `:711`). **No row is NEEDS-DEVELOPMENT.** Proof-side note (not a statement gap): ZPhi has no `OrderedRing` instance (U1 defines none), so the real order's compatibility with + and × is a development the proofs will need.

## Probe

`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-U5/probe.lean`, sha256 `c723a83fe9aa3166ad82de22703325a140cf76053b7ce211a2a6bb4c719a30ec` = U1's final probe (sha256 `f15f320065142f9533d7c775430280434d4ec3533a27927dd740d2210e04af63`, copied whole and unedited as the prefix) + U5's block (eleven theorems `:= by sorry`, then the two LADc witness `example`s `:= by decide`). **NOT RUN by this seat** (the brief's amendment, 10:05:25Z): exit, first error and memory are the orchestrator's to record. Every spec's §5 Lean text is a byte-for-byte substring of the probe (checked by script: 5 of 5 specs, 1 block each, all contained). The line most likely to fail elaboration is the witness `example : ntr [1, 4] = 3 + phi := by decide` (a 2 × 2 matrix product over ZPhi under `decide`); a failure there does not touch the defect, which stands on the record's own value t(1, 4) = 3 + φ and the exact comparison `(3 : ZPhi) + phi < 3 * phi`.

## Line counts (the template's one-liner, per spec)

- `specs/G5-MONOa.md`: 0 Lean line(s) over 100 code points
- `specs/G5-MONOb.md`: 0 Lean line(s) over 100 code points
- `specs/G5-LADa.md`: 0 Lean line(s) over 100 code points
- `specs/G5-LADb.md`: 0 Lean line(s) over 100 code points
- `specs/G5-LADc.md`: 0 Lean line(s) over 100 code points

## The one thing V₁ should look hardest at, per row

- **G5-MONOa:** whether "the entrywise-nonneg hypothesis made explicit" is rightly carried as a separate declaration (`g5_u5_mono_prod`, every product of blocks has ℕ[φ] entries and is ≥ I) with A, B ranging over block products of possibly-empty lists — rather than as a hypothesis `∀ i j, 0 ≤ (B * A) i j` on arbitrary matrices (SH-P2-1 §3.1's proof form, DO's "for non-negative P"), which would be stronger than the STATEMENTS.md row.
- **G5-MONOb:** that "every prefix" is read as SH-P2-1's corrected "every prefix containing the opening 2/3 or the whole opening pair (1, 4)" via quantification over all words with that opening (`p.take 2 = [1, 4]` excludes the bare (1)), and that "each further syllable" is one syllable appended at the end, with ≥ φ (the corrected strength), not AM's ≥ 1.
- **G5-LADa:** the hypothesis — "hyperbolic class" read as "word other than (1^k), (4^k)" (the record's own definition, DEFINITIONS l. 21, and exactly the population the second head's proof runs over) rather than `2 < ntr w`.
- **G5-LADb:** the k = 1 iff (both sides hold for every admissible w; kept because the brief asks for "the named words at k = 1, 2") and whether "exactly the rotations" is rightly `List.IsRotated w v` with v the printed representatives `List.replicate (k − 1) 1 ++ [2]` and `3 :: List.replicate (k − 1) 4`.
- **G5-LADc:** whether V₁ agrees the K = 1 failure is a defect of the recorded sentence (CC-CANDIDATE) and not a reading to be silently restricted; the restriction is the wall's.

## Files

Specs (write path): `~/Claude/projects/claude-papers-lean/specs/` — `G5-MONOa.md`, `G5-MONOb.md`, `G5-LADa.md`, `G5-LADb.md`, `G5-LADc.md`, `_UNIT-U5.md` (this file).

Scratch a later stage must read: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-U5/probe.lean` (the probe, the source of every §5 block; to be elaborated by the orchestrator). Also there: `gen.py` (the script that wrote the five specs, pulling every §2 quote by file and line from the record, every §4 verdict from the classifier and every §5 block from the probe) and `clock.txt`.

## Status

SPEC-DRAFT 2026-10-30T10:20:51Z — U5 on disk; four rows for V₁, one stopped (G5-LADc, CC-CANDIDATE) for the wall.
