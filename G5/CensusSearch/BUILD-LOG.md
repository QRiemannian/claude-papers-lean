# BUILD-LOG — unit U15 (`G5/CensusSearch`), seat L-ADD3, PHASE statements

*Seat L-ADD3 opened 2026-10-30T21:54:24Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-L-statements-ADD3.md` (BRIEF DRAFTED 2026-10-30T21:44:48Z; READY 21:53:55Z), with every rule of `SEAT-P4-LEAN-L-statements-ADD2.md` and `SEAT-P3-LEAN-L-statements-U8.md`. One seat, two units (U14, U15), built serially. No git, no web. Scratch: `<scratchpad>/L-ADD3/`. Lean-process discipline: `tools/waitlean.sh` (process NAME match, `pgrep -x` on lean / lake / lean4export / comparator; 15 s per wait), never `pgrep -f`.*

- **source** STATEMENTS.md at 2026-10-30T21:55:17Z: `shasum -a 256` = `9ebf30048d9d246295226f9f8aa7ac86da0d72956e1c1d6e0c45d4eda57c79b3`, `wc -c` = 31612 — the edition the brief names (the third extending edition); `head -c 30598` = `4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f` (the specs' edition), `head -c 25981` = `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47`, `head -c 21568` = `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` — the three extensions hold.
- **dependencies** at 2026-10-30T21:55:17Z: `shasum -a 256` of each imported frozen `Challenge.lean` equals its `formalization.yaml` `statement_sha256` (recorded under `depends_on`).
- first artefact: this file, 2026-10-30T21:55:49Z.
- **specs/probe** 2026-10-30T21:55:58Z — `<scratchpad>/L-ADD3/sec5.py`: the §5 Lean block of each of `G5-SRCHa.md`, `G5-SRCHb.md` (the definition `Visited` and `g5_u15_srch_visit`), `G5-SRCHc.md` (one block each, every one V1-GREEN 21:50:45Z, all four theorems and the definition kept, `hj` kept) is a byte substring of M's probe `probe-U15.lean` (sha256 re-read `e2bca919…`), occurring once, and the blocks joined by one newline equal the probe's text between `namespace G5` and `end G5`, byte for byte.
- **assemble** 2026-10-30T21:56:19Z — `<scratchpad>/L-ADD3/assemble.py` writes `Challenge.lean` = the probe's imports, a module doc (unit, rows, the edition 9ebf3004… · 31612 B with the three extension clauses 4a53d9ba… · 30598, 1fb5b03e… · 25981, a84cecdd… · 21568, the frozen imports), then the probe from `open G5 ZPhi` to `end G5` unchanged. Checks: each §5 block occurs exactly once in the output; every line ≤ 100 code points (longest 92); none of the lane's barred words; no `axiom` / `native_decide` / `set_option` / `admit`; 1 definition, 4 theorems, 4 `:= by sorry`.
- **wait** before B2 (after B1 had landed at 21:57:15Z): `pgrep -x` lean / lake / lean4export / comparator at 2026-10-30T21:57:27Z, then `tools/waitlean.sh` inside the build's own command at 21:57:27Z — clear at the first poll, no wait (no waits log created).
- **B2** 2026-10-30T21:57:27Z — `lake build G5.CensusSearch.Challenge`: exit **0**, wall 32 s (the module 28 s), `Build completed successfully (8710 jobs)`. First error: none. Warnings in this module: 4 × `declaration uses 'sorry'` (l. 37 `g5_u15_srch_cap`, l. 58 `g5_u15_srch_visit`, l. 68 `g5_u15_srch_const`, l. 77 `g5_u15_srch_inf`) and nothing else; no linter line for `hj` (the bodies are `sorry`). The 22 upstream `sorry` warnings of U1 (5), U5 (11), U11 (3), U13 (3) were replayed. Log: `<scratchpad>/L-ADD3/B2-U15.log`.
- `Challenge.lean` sha256 `c17de52108773b18ccb7f8991ea27d20e8343c0c8b034493573677a8c1d3d81f`, 81 lines, longest line 92 code points; recorded in `formalization.yaml` as `statement_sha256_draft`. `depends_on` (re-read 21:58:10Z, each equal to its `statement_sha256`): U1 `863127f8…948c` · U5 `ea6b4aed…d11a` · U11 `ee958447…b76c` · U13 `d10844cb…067e`. STATEMENTS.md still `9ebf3004…79b3` at 21:58:10Z.

## Rows
| row | declarations | status |
|---|---|---|
| G5-SRCHa | `G5.g5_u15_srch_cap` | STATED |
| G5-SRCHb | `G5.Visited` (the one definition), `G5.g5_u15_srch_visit` | STATED |
| G5-SRCHc | `G5.g5_u15_srch_const` (`hj` kept, V₁-signed), `G5.g5_u15_srch_inf` | STATED |

## Departures from the specs' text (none in a signature)
1. Each §5 block (the definition `Visited` with its docstring, and each theorem with its docstring carrying the row id, the record's sentence, the locus and the prefix `4a53d9ba`) is carried whole; the probe's text from `open G5 ZPhi` to `end G5` is carried unchanged; a module doc was added after the imports.
2. No `Solution.lean`; `G5.lean` untouched; no git run. No `STATEMENT-CHANGE-NEEDED`.
3. Scratch: `<scratchpad>/L-ADD3/` (sec5.py, assemble.py, B2-U15.log).

Closed: 2026-10-30T21:59Z.

# BUILD-LOG — unit U15 (`G5/CensusSearch`), seat L-ADD3-proofs, PHASE proofs

*Seat opened 2026-10-30T22:15:42Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-L-proofs-ADD3.md` (READY 2026-10-30T22:14:44Z), with every rule of `SEAT-P4-LEAN-L-proofs-ADD2.md`, `SEAT-P4-LEAN-L-proofs-ADD.md`, `SEAT-P3-LEAN-L-proofs-U8.md`. One seat, two units (U14, U15), built serially. No git, no web. Scratch: `<scratchpad>/L-ADD3-proofs/`. Lean-process discipline: `pgrep -x` on lean / lake / lean4export / comparator before every lake command; `tools/waitlean.sh`; never `pgrep -f`.*

- **frozen check** 2026-10-30T22:15:42Z: `shasum -a 256 G5/CensusSearch/Challenge.lean` = `c17de52108773b18ccb7f8991ea27d20e8343c0c8b034493573677a8c1d3d81f` — equals `formalization.yaml` `statement_sha256`. Proceed.
- **PRELUDE-RULE U15: Solution imports `Mathlib`, `G5.Ring.Solution`, `G5.Ladder.Solution`, `G5.Census.Solution`, `G5.CensusCap.Solution`** — never its own Challenge, no Challenge prelude; restates the unit's ONE definition `Visited` byte for byte (with its docstring, at the Challenge's position). U13's private real-order device (`g5_u13_aux_v`, `_v_apply`, `_v_phi`, `_ab5`, `_le_iff`, `_v_inj`, `_lt`, `_lt_of`) restated as `g5_u15_aux_*` from U13's Solution text, proofs unchanged up to the prefix; U5's private block-product lemmas and rotation argument restated likewise. `G5.WordLevel.Solution` not needed.
- **Solution written** 2026-10-30T22:21:22Z — assembled by script from the Challenge's text from `open G5 ZPhi` to `end G5`: helpers inserted after `namespace G5`, each `:= by sorry` replaced by its proof; the definition and the four statements otherwise untouched.
- **wait** before B1: `pgrep -x` lean / lake / lean4export / comparator at 2026-10-30T22:21:28Z, then `tools/waitlean.sh` — clear, no wait (every poll of this unit clear at the first look; `<scratchpad>/L-ADD3-proofs/waits.log`).
- **B1** 2026-10-30T22:21:28Z — `lake build G5.CensusSearch.Solution`: exit **1**, wall 29 s. First error: `G5/CensusSearch/Solution.lean:170:9: unsolved goals case y` — `ext i k` on the matrix equation descended into `ZPhi`'s own `@[ext]` and split the x/y components, so `fin_cases` reached only the first. Also two unused-simp-argument lines (`Matrix.head_cons`). Log: `<scratchpad>/L-ADD3-proofs/B1-U15.log`.
- **fix** — `refine Matrix.ext fun i k => ?_` in the two unipotent helpers; `Matrix.head_cons` dropped.
- **B2** 2026-10-30T22:22:13Z (polls clear) — exit **0**, wall 23 s; two `unnecessarySeqFocus` linter lines (`simp … <;> ring`). Log: `B2-U15.log`.
- **fix** — `ring` on its own line after the `fin_cases … <;> simp …` chain.
- **B3** 2026-10-30T22:22:47Z (polls clear) — `lake build G5.CensusSearch.Solution`: exit **0**, wall 23 s (the module 20 s), `Build completed successfully (8710 jobs)`. First error: none. Warnings in this module: ONE, the expected unused-variable line for `hj` in `g5_u15_srch_const` (l. 260; the frozen statement keeps `hj`, V₁-signed; the proof holds for every `j`, `1^0 = []` having trace 2 too) — not an error; zero `sorry`. Log: `B3-U15.log`.
- **statement check** 2026-10-30T22:23Z (`check.py`): the definition `Visited` and each of the four theorem blocks (docstring + text up to `:= by`) occur exactly once in `Solution.lean`, in the Challenge's order; no `import` of a Challenge; longest line 97 code points; no `sorry` / `admit` / `native_decide` / `axiom` / `set_option`; none of the lane's barred words.
- **axioms** 2026-10-30T22:23:20Z (polls clear) — `lake env lean <scratchpad>/L-ADD3-proofs/ax-U15.lean` (exit 0, 15 s):
  - `G5.g5_u15_srch_cap` depends on axioms: [propext, Classical.choice, Quot.sound]
  - `G5.g5_u15_srch_visit` depends on axioms: [propext, Classical.choice, Quot.sound]
  - `G5.g5_u15_srch_const` depends on axioms: [propext, Classical.choice, Quot.sound]
  - `G5.g5_u15_srch_inf` depends on axioms: [propext, Classical.choice, Quot.sound]
- **comparator** 2026-10-30T22:23:43Z (polls clear) — `bash tools/comparator.sh G5/CensusSearch`: exit **0**, wall 43 s; landrun = the macOS shim (NOT sandboxed). Last lines: `Running Lean default kernel on solution.` · `Lean default kernel accepts the solution` · `Your solution is okay!`. Log: `CMP-U15.log`.
- `Solution.lean` sha256 `d06966ecb0edb23f9f732c9fdd71c2561e5518d0eb52d5b3b921c2cb08a9021e`, 298 lines. `Challenge.lean` re-read 2026-10-30T22:24:26Z: still `c17de521…d81f`.

## Rows (proofs)
| row | declaration | status | how |
|---|---|---|---|
| G5-SRCHa | `g5_u15_srch_cap` | PROVED | `3φ ≤ X`: `g5_u13_cap_a`; else, in real values, `t ≤ X < 3φ < 4φ`, so U11's `g5_u11_census_a` at `K = 2` gives `k ≤ 2` |
| G5-SRCHb | `Visited` (restated) · `g5_u15_srch_visit` | PROVED | prefix dominance `ntr u ≤ ntr (u ++ s)` by induction on `s`, each step U5's `g5_u5_mono_a` with right factor `[]` (no non-constancy needed — the empty and constant prefixes included); `ntr` rotation-invariant (`Matrix.trace_mul_comm`), rotation keeps length and letters (`List.IsRotated.perm`); the cap of SRCHa carries down since `(|p| + 1)φ ≤ (|w| + 1)φ` |
| G5-SRCHc | `g5_u15_srch_const` | PROVED | `blockProd (1^j) = [[1, jφ], [0, 1]]`, `blockProd (4^j) = [[1, 0], [jφ, 1]]` by induction (entrywise `simp` + `ring`); trace `1 + 1 = 2` |
| G5-SRCHc | `g5_u15_srch_inf` | PROVED | `n ↦ 1^(n+1)` injective (`List.length`); each is a word and every prefix is `1^i`, `i ≥ 1` (`List.eq_replicate_iff`, `IsPrefix.subset`), trace 2 ≤ X; `Set.infinite_of_injective_forall_mem` |

No `STATEMENT-CHANGE-NEEDED`. No git run; `G5.lean` untouched. Scratch: `<scratchpad>/L-ADD3-proofs/` (run.sh, check.py, ax-U15.lean, B1/B2/B3-U15.log, AX-U15.log, CMP-U15.log, waits.log, runs.log).

Closed (U15 proofs): 2026-10-30T22:24Z.
