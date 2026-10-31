import Mathlib
import G5.Ring.Solution
import G5.Group.Solution
import G5.GroupLevel.Solution

/-!
# Unit U17 (`G5/TraceSet`) — the trace set's sign-symmetry and `±φ⁻¹` (rows G5-TSYM,
G5-PHIINV): proofs

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Statements: `G5/TraceSet/Challenge.lean` (sha256 prefix `b429cfc8`), two theorems under the
same names and statement texts, byte for byte. U17 defines nothing; this module imports the
proved preludes `G5.Ring.Solution`, `G5.Group.Solution` and `G5.GroupLevel.Solution` (the
prelude rule for dependent units) and restates nothing.
Method: unit U7's device — the units of `S` and `T` in `M2ˣ`, members of `⟨S, T⟩` by
`Subgroup.subset_closure`, and `R^a` as the unit `(T S)^a` — restated here privately.
TSYM: `S² = −I`, so `h := S S g` has matrix `−g` and `tr h = −tr g` (`Matrix.trace_neg`).
PHIINV: `R²` and `R³` have traces `⟨−1, 1⟩` and `⟨1, −1⟩` (unit U8's `g5_u8_ell`).
-/

open G5 ZPhi

namespace G5

/-- Helper: `S² = −I`. -/
private theorem g5_u17_aux_SS : S * S = -1 := by decide

/-- Helper: the unit `S`. -/
private def g5_u17_aux_uS : M2ˣ := ⟨S, -S, by decide, by decide⟩

/-- Helper: the unit `T`. -/
private def g5_u17_aux_uT : M2ˣ := ⟨T, -(S * R ^ 4), by decide, by decide⟩

/-- Helper: the unit `S` lies in `⟨S, T⟩`. -/
private theorem g5_u17_aux_uS_mem : g5_u17_aux_uS ∈ HeckeGrp :=
  Subgroup.subset_closure (Or.inl rfl)

/-- Helper: the unit `T` lies in `⟨S, T⟩`. -/
private theorem g5_u17_aux_uT_mem : g5_u17_aux_uT ∈ HeckeGrp :=
  Subgroup.subset_closure (Or.inr rfl)

/-- Helper: the unit `R^a = (T S)^a` lies in `⟨S, T⟩`. -/
private theorem g5_u17_aux_uR_pow_mem (a : ℕ) :
    (g5_u17_aux_uT * g5_u17_aux_uS) ^ a ∈ HeckeGrp :=
  pow_mem (mul_mem g5_u17_aux_uT_mem g5_u17_aux_uS_mem) a

/-- Helper: the unit `(T S)^a` has matrix `R^a`. -/
private theorem g5_u17_aux_uR_pow (a : ℕ) :
    (((g5_u17_aux_uT * g5_u17_aux_uS) ^ a : M2ˣ) : M2) = R ^ a := by
  rw [Units.val_pow_eq_pow_val]
  rfl


/-- G5-TSYM (the sign-symmetry of the trace set). For every element `g` of `⟨S, T⟩` there is
an element `h` of `⟨S, T⟩` with `tr h = −tr g`: the set of literal traces is symmetric under
`t ↦ −t`.
Locus: `candidates/checks/AM-1-second-head.md` §4 "Every element, not only every class"
(l. 72); the print `phase-4/draft/S2-preliminaries.md` §2.1 (l. 66–68).
STATEMENTS.md sha256 prefix `9ebf3004`. -/
theorem g5_u17_tsym (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    ∃ h ∈ HeckeGrp, (h : M2).trace = -(g : M2).trace := by
  refine ⟨g5_u17_aux_uS * g5_u17_aux_uS * g,
    mul_mem (mul_mem g5_u17_aux_uS_mem g5_u17_aux_uS_mem) hg, ?_⟩
  change (S * S * (g : M2)).trace = _
  rw [g5_u17_aux_SS, neg_one_mul, Matrix.trace_neg]

/-- G5-PHIINV (`±φ⁻¹` realized). Each of `φ⁻¹` and `−φ⁻¹` — the pairs `⟨−1, 1⟩ = φ − 1` and
`⟨1, −1⟩ = 1 − φ` — is the trace of some element of `⟨S, T⟩`.
Locus: `candidates/checks/AM-1-second-head.md` §1 table (l. 26) and §4 "The non-hyperbolic
traces" (l. 73–74); the print `phase-4/draft/S2-preliminaries.md` Prop. 2.5 (l. 196–199),
l. 210–212, and `phase-4/draft/S3-theorem-a.md` l. 51–53.
STATEMENTS.md sha256 prefix `9ebf3004`. -/
theorem g5_u17_phiinv (t : ZPhi)
    (ht : t = (⟨-1, 1⟩ : ZPhi) ∨ t = (⟨1, -1⟩ : ZPhi)) :
    ∃ g ∈ HeckeGrp, (g : M2).trace = t := by
  rcases ht with rfl | rfl
  · refine ⟨(g5_u17_aux_uT * g5_u17_aux_uS) ^ 2, g5_u17_aux_uR_pow_mem 2, ?_⟩
    rw [g5_u17_aux_uR_pow]
    exact g5_u8_ell.2.2.2.1
  · refine ⟨(g5_u17_aux_uT * g5_u17_aux_uS) ^ 3, g5_u17_aux_uR_pow_mem 3, ?_⟩
    rw [g5_u17_aux_uR_pow]
    exact g5_u8_ell.2.2.2.2.1

end G5
