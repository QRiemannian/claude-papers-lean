# G5-MONOa

## 1 · Header

row: G5-MONOa
unit: U5
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` read 2026-10-30T10:06:17Z; §4 Errata included)
locus: AM transcript §5.1 "Pruning lemma" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 198), with §1.1 l. 34 and §1.2 l. 50; TA transcript §1 "Lemma 3" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` l. 51); DO transcript §2 "Lemma L1" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` l. 60); `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.1 (l. 176), §3.2 (l. 178), §2 (i) (l. 133), census (l. 187); STATEMENTS.md row G5-MONO (l. 19), its SECOND clause (pointer), read with §4 Errata (l. 44). SPLIT of G5-MONO per the brief: a = the trace inequality; b = the strong clause (G5-MONOb); the first clause is U1's `g5_u1_ge_a`
spec_clock: 2026-10-30T10:18:44Z

## 2 · Printed statement, verbatim

The trace inequality, in the four records:

> **Pruning lemma (WORKED OUT HERE):** every P_a has real-nonnegative entries and P_a − I real-nonnegative entries, so for W = A·P·B (A, B products of P's) tr W ≥ tr(prefix) in ℝ;
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 198

> **Lemma 3 (monotonicity, the previous occupant's D-4; WORKED OUT HERE).** Each A_a(φ) ≥ I entrywise with non-negative entries, so every product Q of them is ≥ I, and for any product P of them tr(PQ) = tr P + tr(P(Q − I)) ≥ tr P. Inserting syllables anywhere never lowers |t|. (This is what licenses ta4's pruning at tr(prefix) > X.)
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` l. 51

> **Lemma L1 (WORKED OUT HERE).** Each N_a ≥ I entrywise. For non-negative P, P·N_a ≥ P, so tr(P N_a) ≥ tr P. The trace of a sequence therefore dominates the trace of each of its prefixes.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` l. 60

> **§3.1 TA Lemma 3: HOLDS.** tr(A P_a B) = tr(BA P_a) = tr(BA) + tr(BA(P_a − I)) ≥ tr(BA) = tr(AB). The inequality holds because BA ≥ 0 and P_a − I ≥ 0 entrywise. A and B may be empty.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 176

> **§3.2 DO Lemma L1: HOLDS.** P·N_a = P + P(N_a − I) ≥ P entrywise, so a trace dominates the trace of each of its prefixes, by induction on the suffix.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 178

The hypothesis the inequality rests on — products of blocks have entries in ℕ[φ] and are ≥ I:

> Every entry lies in {0, 1, φ} ⊂ ℕ[φ]; every P_a has determinant 1; every P_a − I has real-nonnegative entries (φ − 1 > 0). (P_a − I does NOT have entries in ℕ[φ] for a = 2, 3, since φ − 1 = −1 + φ; see the correction note in §1.2.)
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 34

> appending a syllable, Q ↦ QP_a (Q a product of P's, entries in ℕ[φ]), changes the sign-normalized trace by Δ = tr(Q(P_a − I))
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 50

> - P ≥ I entrywise because each A_a(φ) ≥ I with non-negative entries, so (I + N₁)(I + N₂) ≥ I.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 133

> **Census on L1/L3.** Over 1,398,100 nodes, every node's trace is ≥ its parent's trace, with tr I = 2 above k = 1: 0 violations. Every product has entries in ℕ[φ]: 0 violations.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 187

The list's row (pointer) and the erratum that binds it:

> Every P_a ≥ I entrywise over ℕ[φ]; for products A, B of the P's, tr(A P_a B) ≥ tr(A B); after a rotation beginning with 2, 3 or the whole pair (1, 4), every prefix has all four entries ≥ 1 and each further syllable raises the trace by ≥ φ.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` l. 19

> The lane reads G5-MONO's first clause as the real-order statement (spec G5-U1-GEa)
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` l. 44

## 3 · Formal reading

- **Domain.** A = P_{u₁}⋯P_{u_m} and B = P_{v₁}⋯P_{v_n} for lists u, v over {1, 2, 3, 4}, either possibly empty (then A or B is I); a ∈ {1, 2, 3, 4}. This is "products of P's" (AM l. 198), "any product P of them" (TA l. 51), "A and B may be empty" (SH-P2-1 l. 176).
- **The inequality** tr(A P_a B) ≥ tr(A B) is in the REAL order ("in ℝ", AM l. 198; SH-P2-1 §3.1's "≥" rests on BA ≥ 0 and P_a − I ≥ 0 entrywise, both real), i.e. U1's `instLE`. Not the coefficientwise ℕ[φ] order (STATEMENTS.md §4: the coefficientwise reading of the first clause is false for a = 2, 3).
- **The hypothesis made explicit.** The records' proofs use that BA (a product of blocks) has real-nonnegative entries and that P_a − I ≥ 0 entrywise. The second is U1's `g5_u1_ge_a` (not restated). The first is stated as its own declaration, `g5_u5_mono_prod`: every product of blocks has entries in ℕ[φ] (AM l. 34, l. 50; SH-P2-1 l. 187) and is ≥ I entrywise in the real order (TA l. 51 "every product Q of them is ≥ I"; SH-P2-1 l. 133). ℕ[φ] entries are real-nonnegative, so this discharges the records' "BA ≥ 0" for every A, B in the domain.
- **Conventions.** Words are lists over {1, 2, 3, 4} with U1's `IsWord` (non-empty); possibly-empty products of blocks carry `∀ b ∈ u, 1 ≤ b ∧ b ≤ 4` instead (SH-P2-1 §3.1: "A and B may be empty"; the empty product is `1 = I`). Words, not classes (STATEMENTS.md §2 note 4): a class statement is read as the statement for every word of the class, the trace being rotation-invariant; rotations are mathlib's `List.IsRotated w v` (∃ n, w.rotate n = v). The trace is the NORMALIZED one, U1's `ntr` = tr(P_{a₁}⋯P_{a_k}), which is (−1)^k · tr W for the literal lift (U1's `g5_u1_trace`); no statement here mentions `W`, so no sign enters. `≤` is U1's exact REAL order `instLE` (s ≤ t ⟺ t − s ≥ 0 as a real number, decided by the sign of a + b√5); `nonneg` is ℕ[φ].
- G5-MONO's first clause ("Every P_a ≥ I entrywise", real-order reading) is U1's row G5-U1-GEa, `g5_u1_ge_a`; it is cited, not restated.

## 4 · Target mathlib declarations

```
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
Matrix.trace_mul_comm	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:158
Matrix.trace_mul_cycle	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:161
Matrix.trace_add	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:64
Matrix.mul_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Notation.lean:479
List.prod_append	NOT FOUND
List.map_append	NOT FOUND
```

`List.prod_append` and `List.map_append` read NOT FOUND in mathlib because they are Lean CORE at the pinned toolchain `leanprover/lean4:v4.33.0` (`Init/Data/List/Lemmas.lean:1883` and `:1853`); `List.prod` itself is core (U1's note: `Init/Data/List/Basic.lean:2083`). No statement-level name is missing; the row is not NEEDS-DEVELOPMENT. The proof aids are `Matrix.trace_mul_comm` / `Matrix.trace_mul_cycle` (tr(A P_a B) = tr(B A P_a)), `Matrix.mul_fin_two` and `Matrix.trace_fin_two` for the 2 × 2 expansion; the real order's compatibility with + and × on ZPhi is not in mathlib (no `OrderedRing` instance on `ZPhi`; U1 defines none) and is a proof-side development, not a statement gap.

## 5 · Intended Lean statement

In prose: (i) for every list u over {1, 2, 3, 4} (possibly empty), every entry of P_{u₁}⋯P_{u_m} lies in ℕ[φ] and is ≥ the corresponding entry of I in the real order; (ii) for lists u, v over {1, 2, 3, 4} (possibly empty) and a ∈ {1, 2, 3, 4}, tr(A B) ≤ tr(A P_a B) in the real order, where A, B are the block products of u, v.

Probe: `<scratchpad>/M-U5/probe.lean` (sha256 `c723a83fe9aa3166ad82de22703325a140cf76053b7ce211a2a6bb4c719a30ec`; U1's final probe `f15f3200…` copied whole as the prefix, then U5's block). NOT RUN by this seat (the brief's amendment of 10:05:25Z): the orchestrator elaborates it. The text below is the probe's text byte for byte.

```lean
/-- G5-MONOa, the record's hypothesis made explicit: a product of blocks (the empty product
is `1`) has entries in ℕ[φ] and is `≥ I` entrywise in the real order. -/
theorem g5_u5_mono_prod (u : List ℕ) (hu : ∀ b ∈ u, 1 ≤ b ∧ b ≤ 4) (i j : Fin 2) :
    nonneg (blockProd u i j) ∧ (1 : M2) i j ≤ blockProd u i j := by sorry

/-- G5-MONOa: for products `A, B` of blocks, `tr (A P_a B) ≥ tr (A B)` in the real order. -/
theorem g5_u5_mono_a (u v : List ℕ) (hu : ∀ b ∈ u, 1 ≤ b ∧ b ≤ 4)
    (hv : ∀ b ∈ v, 1 ≤ b ∧ b ≤ 4) (a : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) :
    (blockProd u * blockProd v).trace ≤ (blockProd u * P a * blockProd v).trace := by sorry
```

## 6 · What the row does not claim

- Not that P_a − I, or a product minus I, has entries in ℕ[φ] (false for a = 2, 3: STATEMENTS.md §4, G5-U1-GEb).
- Not the coefficientwise order: (ii) is a real inequality only; nothing is said about the φ-coefficient of the increment (AM l. 50 does say it is ≥ 0; that is not this row).
- Not the general DO form "for non-negative P" over arbitrary matrices: A, B range over products of blocks only (the STATEMENTS.md row's "products A, B of the P's").
- Not prefix domination as a separate statement (DO l. 60's "the trace of a sequence dominates the trace of each of its prefixes" follows by iterating (ii) with B = I); not the strong clause (G5-MONOb); not P_a ≥ I (U1).
- No `OrderedRing`/`Preorder` structure on ZPhi is claimed or assumed.

## 7 · Status

SPEC-DRAFT 2026-10-30T10:18:44Z

V1: V1-GREEN 2026-10-30T10:27:16Z — all eleven §2 cites match their source lines verbatim (script; AM l. 198, l. 50 and STATEMENTS.md l. 19, l. 44 as verbatim substrings, the rest whole; STATEMENTS.md now reads 51324441…, two errata appended after M's 0b277844…, the quoted lines unchanged). `g5_u5_mono_a` is the row's second clause at the row's strength: A, B range over block products of possibly-empty lists (STATEMENTS.md l. 19 "products A, B of the P's"; SH-P2-1 l. 176 "A and B may be empty"), a ∈ {1..4} guarded against U1's filler, the inequality in U1's real order (AM l. 198 "in ℝ"; §4 erratum) — no hypothesis on arbitrary matrices, so not DO l. 60's stronger "for non-negative P" form, and not weaker than SH-P2-1 §3.1. V1-SPLIT-OK on `g5_u5_mono_prod`: it is not a hypothesis of mono_a but a separate declaration, TA l. 51's own "every product Q of them is ≥ I" with AM l. 50 / SH-P2-1 l. 187's ℕ[φ] entries; separately freezable, mono_a stands without it. Names: U1's `blockProd`, `P`, `nonneg`, `M2`, `instLE`; mathlib's `Matrix.trace`; nothing defined. Independent exact check (zphi.py, read-only): mono_prod on all 87,381 lists of length ≤ 8 (empty included), mono_a on 669,924 (u, v, a) with |u| + |v| ≤ 7 — 0 violations. Parse: 0 Lean line(s) over 100 code points

V2: V2-GREEN 2026-10-30T10:53:28Z — g5_u5_mono_prod and g5_u5_mono_a say what the record says at the locus (TA l. 51, AM l. 50, l. 198, SH-P2-1 l. 176, l. 187, STATEMENTS.md l. 19 with the 10:02:47Z real-order erratum): possibly-empty block products, guards present, the real order throughout; §5 byte-identical in Challenge.lean (sha256 ea6b4aed…); 0 violations on an independent exact check.
