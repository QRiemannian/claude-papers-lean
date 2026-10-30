# BUILD-LOG — unit U14 (`G5/EvenKRemark`), seat L-ADD3, PHASE statements

*Seat L-ADD3 opened 2026-10-30T21:54:24Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-L-statements-ADD3.md` (BRIEF DRAFTED 2026-10-30T21:44:48Z; READY 21:53:55Z), with every rule of `SEAT-P4-LEAN-L-statements-ADD2.md` and `SEAT-P3-LEAN-L-statements-U8.md`. One seat, two units (U14, U15), built serially. No git, no web. Scratch: `<scratchpad>/L-ADD3/`. Lean-process discipline: `tools/waitlean.sh` (process NAME match, `pgrep -x` on lean / lake / lean4export / comparator; 15 s per wait), never `pgrep -f`.*

- **source** STATEMENTS.md at 2026-10-30T21:55:17Z: `shasum -a 256` = `9ebf30048d9d246295226f9f8aa7ac86da0d72956e1c1d6e0c45d4eda57c79b3`, `wc -c` = 31612 — the edition the brief names (the third extending edition); `head -c 30598` = `4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f` (the specs' edition), `head -c 25981` = `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47`, `head -c 21568` = `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` — the three extensions hold.
- **dependencies** at 2026-10-30T21:55:17Z: `shasum -a 256` of each imported frozen `Challenge.lean` equals its `formalization.yaml` `statement_sha256` (recorded under `depends_on`).
- first artefact: this file, 2026-10-30T21:55:49Z.
- **specs/probe** 2026-10-30T21:55:58Z — `<scratchpad>/L-ADD3/sec5.py`: the §5 Lean block of each of `G5-EVKRa.md`, `G5-EVKRb.md`, `G5-EVKRc.md` (one block each, every one V1-GREEN 21:50:38Z, all five theorems kept) is a byte substring of M's probe `probe-U14.lean` (sha256 re-read `aa833b71…`), occurring once, and the blocks joined by one newline equal the probe's text between `namespace G5` and `end G5`, byte for byte.
- **assemble** 2026-10-30T21:56:19Z — `<scratchpad>/L-ADD3/assemble.py` writes `Challenge.lean` = the probe's imports, a module doc (unit, rows, the edition 9ebf3004… · 31612 B with the three extension clauses 4a53d9ba… · 30598, 1fb5b03e… · 25981, a84cecdd… · 21568, the frozen imports), then the probe from `open G5 ZPhi` to `end G5` unchanged. Checks: each §5 block occurs exactly once in the output; every line ≤ 100 code points (longest 92); none of the lane's barred words; no `axiom` / `native_decide` / `set_option` / `admit`; 0 definitions, 5 theorems, 5 `:= by sorry`.
- **wait** before B1: `pgrep -x` lean / lake / lean4export / comparator at 2026-10-30T21:56:35Z, then `tools/waitlean.sh` at 21:56:35Z and again inside the build's own command at 21:56:43Z — clear at the first poll each time, no wait (no waits log created).
- **B1** 2026-10-30T21:56:43Z — `lake build G5.EvenKRemark.Challenge`: exit **0**, wall 32 s (the module 26 s), `Build completed successfully (8709 jobs)`. First error: none. Warnings in this module: 5 × `declaration uses 'sorry'` (l. 35 `g5_u14_evkr_mech`, l. 43 `g5_u14_evkr_one`, l. 51 `g5_u14_evkr_ord`, l. 59 `g5_u14_evkr_b`, l. 67 `g5_u14_evkr_rot`) and nothing else; no linter line (the bodies are `sorry`). The 16 upstream `sorry` warnings of U1 (5), U2 (9), U12 (2) were replayed. Log: `<scratchpad>/L-ADD3/B1-U14.log`.
- `Challenge.lean` sha256 `398c41e2254cecad8a0291cbd766b202219ffc56f6ced92822a859007c1c13cd`, 70 lines, longest line 92 code points; recorded in `formalization.yaml` as `statement_sha256_draft`. `depends_on` (re-read 21:58:10Z, each equal to its `statement_sha256`): U1 `863127f8…948c` · U2 `c342ab92…c78c` · U12 `321dfbf5…7565`. STATEMENTS.md still `9ebf3004…79b3` at 21:58:10Z.

## Rows
| row | declarations | status |
|---|---|---|
| G5-EVKRa | `G5.g5_u14_evkr_mech` | STATED |
| G5-EVKRb | `G5.g5_u14_evkr_one`, `G5.g5_u14_evkr_ord`, `G5.g5_u14_evkr_b` (kept, V₁-signed) | STATED |
| G5-EVKRc | `G5.g5_u14_evkr_rot` (no `IsWord`, the widening V₁-accepted) | STATED |

## Departures from the specs' text (none in a signature)
1. Each §5 block (each theorem with its docstring carrying the row id, the record's sentence, the locus and the prefix `4a53d9ba`) is carried whole; the probe's text from `open G5 ZPhi` to `end G5` is carried unchanged; a module doc was added after the imports.
2. No `Solution.lean`; `G5.lean` untouched; no git run. No `STATEMENT-CHANGE-NEEDED`.
3. Scratch: `<scratchpad>/L-ADD3/` (sec5.py, assemble.py, B1-U14.log).

Closed: 2026-10-30T21:59Z.

# BUILD-LOG — unit U14 (`G5/EvenKRemark`), seat L-ADD3-proofs, PHASE proofs

*Seat opened 2026-10-30T22:15:42Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P4-LEAN-L-proofs-ADD3.md` (READY 2026-10-30T22:14:44Z), with every rule of `SEAT-P4-LEAN-L-proofs-ADD2.md`, `SEAT-P4-LEAN-L-proofs-ADD.md`, `SEAT-P3-LEAN-L-proofs-U8.md`. One seat, two units (U14, U15), built serially. No git, no web. Scratch: `<scratchpad>/L-ADD3-proofs/`. Lean-process discipline: `pgrep -x` on lean / lake / lean4export / comparator before every lake command; `tools/waitlean.sh`; never `pgrep -f`.*

- **frozen check** 2026-10-30T22:15:42Z: `shasum -a 256 G5/EvenKRemark/Challenge.lean` = `398c41e2254cecad8a0291cbd766b202219ffc56f6ced92822a859007c1c13cd` — equals `formalization.yaml` `statement_sha256`. Proceed.
- **PRELUDE-RULE U14: Solution imports `Mathlib`, `G5.Ring.Solution`, `G5.ModTwo.Solution`, `G5.EvenK.Solution`** — never its own Challenge, no Challenge prelude; restates nothing (the unit defines nothing; `A` comes from U12's proved Solution). U12's private mechanism (`g5_u12_aux_map`, `_red2M_W`, `_f`, `_step`, `_pair`) restated as `g5_u14_aux_*` from U12's Solution text, proofs unchanged up to the prefix.
- **Solution written** 2026-10-30T22:16:33Z — assembled by script from the Challenge's text from `open G5 ZPhi` to `end G5`: helpers inserted after `namespace G5`, each `:= by sorry` replaced by its proof; the five statements otherwise untouched.
- **wait** before B1: `pgrep -x` lean / lake / lean4export / comparator at 2026-10-30T22:16:45Z, then `tools/waitlean.sh` — clear at the first poll, no wait (`<scratchpad>/L-ADD3-proofs/waits.log`).
- **B1** 2026-10-30T22:16:45Z — `lake build G5.EvenKRemark.Solution`: exit **0**, wall 33 s (the module 26 s), `Build completed successfully (8709 jobs)`. First error: none. Warnings in this module: none (zero `sorry`). Replayed upstream: U12 Solution's expected unused-variable line for `hk` (G5/EvenK/Solution.lean:114, logged at U12). Log: `<scratchpad>/L-ADD3-proofs/B1-U14.log`.
- **statement check** 2026-10-30T22:17Z (`<scratchpad>/L-ADD3-proofs/check.py`): each of the five Challenge declaration blocks (docstring + statement up to `:= by`) occurs exactly once in `Solution.lean`, in the Challenge's order; no `import` of a Challenge; longest line 96 code points; no `sorry` / `admit` / `native_decide` / `axiom` / `set_option`; none of the lane's barred words.
- **wait** before the axioms print: polls at 2026-10-30T22:17:38Z — clear, no wait.
- **axioms** 2026-10-30T22:17:38Z — `lake env lean <scratchpad>/L-ADD3-proofs/ax-U14.lean` (exit 0, 28 s):
  - `G5.g5_u14_evkr_mech` depends on axioms: [propext, Classical.choice, Quot.sound]
  - `G5.g5_u14_evkr_one` depends on axioms: [propext, Classical.choice, Quot.sound]
  - `G5.g5_u14_evkr_ord` depends on axioms: [propext, Classical.choice, Quot.sound]
  - `G5.g5_u14_evkr_b` depends on axioms: [propext, Classical.choice, Quot.sound]
  - `G5.g5_u14_evkr_rot` depends on axioms: [propext, Classical.choice, Quot.sound]
- **wait** before the comparator: polls at 2026-10-30T22:18:11Z — clear, no wait.
- **comparator** 2026-10-30T22:18:11Z — `bash tools/comparator.sh G5/EvenKRemark`: exit **0**, wall 67 s; landrun = the macOS shim (NOT sandboxed, as the script's first line says). Last lines: `Running Lean default kernel on solution.` · `Lean default kernel accepts the solution` · `Your solution is okay!`. Log: `<scratchpad>/L-ADD3-proofs/CMP-U14.log`.
- `Solution.lean` sha256 `bfc799fb909d1155cd009c9e5272aefd5345d874af77daa895e40ff2f1a852c4`, 158 lines. `Challenge.lean` re-read 2026-10-30T22:19:23Z: still `398c41e2…13cd`.

## Rows (proofs)
| row | theorem | status | how |
|---|---|---|---|
| G5-EVKRa | `g5_u14_evkr_mech` | PROVED | `g5_u2_red_hom` → reduced word = product of reduced syllables (`_red2M_W`); pairing two syllables at a time in D̄₅ (`_step`, kernel `decide`) gives `R̄^(A w mod 5)` at even length (`_pair`) |
| G5-EVKRb | `g5_u14_evkr_one` | PROVED | `5 ∣ A ↔ (A : ZMod 5) = 0` (`ZMod.intCast_zmod_eq_zero_iff_dvd`); the mechanism; `R̄^j = 1 ↔ j = 0` over `ZMod 5` (kernel `decide`) |
| G5-EVKRb | `g5_u14_evkr_ord` | PROVED | the mechanism; `orderOf_eq_iff` with the table `(R̄^j)^5 = 1 ∧ ∀ m < 5, 0 < m → (R̄^j)^m ≠ 1` for `j ≠ 0` (kernel `decide`) |
| G5-EVKRb | `g5_u14_evkr_b` | PROVED | case on `5 ∣ A w`: yes → `red2M (W w) = 1`, `orderOf_one`, 1 ≠ 5; no → order is 5 by `evkr_ord` |
| G5-EVKRc | `g5_u14_evkr_rot` | PROVED | closed form `A (l ++ [a]) = A l + (−1)^|l| a` by induction on `l`; `|l|` odd from `hk`, `Odd.neg_one_pow`, `ring` |

No `STATEMENT-CHANGE-NEEDED`. No git run; `G5.lean` untouched. Scratch: `<scratchpad>/L-ADD3-proofs/` (run.sh, check.py, ax-U14.lean, B1-U14.log, AX-U14.log, CMP-U14.log, waits.log, runs.log).

Closed (U14 proofs): 2026-10-30T22:19Z.
