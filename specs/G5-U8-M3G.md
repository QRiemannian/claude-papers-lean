# G5-U8-M3G

## 1 · Header

row: G5-U8-M3G
unit: U8
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: e0df0f356a20456e8b9a9cfdd816c41ee3d010642acc684a43bc4193c36733bf (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T11:00:47Z; §4 Errata included — this is the digest the brief names)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U7 `G5.Group.Challenge` 689c36e6c026a1ce151dd2ab84243a5f8f76bb20a11304c9065cdb358ed410ae · U2 `G5.ModTwo.Challenge` c342ab92ba8ef07e5a9fba82422968b9de4410974583210dc1dcded53354c78c · U6 `G5.Congruence.Challenge` d576229b23afb62ac8beb64cd32f0ca753d5564ca4839eab90b55cf769aac532 (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-30T11:01Z matches)
locus: `Claude-Papers/No1-G5/candidates/LEDGER.md` row AM-5 (l. 17, the statement cell); AM §2.3 (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 95), §2.4 (l. 116); DO §3.2 (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` l. 116, l. 121) and §10 D-2 (l. 246); STATEMENTS.md row G5-M3 (l. 21, pointer) and §4 l. 47–48 (the charter)
spec_clock: 2026-10-30T11:09:18Z

## 2 · Printed statement, verbatim

> Mod 3: no trace has x ≡ y ≢ 0 (mod 3) (A₅ has no element of order 4).
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` row AM-5, l. 17, the statement cell (a verbatim substring of the row)

> - **(mod 3; new):** **no trace has x ≡ y ≢ 0 (mod 3)** — the order-4 stratum is empty in A₅. Hand proof: 3 is inert, ℤ[φ]/3 ≅ 𝔽₉; the element traces of PSL(2, 𝔽₉) up to sign are 0 (order 2), ±1 (orders 1, 3), ±φ̄, ±(φ̄ − 1) (order 5), ±φ̄² (order 4); A₅ has orders {1, 2, 3, 5}; φ̄² ↔ (x, y) ≡ (1, 1). PROVED.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` §2.4, l. 116

> COMPUTED HERE by breadth-first closure of S̄, R̄ in SL(2, ℤ[φ]/n), tracked with k mod 2 (`python3 images.py n`, `python3 lifts.py 2 4`, `python3 lifts.py 3 2`, `python3 img_trace_only.py 7|11`); exact; the set of realized trace residues of the image IS the set of trace residues of G(5) mod n (the image is the image). Image orders in SL (PSL = half):
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` §2.3, l. 95

> Mod 3 by hand (WORKED OUT HERE). The binary icosahedral traces are {±2, 0, ±1, ±φ, ±(φ−1)}. Reduced mod 3, ±2 merges with ∓1, leaving 7 residues; ±φ² is missing.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` §3.2, l. 116

> - (iii) never x ≡ y ≢ 0 (mod 3).
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` §3.2, l. 121

> - **D-2 (local congruences).** Every trace x + yφ of G(5) satisfies: x odd ⟹ (y odd and x + y ≡ 0 mod 4); x ≡ 2 (mod 4) ⟹ y even; not (x ≡ y ≢ 0 mod 3). Equivalently the trace residues lie in the 8-element set H₄ = {(0,·), (2,0), (2,2), (1,3), (3,1)} mod 4 and avoid ±φ² mod 3. Status: proved by exact closure (COMPUTED HERE, one hand). *Falsifier:* any group element with a trace in a missed residue. *Test:* recompute the mod-4 and mod-3 images on the second instrument (impl-a's closure code); census control 0 violations at depth 12 and in the trace-complete set. → candidate L-3/L-4 after the pair agrees.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` §10, l. 246

The charter (pointers, not the authority; they fix what is word-level and what is group-level):

> - **2026-10-30T10:26:51Z — scope note from V₁-U6 (not a defect):** the lane carries the mod-4 and mod-3 laws at the WORD level (U6); the rows G5-M4 and G5-M3 say "every trace" of G(5), and the group-level leg follows from U7's normal-form existence plus the elliptic traces (0, ±φ, ±φ⁻¹, ±2 — all inside H₄ and outside the mod-3 exclusion). If the paper prints the group-level law, that leg enters as a NEW unit (§3). The §2 note 3 erratum of 10:18:27Z also covers the state-count parentheses in the G5-M4 and G5-M3 Lean-notes cells ("320 matrices × parity", "240 states"); the record's orders are 320 and 120.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` §4 l. 47 (the 10:26:51Z scope note — the charter's ground, a pointer, not the authority)

> - **2026-10-30T10:29:26Z — coverage decision (V₁-U2's flag, V₁-U6's note; decided by the orchestrator as the lane's structuring, not a change of any statement):** the group-level main clauses of G5-L2 ("no ELEMENT of G(5) has trace with x odd and y even"), G5-M4 and G5-M3 ("every trace" of G(5)) are on no unit — U2 and U6 state them over words, U7's INTa carries only L-2's "in particular". They enter as a NEW unit **U8 — the group-level legs**: from U7's normal-form existence (`g5_u7_nf`) and the word theorems, plus the traces of ±I, ±S, ±R^a (0, ±2, ±φ, ±φ⁻¹ — none with x odd and y even; all inside H₄ and outside the mod-3 exclusion), the three group-level statements. M-U8 dispatches when V₁-U7 has signed the NF row; its specs cite U2's, U6's and U7's names as frozen. The word-level rows stand as they are.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` §4 l. 48 (the 10:29:26Z coverage decision — this unit's charter, a pointer, not the authority)

## 3 · Formal reading

- **The predicate** exactly as U6's word leg writes it: `¬ (t.x ≡ t.y [ZMOD 3] ∧ ¬ (t.x ≡ 0 [ZMOD 3]))` with t = `(g : M2).trace` — the record's "x ≡ y ≢ 0 (mod 3)" read as x ≡ y and x ≢ 0 (with x ≡ y, x ≢ 0 ⟺ y ≢ 0), `Int.ModEq` on the coordinates. U6's `red3` is not used, so the leg composes with `g5_u6_m3b` verbatim. Sign-invariant: x ≡ y ⟺ −x ≡ −y, x ≡ 0 ⟺ −x ≡ 0 (mod 3).
- **"No trace"** (ledger AM-5) is every trace of G(5) (AM l. 95: the image's trace residues ARE G(5)'s; DO l. 246 "Every trace x + yφ of G(5) satisfies … not (x ≡ y ≢ 0 mod 3)"): every element of ⟨S, T⟩.
- **The non-word forms** (own arithmetic): ±⟨2, 0⟩ (x ≢ y), ⟨0, 0⟩ and ±⟨0, 1⟩ (x ≡ 0), ⟨−1, 1⟩ (x ≡ 2, y ≡ 1), ⟨1, −1⟩ (x ≡ 1, y ≡ 2) — none has x ≡ y ≢ 0; DO l. 116's binary icosahedral traces agree.
- **The word leg:** U6's `g5_u6_m3b (w) (hw : IsWord w) : ¬ ((W w).trace.x ≡ (W w).trace.y [ZMOD 3] ∧ ¬ ((W w).trace.x ≡ 0 [ZMOD 3]))`, frozen (d576229b), for ±W w with the sign as above.
- **The group.** U7's `HeckeGrp : Subgroup M2ˣ` (the closure of the units whose underlying matrices are U1's literal `S`, `T`; frozen, V1/V2-GREEN as the record's ⟨S, T⟩ ⊂ SL(2, ℤ[φ])); an element is `g : M2ˣ` with `hg : g ∈ HeckeGrp`, its matrix the coercion `(g : M2)` (`Units.val`), its trace `(g : M2).trace : ZPhi` (`Matrix.trace`). **Every element, not every class** (second head l. 72): no conjugacy appears in the statement; conjugacy is the proof route.
- **The ring.** U1's `ZPhi`, pairs `⟨x, y⟩ = x + y φ`, product (x, y)(u, v) = (xu + yv, xv + yu + yv); `.x` and `.y` are the coordinates (U1's structure fields; `phiCoeff t = t.y`). σ and the real order are not read by this row.
- **SL, the literal lift** (STATEMENTS.md §2 note 2): the statement is about the literal trace of the literal matrix. The record states it for G(5) ⊂ PSL(2, ℝ), where a trace is defined up to sign; the mod-3 reduction is not defined on PSL but the predicate is sign-symmetric (AM §4 gap 2, l. 187, lists "x ≡ y ≢ 0 mod 3" among the predicates invariant under t ↦ −t), so the SL reading over every element is the same statement, and −I = S² lies in the group (second head l. 72).
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
Int.ModEq	FOUND Int Mathlib/Data/Int/ModEq.lean:30
Int.ModEq.neg	FOUND Int.ModEq Mathlib/Data/Int/ModEq.lean:172
Int.ModEq.refl	FOUND Int.ModEq Mathlib/Data/Int/ModEq.lean:70
```

- All FOUND. Targeted by the statement: `Matrix.trace`, `Int.ModEq` (the notation `a ≡ b [ZMOD n]`, as U6 uses it). Proof aids: the conjugation lemmas, `Matrix.trace_neg`, `Int.ModEq.neg` for the sign.
- No row is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for every unit g of `M2` lying in ⟨S, T⟩, the trace x + yφ of its matrix does not satisfy x ≡ y (mod 3) with x ≢ 0 (mod 3).

Probe: `<scratchpad>/M-U8/probe.lean` (`import Mathlib` and the four frozen Challenge imports, then `open G5 ZPhi`, `namespace G5`, this unit's five theorems `:= by sorry`, `end G5`; sha256 in `_UNIT-U8.md`). **NOT RUN by this seat** (the brief: no `lake` command of any kind); the orchestrator elaborates it and returns any error to the row. The block below sits inside `namespace G5` after `open G5 ZPhi`, and is the probe's text byte for byte.

```lean
/-- G5-U8-M3G. No element of `⟨S, T⟩` has trace with `x ≡ y ≢ 0 (mod 3)`.
Locus: LEDGER row AM-5 (l. 17); AM §2.3 (l. 95), §2.4 (l. 116); DO §3.2 (l. 116, l. 121)
and §10 D-2 (l. 246). STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u8_m3g (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    ¬ ((g : M2).trace.x ≡ (g : M2).trace.y [ZMOD 3] ∧
      ¬ ((g : M2).trace.x ≡ 0 [ZMOD 3])) := by sorry
```

## 6 · What the row does not claim

- Not the image order 120 or the identification of the mod-3 image with the binary icosahedral group / A₅ (U6's `g5_u6_m3a` is the word-level count; the group-theoretic identification is the paper's register, AM l. 109, not stated).
- No realization claim (that the seven other residues occur).
- The hand proof (A₅ has no element of order 4) is the paper's register, not a statement here.

## 7 · Status

SPEC-DRAFT 2026-10-30T11:09:18Z

V1: V1-GREEN 2026-10-30T11:28:12Z — "no trace has x ≡ y ≢ 0 (mod 3)" (LEDGER l. 17; AM l. 116; DO l. 121, l. 246 "Every trace x + yφ of G(5) satisfies … not (x ≡ y ≢ 0 mod 3)"), stated over every unit of `HeckeGrp`. Reading the chain as x ≡ y ∧ ¬ x ≡ 0 is faithful: given x ≡ y, x ≢ 0 ⟺ y ≢ 0. It excludes exactly the residues (1, 1), (2, 2) = ±φ² (own check; AM l. 103 "never (x, y) ≡ ±(1, 1)", DO l. 108). The `Int.ModEq` form on U1's `.x`/`.y` is `g5_u6_m3b`'s byte for byte, so the word leg composes verbatim. Leaving `red3` unused is not a drift: `red3 t ∉ {(1,1), (2,2)}` is the same proposition. The predicate is sign-symmetric (AM gap 2, l. 187), so the literal SL lift over every element is the record's PSL statement (−I = S² in the group). Own arithmetic: no NF non-word form has x ≡ y ≢ 0 (⟨±2, 0⟩, 0, ⟨0, ±1⟩, ⟨−1, 1⟩, ⟨1, −1⟩). Locus slip, pointer only: "STATEMENTS.md row G5-M3 (l. 19)" is G5-MONO's line; G5-M3 is l. 21. The quoted loci are right and no Lean text carries the number, so the GREEN stands across the fix. §2: 8 cites verbatim (7 exact; LEDGER l. 17 a verbatim substring). Parse: 0 Lean line(s) over 100 code points

*Pointer corrected 2026-10-30T11:31Z by the orchestrator at V₁-U8's note: the STATEMENTS.md row line was two early (G5-M3 (l. 19) → G5-M3 (l. 21)); the quoted loci were right; no Lean text carries the number; the `locus:` header line itself corrected at 2026-10-30T11:35:14Z (V₁ re-sign note).*

V2: V2-GREEN 2026-10-30T11:44:57Z — `g5_u8_m3g` says what the record says: "no trace has x ≡ y ≢ 0 (mod 3)" (LEDGER l. 17; AM l. 116; DO l. 121, l. 246 "Every trace x + yφ of G(5) satisfies … not (x ≡ y ≢ 0 mod 3)"; STATEMENTS.md row G5-M3 l. 21), stated on every element of `HeckeGrp` in `g5_u6_m3b`'s `Int.ModEq` form. Reading the chain as x ≡ y ∧ x ≢ 0 is exact, because with x ≡ y, x ≢ 0 ⟺ y ≢ 0; it excludes exactly ±φ² = (1, 1), (2, 2) (AM l. 103, DO l. 108). The predicate is sign-symmetric (AM l. 187), so the literal SL lift is the record's statement. It is not vacuous: [[1 + φ, 1], [−1, 0]] is a unit of `M2` with trace ⟨1, 1⟩. The theorem text is byte-identical to §5 (script).

*Erratum appended 2026-10-30T11:56:57Z by Orchestrator A: the Probe line reads "this unit's five theorems"; after V₁-U8 struck `g5_u8_ell_inv` (11:3xZ) the unit holds FOUR theorems (`g5_u8_ell`, `g5_u8_l2g`, `g5_u8_m4g`, `g5_u8_m3g`); the frozen Challenge (`bf7316f7…`) carries four. Wording only.*
