# BUILD-LOG — unit U3 (`G5/WordLevel`), seat L, PHASE statements — Claude Paper No. 1

- Seat: L-U3 (statements), Opus, dispatched by Orchestrator A 2026-10-30. Brief:
  `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-L-statements-U3.md` (BRIEF READY 2026-10-30T10:23:20Z).
- Opened: 2026-10-30T10:24:03Z (`date -u`). First artefact (this file): 2026-10-30T10:24:43Z.
- No git, no web, nothing under the lab's non-public research trees; one Lean process at a time (pgrep before every `lake`).
- Inputs read: the brief; `specs/_V1-U3.md` (V1 COMPLETE 10:21:25Z, four GREEN, both splits OK); `specs/_UNIT-U3.md`;
  the four V1-GREEN specs (G5-Aa, G5-Ab, G5-SEPa, G5-SEPb); M's probe `<scratchpad>/M-U3/probe.lean` (sha256
  `f600675e…a84c0`, matches); `G5/Ring/{Challenge.lean,comparator.json,formalization.yaml,BUILD-LOG.md}` for shapes;
  `specs/_V2-U1.md` (U1 frozen at `863127f8…`).
- STATEMENTS.md digest at open (10:24:24Z): `513244419676c1eecef06054d23a34909af196eb75471b7157b4a089b4149111` —
  moved past the brief's `3a9e5400` by the §4 erratum stamped 10:22:16Z (G5-LAD's consequence clause, found by M-U5;
  touches no U3 row).
- U1 prelude imported: `G5/Ring/Challenge.lean` sha256 `863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c`.

## Builds

- **assemble** 2026-10-30T10:25:01Z — a script (scratchpad `L-U3/assemble.py`) cut each spec's §5 `lean` fence (asserting
  exactly one fence and the spec's `V1: V1-GREEN` line) and wrote `Challenge.lean`: `import Mathlib`,
  `import G5.Ring.Challenge`, a module docstring, `open G5 ZPhi`, `namespace G5`, the four theorem blocks byte for byte
  each under a docstring (row id · locus · STATEMENTS.md prefix `51324441`), `end G5`. Checks: all four §5 blocks are
  byte substrings of `Challenge.lean` AND of M's probe; 0 lines over 100 code points; no forbidden word; no
  `axiom` / `native_decide` / `set_option` / `ComplexConjugate` in the file.
- **wait** before B1: pgrep at 10:25:05Z found the orchestrator's `lake env lean …/M-U5/probe.lean` (pids 35919/35920/35953);
  waited in 30 s steps — 10:25:13Z busy (pids 36015/36016/36035, the next serial probe) — 10:25:43Z clear.
- **B1** 2026-10-30T10:25:51Z → 10:26:18Z — pgrep clear — `lake build G5.WordLevel.Challenge` · exit **0** · wall 27 s
  (Challenge 23 s; U1 replayed) · `Build completed successfully (8707 jobs)` · first error: none · warnings in this
  module: 4 × `declaration uses 'sorry'` (l. 23, 30, 39, 48 — the four theorems), nothing else. No unused-variable
  linter warning on `hw`/`hy` appeared (the `sorry` bodies keep the linter quiet); U1's five replayed `sorry` lines.
- **inspect** 10:26:26Z → 10:26:38Z — pgrep clear — scratch file `import G5.WordLevel.Challenge` + `#check` with full names
  via `lake env lean` · exit 0 · `G5.g5_u3_a_nonneg`, `G5.g5_u3_a_y_eq_zero`, `G5.g5_u3_sep_lin`, `G5.g5_u3_sep_sq`
  resolve; `nonneg` → `ZPhi.nonneg`, `conj` → `ZPhi.conj`, `phi` → `ZPhi.phi`, `ntr`/`IsWord` → U1's `G5.*`; the
  statements print as the specs' §5.
- **B2 (final)** 2026-10-30T10:26:45Z → 10:26:48Z — pgrep clear — `lake build G5.WordLevel.Challenge` · exit **0** · wall 3 s
  (replayed) · first error: none · warnings: the same 4 × `sorry` (plus U1's five replayed), nothing else.
- `Challenge.lean` sha256 `69533d2d17c4ed2dc569c1de6ddb5e92e42b85099901370bb946ea0ed7a13735` (recorded in
  `formalization.yaml` → `statement_sha256_draft`). Built against U1 `863127f8…` (= U1's `statement_sha256`, V2-signed
  10:23:30Z) → `depends_on`. STATEMENTS.md re-read at 10:26:48Z: `51324441…9111`, unchanged since open.

## Departures from the specs' text (none in a signature)
1. **The theorems sit inside `namespace G5 … end G5`**, after `open G5 ZPhi`; the probe put them at the root. The
   statement text is byte-identical; the names become the comparator's `G5.g5_u3_*`.
2. **Docstrings** on each theorem (the specs' §5 blocks carry none): row id, the primary locus, and the STATEMENTS.md
   prefix `51324441` (the edition current at open; the specs' headers carry `0b277844`, the brief named `3a9e5400`).
3. **Not carried:** U1's block (imported, not restated) and the probe's module comment. U3 defines nothing.
4. `G5.lean` untouched (the orchestrator adds the import). No `Solution.lean`.
5. Scratch: the brief's Common notes say `<scratchpad>/L-U1/`; the dispatch said `L-U3/` — this seat wrote only
   `<scratchpad>/L-U3/` (assemble.py, waits.log, B1.log, B2.log, inspect.lean, inspect.txt) and read `L-U1/assemble.py`.

Closed: 2026-10-30T10:27:05Z.

---

# PHASE proofs (step 6) — seat L-U3 (proofs), Opus

- Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-L-proofs-U3.md` (BRIEF READY 2026-10-30T10:43:48Z).
- Opened: 2026-10-30T10:44:38Z (`date -u`). First artefact (this entry): 2026-10-30T10:46:14Z.
- `shasum -a 256 G5/WordLevel/Challenge.lean` at open: `69533d2d17c4ed2dc569c1de6ddb5e92e42b85099901370bb946ea0ed7a13735`
  = the frozen digest. Challenge.lean, comparator.json, formalization.yaml: read, not edited.
- **PRELUDE-RULE U3: Solution imports G5.Ring.Solution** (the PROVED U1 prelude, sha256 `0a11790b…`), not
  `G5.WordLevel.Challenge` and not `G5.Ring.Challenge`; U3 defines nothing, so nothing is restated. `open G5 ZPhi`
  and `namespace G5 … end G5` as Challenge.lean has them; helpers named `g5_u3_aux_*`, private, inside the namespace.
- Gate: scratchpad `L-U3-proofs/gate.sh` polls `ps -axo comm` for the executables lean · lake · lean4export ·
  comparator (not shell command lines) every 30 s; each poll is logged to `L-U3-proofs/waits.log` and summarised here.

## Builds (proofs phase)
- **B0** 2026-10-30T10:48:30Z → 10:53:30Z — gate waits 10:48:30Z → 10:53:30Z, 10 polls busy (other seats' `lake`/`lean`
  pids 42486 … 45321, then a `comparator` + `lean4export` drive 10:52:30Z–10:53:00Z), clear 10:53:30Z — the command
  carried a `timeout` prefix that macOS lacks: exit **127** (`command not found: timeout`), no Lean process started.
- **B1** 2026-10-30T10:53:42Z → 10:54:14Z (gate clear at once) — `lake build G5.WordLevel.Solution` · exit **1** · wall 32 s ·
  first error: `Solution.lean:84:23: failed to synthesize Decidable ((∀ i j : Fin 2, (P 1 i j).nonneg) ∧ …)` (a
  `decide` on a whole `∀ i j` statement; plus the same for the empty word at l. 103, and SEPb's last step left
  `1 ≤ |(ntr w).y|` after a bare `simp`). Fix: `fin_cases i <;> fin_cases j <;> decide`; SEPb closes with
  `simp only [sub_x, sub_y] <;> nlinarith`.
- **B2** 2026-10-30T10:55:04Z → 10:55:37Z (gate: 1 busy poll 10:54:34Z, clear 10:55:04Z) — exit **1** · wall 33 s · first
  error: `Solution.lean:85:4: decide proved that ((P 2 - 1) 0 0).nonneg is false`. The first Ab route asked for
  `P_a − 1 ∈ ℕ[φ]` entrywise, which fails for `P₂`, `P₃` (`φ − 1 = ⟨−1, 1⟩`; `P_a ≥ 1` holds in the REAL order only, as
  U1's GEa states). Rebuilt the Ab helpers around a different invariant (below); no statement touched.
- **B3** 2026-10-30T10:58:31Z → 10:59:14Z (gate: 2 busy polls 10:57:31Z–10:58:01Z) — exit **0** · wall 43 s · first error:
  none · warnings: 2 × `<;>` where `;` suffices (cosmetic), 2 × unused `hw` (SEPa l. 326, SEPb l. 345 — `hw` is in the
  frozen statements and the separation needs only `hy`; the name cannot change, so the warning stays).
- **B4** 2026-10-30T11:03:01Z → 11:03:42Z (gate: 3 busy polls 11:01:01Z–11:02:31Z, incl. another seat's comparator) —
  exit **0** · wall 41 s · first error: none · warnings: the 2 × unused `hw` only.
- **AXIOMS** 2026-10-30T11:05:23Z → 11:05:45Z (gate: 3 busy polls 11:03:53Z–11:04:53Z) — scratch
  `L-U3-proofs/axioms.lean` (`import G5.WordLevel.Solution` + four `#print axioms`) via `lake env lean` · exit 0:
```
'G5.g5_u3_a_nonneg' depends on axioms: [propext, Classical.choice, Quot.sound]
'G5.g5_u3_a_y_eq_zero' depends on axioms: [propext, Classical.choice, Quot.sound]
'G5.g5_u3_sep_lin' depends on axioms: [propext, Classical.choice, Quot.sound]
'G5.g5_u3_sep_sq' depends on axioms: [propext, Classical.choice, Quot.sound]
```
- **COMPARATOR** 2026-10-30T11:06:55Z → 11:08:39Z (gate: 2 busy polls 11:05:55Z–11:06:25Z) —
  `bash tools/comparator.sh G5/WordLevel` · exit **0** · output (lake's per-job lines and the long export argument lists
  trimmed; the two unused-`hw` warnings of the Solution build trimmed):
```
comparator.sh @ 2026-10-30T11:06:55Z · unit G5/WordLevel · landrun /Users/qriemannian/Claude/projects/comparator/scripts/fake-landrun.sh (the macOS shim: NOT sandboxed)
Building G5.WordLevel.Challenge
WARNING: THIS IS NOT REAL LANDRUN! UNSAFELY RUNNING exec lake build G5.WordLevel.Challenge
warning: G5/WordLevel/Challenge.lean:23:8: declaration uses `sorry`
warning: G5/WordLevel/Challenge.lean:30:8: declaration uses `sorry`
warning: G5/WordLevel/Challenge.lean:39:8: declaration uses `sorry`
warning: G5/WordLevel/Challenge.lean:48:8: declaration uses `sorry`
Build completed successfully (8707 jobs).
Exporting #[G5.g5_u3_a_nonneg, G5.g5_u3_a_y_eq_zero, G5.g5_u3_sep_lin, G5.g5_u3_sep_sq, propext, Quot.sound, Classical.choice, …] from G5.WordLevel.Challenge
Building G5.WordLevel.Solution
WARNING: THIS IS NOT REAL LANDRUN! UNSAFELY RUNNING exec lake build G5.WordLevel.Solution
Build completed successfully (8707 jobs).
Exporting #[G5.g5_u3_a_nonneg, G5.g5_u3_a_y_eq_zero, G5.g5_u3_sep_lin, G5.g5_u3_sep_sq, propext, Quot.sound, Classical.choice, …] from G5.WordLevel.Solution
Running Lean default kernel on solution.
Lean default kernel accepts the solution
Your solution is okay!
```
  Reading: PASS (exit 0 and `Your solution is okay!`) — the comparator ACCEPTS the prelude arrangement (Challenge on
  `G5.Ring.Challenge`, Solution on `G5.Ring.Solution`). Carried from the script's first line: the landrun is the macOS
  shim, NOT sandboxed.
- **B5 (final)** 2026-10-30T11:13:52Z → 11:13:56Z (gate: 10 busy polls 11:08:52Z–11:13:22Z, other seats' builds and a
  comparator drive) — `lake build G5.WordLevel.Solution` · exit **0** · wall 4 s (replayed) · first error: none ·
  warnings: the 2 × unused `hw` only · `Build completed successfully (8707 jobs).`
- Checks by script (`L-U3-proofs/proofs.py`, run at every assembly): each theorem's docstring + signature text up to
  `:=` is a byte substring of both files (356 / 451 / 470 / 462 bytes); no `sorry` / `admit` / `native_decide` /
  `axiom` in the file; 0 lines over 100 code points.
- Digests at close: `Challenge.lean` `69533d2d17c4ed2dc569c1de6ddb5e92e42b85099901370bb946ea0ed7a13735` (unchanged,
  untouched); `Solution.lean` `1666d0f4eb56aeb7f5fa011cef9b480b7c7118fc1192bbd6256bbe024e080912` (361 lines); prelude
  `G5/Ring/Solution.lean` `0a11790b32f126ecac0f1df2f41e7399a4a9b514a77794ebf08f7878825c0271`.

## Rows (proofs phase)
| row | theorem | status | proof |
|---|---|---|---|
| G5-Aa | `G5.g5_u3_a_nonneg` | PROVED | invariant by induction on the word: every entry of `blockProd w` lies in ℕ[φ] (aux `nonneg_add`, `nonneg_mul`, their matrix forms over `Fin 2`); `tr = M₀₀ + M₁₁` |
| G5-Ab | `G5.g5_u3_a_y_eq_zero` | PROVED | ⇐ and `x = 2`: a constant word in `1` (in `4`) keeps `[[1, ∗], [0, 1]]` (`[[1, 0], [∗, 1]]`), trace `2`. ⇒ by contradiction: a non-constant word has a `2`/`3`, or both a `1` and a `4`. One closed path of the product carries φ: each product entry dominates (coefficientwise in ℕ[φ]) each term of its sum; the diagonal entries of every block product are non-zero in ℕ[φ]; so `(X P_a Z)₀₀ ≥ X₀₀ φ Z₀₀` for `a ∈ {2, 3}`, `(X P₁ M P₄ Z)₀₀ ≥ X₀₀ φ M₁₁ φ Z₀₀`, `(X P₄ M P₁ Z)₁₁ ≥ X₁₁ φ M₀₀ φ Z₁₁`, each with `y ≥ 1` |
| G5-SEPa | `G5.g5_u3_sep_lin` | PROVED | `t − t^σ = ⟨−y, 2y⟩`; `y • u = (y : ℤ[φ]) u` (`zsmul_eq_mul`, an int-cast lemma), `2 = ⟨2, 0⟩`; the order clause unfolds to `NonnegAB5 0 (2y − 2)`, first disjunct, `omega` |
| G5-SEPb | `G5.g5_u3_sep_sq` | PROVED | `⟨−y, 2y⟩² = ⟨5y², 0⟩` (`sq`, components, `ring`); `5 = ⟨5, 0⟩`; the order clause unfolds to `NonnegAB5 (10y² − 10) 0`, first disjunct, `nlinarith` |

Route note (Ab): of the record's two routes the proof takes the direct closed-path weight one (AM-1-SH §3), cast as a
coefficientwise domination of single product terms; the f₁-count of PROOF-TA-1 Lemma 1 is not used. 25 private helpers
`g5_u3_aux_*`, inside `namespace G5`, after `open G5 ZPhi`; no shared declaration restated or changed.
No `STATEMENT-CHANGE-NEEDED`. `Challenge.lean`, `comparator.json`, `formalization.yaml`, `G5.lean` untouched.
Closed: 2026-10-30T11:14:39Z.
