# G5-U8-ELL

## 1 · Header

row: G5-U8-ELL
unit: U8
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: e0df0f356a20456e8b9a9cfdd816c41ee3d010642acc684a43bc4193c36733bf (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T11:00:47Z; §4 Errata included — this is the digest the brief names)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U7 `G5.Group.Challenge` 689c36e6c026a1ce151dd2ab84243a5f8f76bb20a11304c9065cdb358ed410ae · U2 `G5.ModTwo.Challenge` c342ab92ba8ef07e5a9fba82422968b9de4410974583210dc1dcded53354c78c · U6 `G5.Congruence.Challenge` d576229b23afb62ac8beb64cd32f0ca753d5564ca4839eab90b55cf769aac532 (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-30T11:01Z matches)
locus: `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` §1 table rows "R = TS" (l. 21) and "tr R^a, a = 1..4" (l. 26), §4 "The non-hyperbolic traces" (l. 73–76); AM §3.2 proof, last sentence (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 130); STATEMENTS.md §4 entries 10:26:51Z (l. 47) and 10:29:26Z (l. 48) (pointers — the charter); the brief's "elliptic traces as a lemma leg"
spec_clock: 2026-10-30T11:08:51Z

## 2 · Printed statement, verbatim

> | R = TS | [[φ, −1], [1, 0]] |
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` §1 table, l. 21

> | tr R^a, a = 1..4 | φ, φ − 1 = φ⁻¹, 1 − φ = −φ⁻¹, −φ |
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` §1 table, l. 26

> - **The non-hyperbolic traces.**
>   - Elliptic: 0 (±S), and ±φ, ±φ⁻¹ (±R^a, from the table in §1).
>   - Identity and parabolic: ±2.
>   - Of these, only 0 and ±2 are integers.
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` §4, l. 73–76

> Finally every element of G(5) is conjugate to ±I, ±S, ±R^a (traces ±2, 0, ±φ, ±φ⁻¹) or to ± a cyclic word R^{a₁}S⋯R^{a_k}S with a_i ∈ {1, …, 4} — which follows from S² = −I and R⁵ = −I by cyclic reduction, without the uniqueness of the normal form — and the trace is a class function; the integers among {0, ±φ, ±φ⁻¹, ±2} are {0, ±2}. ∎
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` §3.2 proof, l. 130 (the last sentence, a verbatim substring)

The charter (pointers, not the authority; they fix what is word-level and what is group-level):

> - **2026-10-30T10:26:51Z — scope note from V₁-U6 (not a defect):** the lane carries the mod-4 and mod-3 laws at the WORD level (U6); the rows G5-M4 and G5-M3 say "every trace" of G(5), and the group-level leg follows from U7's normal-form existence plus the elliptic traces (0, ±φ, ±φ⁻¹, ±2 — all inside H₄ and outside the mod-3 exclusion). If the paper prints the group-level law, that leg enters as a NEW unit (§3). The §2 note 3 erratum of 10:18:27Z also covers the state-count parentheses in the G5-M4 and G5-M3 Lean-notes cells ("320 matrices × parity", "240 states"); the record's orders are 320 and 120.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` §4 l. 47 (the 10:26:51Z scope note — the charter's ground, a pointer, not the authority)

> - **2026-10-30T10:29:26Z — coverage decision (V₁-U2's flag, V₁-U6's note; decided by the orchestrator as the lane's structuring, not a change of any statement):** the group-level main clauses of G5-L2 ("no ELEMENT of G(5) has trace with x odd and y even"), G5-M4 and G5-M3 ("every trace" of G(5)) are on no unit — U2 and U6 state them over words, U7's INTa carries only L-2's "in particular". They enter as a NEW unit **U8 — the group-level legs**: from U7's normal-form existence (`g5_u7_nf`) and the word theorems, plus the traces of ±I, ±S, ±R^a (0, ±2, ±φ, ±φ⁻¹ — none with x odd and y even; all inside H₄ and outside the mod-3 exclusion), the three group-level statements. M-U8 dispatches when V₁-U7 has signed the NF row; its specs cite U2's, U6's and U7's names as frozen. The word-level rows stand as they are.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` §4 l. 48 (the 10:29:26Z coverage decision — this unit's charter, a pointer, not the authority)

## 3 · Formal reading

- **The forms and their literal matrices** (U1, U7's `IsNF`): `1 : M2` (I), U1's `S = !![0, -1; 1, 0]`, `R ^ a` for a = 1, 2, 3, 4 with U1's `R = T * S` (the record's R = TS = [[φ, −1], [1, 0]], second head l. 21) and the monoid power of `M2` — written `R ^ 1`, not `R`, so the forms read exactly as `IsNF` writes them (`m = R ^ a`).
- **The values, computed exactly in the pair ring** (own pair arithmetic, `<scratchpad>/M-U8/ell_check.py`, run 11:05:12Z): R² = [[φ, −φ], [φ, −1]], R³ = [[1, −φ], [φ, −φ]], R⁴ = [[0, −1], [1, −φ]]; tr I = ⟨2, 0⟩, tr S = ⟨0, 0⟩, tr R = ⟨0, 1⟩ (φ), tr R² = ⟨−1, 1⟩ (φ − 1), tr R³ = ⟨1, −1⟩ (1 − φ), tr R⁴ = ⟨0, −1⟩ (−φ) — the record's table l. 26 in order; and tr R⁵ = ⟨−2, 0⟩ (R⁵ = −I, U1's `g5_u1_r5`, not restated).
- **φ⁻¹.** The pair ring carries no inverse operation by name; the table's "φ − 1 = φ⁻¹" is read as the VALUE ⟨−1, 1⟩ = φ − 1 only — the identity φ · (φ − 1) = 1 (φ² = φ + 1) is NOT carried on U8 (struck at V₁-U8's word, 2026-10-30T11:28:12Z: it is one of V₃-U1's uncarried statements and the wall's scope; no leg uses it).
- **The signed forms** (−I, −S, −R^a): their traces are the negatives by `Matrix.trace_neg`; the record's "±" (l. 74–75) is carried by that mathlib lemma at the legs, not restated here.
- **Elliptic, parabolic, identity** are the record's names for these traces (l. 74–75); no predicate "elliptic" is defined or stated.

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
Matrix.trace_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:220
Matrix.trace_one	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:146
Matrix.trace_neg	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:136
pow_succ	FOUND _root_ Mathlib/Algebra/Group/Defs.lean:696
pow_one	FOUND _root_ Mathlib/Algebra/Group/Defs.lean:700
```

- All six FOUND. Proof aids, not targeted by the statement: `Matrix.trace_fin_two` (tr of a 2 × 2 = A 0 0 + A 1 1), `pow_succ`, `pow_one`; the whole theorem is closed terms over a type with `DecidableEq`, so `decide` or `rfl` after unfolding U1's `R`, `T`, `S` is the expected proof (an L seat concern).
- `Matrix.trace_neg` is cited by the three legs for the signed forms.
- No row is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: the trace of the identity of `M2` is ⟨2, 0⟩ = 2, the trace of `S` is 0, and the traces of `R ^ 1`, `R ^ 2`, `R ^ 3`, `R ^ 4` are ⟨0, 1⟩ = φ, ⟨−1, 1⟩ = φ − 1, ⟨1, −1⟩ = 1 − φ, ⟨0, −1⟩ = −φ. (The table's φ − 1 = φ⁻¹ is carried as the value ⟨−1, 1⟩ only; the identity φ · (φ − 1) = 1 is struck — V₁-U8.)

Probe: `<scratchpad>/M-U8/probe.lean` (`import Mathlib` and the four frozen Challenge imports, then `open G5 ZPhi`, `namespace G5`, this unit's four theorems (five before the strike) `:= by sorry`, `end G5`; sha256 in `_UNIT-U8.md`). **NOT RUN by this seat** (the brief: no `lake` command of any kind); the orchestrator elaborates it and returns any error to the row. The block below sits inside `namespace G5` after `open G5 ZPhi`, and is the probe's text byte for byte.

```lean
/-- G5-U8-ELL. The traces of the non-word forms: `tr I = 2`, `tr S = 0`, and `tr R^a`
for `a = 1, 2, 3, 4` is `φ`, `φ − 1`, `1 − φ`, `−φ` (pairs `⟨x, y⟩ = x + y φ`).
Locus: `candidates/checks/AM-1-second-head.md` §1 table (l. 21, l. 26) and §4 (l. 73–76).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u8_ell :
    (1 : M2).trace = (⟨2, 0⟩ : ZPhi) ∧ S.trace = 0 ∧
      (R ^ 1).trace = (⟨0, 1⟩ : ZPhi) ∧ (R ^ 2).trace = (⟨-1, 1⟩ : ZPhi) ∧
      (R ^ 3).trace = (⟨1, -1⟩ : ZPhi) ∧ (R ^ 4).trace = (⟨0, -1⟩ : ZPhi) := by sorry

```

## 6 · What the row does not claim

- No classification of elements into elliptic / parabolic / hyperbolic, no order of R ("R of order 10" is V₃-U1's uncarried statement, offered, not specced), no claim that these are ALL the elliptic or parabolic traces of G(5).
- Nothing about T or the parabolic elements' traces beyond the forms ±I (the record's "±2 from the identity and the parabolic elements", l. 267, is not stated: U8's forms are `IsNF`'s, and T itself is the word form −W (1) — R S = −T, second head l. 61 — a word-leg fact, not this row's).
- No statement about −I, −S, −R^a (carried by `Matrix.trace_neg` at the legs).
- No inverse operation on `ZPhi` is defined; "φ⁻¹" is read only as the value ⟨−1, 1⟩ = φ − 1 in `g5_u8_ell`; the identity φ · (φ − 1) = 1 is not on U8 (struck 2026-10-30T11:31Z at V₁-U8's word; the wall's scope per V₃-U1).

## 7 · Status

SPEC-DRAFT 2026-10-30T11:08:51Z

V1: V1-DRIFT 2026-10-30T11:28:12Z — `g5_u8_ell` is faithful and stands as written: the six values match the second head's table l. 21 and l. 26 and §4 l. 73–75 (own pair arithmetic: tr I = ⟨2, 0⟩, tr S = 0, tr R^a = ⟨0, 1⟩, ⟨−1, 1⟩, ⟨1, −1⟩, ⟨0, −1⟩ for a = 1..4, the table's φ, φ − 1, 1 − φ, −φ in order; R = TS = [[φ, −1], [1, 0]]); U1's `S`, `R` = `T * S`, `M2`, `ZPhi` in U1's sense; the spelling `R ^ 1` meets U7's `IsNF` (`m = R ^ a`) literally; the ± forms are left to `Matrix.trace_neg`, which the record's "±" needs and nothing more. The DRIFT is `g5_u8_ell_inv` alone, which should be struck. As a reading of "φ − 1 = φ⁻¹" it is fair (in a commutative ring φ · (φ − 1) = 1 says exactly that φ − 1 is φ's inverse). But its content is the identity φ · (φ − 1) = 1 (equivalently φ² = φ + 1), and V₃-U1 lists both as uncarried statements left to the wall's scope (`_V3-U1.md` l. 49 "φ² = φ + 1"; l. 50 "… and φ · (φ − 1) = 1 are not stated"). The charter (STATEMENTS.md §4 l. 48) routes only the TRACES of ±I, ±S, ±R^a to U8, and no leg uses the theorem. Keeping it would carry the wall's uncarried statement into U8, so the spec is stronger than its charter. The fix is mechanical: strike the second theorem (its §3 bullet "φ⁻¹", its clause in §5's prose and its §5 block, and the probe's l. 22–25); `g5_u8_ell` needs no change. The integer sentence of l. 76 ("only 0 and ±2 are integers") is decided by the stated values; its group-level form is U7's INTa, so nothing is dropped. §2: 6 cites, every one verbatim (5 exact, AM l. 130 a verbatim substring). Parse: 0 Lean line(s) over 100 code points

V1: V1-GREEN 2026-10-30T11:34:32Z — re-signed on the struck spec. `g5_u8_ell`'s §5 block is byte-identical to the block I signed at 11:28:12Z (script: equal to the old text plus one trailing blank line inside the fence). It is a byte-for-byte substring of the struck probe (sha256 34bf2bc2…161e, four theorems: `g5_u8_ell`, `g5_u8_l2g`, `g5_u8_m4g`, `g5_u8_m3g`; no `g5_u8_ell_inv`). It is faithful as I found it: the six values are the table's (second head l. 21, l. 26, §4 l. 73–75) in U1's names and U7's `IsNF` spelling. The struck theorem is gone from §5. The §3 bullet now reads "φ⁻¹" as the value ⟨−1, 1⟩ = φ − 1 only, which is the table's left-hand form and exactly what `g5_u8_ell` states. The §5 prose and §6's last line say the identity φ · (φ − 1) = 1 is not on U8. That matches the charter (traces only) and leaves V₃-U1's uncarried item with the wall. Nothing else changed: §1, §2 (6 cites, still verbatim), §4, and the other §3 and §6 bullets are as I read them. Two cosmetic residues, not verdict-bearing: §5's probe sentence (l. 73) still says "this unit's four theorems (five before the strike)" where the probe now holds four; §6's last line stamps the strike "11:3xZ". Parse: 0 Lean line(s) over 100 code points
