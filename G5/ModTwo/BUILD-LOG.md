# BUILD-LOG — unit U2 (`G5/ModTwo`), seat L-U2, PHASE statements

*Seat L-U2 opened 2026-10-30T10:36:50Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-L-statements-U2.md` (BRIEF READY 2026-10-30T10:29:26Z). No git, no web.*

- **source** STATEMENTS.md `shasum -a 256` at 2026-10-30T10:37:37Z: `e0df0f35…` (`e0df0f356a20456e8b9a9cfdd816c41ee3d010642acc684a43bc4193c36733bf`); re-read unchanged at 10:50:48Z. The brief named `3a9e5400`; the specs' headers carry `0b277844`. The §4 entries since touch no U2 statement: the 10:29:26Z coverage decision puts G5-L2's group-level main clause on a new unit U8 and leaves the word-level rows as they are.
- **U1** `G5/Ring/Challenge.lean` shasum at 10:38:30Z and 10:50:48Z: `863127f8…445948c`, U1's `statement_sha256` (V2-signed 10:23:30Z). Recorded as `depends_on`.
- **assemble** 2026-10-30T10:38:25Z — `<scratchpad>/L-U2/assemble.py` writes `Challenge.lean` from the six V1-GREEN specs' §5 blocks. The file has the two imports, the module doc and `open G5 ZPhi`. Then comes the G5-U2-MOD2 block whole, with its own `namespace G5 … end G5` and closing `open G5 ZPhi`. After it, `namespace G5`, the nine theorems in spec order (HOM ×3, D5 ×2, TRD5, L1, L2 ×2), each under a docstring the seat added, then `end G5`. Checks:
  - the MOD2 block and every theorem's text are byte substrings of `Challenge.lean`;
  - every whole §5 block is a byte substring of M's probe (`e354f54c…`);
  - 0 lines are over 100 code points;
  - no forbidden word appears;
  - there is no `native_decide` and no `set_option`;
  - the one `axiom` substring is the spec's own comment at l. 59 ("The axioms by `simp only` …"), not a declaration.
- **wait** before B1, 10:38:37Z → 10:49:23Z (`<scratchpad>/L-U2/waits.log`, 30 s polls):
  - 10:38:37Z → 10:39:07Z: a real `lake build G5.Group.Challenge` (pid 39698, another seat's build).
  - 10:39:37Z → 10:48:37Z: the only hits were other seats' waiter shells (pids 39746, 41818), whose command lines carry the pattern text `bin/lean|bin/lake`. They are false positives, and two waiters running that pattern hold each other.
  - 10:48:45Z: the poller was restarted on `pgrep -x lean` / `pgrep -x lake` (process name only).
  - 10:48:53Z: a real `lake build G5.Ladder.Challenge` (lean 42722, lake 42703); clear at 10:49:23Z.
- **B1** 2026-10-30T10:49:30Z → 10:50:07Z (re-polled clear at 10:49:30Z) — `lake build G5.ModTwo.Challenge`: exit **0**, wall 37 s (the Challenge module took 35 s; U1 replayed), `Build completed successfully (8707 jobs)`. First error: none. Warnings in this module: 9 × `declaration uses 'sorry'` at l. 125, 130, 135, 140, 146, 153, 160, 166 and 172 (the nine theorems), and nothing else. No unused-variable linter warning on `hw` appeared. U1's five `sorry` warnings were replayed.
- **inspect** 10:50:15Z → 10:50:37Z (polled clear) — a scratch file with `import G5.ModTwo.Challenge` and `#check` on the full names, run with `lake env lean`: exit 0.
  - `G5.F4 : Type`, `G5.red2 : ZPhi → G5.F4` and `G5.D5bar : Finset G5.F4M` resolve, and `CommRing G5.F4` is found by `inferInstance`.
  - `G5.g5_u2_f4` … `G5.g5_u2_l2_int` all resolve and print as the specs' §5 do. `W` and `IsWord` resolve to U1's `G5.*`.
  - `#print axioms G5.g5_u2_l1` gives propext, sorryAx, Classical.choice and Quot.sound. sorryAx is expected in this phase.
- **B2 (final)** 2026-10-30T10:50:44Z → 10:50:48Z (polled clear) — `lake build G5.ModTwo.Challenge`: exit **0**, wall 4 s (replayed). First error: none. Warnings: the same 9 × `sorry`, U1's five replayed, and nothing else.
- `Challenge.lean` sha256 `c342ab92ba8ef07e5a9fba82422968b9de4410974583210dc1dcded53354c78c`, recorded in `formalization.yaml` as `statement_sha256_draft`.

## Departures from the specs' text (none in a signature)
1. **Placement.** The MOD2 block is carried whole, as the probe places it, so the names are `G5.F4`, `G5.red2`, … `G5.D5bar`. The file opens with `open G5 ZPhi` before the block because the probe had U1's `open G5 ZPhi` in effect at that point; the block's own closing `open G5 ZPhi` repeats it harmlessly. The theorems sit in `namespace G5` per the brief, so their names are `G5.g5_u2_…`. In the probe they sat at the root. The statement text is byte-identical.
2. **Docstrings added.** The U2 specs' theorem blocks carry no docstring. Each theorem gets one directly above its unchanged text, giving the row id, a one-line gloss, the source-of-record locus and the STATEMENTS.md prefix `e0df0f35`. MOD2's locus and prefix sit in a plain `/- … -/` comment above the block, because the block's declarations already carry their own docstrings. The module doc gives the short forms AM and LEDGER.
3. **Not carried:** U1's block (it is imported, not restated) and the probe's U1 part. `G5.lean` is untouched; the orchestrator adds the import. There is no `Solution.lean`.
4. **Brief residue.** The brief's first bullet reads "U3 imports U1" and "theorem row of U3" (template residue). This seat built U2, the six rows the brief's title names.

Closed: 2026-10-30T10:51:37Z.
