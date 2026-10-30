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
