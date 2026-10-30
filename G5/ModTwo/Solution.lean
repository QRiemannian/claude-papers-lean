import Mathlib
import G5.Ring.Solution

/-!
# Unit U2 (`G5/ModTwo`) — L-1, L-2 and the mod-2 closure: proofs

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
The statements are `G5/ModTwo/Challenge.lean` (sha256 prefix `c342ab92`); this module does not
import it. It imports the proved U1 prelude `G5.Ring.Solution` and restates the G5-U2-MOD2
block byte for byte, then proves the nine theorems under the same names and texts.

Method. `red2` is a ring map (`g5_u2_aux_hom`), so `red2M` is multiplicative and the reduction
of a literal word is the product of its reduced syllables `R̄^a S̄`. Kernel `decide` over the
ten explicit matrices of `D5bar` gives the closure, the products, and the traces; the parity
of the word's length picks the half of `D5bar` (rotations `R̄^j`, reflections `R̄^j S̄`).
-/

open G5 ZPhi

/- G5-U2-MOD2. Locus: AM §4, the L-1 proof (l. 178), gap 3 (l. 188); §2.2 (l. 83);
§2.3 (l. 99); §3.1 (l. 124); STATEMENTS.md §2 note 3 (l. 31).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
/-! Unit U2 — L-1, L-2 and the mod-2 closure (proposed; seat M-U2). -/

namespace G5

/-- 𝔽₄ = ℤ[φ]/2 as pairs mod 2: `⟨x, y⟩` stands for `x + y φ̄`, `φ̄² = φ̄ + 1`. -/
@[ext] structure F4 where
  x : ZMod 2
  y : ZMod 2
deriving DecidableEq

namespace F4

instance instZero : Zero F4 := ⟨⟨0, 0⟩⟩
instance instOne : One F4 := ⟨⟨1, 0⟩⟩
instance instAdd : Add F4 := ⟨fun s t => ⟨s.x + t.x, s.y + t.y⟩⟩
instance instNeg : Neg F4 := ⟨fun s => ⟨-s.x, -s.y⟩⟩
instance instSub : Sub F4 := ⟨fun s t => ⟨s.x - t.x, s.y - t.y⟩⟩
/-- `(x, y)(u, v) = (xu + yv, xv + yu + yv)`: the product of ℤ[φ], read mod 2. -/
instance instMul : Mul F4 :=
  ⟨fun s t => ⟨s.x * t.x + s.y * t.y, s.x * t.y + s.y * t.x + s.y * t.y⟩⟩

lemma zero_x : (0 : F4).x = 0 := rfl
lemma zero_y : (0 : F4).y = 0 := rfl
lemma one_x : (1 : F4).x = 1 := rfl
lemma one_y : (1 : F4).y = 0 := rfl
lemma add_x (s t : F4) : (s + t).x = s.x + t.x := rfl
lemma add_y (s t : F4) : (s + t).y = s.y + t.y := rfl
lemma neg_x (s : F4) : (-s).x = -s.x := rfl
lemma neg_y (s : F4) : (-s).y = -s.y := rfl
lemma sub_x (s t : F4) : (s - t).x = s.x - t.x := rfl
lemma sub_y (s t : F4) : (s - t).y = s.y - t.y := rfl
lemma mul_x (s t : F4) : (s * t).x = s.x * t.x + s.y * t.y := rfl
lemma mul_y (s t : F4) : (s * t).y = s.x * t.y + s.y * t.x + s.y * t.y := rfl

/- The axioms by `simp only` on the field lemmas, then `ring` in `ZMod 2` (a plain `simp`
   would also fire `ZMod.neg_eq_self_mod_two`). -/
instance instCommRing : CommRing F4 where
  add_assoc := by intros; ext <;> simp only [F4.add_x, F4.add_y] <;> ring
  zero_add := by
    intros; ext <;> simp only [F4.add_x, F4.add_y, F4.zero_x, F4.zero_y] <;> ring
  add_zero := by
    intros; ext <;> simp only [F4.add_x, F4.add_y, F4.zero_x, F4.zero_y] <;> ring
  add_comm := by intros; ext <;> simp only [F4.add_x, F4.add_y] <;> ring
  mul_assoc := by intros; ext <;> simp only [F4.mul_x, F4.mul_y] <;> ring
  one_mul := by
    intros; ext <;> simp only [F4.mul_x, F4.mul_y, F4.one_x, F4.one_y] <;> ring
  mul_one := by
    intros; ext <;> simp only [F4.mul_x, F4.mul_y, F4.one_x, F4.one_y] <;> ring
  zero_mul := by
    intros; ext <;> simp only [F4.mul_x, F4.mul_y, F4.zero_x, F4.zero_y] <;> ring
  mul_zero := by
    intros; ext <;> simp only [F4.mul_x, F4.mul_y, F4.zero_x, F4.zero_y] <;> ring
  left_distrib := by
    intros; ext <;> simp only [F4.mul_x, F4.mul_y, F4.add_x, F4.add_y] <;> ring
  right_distrib := by
    intros; ext <;> simp only [F4.mul_x, F4.mul_y, F4.add_x, F4.add_y] <;> ring
  mul_comm := by intros; ext <;> simp only [F4.mul_x, F4.mul_y] <;> ring
  neg_add_cancel := by
    intros; ext <;>
      simp only [F4.add_x, F4.add_y, F4.neg_x, F4.neg_y, F4.zero_x, F4.zero_y] <;> ring
  sub_eq_add_neg := by
    intros; ext <;>
      simp only [F4.sub_x, F4.sub_y, F4.add_x, F4.add_y, F4.neg_x, F4.neg_y] <;> ring
  nsmul := nsmulRec
  zsmul := zsmulRec

end F4

/-- Reduction mod 2, `ℤ[φ] → 𝔽₄`: `x + y φ ↦ x̄ + ȳ φ̄`. -/
def red2 (t : ZPhi) : F4 := ⟨(t.x : ZMod 2), (t.y : ZMod 2)⟩

/-- 2 × 2 matrices over 𝔽₄. -/
abbrev F4M := Matrix (Fin 2) (Fin 2) F4

/-- Entrywise reduction mod 2 of a matrix over ℤ[φ]. -/
def red2M (A : M2) : F4M := A.map red2

/-- `S̄`, the reduction of `S`. -/
def Sbar : F4M := red2M S

/-- `T̄`, the reduction of `T`. -/
def Tbar : F4M := red2M T

/-- `R̄`, the reduction of `R = T S`. -/
def Rbar : F4M := red2M R

/-- The ten matrices `R̄^j`, `R̄^j S̄` (`j < 5`): the record's `D₅ = ⟨R̄, S̄⟩`. -/
def D5bar : Finset F4M :=
  (Finset.range 5).image (fun j => Rbar ^ j) ∪
    (Finset.range 5).image (fun j => Rbar ^ j * Sbar)

end G5

open G5 ZPhi

namespace G5

/-! ## Helpers (private, `g5_u2_aux_*`): the ring map, the word bridge, the two halves -/

/-- `F4` and pairs mod 2 are the same set. -/
private def g5_u2_aux_equiv : F4 ≃ ZMod 2 × ZMod 2 where
  toFun s := (s.x, s.y)
  invFun p := ⟨p.1, p.2⟩
  left_inv _ := rfl
  right_inv _ := rfl

/-- The inverse of a non-zero `x + y φ̄` is `(x + y) + y φ̄`, over the four elements. -/
private theorem g5_u2_aux_inv :
    ∀ x y : ZMod 2, (⟨x, y⟩ : F4) ≠ 0 → (⟨x, y⟩ : F4) * ⟨x + y, y⟩ = 1 := by
  decide +kernel

/-- Reduction mod 2 as a ring map; its function is `red2`. -/
private def g5_u2_aux_hom : ZPhi →+* F4 where
  toFun := red2
  map_one' := by ext <;> simp [red2, F4.one_x, F4.one_y]
  map_mul' s t := by
    ext <;> simp only [red2, F4.mul_x, F4.mul_y, ZPhi.mul_x, ZPhi.mul_y] <;> push_cast <;> ring
  map_zero' := by ext <;> simp [red2, F4.zero_x, F4.zero_y]
  map_add' s t := by
    ext <;> simp only [red2, F4.add_x, F4.add_y, ZPhi.add_x, ZPhi.add_y] <;> push_cast <;> ring

private theorem g5_u2_aux_hom_apply (t : ZPhi) : g5_u2_aux_hom t = red2 t := rfl

private theorem g5_u2_aux_red2M_mul (A B : M2) : red2M (A * B) = red2M A * red2M B :=
  Matrix.map_mul (f := g5_u2_aux_hom)

/-- `red2M` as a monoid map. -/
private def g5_u2_aux_homM : M2 →* F4M where
  toFun := red2M
  map_one' := Matrix.map_one red2 (map_zero g5_u2_aux_hom) (map_one g5_u2_aux_hom)
  map_mul' := g5_u2_aux_red2M_mul

private theorem g5_u2_aux_red2M_pow (A : M2) (n : ℕ) : red2M (A ^ n) = red2M A ^ n :=
  map_pow g5_u2_aux_homM A n

/-- The reduction of a literal word is the product of its reduced syllables `R̄^a S̄`. -/
private theorem g5_u2_aux_red2M_W (w : List ℕ) :
    red2M (W w) = (w.map fun a => Rbar ^ a * Sbar).prod := by
  induction w with
  | nil => exact map_one g5_u2_aux_homM
  | cons a w ih =>
    simp only [W, List.map_cons, List.prod_cons] at ih ⊢
    rw [g5_u2_aux_red2M_mul, ih, g5_u2_aux_red2M_mul, g5_u2_aux_red2M_pow]
    rfl

/-- `red2` of a trace is the trace of `red2M`. -/
private theorem g5_u2_aux_red2_trace (A : M2) : red2 A.trace = (red2M A).trace := by
  rw [Matrix.trace_fin_two, Matrix.trace_fin_two, ← g5_u2_aux_hom_apply, map_add]
  rfl

/-- The rotation half `R̄^j`, `j < 5`. -/
private def g5_u2_aux_rot : Finset F4M := (Finset.range 5).image (fun j => Rbar ^ j)

/-- The reflection half `R̄^j S̄`, `j < 5`. -/
private def g5_u2_aux_ref : Finset F4M := (Finset.range 5).image (fun j => Rbar ^ j * Sbar)

private theorem g5_u2_aux_syl (a : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) :
    Rbar ^ a * Sbar ∈ g5_u2_aux_ref := by
  obtain ⟨h1, h4⟩ := ha
  interval_cases a <;> decide +kernel

private theorem g5_u2_aux_one_rot : (1 : F4M) ∈ g5_u2_aux_rot := by decide +kernel

private theorem g5_u2_aux_ref_rot :
    ∀ X ∈ g5_u2_aux_ref, ∀ Y ∈ g5_u2_aux_rot, X * Y ∈ g5_u2_aux_ref := by
  decide +kernel

private theorem g5_u2_aux_ref_ref :
    ∀ X ∈ g5_u2_aux_ref, ∀ Y ∈ g5_u2_aux_ref, X * Y ∈ g5_u2_aux_rot := by
  decide +kernel

private theorem g5_u2_aux_ref_trace : ∀ X ∈ g5_u2_aux_ref, X.trace = 0 := by decide +kernel

private theorem g5_u2_aux_d5_mul : ∀ X ∈ D5bar, ∀ Y ∈ D5bar, X * Y ∈ D5bar := by decide +kernel

/-- Odd-length products of syllables land in the reflection half, even-length ones in the
rotation half. -/
private theorem g5_u2_aux_parity (w : List ℕ) (hw : ∀ a ∈ w, 1 ≤ a ∧ a ≤ 4) :
    (Even w.length → (w.map fun a => Rbar ^ a * Sbar).prod ∈ g5_u2_aux_rot) ∧
      (Odd w.length → (w.map fun a => Rbar ^ a * Sbar).prod ∈ g5_u2_aux_ref) := by
  induction w with
  | nil => exact ⟨fun _ => g5_u2_aux_one_rot, fun h => by simp at h⟩
  | cons a w ih =>
    have hX := g5_u2_aux_syl a (hw a (List.mem_cons_self ..))
    obtain ⟨ihE, ihO⟩ := ih fun b hb => hw b (List.mem_cons_of_mem a hb)
    simp only [List.map_cons, List.prod_cons, List.length_cons]
    refine ⟨fun h => ?_, fun h => ?_⟩
    · exact g5_u2_aux_ref_ref _ hX _ (ihO (Nat.not_even_iff_odd.mp (Nat.even_add_one.mp h)))
    · refine g5_u2_aux_ref_rot _ hX _ (ihE ?_)
      by_contra hc
      exact (Nat.not_even_iff_odd.mpr h) (Nat.even_add_one.mpr hc)

/-- The reduction of every literal word lies in `D5bar`. -/
private theorem g5_u2_aux_W_mem (w : List ℕ) (hw : ∀ a ∈ w, 1 ≤ a ∧ a ≤ 4) :
    red2M (W w) ∈ D5bar := by
  rw [g5_u2_aux_red2M_W]
  rcases Nat.even_or_odd w.length with h | h
  · exact Finset.mem_union_left _ ((g5_u2_aux_parity w hw).1 h)
  · exact Finset.mem_union_right _ ((g5_u2_aux_parity w hw).2 h)

/-- G5-U2-HOM. 𝔽₄ (pairs mod 2, the ℤ[φ] product) is a field with four elements.
Locus: AM §4, the L-1 proof (l. 178); gap 3 (l. 188).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u2_f4 : IsField F4 ∧ Nat.card F4 = 4 := by
  refine ⟨⟨⟨0, 1, by decide +kernel⟩, fun a b => mul_comm a b, fun {a} ha => ?_⟩, ?_⟩
  · obtain ⟨x, y⟩ := a
    exact ⟨⟨x + y, y⟩, g5_u2_aux_inv x y ha⟩
  · rw [Nat.card_congr g5_u2_aux_equiv, Nat.card_prod, Nat.card_zmod]

/-- G5-U2-HOM. Reduction mod 2 is a ring map ℤ[φ] → 𝔽₄.
Locus: AM §4, the L-1 proof (l. 178); gap 3 (l. 188).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u2_red_hom : ∃ f : ZPhi →+* F4, ∀ t : ZPhi, f t = red2 t := by
  exact ⟨g5_u2_aux_hom, g5_u2_aux_hom_apply⟩

/-- G5-U2-HOM. `red2 t = 0` exactly when both coordinates of `t` are even.
Locus: AM §4, the L-1 proof (l. 178).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u2_red_eq_zero (t : ZPhi) : red2 t = 0 ↔ 2 ∣ t.x ∧ 2 ∣ t.y := by
  rw [F4.ext_iff]
  exact and_congr (ZMod.intCast_zmod_eq_zero_iff_dvd t.x 2)
    (ZMod.intCast_zmod_eq_zero_iff_dvd t.y 2)

/-- G5-U2-D5. S̄, T̄ involutions, R̄ = T̄S̄ of order 5, S̄R̄S̄ = R̄⁴.
Locus: AM §4 (l. 178); AM §3.1 (l. 124); LEDGER row L-1 (l. 7).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u2_d5_gens : Sbar * Sbar = 1 ∧ Sbar ≠ 1 ∧ Tbar * Tbar = 1 ∧ Tbar ≠ 1 ∧
    Rbar = Tbar * Sbar ∧ Rbar ^ 5 = 1 ∧ Rbar ≠ 1 ∧ Sbar * Rbar * Sbar = Rbar ^ 4 := by
  decide +kernel

/-- G5-U2-D5. The monoid closure of {S̄, T̄} is `D5bar`, ten elements.
Locus: AM §4 (l. 178); §3.1 (l. 124); §2.3 (l. 99); §2.2 (l. 83).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u2_d5_image :
    (Submonoid.closure ({Sbar, Tbar} : Set F4M) : Set F4M) = (D5bar : Set F4M) ∧
      D5bar.card = 10 := by
  refine ⟨Set.Subset.antisymm ?_ ?_, by decide +kernel⟩
  · let N : Submonoid F4M :=
      { carrier := (D5bar : Set F4M)
        mul_mem' := fun {X Y} hX hY => g5_u2_aux_d5_mul X hX Y hY
        one_mem' := by decide +kernel }
    have hgen : ({Sbar, Tbar} : Set F4M) ⊆ N := by
      simp only [Set.insert_subset_iff, Set.singleton_subset_iff]
      exact ⟨(by decide +kernel : Sbar ∈ D5bar), (by decide +kernel : Tbar ∈ D5bar)⟩
    intro M hM
    exact (Submonoid.closure_le.mpr hgen) hM
  · intro M hM
    have hS : Sbar ∈ Submonoid.closure ({Sbar, Tbar} : Set F4M) :=
      Submonoid.subset_closure (by simp)
    have hT : Tbar ∈ Submonoid.closure ({Sbar, Tbar} : Set F4M) :=
      Submonoid.subset_closure (by simp)
    have hR : Rbar ∈ Submonoid.closure ({Sbar, Tbar} : Set F4M) := by
      rw [show Rbar = Tbar * Sbar from g5_u2_aux_red2M_mul T S]
      exact Submonoid.mul_mem _ hT hS
    simp only [D5bar, Finset.coe_union, Finset.coe_image, Finset.coe_range, Set.mem_union,
      Set.mem_image, Set.mem_Iio] at hM
    rcases hM with ⟨j, -, rfl⟩ | ⟨j, -, rfl⟩
    · exact Submonoid.pow_mem _ hR j
    · exact Submonoid.mul_mem _ (Submonoid.pow_mem _ hR j) hS

/-- G5-U2-TRD5. No trace 1 on `D5bar`; trace 0 on each R̄^j S̄, j < 5.
Locus: AM §4 gap 3 (l. 188); the L-1 proof (l. 178); the L-2 proof (l. 181).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u2_d5_trace :
    (∀ M ∈ D5bar, M.trace ≠ 1) ∧
      ∀ j : ℕ, j < 5 → (Rbar ^ j * Sbar).trace = 0 := by
  refine ⟨by decide +kernel, fun j hj => ?_⟩
  exact g5_u2_aux_ref_trace _ (Finset.mem_image_of_mem _ (Finset.mem_range.mpr hj))

/-- G5-L1. For every word of odd length, both coordinates of tr W are even.
Locus: LEDGER row L-1 (l. 7); AM §4 "Lemma (L-1)" (l. 177, l. 178); §2.4 (l. 114).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u2_l1 (w : List ℕ) (hw : IsWord w) (hk : Odd w.length) :
    Even (W w).trace.x ∧ Even (W w).trace.y := by
  have hO := (g5_u2_aux_parity w hw.2).2 hk
  rw [← g5_u2_aux_red2M_W] at hO
  have h0 : red2 (W w).trace = 0 := by
    rw [g5_u2_aux_red2_trace]
    exact g5_u2_aux_ref_trace _ hO
  obtain ⟨hx, hy⟩ := (g5_u2_red_eq_zero _).mp h0
  exact ⟨even_iff_two_dvd.mpr hx, even_iff_two_dvd.mpr hy⟩

/-- G5-L2. No word has trace x + y φ with x odd and y even (word level).
Locus: LEDGER row L-2 (l. 8); AM §4 "Lemma (L-2)" (l. 180, l. 181); §2.4 (l. 114).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u2_l2 (w : List ℕ) (hw : IsWord w) :
    ¬ (Odd (W w).trace.x ∧ Even (W w).trace.y) := by
  rintro ⟨hx, hy⟩
  have h1 : red2 (W w).trace = 1 := by
    ext
    · exact ZMod.intCast_eq_one_iff_odd.mpr hx
    · exact (ZMod.intCast_zmod_eq_zero_iff_dvd _ 2).mpr (even_iff_two_dvd.mp hy)
  exact (g5_u2_d5_trace.1 _ (g5_u2_aux_W_mem w hw.2))
    (by rw [← g5_u2_aux_red2_trace, h1])

/-- G5-L2. The "in particular" at word level: y = 0 ⟹ x even.
Locus: LEDGER row L-2 (l. 8); AM §4 "Lemma (L-2)" (l. 180, l. 181).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u2_l2_int (w : List ℕ) (hw : IsWord w) (h0 : (W w).trace.y = 0) :
    Even (W w).trace.x := by
  by_contra hc
  refine g5_u2_l2 w hw ⟨Int.not_even_iff_odd.mp hc, ?_⟩
  rw [h0]
  exact even_iff_two_dvd.mpr (dvd_zero 2)

end G5
