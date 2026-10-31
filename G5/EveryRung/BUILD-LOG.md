# BUILD-LOG — unit U18 (`G5/EveryRung`), seat L-ADD4, PHASE statements

*Seat L-ADD4 opened 2026-10-31T11:36:46Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-L-statements-ADD4.md` (BRIEF READY 2026-10-31T11:36:14Z), with every rule of `SEAT-P4-LEAN-L-statements-ADD3.md` and through it `SEAT-P4-LEAN-L-statements-ADD2.md`, `SEAT-P4-LEAN-L-statements-ADD.md`, `SEAT-P3-LEAN-L-statements-U8.md`. One seat, three units (U16, U17, U18), built serially U16 → U17 → U18. No git, no web. Scratch: `<scratchpad>/L-ADD4/`. Lean-process discipline: `pgrep -x` on lean / lake / lean4export / comparator before every lake command, then `tools/waitlean.sh` (15 s per wait, logged to `<scratchpad>/L-ADD4/waits.log`); never `pgrep -f`.*

- **source** STATEMENTS.md at 2026-10-31T11:37:41Z: `shasum -a 256` = `5f2f0ed820a3acf6e2be57f5f11fe12a0c0c3010e74a0ae89ef33eec8783bdf3`, `wc -c` = 36526 — the edition the brief names (the fourth extending edition, §7 appended 11:26:17Z); `head -c 31612` = `9ebf30048d9d246295226f9f8aa7ac86da0d72956e1c1d6e0c45d4eda57c79b3` (the specs' edition), `head -c 30598` = `4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f`, `head -c 25981` = `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47`, `head -c 21568` = `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` — the four extensions hold.
- **dependencies** at 2026-10-31T11:38:29Z: `shasum -a 256` of each imported frozen `Challenge.lean` equals its `formalization.yaml` `statement_sha256` (recorded under `depends_on`).
- first artefact: this file, 2026-10-31T11:38:57Z.
- **specs/probe** 2026-10-31T11:38:17Z — `<scratchpad>/L-ADD4/sec5.py`: each of `G5-RUNGa.md`, `G5-RUNGb.md`, `G5-RUNGc.md` carries TWO §5 Lean blocks — the unit's two definitions (`fibZ`, `lucasZ`, one block, the same bytes in all three specs, "carried in each of U18's three specs") and its theorem; every block is a byte substring of M's probe `probe-U18.lean` (sha256 re-read `677dc138…`), occurring once. The raw nine-block join is not the probe body (the definition block thrice); taken once, in the probe's order — the definition block, then `g5_u18_rung_a`, `g5_u18_rung_b`, `g5_u18_rung_c` — the four blocks joined by one newline equal the probe's text between `namespace G5` and `end G5`, byte for byte (asserted in `assemble.py`).
- **assemble** 2026-10-31T11:39:26Z — `<scratchpad>/L-ADD4/assemble.py` writes `Challenge.lean` = the probe's imports, a module doc (unit, rows, the edition 5f2f0ed8… · 36526 B with the four extension clauses 9ebf3004… · 31612, 4a53d9ba… · 30598, 1fb5b03e… · 25981, a84cecdd… · 21568, the two definitions, the frozen imports), then the probe from `open G5 ZPhi` to `end G5` unchanged. Checks: each distinct §5 block occurs exactly once; every line ≤ 100 code points (longest 92); none of the lane's barred words; no `axiom` / `native_decide` / `set_option` / `admit`; 2 definitions, 3 theorems, 3 `:= by sorry`.
- **wait** before B1 (after U17's B1 had landed): `pgrep -x` lean / lake / lean4export / comparator at 2026-10-31T11:40:59Z — all four empty; `tools/waitlean.sh` — clear at the first poll, no wait.
- **B1** 2026-10-31T11:40:59Z — `lake build G5.EveryRung.Challenge`: exit **0**, wall 24 s (the module 21 s), `Build completed successfully (8713 jobs)`. First error: none. Warnings in this module: 3 × `declaration uses 'sorry'` (l. 54 `g5_u18_rung_a`, l. 62 `g5_u18_rung_b`, l. 70 `g5_u18_rung_c`) and nothing else; no linter line; the two definitions elaborate with no warning (structural recursion accepted). The 35 upstream `sorry` warnings of U1 (5), U7 (6), U2 (9), U6 (6), U8 (4), U3 (4), U10 (1) were replayed (U10's own imports); no non-`sorry` warning anywhere in the log. Log: `<scratchpad>/L-ADD4/B1-U18.log`.
- `Challenge.lean` sha256 `5bccdfeb26a4a34702a9ecbcb2b7f2e9cd3b54e8cecb33b0d27aaa7876cb2a21`, 74 lines, longest line 92 code points; recorded in `formalization.yaml` as `statement_sha256_draft`. `depends_on` (re-read 11:42:14Z, each equal to its `statement_sha256`): U1 `863127f8…948c` · U7 `689c36e6…10ae` · U10 `34608245…b288`. STATEMENTS.md still `5f2f0ed8…bdf3` at 11:42:14Z.

## Rows
| row | declarations | status |
|---|---|---|
| G5-RUNGa | `G5.fibZ`, `G5.lucasZ` (the two definitions), `G5.g5_u18_rung_a` | STATED |
| G5-RUNGb | `G5.g5_u18_rung_b` | STATED |
| G5-RUNGc | `G5.g5_u18_rung_c` (V₁ KEEP) | STATED |

## Departures from the specs' text (none in a signature)
1. Each distinct §5 block (the two definitions with their docstrings, and each theorem with its docstring carrying the row id, the record's sentence, the locus and the prefix `9ebf3004`) is carried whole and once; the probe's text from `open G5 ZPhi` to `end G5` is carried unchanged; a module doc was added after the imports.
2. No `Solution.lean`; `G5.lean` untouched; no git run. No `STATEMENT-CHANGE-NEEDED`.
3. Scratch: `<scratchpad>/L-ADD4/` (sec5.py, assemble.py, records.py, run.sh, runs.log, B1-U18.log).

Closed: 2026-10-31T11:43:14Z.

# BUILD-LOG — unit U18 (`G5/EveryRung`), seat L-ADD4-proofs, PHASE proofs

*Seat opened 2026-10-31T11:55:14Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-L-proofs-ADD4.md` (READY 2026-10-31T11:54:12Z), with every rule of `SEAT-P4-LEAN-L-proofs-ADD3.md`, `SEAT-P4-LEAN-L-proofs-ADD2.md`, `SEAT-P4-LEAN-L-proofs-ADD.md`, `SEAT-P3-LEAN-L-proofs-U8.md`. One seat, three units (U16, U17, U18), built serially. No git, no web. Scratch: `<scratchpad>/L-ADD4-proofs/`. Lean-process discipline: `pgrep -x` on lean / lake / lean4export / comparator before every lake command; `tools/waitlean.sh`; never `pgrep -f`.*

- **frozen check** 2026-10-31T11:55:14Z: `shasum -a 256 G5/EveryRung/Challenge.lean` = `5bccdfeb26a4a34702a9ecbcb2b7f2e9cd3b54e8cecb33b0d27aaa7876cb2a21` — equals `formalization.yaml` `statement_sha256`. Proceed.
- **PRELUDE-RULE U18: Solution imports `Mathlib`, `G5.Ring.Solution`, `G5.Group.Solution`, `G5.Containment.Solution`** — never its own Challenge, no Challenge prelude; restates the unit's TWO definitions `fibZ` and `lucasZ` byte for byte (docstrings included, at the Challenge's position, before the helpers and the theorems; `check.py` finds each definition block exactly once). No upstream private helper needed restating; the helpers are new and small (`g5_u18_aux_*`).
- **Solution written** 2026-10-31T12:05:05Z — assembled by script (`<scratchpad>/L-ADD4-proofs/assemble.py`, `spec18.py`) from the Challenge's text from `open G5 ZPhi` to `end G5`: helpers inserted after the two definitions (before the RUNGa docstring), each `:= by sorry` replaced by its proof; the definitions and the three statements otherwise untouched.
- **wait** before B1: `pgrep -x` lean / lake / lean4export / comparator at 2026-10-31T12:05:10Z, then `tools/waitlean.sh` — clear, no wait (every poll of this unit clear at the first look; `<scratchpad>/L-ADD4-proofs/waits.log`).
- **B1** 2026-10-31T12:05:10Z — `lake build G5.EveryRung.Solution`: exit **1**, wall 33 s. First error: `G5/EveryRung/Solution.lean:62:15: omega could not prove the goal` — in `g5_u18_aux_lucas_pos`, `omega` read `lucasZ (n + 1 + 1)` and `lucasZ (n + 2)` as two atoms. Also four unused-simp-argument lines (`neg_x`, `neg_y` in the un-negated branches of RUNGa/RUNGb) and two `unnecessarySeqFocus` lines (`ext <;> simp … <;> ring`, one goal left by `simp`). Log: `<scratchpad>/L-ADD4-proofs/B1-U18.log`.
- **fix** — the first conjunct by `(1 ≤ 3).trans ih.2` (the two atoms are definitionally equal); `dsimp only` in the un-negated branches; `ring` on its own line after `ext <;> simp …`.
- **B2** 2026-10-31T12:06:16Z (poll clear) — `lake build G5.EveryRung.Solution`: exit **0**, wall 28 s (the module 24 s), `Build completed successfully (8713 jobs)`. First error: none. Warnings in this module: none; zero `sorry`. Log: `B2-U18.log`.
- **statement check** 2026-10-31T12:06Z (`check.py`): the two definition blocks and each of the three theorem blocks (docstring + text up to `:=`) occur exactly once in `Solution.lean`, in the Challenge's order; no `import` of a Challenge; longest line 98 code points; no `sorry` / `admit` / `native_decide` / `axiom` / `set_option`; none of the lane's barred words.
- **axioms** 2026-10-31T12:06:54Z (poll clear) — `lake env lean <scratchpad>/L-ADD4-proofs/ax-U18.lean` (exit 0, 25 s):
  - `G5.g5_u18_rung_a` depends on axioms: [propext, Classical.choice, Quot.sound]
  - `G5.g5_u18_rung_b` depends on axioms: [propext, Classical.choice, Quot.sound]
  - `G5.g5_u18_rung_c` depends on axioms: [propext, Classical.choice, Quot.sound]
- **comparator** 2026-10-31T12:07:19Z (poll clear) — `bash tools/comparator.sh G5/EveryRung`: exit **0**, wall 65 s; landrun = the macOS shim (NOT sandboxed). Last lines: `Running Lean default kernel on solution.` · `Lean default kernel accepts the solution` · `Your solution is okay!`. Log: `CMP-U18.log`.
- `Solution.lean` sha256 `58758765b32e19568dce4d670d5bdde14ea033fcee236a5a77ec04cb3de8dd6a`, 213 lines. `Challenge.lean` re-read 2026-10-31T12:08:24Z: still `5bccdfeb…2a21`.
- **The wall's caution (a possible genuine wall at U18):** none met. The attempt log is B1 → B2 above: one `omega` atom slip and linter lines, no row resisted, no statement change needed. The one identity worked out on paper first (the brief's NOTE): the invariant proved is not a common recursion but the two closed forms of Lemma R.1 separately — `φ^(m+1) = ⟨F_m, F_{m+1}⟩` and `⟨−1, 1⟩^(m+1) = ⟨(−1)^(m+1) F_{m+2}, (−1)^m F_{m+1}⟩` (one-step inductions, the step `⟨a, b⟩ · ⟨−1, 1⟩ = ⟨b − a, a⟩`) — summed; at n = 1..4 they give ⟨−1, 2⟩, ⟨3, 0⟩, ⟨−2, 4⟩, ⟨7, 0⟩, the record's table.

## Rows (proofs)
| row | declaration | status | how |
|---|---|---|---|
| G5-RUNGa | `fibZ`, `lucasZ` (restated) · `g5_u18_rung_a` | PROVED | `n = m + 2` from `Even n`, `1 ≤ n`; `L_{m+2} ≥ 3` by induction; U10's `g5_u10_cor` read as a shape on the trace's coordinates (`g5_u18_aux_shape`: `y = 0 ∧ x ∈ {2, −2, 0}`, `y = ±1`, `x ≥ 0 ∧ y ≥ 1`, or `x ≤ 0 ∧ y ≤ −1`); `tr = ⟨±L, 0⟩` compared coordinatewise (`congrArg ZPhi.x/.y`), `omega` |
| G5-RUNGb | `g5_u18_rung_b` | PROVED | `n = m + 1` from `Odd n`; `F_{m+1} ≥ 1` by induction; the same shape: `⟨−F, 2F⟩` needs `x = −F ≥ 0` or `y = 2F ∈ {0, ±1}`, `⟨F, −2F⟩` needs `x = F ≤ 0` or `y ≥ 1`; `omega` |
| G5-RUNGc | `g5_u18_rung_c` | PROVED | `Ring.inverse φ = ⟨−1, 1⟩` by `Ring.inverse_unit` at the unit `⟨φ, ⟨−1, 1⟩⟩` (`decide` on the two products); the two closed forms above and `L_{m+1} = F_m + F_{m+2}` (two-step induction); `Nat.even_or_odd (m + 1)` with `Even.neg_one_pow` / `Odd.neg_one_pow` rewrites `φⁿ + φ⁻ⁿ` to `⟨L_n, 0⟩` or `⟨−F_n, 2F_n⟩`, then RUNGa / RUNGb |

No `STATEMENT-CHANGE-NEEDED`. No git run; `G5.lean` untouched. Scratch: `<scratchpad>/L-ADD4-proofs/` (assemble.py, spec18.py, check.py, run.sh, ax-U18.lean, B1/B2-U18.log, AX-U18.log, CMP-U18.log, waits.log, runs.log).

Closed (U18 proofs): 2026-10-31T12:08Z.
