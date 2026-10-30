# G5-U8-M4G

## 1 · Header

row: G5-U8-M4G
unit: U8
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: e0df0f356a20456e8b9a9cfdd816c41ee3d010642acc684a43bc4193c36733bf (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T11:00:47Z; §4 Errata included — this is the digest the brief names)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U7 `G5.Group.Challenge` 689c36e6c026a1ce151dd2ab84243a5f8f76bb20a11304c9065cdb358ed410ae · U2 `G5.ModTwo.Challenge` c342ab92ba8ef07e5a9fba82422968b9de4410974583210dc1dcded53354c78c · U6 `G5.Congruence.Challenge` d576229b23afb62ac8beb64cd32f0ca753d5564ca4839eab90b55cf769aac532 (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-30T11:01Z matches)
locus: DO §3.2 "New exact congruences (D-2)" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` l. 118–120) and §10 D-2 (l. 246); AM §2.3 (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 95); `Claude-Papers/No1-G5/phase-2/PHASE-2-DEFINITIONS.md` §1 (l. 15, the H₄ display); `Claude-Papers/No1-G5/candidates/LEDGER.md` row AM-4 (l. 16, the statement cell — the word-level k-form, quoted to mark what is NOT group-level); `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` §4 (l. 73–75); STATEMENTS.md row G5-M4 (l. 20, pointer) and §4 l. 47–48 (the charter)
spec_clock: 2026-10-30T11:09:14Z

## 2 · Printed statement, verbatim

> **New exact congruences (D-2):**
> - (i) x odd ⟹ y odd **and x + y ≡ 0 (mod 4)**;
> - (ii) x ≡ 2 (mod 4) ⟹ y even;
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` §3.2, l. 118–120

> - **D-2 (local congruences).** Every trace x + yφ of G(5) satisfies: x odd ⟹ (y odd and x + y ≡ 0 mod 4); x ≡ 2 (mod 4) ⟹ y even; not (x ≡ y ≢ 0 mod 3). Equivalently the trace residues lie in the 8-element set H₄ = {(0,·), (2,0), (2,2), (1,3), (3,1)} mod 4 and avoid ±φ² mod 3. Status: proved by exact closure (COMPUTED HERE, one hand). *Falsifier:* any group element with a trace in a missed residue. *Test:* recompute the mod-4 and mod-3 images on the second instrument (impl-a's closure code); census control 0 violations at depth 12 and in the trace-complete set. → candidate L-3/L-4 after the pair agrees.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` §10, l. 246

> COMPUTED HERE by breadth-first closure of S̄, R̄ in SL(2, ℤ[φ]/n), tracked with k mod 2 (`python3 images.py n`, `python3 lifts.py 2 4`, `python3 lifts.py 3 2`, `python3 img_trace_only.py 7|11`); exact; the set of realized trace residues of the image IS the set of trace residues of G(5) mod n (the image is the image). Image orders in SL (PSL = half):
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` §2.3, l. 95

> **The two congruence laws (proved by exact finite closure, three codes).** For the normalized (x, y): (mod 4) the residue (x mod 4, y mod 4) lies in the 8-element set H₄ = {(0,0), (0,1), (0,2), (0,3), (2,0), (2,2), (1,3), (3,1)} — equivalently: x odd ⟹ y odd and x + y ≡ 0 (mod 4); x ≡ 2 (mod 4) ⟹ y even; (mod 3) never x ≡ y ≢ 0 (mod 3). Admissible residue density (8/16)(7/9) = 7/18. "Admissible" below means: in the sector AND residue in H₄ AND not (x ≡ y ≢ 0 mod 3).
>
> — `Claude-Papers/No1-G5/phase-2/PHASE-2-DEFINITIONS.md` §1, l. 15

> Mod 4: k even and y even ⟹ (x, y) ≡ (2, 0) mod 4; y odd ⟹ x ≡ 0 or −y mod 4 (the second clause by finite image computation only).
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` row AM-4, l. 16, the statement cell (a verbatim substring of the row)

> - **The non-hyperbolic traces.**
>   - Elliptic: 0 (±S), and ±φ, ±φ⁻¹ (±R^a, from the table in §1).
>   - Identity and parabolic: ±2.
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` §4, l. 73–75

The charter (pointers, not the authority; they fix what is word-level and what is group-level):

> - **2026-10-30T10:26:51Z — scope note from V₁-U6 (not a defect):** the lane carries the mod-4 and mod-3 laws at the WORD level (U6); the rows G5-M4 and G5-M3 say "every trace" of G(5), and the group-level leg follows from U7's normal-form existence plus the elliptic traces (0, ±φ, ±φ⁻¹, ±2 — all inside H₄ and outside the mod-3 exclusion). If the paper prints the group-level law, that leg enters as a NEW unit (§3). The §2 note 3 erratum of 10:18:27Z also covers the state-count parentheses in the G5-M4 and G5-M3 Lean-notes cells ("320 matrices × parity", "240 states"); the record's orders are 320 and 120.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` §4 l. 47 (the 10:26:51Z scope note — the charter's ground, a pointer, not the authority)

> - **2026-10-30T10:29:26Z — coverage decision (V₁-U2's flag, V₁-U6's note; decided by the orchestrator as the lane's structuring, not a change of any statement):** the group-level main clauses of G5-L2 ("no ELEMENT of G(5) has trace with x odd and y even"), G5-M4 and G5-M3 ("every trace" of G(5)) are on no unit — U2 and U6 state them over words, U7's INTa carries only L-2's "in particular". They enter as a NEW unit **U8 — the group-level legs**: from U7's normal-form existence (`g5_u7_nf`) and the word theorems, plus the traces of ±I, ±S, ±R^a (0, ±2, ±φ, ±φ⁻¹ — none with x odd and y even; all inside H₄ and outside the mod-3 exclusion), the three group-level statements. M-U8 dispatches when V₁-U7 has signed the NF row; its specs cite U2's, U6's and U7's names as frozen. The word-level rows stand as they are.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` §4 l. 48 (the 10:29:26Z coverage decision — this unit's charter, a pointer, not the authority)

## 3 · Formal reading

- **The law in its H₄ form**, exactly as U6's word leg writes it: `red4 t ∈ H4` with t = `(g : M2).trace`, U6's `ZPhi.red4 t = ((t.x : ZMod 4), (t.y : ZMod 4))` (pairs only) and U6's `G5.H4` = {(0,0), (0,1), (0,2), (0,3), (2,0), (2,2), (1,3), (3,1)} (PHASE-2-DEFINITIONS l. 15). The record's D-2 implication form (DO l. 118–120, l. 246: x odd ⟹ y odd and x + y ≡ 0; x ≡ 2 ⟹ y even) is "equivalently" the H₄ form by a finite check on the sixteen residues (DO l. 246, PHASE-2-DEFINITIONS l. 15); the statement carries the H₄ form only, as U6's `g5_u6_m4b` does.
- **"Every trace of G(5)"** (DO l. 246, AM l. 95: "the set of realized trace residues of the image IS the set of trace residues of G(5) mod n"): every element of ⟨S, T⟩, inclusion only (no claim that all eight residues are realized).
- **Normalized vs literal.** PHASE-2-DEFINITIONS l. 15 states the law for "the normalized (x, y)"; DO l. 246 for "every trace x + yφ of G(5)". H₄ is closed under negation ((1,3) ↔ (3,1), the rest fixed; checked, `ell_check.py`), so the literal SL trace of every element is the same statement.
- **The non-word forms** (own arithmetic): red4 of ±⟨2, 0⟩ = (2, 0); ⟨0, 0⟩; ±⟨0, 1⟩ = (0, 1), (0, 3); ⟨−1, 1⟩ = (3, 1); ⟨1, −1⟩ = (1, 3) — all in H₄.
- **The word leg:** U6's `g5_u6_m4b (w) (hw : IsWord w) : red4 (W w).trace ∈ H4`, frozen (d576229b), for ±W w with H₄'s sign-closure.
- **The group.** U7's `HeckeGrp : Subgroup M2ˣ` (the closure of the units whose underlying matrices are U1's literal `S`, `T`; frozen, V1/V2-GREEN as the record's ⟨S, T⟩ ⊂ SL(2, ℤ[φ])); an element is `g : M2ˣ` with `hg : g ∈ HeckeGrp`, its matrix the coercion `(g : M2)` (`Units.val`), its trace `(g : M2).trace : ZPhi` (`Matrix.trace`). **Every element, not every class** (second head l. 72): no conjugacy appears in the statement; conjugacy is the proof route.
- **The ring.** U1's `ZPhi`, pairs `⟨x, y⟩ = x + y φ`, product (x, y)(u, v) = (xu + yv, xv + yu + yv); `.x` and `.y` are the coordinates (U1's structure fields; `phiCoeff t = t.y`). σ and the real order are not read by this row.
- **SL, the literal lift** (STATEMENTS.md §2 note 2; AM §4 gap 2, l. 187: the mod-4 reduction is not defined on PSL, so the statement quantifies over the literal SL element and is sign-symmetric by H₄'s closure under negation).
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
Int.cast_neg	FOUND Int Mathlib/Data/Int/Cast/Basic.lean:84
Finset.mem_insert	FOUND Finset Mathlib/Data/Finset/Insert.lean:366
Finset.mem_singleton	FOUND Finset Mathlib/Data/Finset/Insert.lean:74
```

- All FOUND. Targeted by the statement: `Matrix.trace` (with U6's `red4`, `H4` — `Finset (ZMod 4 × ZMod 4)` membership, `Finset.mem_insert`/`Finset.mem_singleton` the unfolding). Proof aids: the conjugation lemmas, `Matrix.trace_neg`, `Int.cast_neg` for red4 of a negative.
- U6's `ZPhi.red3` is not used by any U8 statement (M3G uses U6's `Int.ModEq` form, as `g5_u6_m3b` does).
- No row is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for every unit g of `M2` lying in ⟨S, T⟩, the residue (x mod 4, y mod 4) of the trace x + yφ of its matrix lies in H₄.

Probe: `<scratchpad>/M-U8/probe.lean` (`import Mathlib` and the four frozen Challenge imports, then `open G5 ZPhi`, `namespace G5`, this unit's five theorems `:= by sorry`, `end G5`; sha256 in `_UNIT-U8.md`). **NOT RUN by this seat** (the brief: no `lake` command of any kind); the orchestrator elaborates it and returns any error to the row. The block below sits inside `namespace G5` after `open G5 ZPhi`, and is the probe's text byte for byte.

```lean
/-- G5-U8-M4G. The trace of every element of `⟨S, T⟩` lies in `H₄` mod 4.
Locus: DO §3.2 (l. 118–120) and §10 D-2 (l. 246); AM §2.3 (l. 95);
PHASE-2-DEFINITIONS §1 (l. 15). STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u8_m4g (g : M2ˣ) (hg : g ∈ HeckeGrp) : red4 (g : M2).trace ∈ H4 := by sorry
```

## 6 · What the row does not claim

- Not the ledger's k-form (row AM-4: "k even and y even ⟹ (x, y) ≡ (2, 0) mod 4; y odd ⟹ x ≡ 0 or −y"): k, the syllable count, is a word datum and not a class invariant (AM §4 gap 4, l. 189); that form is U6's word-level `g5_u6_m4d`, not lifted.
- Not the norm form (y odd ⟹ N(t) ≡ 3 mod 4; U6's `g5_u6_m4c`, word level) and not the image order 320 (U6's `g5_u6_m4a`); neither is lifted to the group here.
- Not the D-2 implication form as a separate statement (equivalent to the H₄ form by a sixteen-residue check, §3).
- No realization claim: that every residue of H₄ occurs is not stated.
- The character proof (SH-P2-1 item 5) is the paper's register, not a statement here.

## 7 · Status

SPEC-DRAFT 2026-10-30T11:09:14Z

V1: V1-GREEN 2026-10-30T11:28:12Z — "Every trace x + yφ of G(5) satisfies …; equivalently the trace residues lie in … H₄ mod 4" (DO l. 246; PHASE-2-DEFINITIONS l. 15), stated as `red4 (g : M2).trace ∈ H4` over every unit of `HeckeGrp`, inclusion only. U6's `ZPhi.red4` and `G5.H4` are used in U6's sense (the eight residues of l. 15), and the form is `g5_u6_m4b`'s, so the word leg composes verbatim. The D-2 clause form is the same set (own 16-residue check: x even with x ≢ 2, any y; x ≡ 2 with y even; x odd with y odd and x + y ≡ 0 gives exactly H₄). Normalized (l. 15) vs "every trace" (DO l. 246) vs the literal SL lift: these agree because H₄ is closed under negation ((0,1) ↔ (0,3), (1,3) ↔ (3,1), the rest fixed; checked). I agree the H₄ form alone is the group-level clause. The ledger's k-form (AM-4) needs k, which a group element carries only through a character the lane does not define (AM gap 4, l. 189), so it stays word level as `g5_u6_m4d`. The norm form (y odd ⟹ N ≡ 3 mod 4) is k-free, so the k reason does not apply to it, but it is the y-odd half of the H₄ form by a residue check (own check: for y odd, residue in H₄ ⟺ N ≡ 3 mod 4), so it is not lost. The unit summary gives the k reason for both forms; only the k-form takes it. The spec's §6 is correct. Own arithmetic: every NF non-word residue (2,0), (0,0), (0,1), (0,3), (3,1), (1,3) is in H₄. Locus slip, pointer only: "STATEMENTS.md row G5-M4 (l. 18)" is G5-LAD's line; G5-M4 is l. 20. The quoted loci are right and no Lean text carries the number, so the GREEN stands across the fix. §2: 8 cites verbatim (7 exact; LEDGER l. 16 a verbatim substring). Parse: 0 Lean line(s) over 100 code points

*Pointer corrected 2026-10-30T11:31Z by the orchestrator at V₁-U8's note: the STATEMENTS.md row line was two early (G5-M4 (l. 18) → G5-M4 (l. 20)); the quoted loci were right; no Lean text carries the number; the `locus:` header line itself corrected at 2026-10-30T11:35:14Z (V₁ re-sign note).*

V2: V2-GREEN 2026-10-30T11:44:57Z — `g5_u8_m4g` says what the record says: "Every trace x + yφ of G(5) satisfies … equivalently the trace residues lie in … H₄ mod 4" (DO l. 246; PHASE-2-DEFINITIONS l. 15; STATEMENTS.md row G5-M4 l. 20 "every trace"), stated as `red4 (g : M2).trace ∈ H4` on every element of `HeckeGrp`. It claims inclusion only. U6's `ZPhi.red4` and `G5.H4` are used in U6's sense (the eight residues of l. 15). The record's D-2 clause form gives the same sixteen-residue set (own check). The normalized (l. 15), "every trace" (l. 246) and literal-SL readings agree because H₄ is closed under negation (own check). It is not vacuous: a unit with trace ⟨3, 0⟩ reduces to (3, 0) ∉ H₄. The theorem text is byte-identical to §5 (script).

*Erratum appended 2026-10-30T11:56:57Z by Orchestrator A: the Probe line reads "this unit's five theorems"; after V₁-U8 struck `g5_u8_ell_inv` (11:3xZ) the unit holds FOUR theorems (`g5_u8_ell`, `g5_u8_l2g`, `g5_u8_m4g`, `g5_u8_m3g`); the frozen Challenge (`bf7316f7…`) carries four. Wording only.*
