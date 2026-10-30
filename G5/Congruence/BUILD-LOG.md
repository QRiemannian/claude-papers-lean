# BUILD-LOG — unit U6 (`G5/Congruence`), seat L-U6, PHASE statements

*Seat L-U6 opened 2026-10-30T10:27:07Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-L-statements-U6.md` (BRIEF READY 2026-10-30T10:26:51Z). No git, no web.*

- **source** STATEMENTS.md `shasum -a 256` at 2026-10-30T10:27:31Z: `c6abadff…` (`c6abadffb560da25727255cfab33e290e61685bbb365479af60c0c99670bac36`); its §4 carries the 10:26:51Z V₁-U6 scope note (not a defect) beyond V₁-U6's `51324441`. The specs' headers carry `0b277844`; the errata between touch no U6 statement.
- **assemble** 2026-10-30T10:28:42Z — `<scratchpad>/L-U6/assemble.py` writes `Challenge.lean` from the seven V1-GREEN specs' §5 blocks: imports, module doc, the G5-U6-DEFS block whole at the root (its own `open G5 ZPhi` is the file's one `open`), `namespace G5`, the six theorem blocks less their leading `open G5 ZPhi` line, `end G5`. Checks: the DEFS block and each theorem's docstring+theorem text are byte substrings of `Challenge.lean`; every whole §5 block is a byte substring of M's probe (`b6212752…`); 0 lines over 100 code points; no forbidden word; no `axiom` / `native_decide` / `set_option`.
- **wait** before B1: pgrep at 10:28:51Z found a `lake build G5.Ring.Solution` (pids 37431/37452, another seat's proofs build); the 30 s poller (`L-U6/wait.sh`, which reads only `bin/lean` / `bin/lake` lines, because `pgrep -f "lean"` also matches any command line naming `claude-papers-lean`) found it clear at 10:29:04Z.
- **B1** 2026-10-30T10:29:10Z → 10:29:40Z (pgrep clear) — `lake build G5.Congruence.Challenge`: exit **0**, wall 30 s (the Challenge module took 26 s; U1 replayed), `Build completed successfully (8707 jobs)`. First error: none. Warnings in this module: 6 × `declaration uses 'sorry'` (l. 41, 48, 54, 61, 71, 78, the six theorems) and nothing else. No unused-variable linter warning on `hw`/`hy` appeared; U1's five `sorry` warnings were replayed.
- **inspect** 10:29:47Z → 10:30:06Z (pgrep clear) — a scratch file with `import G5.Congruence.Challenge` and `#check` on the full names, run with `lake env lean`: exit 0. `ZPhi.red4 : ZPhi → ZMod 4 × ZMod 4`, `ZPhi.red3`, `G5.H4 : Finset (ZMod 4 × ZMod 4)` and `G5.g5_u6_m4a` … `G5.g5_u6_m3b` all resolve. `W`, `IsWord` resolve to U1's `G5.*` and `nrm` to `ZPhi.nrm`; the statements print as the specs' §5 do. `#print axioms G5.g5_u6_m4b` gives propext, sorryAx, Classical.choice, Quot.sound, with sorryAx expected in this phase.
- **B2 (final)** 2026-10-30T10:30:43Z → 10:30:46Z (pgrep clear) — `lake build G5.Congruence.Challenge`: exit **0**, wall 3 s (replayed). First error: none. Warnings: the same 6 × `sorry`, plus U1's five replayed, and nothing else.
- `Challenge.lean` sha256 `d576229b23afb62ac8beb64cd32f0ca753d5564ca4839eab90b55cf769aac532`, recorded in `formalization.yaml` as `statement_sha256_draft`. Built against U1 `863127f8…` (U1's `statement_sha256`, V2-signed 10:23:30Z; the file's shasum matched at 10:30:11Z), recorded as `depends_on`. STATEMENTS.md re-read at 10:30:11Z and 10:30:46Z: `e0df0f35…33bf`. The §4 entry added at 10:29:26Z is a coverage decision (a new unit U8 for the group-level legs), and no U6 statement changes. The docstrings carry `c6abadff`, the edition current at open.

## Departures from the specs' text (none in a signature)
1. **The defs sit at the root, the theorems in `namespace G5`.** The DEFS block is carried whole at the root, as the probe places it, so the names are `ZPhi.red4`, `ZPhi.red3` and `G5.H4`; inside `namespace G5` they would have become `G5.ZPhi.red4` and `G5.G5.H4`. Its `open G5 ZPhi` is the file's only `open`. Each theorem block is carried without its leading `open G5 ZPhi` line and blank line, which repeat the open already in effect. The docstring and theorem text is byte-identical to the spec, and every whole §5 block is a byte substring of M's probe.
2. **Locus and prefix go in a plain comment.** Each spec's §5 block already carries a docstring with the row id, and Lean takes one docstring per declaration. To keep the block byte for byte, the source-of-record locus and the STATEMENTS.md prefix `c6abadff` sit in a plain `/- … -/` comment directly above that docstring, and the module doc gives the short forms of the loci (AM, DO, LEDGER, SH-P2-1, PHASE-2-DEFINITIONS).
3. **Not carried:** U1's block (it is imported, not restated) and the probe's module comment. `G5.lean` is untouched; the orchestrator adds the import. There is no `Solution.lean`.
4. **Scratch:** the brief's Common notes name `<scratchpad>/L-U1/`, but the dispatch named `L-U6/`. This seat wrote only `<scratchpad>/L-U6/`: assemble.py, wait.sh, waits.log, B1.log, B2.log, inspect.lean and inspect.txt.

Closed: 2026-10-30T10:31:07Z.

---

# BUILD-LOG — unit U6, seat L-U6, PHASE proofs

*Seat L-U6 (proofs) opened 2026-10-30T10:44:38Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-L-proofs-U6.md` (BRIEF READY 2026-10-30T10:43:48Z). No git, no web. Scratch: `<scratchpad>/L-U6-proofs/`.*

- **freeze check** 2026-10-30T10:45:10Z — `shasum -a 256 G5/Congruence/Challenge.lean`: `d576229b23afb62ac8beb64cd32f0ca753d5564ca4839eab90b55cf769aac532`, the frozen value. Prelude `G5/Ring/Solution.lean`: `0a11790b32f126ecac0f1df2f41e7399a4a9b514a77794ebf08f7878825c0271`.
- **PRELUDE-RULE U6: Solution imports G5.Ring.Solution** (not `G5.Congruence.Challenge`, not `G5.Ring.Challenge`); U6's DEFS block restated byte-identically at the root.
- **plan** 2026-10-30T10:48:05Z — a Python enumeration (`<scratchpad>/L-U6-proofs/gen.py`) of the reductions: mod 4, the words of even length (empty word included) reach 160 matrices, odd length 160, disjoint, union 320; mod 3, both parities reach the same 120. Matrices are coded as base-n numbers (8 digits, Horner order (0,0).x, (0,0).y, (0,1).x, …); the closure and the trace laws are kernel `decide` checks over the code lists; the bridge (`map red_n` of a product is the reduced product; decode∘encode = id) is proved symbolically.
- **waits** (the poller `<scratchpad>/L-U6-proofs/wait.sh` matches executables only — `bin/lean`, `bin/lake`, `lean4export`, `comparator` — never shells whose command line names the repo): 10:53:15Z → 10:54:15Z, 2 waits (another seat's comparator drive, then a `lake`); 10:55:29Z → 10:57:30Z, 4 waits (a `lake build` + `lean`, then another comparator drive); 10:58:44Z → 10:59:14Z, 1 wait (a `lake build` + `lean`); 11:00:14Z and 11:00:49Z clear at the first poll.
- **T1 (scratch probe)** 2026-10-30T10:54:15Z → 10:54:58Z — `lake env lean <scratchpad>/L-U6-proofs/Solution-draft.lean` (the whole draft, all six theorems): exit 1, wall 42 s, peak RSS 4.8 GB. First error: l. 486, `maximum recursion depth has been reached` at `show (320 : ℕ) = g5_u6_aux_L4.length from rfl` (the elaborator unfolding a 320-element list). Second: `ZMod.intCast_eq_intCast_iff` takes `a b c` explicitly here (`(… _ _ 4).mp`). Every kernel `decide` (the closures, the trace laws, the 320 + 120 witness words, `Nodup`) went through on the first try. Fixed: the lengths become `g5_u6_aux_len4/len3` by `decide +kernel` and the theorems close by `.trans`; the deprecated `Set.mem_setOf_eq` became `Set.mem_ofPred_eq`.
- **B1** 2026-10-30T10:57:30Z → 10:58:28Z — `lake build G5.Congruence.Solution` (the six theorems in one module, all at once rather than one per build — the probe had already carried them): exit **0**, wall 58 s, `Build completed successfully (8707 jobs)`. First error: none. One warning: the linter on `show` in M4b (l. 502).
- **B2 (final)** 2026-10-30T10:59:14Z → 11:00:08Z — `lake build G5.Congruence.Solution` after the `show` became a `rw [show red4 (W w).trace = g5_u6_aux_trp 4 c from hk]`: exit **0**, wall 54 s, `Build completed successfully (8707 jobs)`. First error: none. Warnings in this module: none.
- **byte checks** (`<scratchpad>/L-U6-proofs/assemble.py`, asserted at every write): the DEFS block (`/- G5-U6-DEFS.` … the `H4` definition, its `open G5 ZPhi` included) is a byte substring of both files; each of the six rows' comment + docstring + `theorem … :=` text is a byte substring of both files; 0 lines over 100 code points; no `sorry`, `admit`, `axiom`, `native_decide`, `set_option`; no forbidden word. Helpers are `private`, named `g5_u6_aux_*`, inside `namespace G5`, after the block.
- **axioms** 2026-10-30T11:00:14Z → 11:00:42Z — `lake env lean <scratchpad>/L-U6-proofs/axioms.lean` (`import G5.Congruence.Solution` + six `#print axioms`), exit 0:
  ```
  'G5.g5_u6_m4a' depends on axioms: [propext, Classical.choice, Quot.sound]
  'G5.g5_u6_m4b' depends on axioms: [propext, Classical.choice, Quot.sound]
  'G5.g5_u6_m4c' depends on axioms: [propext, Classical.choice, Quot.sound]
  'G5.g5_u6_m4d' depends on axioms: [propext, Classical.choice, Quot.sound]
  'G5.g5_u6_m3a' depends on axioms: [propext, Classical.choice, Quot.sound]
  'G5.g5_u6_m3b' depends on axioms: [propext, Classical.choice, Quot.sound]
  ```
- **comparator** 2026-10-30T11:00:49Z → 11:02:08Z — `bash tools/comparator.sh G5/Congruence`: exit **0**, wall 79 s. Output (lake's progress and replay lines left out; the Challenge's own six `sorry` warnings and U1's replayed ones appear as expected):
  ```
  comparator.sh @ 2026-10-30T11:00:49Z · unit G5/Congruence · landrun /Users/qriemannian/Claude/projects/comparator/scripts/fake-landrun.sh (the macOS shim: NOT sandboxed)
  Exporting #[G5.g5_u6_m4a, G5.g5_u6_m4b, G5.g5_u6_m4c, G5.g5_u6_m4d, G5.g5_u6_m3a, G5.g5_u6_m3b, propext, Quot.sound, Classical.choice, Nat.add, …, List, eagerReduce] from G5.Congruence.Challenge
  Building G5.Congruence.Solution
  Build completed successfully (8707 jobs).
  Exporting #[… the same list …] from G5.Congruence.Solution
  Running Lean default kernel on solution.
  Lean default kernel accepts the solution
  Your solution is okay!
  ```
  The PRELUDE-RULE arrangement (Solution imports `G5.Ring.Solution`, Challenge imports `G5.Ring.Challenge`) is accepted.
- **method, per row:** the bridge `g5_u6_aux_map_mul` (the reduction of `A * B` is the reduced product), `g5_u6_aux_dec_enc` (decode ∘ encode = id, by `Nat.add_mul_mod_self_left` / `Nat.add_mul_div_left`), and `g5_u6_aux_bridge` (the reduction of `W w` is the decoded fold of the syllable codes, by induction on the word, U1's definitions only — no U1 theorem is used). `g5_u6_aux_inv`: induction on the word keeps the code in the even- or odd-length list. M4b/M4c/M4d/M3b: kernel checks of the trace law on every listed code, carried to `ℤ` by `ZMod.val_intCast` and `omega` (M4c through `ZMod.intCast_eq_intCast_iff` and `push_cast`). M4a/M3a: `encode` is injective, the encoded image is exactly the code list (⊆ by the invariant; ⊇ by one listed literal word per code, checked by `decide +kernel`), the list is `Nodup`, length 320 / 120. All finite checks are `decide +kernel` (kernel reduction, no extra axiom; the axioms print shows it); none needed splitting.
- `Solution.lean` sha256 `5165d2c1eccbfcd9bb84d5021e3287e15a53d9238a4a01f9634dbdd3eb12c1f4`, 572 lines. `Challenge.lean` re-hashed at close: `d576229b…ac532`, unchanged.

| row | status |
|---|---|
| G5-U6-DEFS | restated byte-identically (comparator: definitions match) |
| G5-M4a | PROVED |
| G5-M4b | PROVED |
| G5-M4c | PROVED |
| G5-M4d | PROVED |
| G5-M3a | PROVED |
| G5-M3b | PROVED |

Closed: 2026-10-30T11:02:42Z.
