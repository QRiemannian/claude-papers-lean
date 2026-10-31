import Mathlib
import G5.Ring.Solution
import G5.Group.Solution
import G5.Sector.Solution
import G5.WordLevel.Solution
import G5.SectorGroup.Solution

/-!
# Unit U16 (`G5/ClassSep`) — Cor. 3.7 at element level (row G5-CSEP): proofs

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Statements: `G5/ClassSep/Challenge.lean` (sha256 prefix `2021ed56`), two theorems under the
same names and statement texts, byte for byte. U16 defines nothing; this module imports the
proved preludes `G5.Ring.Solution`, `G5.Group.Solution`, `G5.Sector.Solution`,
`G5.WordLevel.Solution` and `G5.SectorGroup.Solution` (the prelude rule for dependent units)
and restates nothing.
Method: unit U3's separation (`g5_u3_sep_lin`, `g5_u3_sep_sq`) is pure ring arithmetic in the
trace `t` under `1 ≤ t.y`; its private helpers are restated here in a free variable
`t : ZPhi` (`t − t^σ = ⟨−y, 2y⟩`, its square `⟨5y², 0⟩`, the order on the components) and
applied at `t := rabs (tr g)`, with `1 ≤ t.y` the first conjunct of unit U9's `g5_u9_bg_a`.
-/

open G5 ZPhi

namespace G5

/-- Helper: natural-number casts into ℤ[φ] are `⟨n, 0⟩`. -/
private theorem g5_u16_aux_natCast (n : ℕ) : ((n : ℕ) : ZPhi) = ⟨n, 0⟩ := by
  induction n with
  | zero => ext <;> simp
  | succ n ih => rw [Nat.cast_succ, ih]; ext <;> simp

/-- Helper: integer casts into ℤ[φ] are `⟨n, 0⟩`. -/
private theorem g5_u16_aux_intCast (n : ℤ) : ((n : ℤ) : ZPhi) = ⟨n, 0⟩ := by
  cases n with
  | ofNat n => rw [Int.ofNat_eq_natCast, Int.cast_natCast, g5_u16_aux_natCast]
  | negSucc n =>
    rw [Int.cast_negSucc, g5_u16_aux_natCast]
    ext <;> simp [Int.negSucc_eq]

/-- Helper: the numeral `2` of ℤ[φ] is `⟨2, 0⟩`. -/
private theorem g5_u16_aux_two : (2 : ZPhi) = ⟨2, 0⟩ := by
  rw [← Nat.cast_ofNat, g5_u16_aux_natCast]; rfl

/-- Helper: the numeral `5` of ℤ[φ] is `⟨5, 0⟩`. -/
private theorem g5_u16_aux_five : (5 : ZPhi) = ⟨5, 0⟩ := by
  rw [← Nat.cast_ofNat, g5_u16_aux_natCast]; rfl

/-- Helper: `t − t^σ = ⟨−y, 2y⟩` (that is, `y √5` with `√5 = 2φ − 1 = ⟨−1, 2⟩`). -/
private theorem g5_u16_aux_diff (t : ZPhi) : t - conj t = ⟨-t.y, 2 * t.y⟩ := by
  ext <;> simp [conj]
  ring

/-- Helper (U3's `g5_u3_sep_lin` in a free variable): for `1 ≤ t.y`,
`t − t^σ = y • (2φ − 1)` and `2φ − 1 ≤ t − t^σ`. -/
private theorem g5_u16_aux_lin (t : ZPhi) (hy : 1 ≤ t.y) :
    t - conj t = t.y • (2 * phi - 1) ∧ 2 * phi - 1 ≤ t - conj t := by
  rw [g5_u16_aux_diff]
  refine ⟨?_, ?_⟩
  · rw [zsmul_eq_mul, g5_u16_aux_intCast, g5_u16_aux_two]
    ext <;> simp [phi]
    ring
  · change RealNonneg (_ - _)
    rw [g5_u16_aux_two]
    unfold RealNonneg NonnegAB5
    left
    simp [phi]
    omega

/-- Helper (U3's `g5_u3_sep_sq` in a free variable): for `1 ≤ t.y`,
`(t − t^σ)² = ⟨5 y², 0⟩` and `5 ≤ (t − t^σ)²`. -/
private theorem g5_u16_aux_sq (t : ZPhi) (hy : 1 ≤ t.y) :
    (t - conj t) ^ 2 = (⟨5 * t.y ^ 2, 0⟩ : ZPhi) ∧ (5 : ZPhi) ≤ (t - conj t) ^ 2 := by
  rw [g5_u16_aux_diff]
  have e : (⟨-t.y, 2 * t.y⟩ : ZPhi) ^ 2 = ⟨5 * t.y ^ 2, 0⟩ := by
    rw [sq]
    ext <;> simp <;> ring
  refine ⟨e, ?_⟩
  change RealNonneg (_ - _)
  rw [e, g5_u16_aux_five]
  unfold RealNonneg NonnegAB5
  left
  refine ⟨?_, ?_⟩ <;> simp only [sub_x, sub_y] <;> nlinarith


/-- G5-CSEPa (Cor. 3.7 at element level, the linear clause). Every hyperbolic element `g` of
`⟨S, T⟩` (`|tr g| > 2` in the real order) has, with its normalized trace `t = |tr g|`,
`t − t^σ = y √5 ≥ √5`, `y` the φ-coefficient of `t` and `√5` the ring element `2φ − 1`.
Locus: TA transcript §1 "E2, sharpened" (l. 49); DO transcript §1.3 (l. 47);
`candidates/checks/SH-P2-1-sector-ladder-pruning.md` §4 (l. 197–200);
STATEMENTS.md row G5-SEP (l. 22). STATEMENTS.md sha256 prefix `9ebf3004`. -/
theorem g5_u16_csep_lin (g : M2ˣ) (hg : g ∈ HeckeGrp) (hh : 2 < rabs (g : M2).trace) :
    rabs (g : M2).trace - conj (rabs (g : M2).trace) =
        (rabs (g : M2).trace).y • (2 * phi - 1) ∧
      2 * phi - 1 ≤ rabs (g : M2).trace - conj (rabs (g : M2).trace) :=
  g5_u16_aux_lin _ (g5_u9_bg_a g hg hh).1

/-- G5-CSEPb (Cor. 3.7 at element level, the distance clause, squared). Every hyperbolic
element `g` of `⟨S, T⟩` (`|tr g| > 2` in the real order) has, with its normalized trace
`t = |tr g|`, `(t − t^σ)² = 5 y² ≥ 5`: the point `(t, t^σ)` lies at distance
`|t − t^σ| / √2 ≥ √(5/2)` from the diagonal of `ℝ²`, stated in the ring without `√`.
Locus: TA transcript §1 "E2, sharpened" (l. 49); DO transcript §1.3 (l. 47);
`candidates/checks/SH-P2-1-sector-ladder-pruning.md` §4 (l. 200);
STATEMENTS.md row G5-SEP (l. 22). STATEMENTS.md sha256 prefix `9ebf3004`. -/
theorem g5_u16_csep_sq (g : M2ˣ) (hg : g ∈ HeckeGrp) (hh : 2 < rabs (g : M2).trace) :
    (rabs (g : M2).trace - conj (rabs (g : M2).trace)) ^ 2 =
        (⟨5 * (rabs (g : M2).trace).y ^ 2, 0⟩ : ZPhi) ∧
      (5 : ZPhi) ≤ (rabs (g : M2).trace - conj (rabs (g : M2).trace)) ^ 2 :=
  g5_u16_aux_sq _ (g5_u9_bg_a g hg hh).1

end G5
