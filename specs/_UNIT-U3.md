# Unit U3 — Theorem A at the word level, and the Minkowski separation (Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)*) — unit summary

*Seat M-U3 (statement author, step 2 of the lean-papers loop), opened 2026-10-30T10:06:01Z, closed 2026-10-30T10:15:14Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-M-U3.md` (BRIEF READY 2026-10-30T10:04:41Z; probe amendment 10:05:25Z). No git, no web, nothing under `NMC-Phase-1-Research/`, no `lake` command of any kind.*

source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 — `Orchestrator/Claude-Papers/No1-G5/phase-3/STATEMENTS.md` (§4 Errata included), `shasum -a 256` at 2026-10-30T10:06Z and again at 10:12:04Z; it matches the brief's digest. (U1's specs carry the earlier digest `64a12aa2…5867d034` read at 09:45:42Z, before the §4 erratum was appended; the erratum touches G5-MONO only, not U3.) Mathlib pin `db584cd6d46c92f209a44c0f1c829460d327499d` (`lake-manifest.json`), toolchain `leanprover/lean4:v4.33.0`.

## Rows

| id | state | proposed declaration |
|---|---|---|
| G5-Aa | SPEC-DRAFT | `g5_u3_a_nonneg (w) (hw : IsWord w) : nonneg (ntr w)` |
| G5-Ab | SPEC-DRAFT | `g5_u3_a_y_eq_zero (w) (hw : IsWord w) : ((ntr w).y = 0 ↔ (∀ a ∈ w, a = 1) ∨ (∀ a ∈ w, a = 4)) ∧ ((∀ a ∈ w, a = 1) ∨ (∀ a ∈ w, a = 4) → (ntr w).x = 2)` |
| G5-SEPa | SPEC-DRAFT (SPLIT, half a) | `g5_u3_sep_lin (w) (hw : IsWord w) (hy : 1 ≤ (ntr w).y) : ntr w - conj (ntr w) = (ntr w).y • (2 * phi - 1) ∧ 2 * phi - 1 ≤ ntr w - conj (ntr w)` |
| G5-SEPb | SPEC-DRAFT (SPLIT, half b) | `g5_u3_sep_sq (w) (hw : IsWord w) (hy : 1 ≤ (ntr w).y) : (ntr w - conj (ntr w)) ^ 2 = (⟨5 * (ntr w).y ^ 2, 0⟩ : ZPhi) ∧ (5 : ZPhi) ≤ (ntr w - conj (ntr w)) ^ 2` |

Specced 4 · split 2 cuts (G5-A → Aa/Ab as the brief directs; G5-SEP → SEPa/SEPb, this seat's cut) · stopped 0 (no CC-CANDIDATE: every U3 statement is true as recorded at the word level).

**The splits, for V₁'s sign-off.**
- **G5-A → G5-Aa + G5-Ab** (the brief's cut): Aa is positivity (x, y ≥ 0 for every word, on the normalized trace); Ab is the y = 0 characterization with the x = 2 clause. The group-level corollary (no hyperbolic integer trace; Θ(G(5)) ∩ ℤ = {0, ±2}) is U7's and is in neither.
- **G5-SEP → G5-SEPa + G5-SEPb** (split by CLAUSE, both halves fully checkable): the brief's ring form "(t − conj t)² = 5y² ≥ 5" carries the record's distance clause ("distance ≥ √(5/2)", squared) exactly but loses the sign of t − t^σ, so alone it is weaker than the record's first clause "t − t^σ = y√5 ≥ √5". SEPa states the linear clause with √5 read as the ring element 2φ − 1 = ⟨−1, 2⟩ (the record's own "y(2φ − 1) = y√5", SH-P2-1 l. 198) and ≥ as U1's real order; SEPb states the brief's squared form. Both take y ≥ 1 as hypothesis (the law sheet's "hyperbolic ⟺ y ≥ 1", `phase-2/PHASE-2-DEFINITIONS.md` l. 9), so neither re-proves G5-A.

**Defined by this unit: nothing.** Every statement uses U1's names only (`ZPhi`, `phi`, `conj`, `nonneg`, the real order `instLE`, `IsWord`, `ntr`; `.x`/`.y` for the coordinates, `.y` being U1's `phiCoeff`). Constant words are written inline as `(∀ a ∈ w, a = 1) ∨ (∀ a ∈ w, a = 4)`; no hyperbolic predicate and no real embedding are introduced. Theorem names follow the offered pattern `g5_u3_*`.

## Mathlib names (classifier of record, `tools/ledger_names.py`, plain form, at the pin)

One hit with its namespace: `Matrix.trace_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:220`.

Declarations per row (verdict lines pasted whole in each spec's §4):
- G5-Aa: `Matrix.trace`, `Matrix.trace_fin_two`, `Matrix.mul_apply`, `Fin.prod_univ_two` (FOUND); `Fin.sum_univ_two` (NOT FOUND — `@[to_additive]` source `Fin.prod_univ_two`); `List.prod_cons`, `List.map_cons` (NOT FOUND — Lean core, `Init/Data/List/Basic.lean:2087`, `:478`).
- G5-Ab: `Matrix.mul_fin_two`, `Matrix.trace_fin_two_of`, `Matrix.trace_fin_two` (FOUND); `List.forall_mem_cons`, `List.eq_replicate_iff`, `List.replicate` (NOT FOUND — Lean core, `Init/Data/List/Lemmas.lean:421`, `:2276`, `Init/Data/List/Basic.lean:706`; `List.replicate` named only for the equivalent reading, not used).
- G5-SEPa: `zsmul_eq_mul` (FOUND `_root_`), `ZSMul` (FOUND), `ZPow.toPow` (FOUND; its `@[to_additive toSMul]` twin `ZSMul.toSMul` is the `SMul ℤ ZPhi` behind `•`), `Nat.AtLeastTwo` (FOUND); `instOfNatAtLeastTwo` (NOT FOUND by the classifier — written `instance (priority := 100) instOfNatAtLeastTwo`; read by hand at `_root_`, `Mathlib/Data/Nat/Cast/Defs.lean:42`).
- G5-SEPb: `pow_two`, `sq`, `Nat.AtLeastTwo` (FOUND); `instOfNatAtLeastTwo` (as above).

**Every name NOT FOUND at the pin:** `Fin.sum_univ_two` (attribute-generated, source FOUND); `List.prod_cons`, `List.map_cons`, `List.forall_mem_cons`, `List.eq_replicate_iff`, `List.replicate` (Lean core at the toolchain); `instOfNatAtLeastTwo` (present at the root, missed by the classifier because of the priority attribute — a classifier note for the governor, not a gap). Tried and not targeted: `Monoid.npow` (a structure field), `Int.cast` (core). No row is NEEDS-DEVELOPMENT.

## Probe

`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-U3/probe.lean`, sha256 `f600675ef8280c17c82c4c10ef2ab898bb7c0435c65020efe8a60f9399aa84c0`: U1's final probe (`M-U1/probe.lean`, sha256 `f15f320065142f9533d7c775430280434d4ec3533a27927dd740d2210e04af63`) copied whole and unedited as the prefix — its first 5,514 bytes re-hash to `f15f3200…af63` (checked) — then this unit's block: a docstring, `open G5 ZPhi`, and the four theorems `:= by sorry`. **NOT RUN BY THIS SEAT** (brief amendment 2026-10-30T10:05:25Z); no `lake` command was issued; exit / first error / peak memory are the orchestrator's serial run to fill. Every spec's §5 Lean text is a byte-for-byte substring of the probe (checked by script). No probe line exceeds 100 code points. What U1's probe did NOT exercise and this block does: `•` (ℤ on `ZPhi`), numerals ≥ 2 in `ZPhi` (`2 * phi`, `(5 : ZPhi)`), `conj` and `.x` in a statement, an ascribed anonymous constructor `(⟨…, 0⟩ : ZPhi)`, and `∀ a ∈ w, …` binders — the likeliest sites of an elaboration error.

## Line counts (the template's one-liner, per spec)

- `specs/G5-Aa.md`: 0 Lean line(s) over 100 code points
- `specs/G5-Ab.md`: 0 Lean line(s) over 100 code points
- `specs/G5-SEPa.md`: 0 Lean line(s) over 100 code points
- `specs/G5-SEPb.md`: 0 Lean line(s) over 100 code points

## The one thing V₁ should look hardest at, per row

- **G5-Aa:** that stating positivity on the normalized trace `ntr w` (as the brief directs) is the record's LITERAL sentence "tr W = (−1)^k (x + yφ) with x, y ≥ 0" only together with `g5_u1_trace`; whether V₁ would freeze the literal form `nonneg ((-1) ^ w.length * (W w).trace)` instead.
- **G5-Ab:** the reading of "a₁ = ⋯ = a_k ∈ {1, 4}" as `(∀ a ∈ w, a = 1) ∨ (∀ a ∈ w, a = 4)` (k ≥ 1 by `IsWord`, so neither disjunct is vacuous), and the x = 2 clause hung on the constant-word condition ("in which case") rather than on y = 0 — equivalent given the iff; the iff is the second head's and AM §3.2's, the ledger and law sheet print only the "only" direction.
- **G5-SEPa:** reading the record's √5 as the ring element 2φ − 1 and "≥" as U1's real order, and the split itself (this seat's cut, not the brief's): is the linear clause the record's statement or only its derivation step?
- **G5-SEPb:** the squared reading of the distance clause — distance |t − t^σ|/√2 ≥ √(5/2) ⟺ (t − t^σ)² ≥ 5, and "= y√(5/2)" ⟺ (t − t^σ)² = 5y² — with the integer 5y² written as the pair ⟨5y², 0⟩.

## Files

Specs (write path): `~/Claude/projects/claude-papers-lean/specs/` — `G5-Aa.md`, `G5-Ab.md`, `G5-SEPa.md`, `G5-SEPb.md`, `_UNIT-U3.md` (this file).

Scratch a later stage must read: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-U3/probe.lean` (the probe, the source of every §5 block; the orchestrator's serial elaboration runs on it). Also there: `quotes.py` + `quotes.json` (every §2 quote pulled from the record by file and line, asserted present), `names.txt` (the classifier's verdict lines), `gen.py` (the script that wrote the four specs, asserting each §5 block is a substring of the probe), `clock.txt`.

## Status

SPEC-DRAFT 2026-10-30T10:15:14Z — U3 on disk; V₁-U3 may open against it.
