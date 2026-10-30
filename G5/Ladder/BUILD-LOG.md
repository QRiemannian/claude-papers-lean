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
