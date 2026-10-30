# BUILD-LOG — unit U4 (`G5/Sector`), seat L, PHASE statements — Claude Paper No. 1

- Seat: L-U4 (statements), Opus, dispatched by Orchestrator A 2026-10-30. Brief:
  `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-L-statements-U4.md` (BRIEF READY 2026-10-30T10:35:13Z).
- Opened: 2026-10-30T10:36:51Z (`date -u`). First artefact (this file): 2026-10-30T10:37:42Z.
- No git, no web, nothing under the lab's non-public research trees; one Lean process at a time (pgrep on the
  toolchain binaries before every `lake`; other seats run beside this one).
- Inputs read: the brief; `specs/_UNIT-U4.md`; the six V1-GREEN specs (G5-Ba, G5-Bb, G5-Bc, G5-Fa, G5-Fb, G5-Fc;
  each carries its `V1: V1-GREEN 2026-10-30T10:27:35Z` line); M's probe `<scratchpad>/M-U4/probe.lean` (sha256
  `911027eb24d5025bf07f216619b5022d27d5875d357b977ee3ebfb913fe3248c`, matches the brief's `911027eb…`);
  `G5/Ring/{Challenge.lean,comparator.json,formalization.yaml}` and `G5/WordLevel/*` for shapes.
- STATEMENTS.md digest at open (2026-10-30T10:37:25Z):
  `e0df0f356a20456e8b9a9cfdd816c41ee3d010642acc684a43bc4193c36733bf` — moved past the brief's `3a9e5400` (§4 Errata).
- U1 prelude imported: `G5/Ring/Challenge.lean` sha256 `863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c`
  = `G5/Ring/formalization.yaml` `statement_sha256` (V2 signed 2026-10-30T10:23:30Z) — the frozen prelude.

## Builds

- **assemble** 2026-10-30T10:38:33Z — a script (scratchpad `L-U4/assemble.py`) cut each spec's §5 `lean` fence (asserting
  exactly one fence, the spec's `V1: V1-GREEN` line, and that the fence is a byte substring of M's probe) and wrote
  `Challenge.lean`: `import Mathlib`, `import G5.Ring.Challenge`, a module docstring, `open G5 ZPhi`, `namespace G5`,
  Ba · Bb · Bb_tr, `end G5`, the `namespace ZPhi … end ZPhi` block defining `ZPhi.rabs` byte for byte (placed as the
  probe places it, between `g5_u4_bb_tr` and `g5_u4_bc`; outside `namespace G5` so the name is `ZPhi.rabs`),
  `namespace G5`, Bc · Bc_id · Bc_att · Fa · Fb · Fc, `end G5` — each theorem under a docstring (row id · locus ·
  STATEMENTS.md prefix `e0df0f35`). Checks: every §5 theorem block and the `rabs` block are byte substrings of
  `Challenge.lean`; 0 lines over 100 code points; nine `by sorry`; no forbidden word; no `axiom` / `native_decide` /
  `set_option` / `admit`. (A first pass failed the 100-code-point assertion on four docstring locus lines; rewrapped.)
- **wait** before B1: 10:38:55Z busy (pids 39698 39743 — `lake build G5.Group.Challenge`, another seat) — 30 s — 10:39:32Z
  clear (polled twice with a 3–10 s jitter; the poll reads executable paths, `ps -axo comm`, so it matches only the
  toolchain's `lean`/`lake` binaries).
- **B1** 2026-10-30T10:39:32Z → 10:40:10Z — `lake build G5.Sector.Challenge` · exit **0** · wall 38 s (Challenge 34 s; U1
  replayed) · `Build completed successfully (8707 jobs)` · first error: none · warnings in this module: 9 ×
  `declaration uses 'sorry'` (l. 23, 32, 42, 63, 72, 77, 84, 93, 104 — the nine theorems), nothing else; no
  unused-variable linter warning on `hw`/`h1`/`h4`/`hk`/`hnc`/`h23` appeared (the `sorry` bodies keep it quiet).
  U1's five replayed `sorry` lines.
- **wait** before the inspection: 10:40:28Z clear (twice, jittered).
- **inspect** 2026-10-30T10:40:28Z → 10:40:57Z — `lake env lean <scratchpad>/L-U4/inspect.lean` (`import
  G5.Sector.Challenge`, `#check` with full names) · exit 0 · all nine `G5.g5_u4_…` resolve with the spec statements;
  `ZPhi.rabs : ZPhi → ZPhi` (and `G5.ZPhi.rabs` absent); `rabs`, `conj`, `phi` elaborate to `ZPhi.rabs`, `ZPhi.conj`,
  `ZPhi.phi`; `≤` in `g5_u4_bc` is U1's real order on `ZPhi`.
- **record** 2026-10-30T10:41:04Z — `Challenge.lean` sha256 `df5fdf79df09a7dd097a8d3102c96b644458d2fcde98856b16de002cf910996f`
  → `formalization.yaml` `statement_sha256_draft`; STATEMENTS.md re-read `e0df0f35…` (unchanged since open); U1 prelude
  re-read `863127f8…` → `depends_on`. `comparator.json` and `formalization.yaml` written in `G5/Ring/`'s schema.

## Status

STATED 2026-10-30T10:41Z — six rows, nine theorems, one definition; `Solution.lean` not written (proofs phase).
