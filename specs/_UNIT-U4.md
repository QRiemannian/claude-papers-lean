# Unit U4 — the sector (Theorem B) and the floor (Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)*) — unit summary

*Seat M-U4 (statement author, step 2 of the lean-papers loop), opened 2026-10-30T10:06:09Z, closed 2026-10-30T10:20:28Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-M-U4.md`. No git, no web, nothing under `NMC-Phase-1-Research/`, no `lake` command of any kind (the probe is written, not run).*

source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 — `Orchestrator/Claude-Papers/No1-G5/phase-3/STATEMENTS.md` (§4 Errata included), `shasum -a 256` at 2026-10-30T10:06:09Z; it matches the brief's digest. Mathlib pin `db584cd6d46c92f209a44c0f1c829460d327499d`. U1's names are used throughout (`open G5 ZPhi`; `ZPhi`, `phi`, `conj`, `RealNonneg`, `instLE`, `IsWord`, `ntr`, `.x`/`.y`).

## Rows

| id | state | proposed declaration(s) |
|---|---|---|
| G5-Ba | SPEC-DRAFT (SPLIT of G5-B, the inequality) | `g5_u4_ba (w) (hw : IsWord w) (h1 : ∃ a ∈ w, a ≠ 1) (h4 : ∃ a ∈ w, a ≠ 4) : 1 ≤ (ntr w).y ∧ 0 ≤ (ntr w).x ∧ (ntr w).x ≤ (ntr w).y + 2` |
| G5-Bb | SPEC-DRAFT (SPLIT of G5-B, the equality family) | `g5_u4_bb (w) (hw) (h1) (h4) : (ntr w).x = (ntr w).y + 2 ↔ ∃ a b : ℕ, 1 ≤ a ∧ 1 ≤ b ∧ List.IsRotated w (List.replicate a 1 ++ List.replicate b 4)`; `g5_u4_bb_tr (a b) (ha : 1 ≤ a) (hb : 1 ≤ b) (w) (hw : List.IsRotated w (…)) : ntr w = (⟨2 + (a : ℤ) * b, (a : ℤ) * b⟩ : ZPhi)` |
| G5-Bc | SPEC-DRAFT (SPLIT of G5-B, the θ bound) | `ZPhi.rabs` (defined); `g5_u4_bc (w) (hw) (h1) (h4) : 11 * rabs (conj (ntr w)) ≤ (17 - 7 * phi) * ntr w ∧ (11 * rabs (conj (ntr w)) = (17 - 7 * phi) * ntr w ↔ ntr w = 3 + phi)`; `g5_u4_bc_id : (4 - phi) * 11 = (17 - 7 * phi) * (3 + phi)`; `g5_u4_bc_att : ntr [1, 4] = 3 + phi` |
| G5-Fa | SPEC-DRAFT (SPLIT of G5-F, the floor) | `g5_u4_fa (w) (hw) (hk : 2 ≤ w.length) (hnc : ∃ a ∈ w, ∃ b ∈ w, a ≠ b) : (w.length : ℤ) - 1 ≤ \|(ntr w).y\|` |
| G5-Fb | SPEC-DRAFT (SPLIT of G5-F, the minimizers — the delicate leg) | `g5_u4_fb (w) (hw) (hk) (hnc) : \|(ntr w).y\| = (w.length : ℤ) - 1 ↔ List.IsRotated w (1 :: List.replicate (w.length - 1) 4) ∨ List.IsRotated w (4 :: List.replicate (w.length - 1) 1)` |
| G5-Fc | SPEC-DRAFT (SPLIT of G5-F, the 2/3 clause) | `g5_u4_fc (w) (hw) (h23 : 2 ∈ w ∨ 3 ∈ w) : (w.length : ℤ) + 1 ≤ \|(ntr w).y\|` |

**Specced: 6. Split: G5-B → Ba, Bb, Bc (STATEMENTS.md's Lean note: inequality first, equality family separate, θ bound exact); G5-F → Fa, Fb, Fc (the Lean note's "may split it as a separate leg"), for V₁'s sign-off. Stopped: 0 (no CC-CANDIDATE).** The one statement on the record that is FALSE as printed — AM §3.4's equality clause ("exactly for the parabolic words and the family (1, 4^n), (4, 1^n)", killed in ledger row AM-2 by (1, 1, 4, 4), trace 6 + 4φ) — is not on the lane: STATEMENTS.md's G5-B row already carries the corrected AM-2′ form, which is what G5-Bb states; each B spec's §6 names the killed clause.

## Conventions this unit fixes (for V₁, and for the units after it)

- **"Hyperbolic" at the word level** (G5-Ba, Bb, Bc): the word is neither (1^k) nor (4^k), as two inline hypotheses `h1 : ∃ a ∈ w, a ≠ 1`, `h4 : ∃ a ∈ w, a ≠ 4` — no predicate defined (U3's G5-Ab reads the constant words as `(∀ a ∈ w, a = 1) ∨ (∀ a ∈ w, a = 4)`; the two are logically the negation of each other for non-empty w).
- **"Non-constant"** (G5-Fa, Fb): NOT all syllables equal, `hnc : ∃ a ∈ w, ∃ b ∈ w, a ≠ b` — the literal reading, AM §1.3's own use of "constant words" for (1^k), (4^k), (2^k), (3^k). Note the two populations differ: Theorem B's excludes only (1^k), (4^k); Theorem C's printed "non-constant" excludes (2^k), (3^k) too.
- **|y|** (G5-F): `|(ntr w).y|` on ℤ, the record's absolute value kept (not imported y ≥ 0 from G5-A).
- **Rotations:** the rotation definition this unit names is mathlib's `List.IsRotated` (`∃ n, l.rotate n = l'`, on Batteries' `List.rotate`), written `List.IsRotated w <family>`. **A deviation from the brief's letter, flagged:** the brief said rotations "need a definition this unit owns, `List.rotate`-based; name it". Mathlib's `List.IsRotated` is exactly a `List.rotate`-based rotation predicate, and U3's G5-PHIa (on disk at 10:16Z) already states with it in the same argument order; defining a private `IsRotation` would have put two rotation notions on the lane. If V₁ wants a unit-owned name, the one-line alias is `def IsRotation (w v : List ℕ) : Prop := List.IsRotated w v`.
- **Absolute value on ℤ[φ]:** `ZPhi.rabs t := if RealNonneg t then t else -t` (the only definition this unit adds), on U1's exact real order; no mathlib `abs`, no order structure on `ZPhi`.

## Mathlib names (classifier of record, `tools/ledger_names.py`, plain form, at the pin)

One hit with its namespace: `List.IsRotated	FOUND List Mathlib/Data/List/Rotate.lean:362`.

Per row (verdict lines pasted whole in each spec's §4):
- Ba: `Matrix.trace`, `Matrix.trace_fin_two`, `Matrix.mul_fin_two` (FOUND; proof aids).
- Bb: `List.IsRotated`, `List.IsRotated.symm`, `List.length_rotate`, `List.mem_rotate`, `List.rotate_eq_drop_append_take`, `Matrix.trace_mul_comm` (FOUND).
- Bc: `Matrix.trace_fin_two`, `Matrix.mul_fin_two` (FOUND; for `g5_u4_bc_att`).
- Fa: `one_le_mabs`, `mabs_of_one_le` (FOUND `_root_`), `Int.abs_eq_natAbs` (FOUND `Int`); `abs_nonneg`, `abs_of_nonneg` read FOUND `CFC` — namespaced suffix hits, NOT the root lemmas, which are `to_additive` images of `one_le_mabs` (`Mathlib/Algebra/Order/Group/Unbundled/Abs.lean:109`) and `mabs_of_one_le` (same file, l. 90).
- Fb: `List.IsRotated`, `List.length_rotate`, `List.mem_rotate`, `mabs_of_one_le` (FOUND).
- Fc: `one_le_mabs`, `mabs_of_one_le`, `List.mem_rotate` (FOUND).

**NOT FOUND at the pin:** `List.rotate` — Batteries, `.lake/packages/batteries/Batteries/Data/List/Basic.lean:653`, in scope under `import Mathlib`; `List.replicate` — Lean core at the pinned toolchain, `Init/Data/List/Basic.lean:706`; `rabs` — this unit's own definition, as intended. Tried as proof aids and NOT FOUND under these names, NOT targeted by any row: `abs_le`, `List.prod_rotate`, `List.IsRotated.prod_eq`, `Int.natAbs` (core), `List.length_replicate` / `List.mem_replicate` (core, `Init/Data/List/Basic.lean:713`, `Init/Data/List/Lemmas.lean:2205`), `List.prod_append` (core, `Init/Data/List/Lemmas.lean:1883`), `List.Perm.length_eq`. No row is NEEDS-DEVELOPMENT.

## Probe

`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-U4/probe.lean`, sha256 `911027eb24d5025bf07f216619b5022d27d5875d357b977ee3ebfb913fe3248c`: U1's final probe (sha256 `f15f320065142f9533d7c775430280434d4ec3533a27927dd740d2210e04af63`) copied whole and unedited as the prefix (the prefix's digest re-read equal), then this unit's block (`/-! Unit U4 … -/` onward: one definition, `ZPhi.rabs`, and nine theorems, each `:= by sorry`). **NOT RUN by this seat** (brief amendment 2026-10-30T10:05:25Z; 16 GB machine); the orchestrator elaborates it serially and returns any error to the row. Every spec's §5 Lean text is a byte-for-byte substring of the probe (asserted by the generator). Elaboration points to watch: `(⟨2 + (a : ℤ) * b, (a : ℤ) * b⟩ : ZPhi)` (anonymous constructor under ascription); the numerals `11`, `17`, `7`, `3`, `4` in `ZPhi` via the `CommRing`'s `NatCast`; `conj` resolving to `ZPhi.conj` (mathlib has no root `conj`; the classifier reads 17 namespaced sites).

**A census control of the readings (not a proof):** `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-U4/check_u4.py` evaluates every proposed statement exactly (integer pairs, the `sign_ab5` test re-implemented from U1's `NonnegAB5`) on all 349,524 words with k ≤ 9: 0 failures on each of Ba, Bb (iff), Bb (trace), Bc (bound), Bc (equality iff), Fa, Fb, Fc; the identity and `ntr [1, 4] = 3 + φ` asserted. Output `check_u4.out`.

## Line counts (the template's one-liner, per spec)

- `specs/G5-Ba.md`: 0 Lean line(s) over 100 code points
- `specs/G5-Bb.md`: 0 Lean line(s) over 100 code points
- `specs/G5-Bc.md`: 0 Lean line(s) over 100 code points
- `specs/G5-Fa.md`: 0 Lean line(s) over 100 code points
- `specs/G5-Fb.md`: 0 Lean line(s) over 100 code points
- `specs/G5-Fc.md`: 0 Lean line(s) over 100 code points

## Standing as the record carries it (information for V₁; grades are the wall's)

- G5-B: STATEMENTS.md "PROVED; second head HOLDS; ACCEPTED at the wall"; ledger AM-2 "INEQUALITY HOLDS … EQUALITY CLAUSE KILLED", AM-2′ "SECOND HEAD HOLDS in both directions".
- G5-F: STATEMENTS.md "PROVED; P1-PC controls 0 violations both trees"; **ledger row AM-3's verdict cell still reads "PROVED-PENDING-CHECK"** — the two surfaces differ; the specs quote both.

## The one thing V₁ should look hardest at, per row

- **G5-Ba:** the word-level reading of "hyperbolic" as "neither (1^k) nor (4^k)" — that it is the record's population (Theorem A's y = 0 case) and that it neither adds the hyperbolicity fact (|t| > 2) nor needs it.
- **G5-Bb:** the rotation choice (mathlib's `List.IsRotated`, no unit-owned def — the flagged deviation) and that a, b ≥ 1 under the hyperbolic hypotheses is exactly SH-P2-1 l. 88 ("The hyperbolic ones have a, b ≥ 1"), neither the ledger AM-2′'s a, b ≥ 0 (constants included) nor stronger.
- **G5-Bc:** the absolute value `rabs` on the real order, and the reading of "the maximum attained only at t = 3 + φ" as (equality ↔ t = 3 + φ) plus attainment at (1, 4); and that the cross-multiplied identity is the faithful form of "(4 − φ)/(3 + φ) = (17 − 7φ)/11".
- **G5-Fa:** the literal reading of "non-constant" (all four constant families excluded), which makes the statement no stronger than the printed sentence.
- **G5-Fb:** the minimizer families as `1 :: List.replicate (k − 1) 4` and `4 :: List.replicate (k − 1) 1` up to rotation, both directions; at k = 2 they coincide.
- **G5-Fc:** the SCOPE — every word with a 2 or 3, every k ≥ 1, constants (2^k), (3^k) included — taken from AM §3.5's own sentence (with its "k = 1: |y| = 2"), the ledger row and AM's candidate, over the statement list's row, which places the clause after "non-constant … k ≥ 2". If V₁ reads the row as governing, the narrower statement adds `hk` and `hnc` and stays true (the census control holds on both).

## Files

Specs (write path): `~/Claude/projects/claude-papers-lean/specs/` — `G5-Ba.md`, `G5-Bb.md`, `G5-Bc.md`, `G5-Fa.md`, `G5-Fb.md`, `G5-Fc.md`, `_UNIT-U4.md` (this file).

Scratch a later stage must read: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-U4/probe.lean` (the source of every §5 block; the orchestrator's elaboration input). Also there: `gen.py` (writes the specs, pulling every §2 quote by file and line from the record, every §4 verdict live from the classifier, every §5 block from the probe), `check_u4.py` + `check_u4.out` (the census control of the readings), `counts.txt`, `clock.txt`, `specclock.txt`.

## Status

SPEC-DRAFT 2026-10-30T10:20:28Z — U4 on disk; for V₁.
