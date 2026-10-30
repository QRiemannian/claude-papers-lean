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

---

# PHASE proofs — seat L-U4 (proofs), Opus

- Opened: 2026-10-30T10:52:25Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-L-proofs-U4.md`
  (BRIEF READY 2026-10-30T10:51:34Z).
- Frozen check: `shasum -a 256 G5/Sector/Challenge.lean` = `df5fdf79df09a7dd097a8d3102c96b644458d2fcde98856b16de002cf910996f`
  — equal to the brief and to `formalization.yaml` `statement_sha256`. Proceeding.
- Proved prelude: `G5/Ring/Solution.lean` sha256 `0a11790b32f126ecac0f1df2f41e7399a4a9b514a77794ebf08f7878825c0271` (= the brief's `0a11790b…`).
- PRELUDE-RULE U4: Solution imports G5.Ring.Solution (and Mathlib), never G5.Sector.Challenge; the `rabs` block
  restated byte for byte in the same position, the two-section `G5` structure kept.

## Proofs phase — builds, waits, checks

- **Method (the route taken).** Each block `P_a` is the value at `λ = φ` of a matrix `Q_a` over `ℕ[λ]`
  (private `g5_u4_aux_Q`; the evaluation `g5_u4_aux_eps = eval₂RingHom (Nat.castRingHom ZPhi) phi`), so
  `ntr w = ε(T w)` with `T w = tr ∏ Q_a ∈ ℕ[λ]`. From `φ^(n+1) = F_n + F_{n+1} φ` (by monomial induction):
  `x, y ≥ 0`, `y ≥ T(1) − T(0)`, `x − y ≤ T(0)`. `T(0)` and `T(1)` are traces of products of the λ = 0 and
  λ = 1 blocks over ℕ, bounded by induction on the word: entries of the λ = 0 product stay ≤ 1 (so `T(0) ≤ 2`,
  `= 2` on `{1, 4}`-words, `≤ 1` led by a 2/3, `= 0` when that letter is the only 2/3); for `{1, 4}`-words
  `tr ≥ 2 + (#1)(#4)`; led by a 2/3, `T(1)` = the entry sum of the rest, `≥ k + 1` (`≥ k + 2` with a second
  2/3). Rotation invariance of `ntr` by `Matrix.trace_mul_comm`. Ba: `y ≥ (#1)(#4) ≥ 1` or `y ≥ k + 1`;
  `x − y ≤ T(0) ≤ 2`. Bb: a 2/3 gives `x − y ≤ 1`; a `{1, 4}`-word with both letters rotates to `1 :: m ++ [4]`;
  either `m = 1^p 4^q` or `[4, 1] <+ m`, and then `[1, 4, 1, 4] <+` the rotation, whose defect `T(0) − (x − y)`
  is ≥ the defect of `(1, 4, 1, 4)` (= 1) by monotonicity of `{1, 4}`-products under deleting letters (Q_a = 1 + N).
  Bb_tr: `P₁^a P₄^b` in closed form. Bc: from Ba, `(17 − 7φ)t ∓ 11t^σ` in coordinates and the exact sign test
  (`x ≤ 3y` and `7x + y > 0`), equality only at (3, 1). Fa/Fb: `(#1)(#4) ≥ k − 1`, equal iff one letter is
  single, then the rotation is `(1, 4^{k−1})` / `(4, 1^{k−1})` and `y = k − 1` by Bb_tr's form. Fc: `y ≥ k + 1`.
  No import of `G5.WordLevel.Solution`; Theorem A's `y ≥ 1` is re-derived inside (the aux lemmas above).
- **Scratch compiles** (`lake env lean <scratchpad>/L-U4-proofs/*.lean`, importing `G5.Ring.Solution`):
  A (infrastructure) 11:02:15Z exit 1 (ext went one level deep into `ZPhi.ext`; monomial case shape) → fixed,
  11:04:36Z exit 0; C (+ invariants, combinatorics, Ba/Bb/Bb_tr) 11:22:12Z → 11:22:38Z exit 1 (first error l. 151:
  `rfl` on `g5_u4_aux_Z 1 * 1 = 1`; then `vecMul` normal forms from `simp` on `!![…] * M`, an implication
  hypothesis dropped by `omega`) → `g5_u4_aux_mul2` (explicit 2 × 2 left product), the entry-sum lemma split in two;
  D (all nine) 11:32:07Z exit 1 (one `omega`: `simp` rewrote `0 < count` to membership) → 11:34:20Z → 11:34:50Z
  exit 0. (Two earlier launches, 11:05Z and 11:15Z, were withdrawn while still queued.)
- **Waits** (poll on executable names by `ps -axo pid=,comm=`: `lean`, `lake`, `lean4export`, `comparator`; 30 s
  between polls; other seats' builds and comparator runs): 57 busy polls in all, the
  log verbatim at `<scratchpad>/L-U4-proofs/waits.log`; summary: 11:01:13Z–11:02:15Z (a comparator run),
  11:03:04Z–11:04:36Z, 11:05:44Z–11:22:12Z (back-to-back statements builds and comparator runs of other units),
  short waits before each later run; every run started only at a clear poll (two polls, 2 s apart).
- **L1** `lake build G5.Sector.Solution` 2026-10-30T11:36:23Z → 11:36:57Z · exit **0** · wall 34 s ·
  `Build completed successfully (8707 jobs)` · first error: none · warnings: style linters only (flexible `simp`,
  `show` vs `change`) and unused-variable on the frozen statements' `ha`/`hb` (Bb_tr) and `hk` (Fa) — names
  fixed by the frozen text. One build covers all nine theorems (each was first closed in the scratch drafts above).
- **Byte checks** (script `<scratchpad>/L-U4-proofs/assemble.py`, which builds `Solution.lean` FROM
  `Challenge.lean` by replacing each `by sorry` and inserting the helpers): the nine docstring + statement texts are
  byte-identical to `Challenge.lean`'s (9/9); the `rabs` block (from the `-- G5-Bc` comment to `end ZPhi`) is a
  byte substring of both files, in the same position (between `g5_u4_bb_tr` and `g5_u4_bc`, outside `namespace
  G5`); two `namespace G5` sections with `open G5 ZPhi` kept; 0 lines over 100 code points; no `sorry`, `admit`,
  `native_decide`, `axiom`, no forbidden word. Helpers: private, named `g5_u4_aux_*`, in `section g5_u4_aux`
  (with `open Polynomial` scoped to it) and before `g5_u4_bc`; no shared declaration is touched.
- `Solution.lean` sha256 `7f454c144e666ef13329ffcd2ba2cb895f07a6161ba9b5f60dcc0842873418c1`; `Challenge.lean`
  re-read `df5fdf79…` (unchanged).
- **Axioms** 11:37:37Z → 11:37:58Z (`lake env lean <scratchpad>/L-U4-proofs/axioms.lean`, `import G5.Sector.Solution`):
```
'G5.g5_u4_ba' depends on axioms: [propext, Classical.choice, Quot.sound]
'G5.g5_u4_bb' depends on axioms: [propext, Classical.choice, Quot.sound]
'G5.g5_u4_bb_tr' depends on axioms: [propext, Classical.choice, Quot.sound]
'G5.g5_u4_bc' depends on axioms: [propext, Classical.choice, Quot.sound]
'G5.g5_u4_bc_id' depends on axioms: [propext]
'G5.g5_u4_bc_att' depends on axioms: [propext, Classical.choice, Quot.sound]
'G5.g5_u4_fa' depends on axioms: [propext, Classical.choice, Quot.sound]
'G5.g5_u4_fb' depends on axioms: [propext, Classical.choice, Quot.sound]
'G5.g5_u4_fc' depends on axioms: [propext, Classical.choice, Quot.sound]
```
- **Comparator** (`bash tools/comparator.sh G5/Sector`), 2026-10-30T11:38:38Z → 11:39:44Z, exit **0**, wall 66 s:
```
comparator.sh @ 2026-10-30T11:38:38Z · unit G5/Sector · landrun /Users/qriemannian/Claude/projects/comparator/scripts/fake-landrun.sh (the macOS shim: NOT sandboxed)
Build completed successfully (8707 jobs).
Exporting #[G5.g5_u4_ba, G5.g5_u4_bb, G5.g5_u4_bb_tr, G5.g5_u4_bc, G5.g5_u4_bc_id, G5.g5_u4_bc_att, G5.g5_u4_fa, G5.g5_u4_fb, G5.g5_u4_fc, propext, Quot.sound, Classical.choice, Nat.add, Nat.sub, Nat.
Build completed successfully (8707 jobs).
Exporting #[G5.g5_u4_ba, G5.g5_u4_bb, G5.g5_u4_bb_tr, G5.g5_u4_bc, G5.g5_u4_bc_id, G5.g5_u4_bc_att, G5.g5_u4_fa, G5.g5_u4_fb, G5.g5_u4_fc, propext, Quot.sound, Classical.choice, Nat.add, Nat.sub, Nat.
Running Lean default kernel on solution.
Lean default kernel accepts the solution
Your solution is okay!
```
  (lake's build lines and the linter warnings it replays are omitted here; full output at
  `<scratchpad>/L-U4-proofs/comparator.out`.) The prelude arrangement (Solution imports `G5.Ring.Solution`) is
  accepted.

## Status (proofs)

PROVED 2026-10-30T11:39Z — G5-Ba · G5-Bb (bb, bb_tr) · G5-Bc (bc, bc_id, bc_att) · G5-Fa · G5-Fb · G5-Fc: nine
theorems, no `sorry`; axioms within `propext`, `Classical.choice`, `Quot.sound`; comparator: `Your solution is okay!`.
