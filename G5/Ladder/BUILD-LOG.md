# BUILD-LOG — unit U5 (`G5/Ladder`), seat L, PHASE statements — Claude Paper No. 1

- Seat: L-U5 (statements), Opus, dispatched by Orchestrator A 2026-10-30. Brief:
  `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-L-statements-U5.md` (BRIEF READY 2026-10-30T10:35:13Z).
- Opened: 2026-10-30T10:36:51Z (`date -u`). First artefact (this file): 2026-10-30T10:37:45Z.
- No git, no web, nothing under the lab's non-public research trees; `G5.lean` untouched. One Lean process at a time:
  `pgrep -fl 'bin/lean|bin/lake'` polled before every `lake` call, waits logged below.
- Inputs read: the brief; `specs/_V1-U5.md` (V1 COMPLETE 10:27:57Z); the four V1-GREEN specs (MONOa, MONOb, LADa,
  LADb) and LADc (V1-CC, no statement); M's probe (sha256 `c723a83f…30ec`, matches the brief);
  `G5/Ring/{formalization.yaml,comparator.json,Challenge.lean,BUILD-LOG.md}` and `G5/WordLevel/` for shapes.
- U1 prelude built against: `G5/Ring/Challenge.lean` sha256 `863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c`
  (= `statement_sha256`, V2-U1 signed 10:23:30Z; the file on disk re-hashed 10:37:33Z, matches).
- STATEMENTS.md digest at open (read 2026-10-30T10:37:33Z):
  `e0df0f356a20456e8b9a9cfdd816c41ee3d010642acc684a43bc4193c36733bf` — moved again past the brief's `3a9e5400` and
  V₁-U5's `51324441`; written as read.

## Builds

- **assemble** 10:37:45Z → 10:38:26Z — a script (scratchpad `L-U5/assemble.py`, shaped on `L-U3/assemble.py`) cut each
  spec's §5 `lean` fence (each spec asserted to carry its `V1: V1-GREEN` line) and wrote `Challenge.lean`:
  `import Mathlib`, `import G5.Ring.Challenge`, a module docstring, `open G5 ZPhi`, `namespace G5`, then per row a
  `/-! … -/` section doc (row id · locus · STATEMENTS.md prefix `e0df0f35` · the row's V1 line) followed by the row's
  §5 block byte for byte, `end G5`. Two passes wrapped three section-doc lines that ran over 100 code points.
  Checks: all four §5 blocks are byte substrings of `Challenge.lean` AND of M's probe; eleven `theorem`s, eleven
  `by sorry`; 0 lines over 100 code points; no `axiom` / `native_decide` / `set_option` / `def` / `instance` /
  `abbrev` / `example`; no forbidden word.
- **wait** 10:38:34Z → 10:47:56Z — the poll `pgrep -fl 'bin/lean|bin/lake'` reported pids 39698, 39743 (gone by
  10:39:34Z), 40205 / 40239 / 40446 (gone by 10:41:04Z) and pid 39762 throughout. 39762 is a `/bin/zsh` (another
  seat's poll loop whose command text carries the pattern), not a toolchain binary; from 10:47:56Z the poll reads the
  executable name (`ps -ax -o pid=,comm=`, `lean`/`lake`). Every wait line: scratchpad `L-U5/waits.log`.
- **B1** 2026-10-30T10:47:56Z → 10:48:33Z — `lake build G5.Ladder.Challenge` · exit **0** · wall 37 s (Ladder 33 s) ·
  `Build completed successfully (8707 jobs)` · first error: none · warnings: 11 × `declaration uses 'sorry'`
  (l. 30, 34, 49, 56, 62, 76, 81, 86, 100, 105, 111 — the eleven theorems) and U1's five replayed; no unused-hypothesis
  linter warning fired (the brief allowed one on `hw`/`hy`; none appeared).
- **inspect** 10:48:41Z → 10:49:07Z — scratch file `import G5.Ladder.Challenge` + `#check @G5.g5_u5_…` × 11 via
  `lake env lean` · exit 0 · all eleven fully qualified names resolve; no error.
- **B2 (final)** 2026-10-30T10:49:15Z → 10:49:18Z — `lake build G5.Ladder.Challenge` · exit **0** · wall 3 s
  (replayed) · first error: none · warnings: the same 11 × `sorry` (plus U1's five), nothing else.
- `Challenge.lean` sha256 `ea6b4aedd3021843c9399543ebbac30b625aeae4cdd18a0b9042b6b33513d11a` (recorded in
  `formalization.yaml` → `statement_sha256_draft`). U1 prelude re-hashed 10:49:18Z: `863127f8…945948c`, unchanged.
  STATEMENTS.md re-hashed 10:49:18Z: `e0df0f35…733bf`, unchanged since open.

## Departures from the specs' text (none in a signature)
1. **The theorems sit inside `namespace G5 … end G5`**, after `open G5 ZPhi`; the probe put them at the root. The
   statement text is byte-identical; the names become the comparator's `G5.g5_u5_*`.
2. **Locus and prefix in a per-row section doc, not in the theorem docstring.** U5's §5 blocks carry their own
   theorem docstrings (row id + clause), and each block is kept byte for byte, so the brief's locus and
   STATEMENTS.md prefix (`e0df0f35`, the edition current at open; the specs' headers carry `0b277844`, V₁-U5 read
   `51324441`, the brief named `3a9e5400`) ride a `/-! … -/` section doc above each row's block, with the row's
   `V1: V1-GREEN 2026-10-30T10:27:16Z` line. Rewriting the docstrings would have broken the §5-substring check.
3. **Not carried:** U1's block (imported, not restated), the probe's module comment and U1 prefix, and the probe's
   two G5-LADc witness `example`s and any LADc statement (V1-CC). U5 defines nothing.
4. **The Lean poll** reads the executable name rather than the command line after a false positive (above).
5. `G5.lean` untouched (the orchestrator adds the import). No `Solution.lean`.

Closed: 2026-10-30T10:49:53Z.

---

# Seat L-U5 — PHASE proofs (step 6)

- **open** 2026-10-30T11:02:39Z — `shasum -a 256 G5/Ladder/Challenge.lean` →
  `ea6b4aedd3021843c9399543ebbac30b625aeae4cdd18a0b9042b6b33513d11a` — matches the freeze. Not edited.
- **PRELUDE-RULE U5: Solution imports G5.Ring.Solution** — `Solution.lean` begins `import Mathlib` +
  `import G5.Ring.Solution` (the PROVED prelude, `0a11790b…`), does not import `G5.Ladder.Challenge`,
  restates nothing (U5 declares nothing of its own), opens `open G5 ZPhi` + `namespace G5 … end G5`.
  `G5.WordLevel.Solution` is NOT imported; the seat's own helpers are `private` `g5_u5_aux_*`.
- **poll** — by process name only (`pgrep -x lean|lake|lean4export|comparator`), 15 s steps; each wait is logged
  here and in the scratch `L-U5-proofs/waits.log`.
- **wait** 11:03:06Z → 11:03:51Z · 11:04:40Z → 11:08:41Z · 11:10:21Z → 11:12:07Z · 11:12:51Z → 11:13:21Z
  (scratch `lake env lean` checks of the helper block) · 11:16:21Z → 11:17:06Z — other seats' `lean`/`lake`.
- **B1** 2026-10-30T11:17:11Z — `lake build G5.Ladder.Solution` · exit **0** · wall 38 s · the helper block +
  `g5_u5_mono_prod` + `g5_u5_mono_a` (G5-MONOa) · first error: none · two linter infos (flexible `simp`).
- **wait** 11:20:54Z → 11:21:24Z · 11:22:16Z → 11:22:46Z · 11:25:34Z → 11:26:49Z · 11:27:39Z → 11:28:54Z ·
  11:29:19Z → 11:30:35Z (scratch checks; other seats' `lean`/`lake`). Two of the seat's own shell calls ended with
  exit 144 while a foreground `sleep` waited inside the poll; the poll now waits with `perl select` (15 s), same rule.
- **B2** 2026-10-30T11:31:04Z — `lake build G5.Ladder.Solution` · exit **0** · wall 31 s · adds
  `g5_u5_mono_b_rot`, `g5_u5_mono_b_ge1`, `g5_u5_mono_b_step` (G5-MONOb) and `g5_u5_lad_a_one`,
  `g5_u5_lad_a_two`, `g5_u5_lad_a_ge3` (G5-LADa) · first error: none · linter warnings only (style, flexible simp).
- **wait** 11:33:03Z → 11:33:33Z · 11:34:27Z → 11:34:57Z (scratch checks of the LADb block) · 11:36:29Z → 11:36:59Z.
- **B3** 2026-10-30T11:36:59Z — `lake build G5.Ladder.Solution` · exit **0** · wall 32 s · adds `g5_u5_lad_b_one`,
  `g5_u5_lad_b_two`, `g5_u5_lad_b_ge3` (G5-LADb): all eleven proved · first error: none · two `show` style warnings.
- **wait** 11:37:53Z → 11:38:38Z.
- **B4 (final)** 2026-10-30T11:38:38Z — `lake build G5.Ladder.Solution` · exit **0** · wall 41 s (module 28–30 s) ·
  `Build completed successfully (8707 jobs)` · first error: none · no warnings (the `show`s became `change`, the
  flexible `simp`s became `simp only`/`simpa`; the Challenge docstrings copied above each theorem).
- **statement check (script)** — each of the eleven Challenge texts, docstring through the statement up to `:=`, occurs
  exactly once in `Solution.lean` followed by `:=`: 11/11. Lines ≤ 100 code points: all. No `sorry`, `admit`,
  `axiom`, `native_decide`. Imports: `Mathlib`, `G5.Ring.Solution` only.
- **wait** 11:39:28Z → 11:40:28Z.
- **axioms** 2026-10-30T11:40:28Z — scratch `L-U5-proofs/Axioms.lean` (`import G5.Ladder.Solution` + eleven
  `#print axioms`) through `lake env lean`:
      'G5.g5_u5_mono_prod' depends on axioms: [propext, Classical.choice, Quot.sound]
      'G5.g5_u5_mono_a' depends on axioms: [propext, Classical.choice, Quot.sound]
      'G5.g5_u5_mono_b_rot' depends on axioms: [propext, Quot.sound]
      'G5.g5_u5_mono_b_ge1' depends on axioms: [propext, Classical.choice, Quot.sound]
      'G5.g5_u5_mono_b_step' depends on axioms: [propext, Classical.choice, Quot.sound]
      'G5.g5_u5_lad_a_one' depends on axioms: [propext, Classical.choice, Quot.sound]
      'G5.g5_u5_lad_a_two' depends on axioms: [propext, Classical.choice, Quot.sound]
      'G5.g5_u5_lad_a_ge3' depends on axioms: [propext, Classical.choice, Quot.sound]
      'G5.g5_u5_lad_b_one' depends on axioms: [propext, Classical.choice, Quot.sound]
      'G5.g5_u5_lad_b_two' depends on axioms: [propext, Classical.choice, Quot.sound]
      'G5.g5_u5_lad_b_ge3' depends on axioms: [propext, Classical.choice, Quot.sound]
  No `sorryAx`; within the permitted three (`mono_b_rot` uses two of them).
- **comparator** 2026-10-30T11:40:54Z — `bash tools/comparator.sh G5/Ladder` · exit **0** · wall 44 s · landrun is the
  macOS shim (NOT sandboxed, its first line says so) · it built `G5.Ladder.Challenge` (11 × `sorry` warnings, as
  frozen) and `G5.Ladder.Solution`, exported both, then:
      Running Lean default kernel on solution.
      Lean default kernel accepts the solution
      Your solution is okay!
  The prelude arrangement (Challenge on `G5.Ring.Challenge`, Solution on `G5.Ring.Solution`) is accepted.
- **close** — `Challenge.lean` re-hashed `ea6b4aed…3d11a` (unchanged); `Solution.lean` sha256
  `7b4326ca615910ae87b4861175f81d942e8d3e784d2664263d7d67369b58a141` (656 lines); U1 prelude `0a11790b…` unchanged.

| row | theorems | status |
|---|---|---|
| G5-MONOa | `g5_u5_mono_prod`, `g5_u5_mono_a` | PROVED |
| G5-MONOb | `g5_u5_mono_b_rot`, `g5_u5_mono_b_ge1`, `g5_u5_mono_b_step` | PROVED |
| G5-LADa | `g5_u5_lad_a_one`, `g5_u5_lad_a_two`, `g5_u5_lad_a_ge3` | PROVED |
| G5-LADb | `g5_u5_lad_b_one`, `g5_u5_lad_b_two`, `g5_u5_lad_b_ge3` | PROVED |

Routes taken: the real order through the ring map `g5_u5_aux_v : ZPhi →+* ℝ` (`x + y φ`), whose order lemma is the
exact `NonnegAB5 a b ↔ 0 ≤ a + b√5` and whose injectivity is `Real.goldenRatio_irrational`; MONOa by induction with
U1's `g5_u1_ge_a`; MONOb's rotation through a list lemma (an adjacent (1, 4) or a 4…1 wrap);
LADa/LADb by induction on the length from a `decide` base at k = 3 (64 words, both clauses), the step deleting the
last syllable of the rotated word (`mono_b_step`); uniqueness by antisymmetry (the prefix sits at its own minimum,
so by induction it is `2 :: 1^{k−2}` or `3 :: 4^{k−2}`) and the x-coefficient: any other last syllable leaves
`x ≠ 0`, while `(k + 1)φ` has `x = 0`. No STATEMENT-CHANGE-NEEDED. `G5.WordLevel.Solution` not imported.

Closed: 2026-10-30T11:42:10Z.
