# G5-U8-L2G

## 1 · Header

row: G5-U8-L2G
unit: U8
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: e0df0f356a20456e8b9a9cfdd816c41ee3d010642acc684a43bc4193c36733bf (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T11:00:47Z; §4 Errata included — this is the digest the brief names)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U7 `G5.Group.Challenge` 689c36e6c026a1ce151dd2ab84243a5f8f76bb20a11304c9065cdb358ed410ae · U2 `G5.ModTwo.Challenge` c342ab92ba8ef07e5a9fba82422968b9de4410974583210dc1dcded53354c78c · U6 `G5.Congruence.Challenge` d576229b23afb62ac8beb64cd32f0ca753d5564ca4839eab90b55cf769aac532 (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-30T11:01Z matches)
locus: `Claude-Papers/No1-G5/candidates/LEDGER.md` row L-2 (l. 8, the statement cell); AM §4 "Lemma (L-2)" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 180, proof l. 181); AM §3.2 proof, last sentence (l. 130); `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` §4 "Every element, not only every class" (l. 72); STATEMENTS.md row G5-L2 (l. 14, pointer) and §4 l. 48 (the charter)
spec_clock: 2026-10-30T11:08:54Z

## 2 · Printed statement, verbatim

> No trace x + yφ of G(5) has x odd and y even. In particular Θ(G(5)) ∩ ℤ ⊆ 2ℤ: no odd integer is a trace of G(5), and of Prop. 5.10's census-bounded values 7, 47 (and 5√5, 13√5 by y odd) are excluded unconditionally.
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` row L-2, l. 8, the statement cell (a verbatim substring of the row)

> **Lemma (L-2).** *No element of G(5) has trace x + yφ with x odd and y even. In particular no odd integer is a trace of G(5).* 
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` §4, l. 180

> *Proof.* Every element of D₅ has order 1, 2 or 5; in PSL(2, 𝔽₄) these have traces 0, 0, ω^{±1}, and trace 1 occurs only in order 3. If y is even the reduced trace is x̄ ∈ 𝔽₂ = {0, 1}; it cannot be 1, so x is even. ∎ *Census control:* the (odd, even) cell is 0 of 182,469 values at k ≤ 12, both trees.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` §4, l. 181

> Finally every element of G(5) is conjugate to ±I, ±S, ±R^a (traces ±2, 0, ±φ, ±φ⁻¹) or to ± a cyclic word R^{a₁}S⋯R^{a_k}S with a_i ∈ {1, …, 4} — which follows from S² = −I and R⁵ = −I by cyclic reduction, without the uniqueness of the normal form — and the trace is a class function; the integers among {0, ±φ, ±φ⁻¹, ±2} are {0, ±2}. ∎
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` §3.2 proof, l. 130 (the last sentence, a verbatim substring)

> - **Every element, not only every class.** The trace is a class function, so the statement covers every element of G(5) in SL and in PSL. The group ⟨S, T⟩ ⊂ SL contains −I = S², so its trace set is sign-symmetric.
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` §4, l. 72

The charter (pointers, not the authority; they fix what is word-level and what is group-level):

> - **2026-10-30T10:26:51Z — scope note from V₁-U6 (not a defect):** the lane carries the mod-4 and mod-3 laws at the WORD level (U6); the rows G5-M4 and G5-M3 say "every trace" of G(5), and the group-level leg follows from U7's normal-form existence plus the elliptic traces (0, ±φ, ±φ⁻¹, ±2 — all inside H₄ and outside the mod-3 exclusion). If the paper prints the group-level law, that leg enters as a NEW unit (§3). The §2 note 3 erratum of 10:18:27Z also covers the state-count parentheses in the G5-M4 and G5-M3 Lean-notes cells ("320 matrices × parity", "240 states"); the record's orders are 320 and 120.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` §4 l. 47 (the 10:26:51Z scope note — the charter's ground, a pointer, not the authority)

> - **2026-10-30T10:29:26Z — coverage decision (V₁-U2's flag, V₁-U6's note; decided by the orchestrator as the lane's structuring, not a change of any statement):** the group-level main clauses of G5-L2 ("no ELEMENT of G(5) has trace with x odd and y even"), G5-M4 and G5-M3 ("every trace" of G(5)) are on no unit — U2 and U6 state them over words, U7's INTa carries only L-2's "in particular". They enter as a NEW unit **U8 — the group-level legs**: from U7's normal-form existence (`g5_u7_nf`) and the word theorems, plus the traces of ±I, ±S, ±R^a (0, ±2, ±φ, ±φ⁻¹ — none with x odd and y even; all inside H₄ and outside the mod-3 exclusion), the three group-level statements. M-U8 dispatches when V₁-U7 has signed the NF row; its specs cite U2's, U6's and U7's names as frozen. The word-level rows stand as they are.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` §4 l. 48 (the 10:29:26Z coverage decision — this unit's charter, a pointer, not the authority)

## 3 · Formal reading

- **The predicate** exactly as U2's word leg writes it: `¬ (Odd t.x ∧ Even t.y)` with t = `(g : M2).trace`, `Odd`/`Even` mathlib's on ℤ — the record's "x odd and y even" on the coordinates of t = x + yφ. Sign-invariant: Odd (−x) ↔ Odd x, Even (−y) ↔ Even y.
- **The non-word forms on the predicate** (own arithmetic, `ell_check.py`): ±⟨2, 0⟩ (x even), ⟨0, 0⟩, ±⟨0, 1⟩ (x = 0), ±⟨−1, 1⟩ (y odd) — none has x odd and y even; so the predicate holds on all the forms of `IsNF`.
- **The word leg:** U2's `g5_u2_l2 (w) (hw : IsWord w) : ¬ (Odd (W w).trace.x ∧ Even (W w).trace.y)`, frozen (c342ab92), for ±W w with the sign as above.
- **The group.** U7's `HeckeGrp : Subgroup M2ˣ` (the closure of the units whose underlying matrices are U1's literal `S`, `T`; frozen, V1/V2-GREEN as the record's ⟨S, T⟩ ⊂ SL(2, ℤ[φ])); an element is `g : M2ˣ` with `hg : g ∈ HeckeGrp`, its matrix the coercion `(g : M2)` (`Units.val`), its trace `(g : M2).trace : ZPhi` (`Matrix.trace`). **Every element, not every class** (second head l. 72): no conjugacy appears in the statement; conjugacy is the proof route.
- **The ring.** U1's `ZPhi`, pairs `⟨x, y⟩ = x + y φ`, product (x, y)(u, v) = (xu + yv, xv + yu + yv); `.x` and `.y` are the coordinates (U1's structure fields; `phiCoeff t = t.y`). σ and the real order are not read by this row.
- **SL, the literal lift** (STATEMENTS.md §2 note 2): the statement is about the literal trace of the literal matrix. The record states it for G(5) ⊂ PSL(2, ℝ), where a trace is defined up to sign; the predicate is invariant under t ↦ −t (AM §4 gap 2, l. 187), so the SL reading over every element is the same statement, and −I = S² lies in the group (second head l. 72).
- **The proof route on the record (not part of the statement):** U7's `g5_u7_nf` (every g has a conjugate h g h⁻¹, h ∈ `HeckeGrp`, in the forms ±I, ±S, ±R^a with 1 ≤ a ≤ 4, ±W w with `IsWord w`); trace is a conjugation invariant (`Matrix.trace_mul_cycle` / `Matrix.trace_mul_comm` on (h g) h⁻¹, with `Units.val_mul`, `Units.mul_inv`); `Matrix.trace_neg` for the sign; the word leg named above for ±W w; this unit's `g5_u8_ell` for ±I, ±S, ±R^a, then the finitely many residues by hand or `decide`.

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
Matrix.trace_mul_cycle	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:161
Matrix.trace_mul_comm	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:158
Matrix.trace_neg	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:136
Units.val_mul	FOUND Units Mathlib/Algebra/Group/Units/Defs.lean:178
Units.val_inv_eq_inv_val	FOUND Units Mathlib/Algebra/Group/Units/Defs.lean:280
Units.mul_inv	FOUND Units Mathlib/Algebra/Group/Units/Defs.lean:201
Int.even_or_odd	FOUND Int Mathlib/Algebra/Ring/Int/Parity.lean:40
odd_neg	FOUND _root_ Mathlib/Algebra/Ring/Parity.lean:208
Odd.neg	FOUND Odd Mathlib/Algebra/Ring/Parity.lean:202
Even.neg	NOT FOUND
even_neg	NOT FOUND
```

- `Even.neg` and `even_neg` read NOT FOUND because they are generated by `@[to_additive]` and the classifier indexes source declarations only: `even_neg` is the additive form of `isSquare_inv` (`Mathlib/Algebra/Group/Even.lean:156`, `@[to_additive (attr := simp)]`) and `Even.neg` of the alias `IsSquare.inv` (l. 159, `@[to_additive] alias`) — present at the pin; proof aids only, not targeted by the statement.
- Targeted by the statement: `Matrix.trace` (and `Odd`, `Even`, U7's `HeckeGrp`, U1's `ZPhi` fields). The rest are proof aids for the composition route.
- No row is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for every unit g of `M2` lying in the subgroup ⟨S, T⟩ (`HeckeGrp`), the trace of its matrix, x + yφ, does not have x odd and y even.

Probe: `<scratchpad>/M-U8/probe.lean` (`import Mathlib` and the four frozen Challenge imports, then `open G5 ZPhi`, `namespace G5`, this unit's five theorems `:= by sorry`, `end G5`; sha256 in `_UNIT-U8.md`). **NOT RUN by this seat** (the brief: no `lake` command of any kind); the orchestrator elaborates it and returns any error to the row. The block below sits inside `namespace G5` after `open G5 ZPhi`, and is the probe's text byte for byte.

```lean
/-- G5-U8-L2G. No element of `⟨S, T⟩` has trace `x + y φ` with `x` odd and `y` even.
Locus: LEDGER row L-2 (l. 8); AM §4 "Lemma (L-2)" (l. 180, l. 181); AM §3.2 (l. 130);
`candidates/checks/AM-1-second-head.md` §4 (l. 72). STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u8_l2g (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    ¬ (Odd (g : M2).trace.x ∧ Even (g : M2).trace.y) := by sorry
```

## 6 · What the row does not claim

- The row's "in particular" (Θ(G(5)) ∩ ℤ ⊆ 2ℤ; no odd integer is a trace; the exclusions of 7, 47, 5√5, 13√5 from Prop. 5.10's list) is NOT restated: per the charter (STATEMENTS.md §4 l. 48) U7's INTa carries L-2's "in particular" (integer traces are 0, ±2), and U2's `g5_u2_l2_int` its word leg. The Prop. 5.10 remark is the paper's register.
- No mod-2 image statement at group level (D₅ as the image of ⟨S, T⟩ is U2's `g5_u2_d5_image`, a submonoid closure of the reductions, not restated); no class invariant; nothing about the parity of k.
- No claim about PSL(2, ℝ) beyond the sign-invariance noted in §3.

## 7 · Status

SPEC-DRAFT 2026-10-30T11:08:54Z

V1: V1-GREEN 2026-10-30T11:28:12Z — the record's "No element of G(5) has trace x + yφ with x odd and y even" (AM l. 180; LEDGER l. 8 "No trace … of G(5)") stated over every unit of U7's `HeckeGrp` with the literal SL trace. This is the same statement as the PSL reading: ⟨S, T⟩ → G(5) is onto with kernel {±I} (−I = S², second head l. 72), and Odd(−x) ⟺ Odd x, Even(−y) ⟺ Even y (AM gap 2, l. 187, lists "x odd ∧ y even" as invariant under t ↦ −t). The predicate is `g5_u2_l2`'s byte for byte, on U1's `.x`/`.y` (pair convention, x + yφ); `HeckeGrp` is used in U7's sense (`Subgroup M2ˣ`, `(g : M2).trace` as in `g5_u7_int_a`); the claim is every element, not every class. Own arithmetic: no NF non-word form has x odd and y even (±⟨2, 0⟩, 0, ±⟨0, 1⟩, ±⟨−1, 1⟩), so the statement is true on the record's route. The "in particular" (Θ ∩ ℤ ⊆ 2ℤ) is left to U7's INTa by the charter (STATEMENTS.md §4 l. 48), not dropped: INTa (φ-coefficient 0 ⟹ trace ∈ {0, ±2}) implies it. Locus slip, pointer only: "STATEMENTS.md row G5-L2 (l. 12)" names the table separator; the row is l. 14. Every quoted locus is right, and no Lean text carries the number, so the GREEN stands across the mechanical fix. Note for the close report, not a U8 defect: in U1's convention 5√5 = 5(2φ − 1) = ⟨−5, 10⟩ has x odd and y even, so its exclusion is an instance of this row's own main clause. The ledger's parenthetical reason "by y odd" (LEDGER l. 8) does not read in the pair convention, and §6 groups 5√5, 13√5 with INTa's "in particular", which concerns integers only. §2: 7 cites verbatim (5 exact; LEDGER l. 8 and AM l. 130 verbatim substrings). Parse: 0 Lean line(s) over 100 code points

*Pointer corrected 2026-10-30T11:31Z by the orchestrator at V₁-U8's note: the STATEMENTS.md row line was two early (G5-L2 (l. 12) → G5-L2 (l. 14)); the quoted loci were right; no Lean text carries the number; the `locus:` header line itself corrected at 2026-10-30T11:35:14Z (V₁ re-sign note).*

V2: V2-GREEN 2026-10-30T11:44:57Z — `g5_u8_l2g` says what the record says: "No element of G(5) has trace x + yφ with x odd and y even" (AM l. 180; LEDGER l. 8; STATEMENTS.md row G5-L2 l. 14), stated on every `g : M2ˣ` with `g ∈ HeckeGrp` (U7's `Subgroup M2ˣ`, ⟨S, T⟩) with the literal SL trace `(g : M2).trace` on U1's `.x`/`.y`. This is the PSL statement: the predicate is sign-symmetric (AM l. 187) and −I = S² lies in the group (second head l. 72). It holds for every element, not every class. The guard `hg` carries the content: units of `M2` outside ⟨S, T⟩ have trace ⟨3, 0⟩ (e.g. [[2, 1], [1, 1]], det 1), so the statement is not vacuous, and g = 1 satisfies the hypothesis. The "in particular" stays with U7's INTa by the charter. The theorem text is byte-identical to §5 (script).
