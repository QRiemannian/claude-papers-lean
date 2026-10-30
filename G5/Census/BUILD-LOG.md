# BUILD-LOG — unit U11 (`G5/Census`), seat L-ADD, PHASE statements

*Seat L-ADD opened 2026-10-30T13:14:40Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-L-statements-ADD.md` (BRIEF READY 2026-10-30T13:14:19Z), with the rules of `SEAT-P3-LEAN-L-statements-U8.md`. One seat, three units (U9, U10, U11), built serially. No git, no web. Scratch: `<scratchpad>/L-ADD/`. Lean-process discipline: `tools/waitlean.sh` (process NAME match, `pgrep -x` on lean / lake / lean4export / comparator; 15 s per wait), never `pgrep -f`.*

- **source** STATEMENTS.md at 2026-10-30T13:15:02Z: `shasum -a 256` = `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731`, `wc -c` = 21568 — the edition the brief and the specs name.
- **dependencies** at 2026-10-30T13:15:13Z, `shasum -a 256` of each imported frozen `Challenge.lean` equals its `formalization.yaml` `statement_sha256` (recorded under `depends_on`).
- **specs/probe** 2026-10-30T13:15:3xZ — `<scratchpad>/L-ADD/sec5.py`: every §5 Lean block of this unit's specs is a byte substring of M's probe, and the blocks joined by one newline equal the probe's text between `namespace G5` and `end G5`, byte for byte.
- **assemble** 2026-10-30T13:15:50Z — `<scratchpad>/L-ADD/assemble.py` writes `Challenge.lean` = the probe's imports, a module doc (unit, rows, the edition sha256 · 21568 B, the frozen imports), then the probe from `open G5 ZPhi` to `end G5` unchanged. Checks: each §5 block is a substring of the output; every line ≤ 100 code points; no forbidden word; no `axiom` / `native_decide` / `set_option`; no definition.
- **wait** before B1: `tools/waitlean.sh` 2026-10-30T13:17:40Z — clear at the first poll, no wait.
- **B1** 2026-10-30T13:17:40Z — `lake build G5.Census.Challenge`: exit **0**, wall 36 s (the module 32 s), `Build completed successfully (8708 jobs)`. First error: none. Warnings in this module: 3 × `declaration uses 'sorry'` (l. 30 `g5_u11_census_a`, l. 41 `g5_u11_census_b`, l. 50 `g5_u11_census_b_wit`) and nothing else; no unused-hypothesis linter warning appeared. The 16 upstream `sorry` warnings of U1, U5 were replayed.
- `Challenge.lean` sha256 `ee958447349e411d839a595dd2057af8d284daedcb410f4a71a4eca3d2c2b76c`, 52 lines, longest line 92 code points; recorded in `formalization.yaml` as `statement_sha256_draft`. `depends_on` (re-read 13:18:23Z, each equal to its `statement_sha256`): U1 `863127f8…948c` · U5 `ea6b4aed…d11a`. STATEMENTS.md still `a84cecdd…0731` · 21568 B at 13:18:23Z.

## Rows
| row | theorems | status |
|---|---|---|
| G5-LADc′a | `G5.g5_u11_census_a` | STATED |
| G5-LADc′b | `G5.g5_u11_census_b`, `G5.g5_u11_census_b_wit` (the witness clause, KEPT at V1) | STATED |

## Departures from the specs' text (none in a signature)
1. Each §5 block's docstring already carries the row id (with U+2032 as the specs write it), the locus and the prefix `a84cecdd`; the blocks are carried whole. The Lean names carry no prime. The probe's text from `open G5 ZPhi` to `end G5` is carried unchanged; a module doc was added after the imports.
2. No `Solution.lean`; `G5.lean` untouched; no git run. No `STATEMENT-CHANGE-NEEDED`.
3. Scratch: `<scratchpad>/L-ADD/` (sec5.py, assemble.py, records.py, waits-U11.log not created (no wait), B1-U11.log).

Closed: 2026-10-30T13:19Z.

---

# PHASE proofs — seat L-ADD (unit U11), opened 2026-10-30T13:27:44Z

*Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-L-proofs-ADD.md` (READY 2026-10-30T13:27:00Z), with the rules of `SEAT-P3-LEAN-L-proofs-U8.md`. No git, no web. Scratch: `<scratchpad>/L-ADD-proofs/`. Lean-process discipline: `tools/waitlean.sh` (pgrep -x on lean / lake / lean4export / comparator).*

- **frozen check** 2026-10-30T13:27:44Z — `shasum -a 256 G5/Census/Challenge.lean` = `ee958447349e411d839a595dd2057af8d284daedcb410f4a71a4eca3d2c2b76c` — equals `statement_sha256` (FROZEN). Proceeding.
- **PRELUDE-RULE U11:** Solution imports `Mathlib`, `G5.Ring.Solution` and `G5.Ladder.Solution` (both PROVED) — not `G5.Census.Challenge`, no Challenge prelude; it restates nothing (U11 defines nothing); the three statements are byte for byte the Challenge's, docstrings included, in order (checked by `<scratchpad>/L-ADD-proofs/assemble.py`: each docstring-plus-statement block up to `:= by` is a byte substring of both files); helpers private, `g5_u11_aux_*` (U5's real-value ring map and its order lemmas, renamed, plus a strict-order lemma). Lines ≤ 100 code points (max 97).
- **wait** before B1: `tools/waitlean.sh` 2026-10-30T13:30:48Z — clear at the first poll.
- **B1** 2026-10-30T13:30:48Z — `lake build G5.Census.Solution`: exit **0**, wall 39 s (module 35 s), `Build completed successfully (8708 jobs)`. First error: none. One warning: `push_neg` deprecated (l. 131).
- **wait** before B2: clear at the first poll, 2026-10-30T13:31:41Z.
- **B2** 2026-10-30T13:31:41Z (the `push_neg` line replaced by `rw [not_le]`) — `lake build G5.Census.Solution`: exit **0**, wall 39 s (module 35 s), `Build completed successfully (8708 jobs)`. First error: none. No warning.
- **axioms** 2026-10-30T13:32:20Z (wait clear at the first poll) — `lake env lean <scratchpad>/L-ADD-proofs/U11/axioms.lean`:
  ```
  'G5.g5_u11_census_a' depends on axioms: [propext, Classical.choice, Quot.sound]
  'G5.g5_u11_census_b' depends on axioms: [propext, Classical.choice, Quot.sound]
  'G5.g5_u11_census_b_wit' depends on axioms: [propext, Classical.choice, Quot.sound]
  ```
  No `sorryAx`.
- **comparator** 2026-10-30T13:33:01Z → 13:34:26Z (wait clear at the first poll) — `bash tools/comparator.sh G5/Census`: exit **0**, wall 85 s. Last lines:
  ```
  Build completed successfully (8708 jobs).
  Exporting #[G5.g5_u11_census_a, G5.g5_u11_census_b, G5.g5_u11_census_b_wit, propext, Quot.sound, Classical.choice, …] from G5.Census.Solution
  Running Lean default kernel on solution.
  Lean default kernel accepts the solution
  Your solution is okay!
  ```
  The landrun in use is the macOS shim (NOT sandboxed), as its own warning line says.
- `Solution.lean` sha256 `45c8c0cb60525b4fa23bcd195eb97be8550ce9ec7f6210e353f631bd65e78248`, 187 lines. `Challenge.lean` still `ee958447…c76c`.

## Rows (proofs phase)
| row | theorem | status | proof |
|---|---|---|---|
| G5-LADc′a | `G5.g5_u11_census_a` | PROVED | by contradiction (`K < k`); `t < (K + 2)φ` read in ℝ; `k ∈ {1, 2}` forces `K = 0`, then U5's `g5_u5_lad_a_one` (`2φ ≤ t`) or `g5_u5_lad_a_two` (`3 + φ ≤ t`, with `φ < 2`); `k ≥ 3`: `g5_u5_lad_a_ge3` (`(k + 1)φ ≤ t`) and `K + 2 ≤ k + 1` |
| G5-LADc′b | `G5.g5_u11_census_b` | PROVED | `k ≥ 3` excluded by `g5_u5_lad_a_ge3` (`4φ ≤ t < 3φ`), so `k = 2`; the sixteen words `[a, b]` decided (`decide` on `hc → t < 3φ → t = 3 + φ`), then `g5_u5_lad_b_two` gives the rotation of `(1, 4)` |
| G5-LADc′b | `G5.g5_u11_census_b_wit` | PROVED | `decide` |

No `STATEMENT-CHANGE-NEEDED`. `Challenge.lean`, `comparator.json`, `formalization.yaml`, `G5.lean` untouched; no git run. Scratch: `<scratchpad>/L-ADD-proofs/` (assemble.py, embed_template.lean, waits.log, U11/{header,helpers,g5_u11_*}.lean, U11/B1.log, U11/B2.log, U11/axioms.lean, U11/axioms.txt, U11/cmp.log).
Closed: 2026-10-30T13:34:44Z.
