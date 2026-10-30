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
