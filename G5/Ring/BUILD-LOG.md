# BUILD-LOG — unit U1 (`G5/Ring`), seat L, PHASE statements — Claude Paper No. 1

- Seat: L-U1 (statements), Opus, dispatched by Orchestrator A 2026-10-30. Brief:
  `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-L-statements-U1.md` (BRIEF READY 2026-10-30T10:13:41Z).
- Opened: 2026-10-30T10:13:57Z (`date -u`). First artefact (this file): 2026-10-30T10:15:06Z.
- No git, no web, nothing under the lab's non-public research trees; the only seat running `lake`.
- Inputs read: the brief; `specs/_V1-U1.md` (V1 COMPLETE 10:12:02Z); `specs/_UNIT-U1.md`; the six V1-GREEN specs
  (DEFS, R5, RAS, DET, GEa, TRACE) and GEb (V1-CC, no statement); M's probe (sha256 `f15f3200…af63`, matches);
  lean-papers `ModularSurface/Now/{comparator.json,formalization.yaml,BUILD-LOG.md,Challenge.lean}` for shapes.
- STATEMENTS.md digest at open: `0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6` (the current edition).

## Builds

- **assemble** between 10:15:06Z and 10:15:30Z (not separately clocked) — a script (scratchpad `L-U1/assemble.py`) cut each spec's §5 `lean` fence and wrote
  `Challenge.lean`: `import Mathlib`, a module docstring, the DEFS block byte for byte, then `namespace G5`, the five
  theorem blocks byte for byte each under a docstring (row id · locus · STATEMENTS.md prefix `0b277844`), `end G5`.
  Checks: all six §5 blocks are byte substrings of `Challenge.lean` AND of M's probe; 0 lines over 100 code points;
  no forbidden word.
- **B1** 2026-10-30T10:15:30Z → 10:16:23Z — `lake build G5.Ring.Challenge` · exit **0** · wall 53 s (Challenge 47 s) ·
  `Build completed successfully (8706 jobs)` · first error: none · warnings: 5 × `declaration uses 'sorry'`
  (l. 152, 157, 162, 169, 175 — the five theorems), nothing else. The DEFS block (incl. the `CommRing` axiom proofs)
  elaborated as copied; no `DEFS-ELABORATION` event.
- **inspect** 10:16:31Z → 10:17:09Z — scratch file `import G5.Ring.Challenge` + `#check` via `lake env lean` · exit 0 ·
  names `G5.g5_u1_r5`, `G5.g5_u1_ras`, `G5.g5_u1_det`, `G5.g5_u1_ge_a`, `G5.g5_u1_trace`, `ZPhi.instCommRing` resolve
  and elaborate to the specs' statements.
- **B2 (final)** 2026-10-30T10:17:36Z → 10:17:41Z — `lake build G5.Ring.Challenge` · exit **0** · wall 5 s (replayed) ·
  first error: none · warnings: the same 5 × `sorry`, nothing else.
- `Challenge.lean` sha256 `863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c` (recorded in
  `formalization.yaml` → `statement_sha256_draft`).

## Departures from the specs' text (none in a signature or a definition)
1. **The theorems sit inside `namespace G5 … end G5`**, placed after the DEFS block's closing `open G5 ZPhi`. The probe
   put them at the root; the brief names them `G5.g5_u1_r5` …, so the wrapper makes the comparator names real. The
   statement text is byte-identical; the names resolve the same (G5 via the namespace, ZPhi via the open).
2. **Docstrings** on each theorem (the specs' §5 blocks carry none): row id, the primary locus from the spec's
   `locus:` line, and the STATEMENTS.md prefix `0b277844` (the current edition; the specs' headers carry `64a12aa2`).
3. **Not carried:** the probe's module comment and its two GEb-witness `example`s (GEb is V1-CC; no statement).
4. `G5.lean` untouched (the orchestrator adds the import). No `Solution.lean`.

Closed: 2026-10-30T10:17:53Z.

# PHASE proofs — seat L-U1 (proofs), Opus, dispatched by Orchestrator A 2026-10-30

- Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-L-proofs-U1.md` (BRIEF READY 2026-10-30T10:25:50Z).
- Opened: 2026-10-30T10:26:06Z (`date -u`). No git, no web; scratch in the session scratchpad `L-U1-proofs/`.
- First act 2026-10-30T10:27:00Z: `shasum -a 256 G5/Ring/Challenge.lean` = `863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c` — matches the frozen digest.
- **probes** 10:27:08Z and 10:27:43Z — two scratch files (`import Mathlib` + the definitions block + candidate
  proofs) through `lake env lean`; gate clear before each. Readings: `decide` closes R⁵ = −I, DET and GEa outright
  (kernel evaluation of the 2×2 products over `ZPhi`); RAS by `interval_cases a <;> decide`; TRACE needed `smul_neg`
  as the last rewrite of the induction step.
- **assemble** 10:28:2xZ — a scratch script (`L-U1-proofs/assemble.py`) cut the definitions block (from the
  `ZPhi` docstring through `open G5 ZPhi`) and the five theorem blocks (docstring + statement through `:= by`) out
  of `Challenge.lean` and wrote `Solution.lean`: `import Mathlib`, a module docstring, the block, `namespace G5`,
  the five theorems with proofs, the one private helper `g5_u1_aux_W_smul` before TRACE, `end G5`. Script checks:
  the block is a byte substring of both files; each of the five docstring+statement texts is a byte substring of
  both files; 0 lines over 100 code points; no trailing whitespace; none of `sorry` / `admit` / `native_decide` /
  `axiom ` / the forbidden word in the file.
- **B1** 2026-10-30T10:28:27Z → 10:28:59Z — `lake build G5.Ring.Solution` · exit **0** · wall 32 s (Solution 29 s) ·
  `Build completed successfully (8706 jobs)` · first error: none · warnings: none. All five theorems in one build
  (the brief's build-per-theorem cadence collapsed: the probes had already closed every row).
  **Gate miss, recorded:** the pre-build `pgrep` listed a running `lake build G5` (pid 37369) and its `lean G5.lean`
  (pid 37402) — the orchestrator's — and my command chain did not stop on it; the two Lean processes overlapped for
  this build. No harm read (both exited 0 here), but the one-Lean-process rule was broken once. From here every
  `lake` call runs behind a blocking gate (`L-U1-proofs/waitlean.sh`: loops 30 s while a toolchain `lean`/`lake`
  binary runs, logging each wait; it matches `/bin/lean`/`/bin/lake` so shells that merely name the repo do not
  count).
- **axioms** 2026-10-30T10:30:26Z → 10:30:40Z (gate: 2 waits, 10:29:26Z on `lake build G5.Congruence.Challenge`
  pid 37640, 10:29:56Z on a `lake env lean` pid 37798; clear 10:30:26Z) — scratch `L-U1-proofs/axioms.lean`
  (`import G5.Ring.Solution` + five `#print axioms`) through `lake env lean` · exit 0:
```
'G5.g5_u1_r5' depends on axioms: [propext, Classical.choice, Quot.sound]
'G5.g5_u1_ras' depends on axioms: [propext, Classical.choice, Quot.sound]
'G5.g5_u1_det' depends on axioms: [propext, Classical.choice, Quot.sound]
'G5.g5_u1_ge_a' depends on axioms: [propext, Classical.choice, Quot.sound]
'G5.g5_u1_trace' depends on axioms: [propext, Classical.choice, Quot.sound]
```
- **comparator** 2026-10-30T10:30:46Z → 10:31:25Z (gate clear, 0 waits) — `bash tools/comparator.sh G5/Ring` · exit **0** · wall 39 s:
```
comparator.sh @ 2026-10-30T10:30:46Z · unit G5/Ring · landrun /Users/qriemannian/Claude/projects/comparator/scripts/fake-landrun.sh (the macOS shim: NOT sandboxed)
Building G5.Ring.Challenge
WARNING: THIS IS NOT REAL LANDRUN! UNSAFELY RUNNING exec lake build G5.Ring.Challenge
⚠ [8706/8706] Replayed G5.Ring.Challenge
warning: G5/Ring/Challenge.lean:152:8: declaration uses `sorry`
warning: G5/Ring/Challenge.lean:157:8: declaration uses `sorry`
warning: G5/Ring/Challenge.lean:162:8: declaration uses `sorry`
warning: G5/Ring/Challenge.lean:169:8: declaration uses `sorry`
warning: G5/Ring/Challenge.lean:175:8: declaration uses `sorry`
Build completed successfully (8706 jobs).
WARNING: THIS IS NOT REAL LANDRUN! UNSAFELY RUNNING exec /Users/qriemannian/Claude/projects/comparator/.lake/packages/lean4export/.lake/build/bin/lean4export G5.Ring.Challenge -- G5.g5_u1_r5 G5.g5_u1_ras G5.g5_u1_det G5.g5_u1_ge_a G5.g5_u1_trace propext Quot.sound Classical.choice Nat.add Nat.sub Nat.mul Nat.pow Nat.gcd Nat.div Nat.mod Nat.beq Nat.ble Nat.land Nat.lor Nat.xor Nat.shiftLeft Nat.shiftRight String.ofList Char.ofNat List eagerReduce
Exporting #[G5.g5_u1_r5, G5.g5_u1_ras, G5.g5_u1_det, G5.g5_u1_ge_a, G5.g5_u1_trace, propext, Quot.sound, Classical.choice, Nat.add, Nat.sub, Nat.mul, Nat.pow, Nat.gcd, Nat.div, Nat.mod, Nat.beq, Nat.ble, Nat.land, Nat.lor, Nat.xor, Nat.shiftLeft, Nat.shiftRight, String.ofList, Char.ofNat, List, eagerReduce] from G5.Ring.Challenge
Building G5.Ring.Solution
WARNING: THIS IS NOT REAL LANDRUN! UNSAFELY RUNNING exec lake build G5.Ring.Solution
Build completed successfully (8706 jobs).
WARNING: THIS IS NOT REAL LANDRUN! UNSAFELY RUNNING exec /Users/qriemannian/Claude/projects/comparator/.lake/packages/lean4export/.lake/build/bin/lean4export G5.Ring.Solution -- G5.g5_u1_r5 G5.g5_u1_ras G5.g5_u1_det G5.g5_u1_ge_a G5.g5_u1_trace propext Quot.sound Classical.choice Nat.add Nat.sub Nat.mul Nat.pow Nat.gcd Nat.div Nat.mod Nat.beq Nat.ble Nat.land Nat.lor Nat.xor Nat.shiftLeft Nat.shiftRight String.ofList Char.ofNat List eagerReduce
Exporting #[G5.g5_u1_r5, G5.g5_u1_ras, G5.g5_u1_det, G5.g5_u1_ge_a, G5.g5_u1_trace, propext, Quot.sound, Classical.choice, Nat.add, Nat.sub, Nat.mul, Nat.pow, Nat.gcd, Nat.div, Nat.mod, Nat.beq, Nat.ble, Nat.land, Nat.lor, Nat.xor, Nat.shiftLeft, Nat.shiftRight, String.ofList, Char.ofNat, List, eagerReduce] from G5.Ring.Solution
Running Lean default kernel on solution.
Lean default kernel accepts the solution
Your solution is okay!
```
  Reading: PASS (exit 0 and `Your solution is okay!`). Note carried from the script's own first line: the landrun
  is the macOS shim, NOT sandboxed.
- **B2 (final)** 2026-10-30T10:31:33Z → 10:31:36Z (gate clear, 0 waits) — `lake build G5.Ring.Solution` · exit **0** ·
  wall 3 s (replayed) · first error: none · warnings: none.
- Digests at close: `Challenge.lean` `863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c` (unchanged,
  untouched); `Solution.lean` `0a11790b32f126ecac0f1df2f41e7399a4a9b514a77794ebf08f7878825c0271`.

## Rows (proofs phase)
| row | theorem | status | proof |
|---|---|---|---|
| G5-U1-R5 | `G5.g5_u1_r5` | PROVED | `decide` |
| G5-U1-RAS | `G5.g5_u1_ras` | PROVED | `interval_cases a <;> decide` |
| G5-U1-DET | `G5.g5_u1_det` | PROVED | `interval_cases a <;> decide` |
| G5-U1-GEa | `G5.g5_u1_ge_a` | PROVED | `interval_cases a <;> fin_cases i <;> fin_cases j <;> decide` |
| G5-U1-TRACE | `G5.g5_u1_trace` | PROVED | private helper `g5_u1_aux_W_smul` (`W w = (−1)^k • blockProd w`, induction on the word via RAS per syllable), then `Matrix.trace_smul` and `(−1)^k (−1)^k = 1` |

No `STATEMENT-CHANGE-NEEDED`. `G5.lean`, `Challenge.lean`, `comparator.json`, `formalization.yaml` untouched.
Closed: 2026-10-30T10:31:49Z.

### Orchestrator line — 2026-10-30T10:34:42Z

The orchestrator added `import G5.Ring.Solution` to the index `G5.lean` and the index build failed: `import G5.Ring.Solution failed, environment already contains 'ZPhi.ext.match_1' from G5.Ring.Challenge`. That is the design, not a defect: the Solution restates the definitions block (CO's ruling) and so cannot share an environment with its Challenge. The import was removed in the same minute; the index carries Challenge files only and the comment in `G5.lean` says why. `Solution.lean` is untouched (sha 0a11790b…). Decided under the lifted bar (mechanical, reversible, documented here).
