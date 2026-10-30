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
