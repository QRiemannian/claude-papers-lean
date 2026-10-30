# BUILD-LOG — unit U7 (`G5/Group`), Claude Paper No. 1 — statements phase

*Seat L-U7 (statements), opened 2026-10-30T10:38:21Z (first clock read 2026-10-30T10:36:52Z). Brief:
`Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-L-statements-U7.md` (BRIEF READY 2026-10-30T10:35:13Z).
No git, no web, nothing under `NMC-Phase-1-Research/`. Scratch: `<scratchpad>/L-U7/` only.*

## Inputs read with the clock
- STATEMENTS.md (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`) at 2026-10-30T10:37:22Z:
  `e0df0f356a20456e8b9a9cfdd816c41ee3d010642acc684a43bc4193c36733bf` (the brief named `0b277844` → `3a9e5400`; the
  edition has moved again; the docstrings carry `e0df0f35`).
- U1 prelude `G5/Ring/Challenge.lean` at 10:37:22Z: `863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c`
  = U1's `statement_sha256` (V2-signed 10:23:30Z) → `depends_on`.
- M-U7 probe `<scratchpad>/M-U7/probe.lean`: `ea2c9fb5f4a2704bd0626c848b8f24f5239650dfbb87aac013501959f1a8301c` (matches).
- Specs `G5-U7-NF`, `G5-U7-INTa`, `G5-U7-INTb`, `G5-PHIa`, `G5-PHIb`, `G5-PHIc` (each V1-GREEN, `_V1-U7.md`).

## Pre-build check (`<scratchpad>/L-U7/check.py`, 10:38Z)
Every spec's §5 block is a substring of the probe and of `Challenge.lean` (the NF block in its two parts: the
definitions block through `end G5`, contiguous, and the theorem); 0 Lean lines over 100 code points; no forbidden word.

## Gate
Before every `lake` call: `pgrep -fl 'bin/lean|bin/lake'` (toolchain binaries only, per the dispatch), polled every
30 s until empty; each wait logged below with its clock.

## Builds
- **B1** 2026-10-30T10:38:28Z → 10:39:16Z (gate clear at 10:38:28Z, 0 waits) — `lake build G5.Group.Challenge` ·
  exit **0** · wall 48 s · first error: none · warnings: 6 × `declaration uses 'sorry'` (`G5/Group/Challenge.lean`
  l. 39, 47, 56, 65, 74, 82) plus U1's five replayed; **no unused-variable linter warning** on `hw`/`hy`/`hx`/`hk`
  (the brief allowed one; none appeared). `(g : M2).trace` elaborated as written: the `Matrix.trace (g : M2)` fallback
  was NOT needed, and no §5 amendment is asked for.
- **Gate incident, 10:39:24Z → 10:49:55Z.** The argv-based gate (`pgrep -f` on the pattern) matched other seats'
  poll shells, whose own command text carries the pattern string — about ten minutes of false-positive waits
  (every one logged in `<scratchpad>/L-U7/waits.log`). The pending inspection was stopped, the gate rebuilt to
  match the EXECUTABLE (`ps -axo pid=,comm=`, comm ending `/bin/lean` or `/bin/lake`), and the pattern text kept
  out of this seat's own command lines so no other seat's argv gate waits on this seat. During the incident a
  genuine run (`lake build G5.ModTwo.Challenge`, another seat) was live at 10:49Z, so the wait was not wasted.
- **Inspection** 2026-10-30T10:50:49Z → 10:51:19Z (rebuilt gate: 1 wait at 10:50:19Z on a live toolchain binary,
  clear at 10:50:49Z) — `lake env lean <scratchpad>/L-U7/inspect.lean` · exit 0 · `G5.g5_u7_nf`, `G5.g5_u7_int_a`,
  `G5.g5_u7_int_b`, `G5.g5_u7_phi_a`, `G5.g5_u7_phi_b`, `G5.g5_u7_phi_c`, `G5.HeckeGrp : Subgroup G5.M2ˣ`,
  `G5.IsNF : G5.M2 → Prop` resolve; `(g : M2).trace` prints as `Matrix.trace ↑g`, `phiCoeff` as `ZPhi.phiCoeff`,
  `List.IsRotated` as `~r`; the statements print as the specs' §5.
- **B2 (final)** 2026-10-30T10:51:28Z → 10:51:32Z (gate clear, 0 waits) — `lake build G5.Group.Challenge` · exit **0** ·
  wall 4 s (replayed) · first error: none · warnings: the same 6 × `sorry` (plus U1's five replayed), nothing else.
- `Challenge.lean` sha256 `689c36e6c026a1ce151dd2ab84243a5f8f76bb20a11304c9065cdb358ed410ae` (recorded in
  `formalization.yaml` → `statement_sha256_draft`). Built against U1 `863127f8…` (= U1's `statement_sha256`) →
  `depends_on`. STATEMENTS.md re-read at 10:51:32Z: `e0df0f35…33bf`, unchanged since open.

## Rows (statements phase)
| row | theorem | status |
|---|---|---|
| G5-U7-NF | `G5.g5_u7_nf` (+ defs `G5.HeckeGrp`, `G5.IsNF`) | STATED |
| G5-U7-INTa | `G5.g5_u7_int_a` | STATED |
| G5-U7-INTb | `G5.g5_u7_int_b` | STATED |
| G5-PHIa | `G5.g5_u7_phi_a` | STATED |
| G5-PHIb | `G5.g5_u7_phi_b` | STATED |
| G5-PHIc | `G5.g5_u7_phi_c` | STATED |

## Departures from the specs' text (none in a signature)
1. **The theorems sit inside `namespace G5 … end G5`**, after the definitions block; the probe put them at the root.
   The definitions block (`open G5 ZPhi` through its own `end G5`) stands contiguous and byte-identical to the NF
   spec's §5, and a second `namespace G5 … end G5` holds the six theorems, so the names are the comparator's
   `G5.g5_u7_*` and the block the Solution must restate is one clean span.
2. **Docstrings** on each theorem (the specs' §5 blocks carry none): row id, the primary locus, the STATEMENTS.md
   prefix `e0df0f35` (the edition current at open; specs carry `0b277844`, the brief named `3a9e5400`).
3. **Not carried:** U1's block (imported, not restated); the probe's module comment; V₁-U7's optional
   stronger-containment row (the orchestrator's call; listed under `rows_not_stated`).
4. **Gate form:** the brief's `pgrep -fl "lean|lake"` and the dispatch's `bin/lean|bin/lake` both match on argv; the
   gate in use matches the executable (see the incident above).
5. `G5.lean` untouched (the orchestrator adds the import). No `Solution.lean`.

Closed: 2026-10-30T10:51:45Z.

---

# PHASE proofs (step 6) — seat L-U7-proofs (Opus), opened 2026-10-30T11:50:02Z

- Brief: `SEAT-P3-LEAN-L-proofs-U7.md` (BRIEF READY 2026-10-30T11:45:11Z).
- First act: `shasum -a 256 G5/Group/Challenge.lean` = `689c36e6c026a1ce151dd2ab84243a5f8f76bb20a11304c9065cdb358ed410ae` —
  matches the freeze; proceeding. Challenge, comparator.json, formalization.yaml untouched by this seat.
- PRELUDE-RULE U7: Solution imports G5.Ring.Solution (+ G5.WordLevel.Solution) — the latter for U3's
  `g5_u3_a_y_eq_zero` (INTa's integer-trace leg); the `HeckeGrp`/`IsNF` block restated byte-identically.
- Plan (NF invariant, fixed before coding): by `Subgroup.closure_induction_right`, every element's matrix is
  `E * W w * R^d` with `E ∈ {1, −1, S, −S}`, syllables in 1..4 (w may be empty), `d : ℕ` — closed under
  right multiplication by `S`, `R` and negation (T = −(R S), T⁻¹ = −(S R⁴), S⁻¹ = −S). Conjugating by
  `R^d` moves the tail to the front; then strong induction on `w.length` for the pair
  `Q(R^d W w) ∧ Q(R^d S W w)` (Q m := ∃ h ∈ HeckeGrp, IsNF (h m h⁻¹)): an exponent sum ≡ 0 mod 5 drops to
  `S W w'`; `S W (init ++ [a])` conjugates by S then R^a to `−R^a W init` — the length drops by one.
- Plan (φ-line): x(tr) ≥ x(one closed-path term) by coefficientwise domination in ℕ[φ] (U3's device);
  rotation invariance of ntr (`Matrix.trace_mul_comm`); a φ·s·φ·t term with s, t non-zero ℕ[φ] has x ≥ 1.
- **B1 (NF helpers + NF; other five scaffolded)** 2026-10-30T11:55:38Z → 2026-10-30T11:56:19Z (gate: 0 waits) — `lake build G5.Group.Solution` · exit **0** · wall 41 s · first error: none
- **B2 (+ INTa, INTb)** 2026-10-30T11:56:37Z → 2026-10-30T11:57:15Z (gate: 0 waits) — `lake build G5.Group.Solution` · exit **0** · wall 38 s · first error: none
- **B3 (+ φ-line helpers, PHIc)** 2026-10-30T11:58:07Z → 2026-10-30T11:58:39Z (gate: 0 waits) — `lake build G5.Group.Solution` · exit **1** · wall 32 s · first error: error: G5/Group/Solution.lean:547:9: unsolved goals
- **B4 (bp_rep fix)** 2026-10-30T11:59:01Z → 2026-10-30T11:59:33Z (gate: 0 waits) — `lake build G5.Group.Solution` · exit **0** · wall 32 s · first error: none
- **B5 (+ PHIa, PHIb)** 2026-10-30T12:00:32Z → 2026-10-30T12:01:02Z (gate: 0 waits) — `lake build G5.Group.Solution` · exit **0** · wall 30 s · first error: none
- **B6 (lint tidy: push Not, an unused ring)** 2026-10-30T12:01:25Z → 2026-10-30T12:01:59Z (gate: 0 waits) — `lake build G5.Group.Solution` · exit **0** · wall 34 s · first error: none
- Axioms (scratch `L-U7-proofs/axioms.lean` through `lake env lean`, 2026-10-30T12:02:07Z, gate clear, 0 waits):
```
'G5.g5_u7_nf' depends on axioms: [propext, Classical.choice, Quot.sound]
'G5.g5_u7_int_a' depends on axioms: [propext, Classical.choice, Quot.sound]
'G5.g5_u7_int_b' depends on axioms: [propext, Classical.choice, Quot.sound]
'G5.g5_u7_phi_a' depends on axioms: [propext, Classical.choice, Quot.sound]
'G5.g5_u7_phi_b' depends on axioms: [propext, Classical.choice, Quot.sound]
'G5.g5_u7_phi_c' depends on axioms: [propext, Classical.choice, Quot.sound]
```
- **Comparator** 2026-10-30T12:02:39Z → 12:03:55Z (gate clear, 0 waits; wall 76 s) — `bash tools/comparator.sh G5/Group` · exit **0**:
```
comparator.sh @ 2026-10-30T12:02:39Z · unit G5/Group · landrun /Users/qriemannian/Claude/projects/comparator/scripts/fake-landrun.sh (the macOS shim: NOT sandboxed)
WARNING: THIS IS NOT REAL LANDRUN! UNSAFELY RUNNING exec lake build G5.Group.Challenge
Build completed successfully (8707 jobs).
WARNING: THIS IS NOT REAL LANDRUN! UNSAFELY RUNNING exec /Users/qriemannian/Claude/projects/comparator/.lake/packages/lean4export/.lake/build/bin/lean4export G5
Exporting #[G5.g5_u7_nf, G5.g5_u7_int_a, G5.g5_u7_int_b, G5.g5_u7_phi_a, G5.g5_u7_phi_b, G5.g5_u7_phi_c, propext, Quot.sound, Classical.choice, Nat.add, Nat.sub
WARNING: THIS IS NOT REAL LANDRUN! UNSAFELY RUNNING exec lake build G5.Group.Solution
Build completed successfully (8708 jobs).
WARNING: THIS IS NOT REAL LANDRUN! UNSAFELY RUNNING exec /Users/qriemannian/Claude/projects/comparator/.lake/packages/lean4export/.lake/build/bin/lean4export G5
Exporting #[G5.g5_u7_nf, G5.g5_u7_int_a, G5.g5_u7_int_b, G5.g5_u7_phi_a, G5.g5_u7_phi_b, G5.g5_u7_phi_c, propext, Quot.sound, Classical.choice, Nat.add, Nat.sub
Running Lean default kernel on solution.
Lean default kernel accepts the solution
Your solution is okay!
```
  Reading: PASS (exit 0 and `Your solution is okay!`) — the comparator ACCEPTS the prelude arrangement (Challenge on
  `G5.Ring.Challenge`, Solution on `G5.Ring.Solution` + `G5.WordLevel.Solution`). The landrun is the macOS shim, NOT sandboxed.
- Final build: **B6** (above) — exit 0, wall 34 s; warnings: style linters only (flexible `simp`, `<;>` sequencing in the
  two family/power lemmas) plus U3's two unused `hw`; no `sorry`.
- Checks by script (`L-U7-proofs/assemble.py`, run at every assembly): the `HeckeGrp`/`IsNF` block (506 bytes, `open G5 ZPhi`
  through its `end G5`) is a byte substring of both files; each theorem's docstring + signature up to `:=` is a byte
  substring of both (445 / 486 / 421 / 529 / 378 / 453 bytes); no `sorry` / `admit` / `native_decide` / `axiom`; 0 lines over
  100 code points.
- Digests at close: `Challenge.lean` `689c36e6c026a1ce151dd2ab84243a5f8f76bb20a11304c9065cdb358ed410ae` (unchanged, untouched); `Solution.lean` `9433821971f61be83142b25f8045c2ed1c280852dc2b80b5b452e067805454eb` (     836 lines, 67 private
  helpers `g5_u7_aux_*`, inside the second `namespace G5`).

## Rows (proofs phase)
| row | theorem | status | proof |
|---|---|---|---|
| G5-U7-NF | `G5.g5_u7_nf` | PROVED | `Subgroup.closure_induction_right`: every element's matrix is `E · W w · R^d`, `E ∈ {±I, ±S}` (right multiplication by `S`, `R`, `−I` keeps the form; `T = −(R S)`, `T⁻¹ = −(S R⁴)`, `S⁻¹ = −S`, each by `decide`); conjugate by `R^d`; strong induction on the syllable count for `R^d W w` and `R^d S W w` together: exponents mod 5 by `R⁵ = −I`, an exponent sum `≡ 0` turns `R^d W (a :: w)` into `S W w`, and `S W (w ++ [a])` conjugates by `S` then `R^a` to `−R^a W w` |
| G5-U7-INTa | `G5.g5_u7_int_a` | PROVED | from NF; the trace is a conjugation invariant (`Matrix.trace_mul_cycle`); `±I` → `±2`, `±S` → `0`, `±R^a` has `y ≠ 0` (`decide`, four cases); `±W w`: `tr W = ±t` (U1's `g5_u1_trace`), `y = 0` forces a constant word with `x = 2` (U3's `g5_u3_a_y_eq_zero`) |
| G5-U7-INTb | `G5.g5_u7_int_b` | PROVED | witnesses `S` (trace 0), `I` (2), `S · S = −I` (−2) |
| G5-PHIa | `G5.g5_u7_phi_a` | PROVED | ⇐: rotation invariance of `ntr` (`Matrix.trace_mul_comm`) and the two family computations. ⇒ (the direct path-weight route, U3's domination device): no `2`/`3` → the all-`0` path has weight 1, `x ≥ 1`; two of them → rotate one to the front, the all-`0` path carries `φ s φ t`, `x ≥ 1`; exactly one `2` with a `4` (one `3` with a `1`) → the path `0→1…1→0` (`1→0…0→1`) carries `φ s φ t`; otherwise the word is `1^i 2 1^j` or `4^i 3 4^j`, an explicit rotation of the family |
| G5-PHIb | `G5.g5_u7_phi_b` | PROVED | PHIa ⇒, rotation invariance, `t(1^n 2) = t(3 4^n) = (n + 2) φ` (`bp(1^n) = [[1, nφ],[0, 1]]`, `bp(4^n) = [[1, 0],[nφ, 1]]` by induction) |
| G5-PHIc | `G5.g5_u7_phi_c` | PROVED | the witness `1^{k−1} 2` and the family computation |

No `STATEMENT-CHANGE-NEEDED`. Route note (PHIa ⇒): the record's path-weight route (SH-P2-1 Remark), not the f₁-count of
PROOF-TA-1 Lemma 1. `Challenge.lean`, `comparator.json`, `formalization.yaml`, `G5.lean` untouched; no git run.
Closed: 2026-10-30T12:04:19Z.
