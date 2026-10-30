import Mathlib
import G5.Ring.Solution

/-!
# Unit U5 (`G5/Ladder`) — monotonicity and the exact ladder: proofs

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Statements: `G5/Ladder/Challenge.lean` (sha256 prefix `ea6b4aed`), eleven theorems under the
same names and statement texts. U5 defines nothing; this module imports the proved U1 prelude
`G5.Ring.Solution` (the prelude rule for dependent units) and restates nothing.
Method: the real order on ℤ[φ] is read through the ring map `x + y φ ↦ x + y φ ∈ ℝ`
(`g5_u5_aux_v`), monotone and injective (φ is irrational); entries and traces of block
products are then real inequalities. The ladder is an induction on the length: rotate the
word to open with 2, 3 or (1, 4), delete the last syllable (the trace drops by `≥ φ`).
-/

open G5 ZPhi

namespace G5

/-- Helper: the real value `x + y φ` of an element of ℤ[φ], as a ring map to ℝ. -/
private noncomputable def g5_u5_aux_v : ZPhi →+* ℝ where
  toFun t := t.x + t.y * Real.goldenRatio
  map_one' := by simp
  map_mul' s t := by
    simp only [mul_x, mul_y]; push_cast
    linear_combination (-(s.y : ℝ) * t.y) * Real.goldenRatio_sq
  map_zero' := by simp
  map_add' s t := by simp only [add_x, add_y]; push_cast; ring

private theorem g5_u5_aux_v_apply (t : ZPhi) :
    g5_u5_aux_v t = t.x + t.y * Real.goldenRatio := rfl

private theorem g5_u5_aux_v_phi : g5_u5_aux_v phi = Real.goldenRatio := by
  simp [g5_u5_aux_v_apply, phi]

private theorem g5_u5_aux_ab5 (a b : ℤ) :
    NonnegAB5 a b ↔ (0 : ℝ) ≤ a + b * Real.sqrt 5 := by
  have h5 : Real.sqrt 5 ^ 2 = 5 := Real.sq_sqrt (by norm_num)
  have hs : 0 ≤ Real.sqrt 5 := Real.sqrt_nonneg 5
  unfold NonnegAB5
  constructor
  · rintro (⟨ha, hb⟩ | ⟨ha, hb, h⟩ | ⟨ha, hb, h⟩)
    · have ha' : (0 : ℝ) ≤ a := by exact_mod_cast ha
      have hb' : (0 : ℝ) ≤ b := by exact_mod_cast hb
      positivity
    · have ha' : (0 : ℝ) < a := by exact_mod_cast ha
      have hb' : (b : ℝ) < 0 := by exact_mod_cast hb
      have h' : 5 * (b : ℝ) ^ 2 ≤ (a : ℝ) ^ 2 := by exact_mod_cast h
      by_contra! hn
      nlinarith [mul_pos (by linarith : (0 : ℝ) < -(b * Real.sqrt 5) - a)
        (by nlinarith : (0 : ℝ) < -(b * Real.sqrt 5) + a)]
    · have ha' : (a : ℝ) < 0 := by exact_mod_cast ha
      have hb' : (0 : ℝ) < b := by exact_mod_cast hb
      have h' : (a : ℝ) ^ 2 ≤ 5 * (b : ℝ) ^ 2 := by exact_mod_cast h
      nlinarith [mul_nonneg hs hb'.le, sq_nonneg ((b : ℝ) * Real.sqrt 5 + a)]
  · intro h
    rcases le_or_gt 0 a with ha | ha
    · rcases le_or_gt 0 b with hb | hb
      · exact Or.inl ⟨ha, hb⟩
      · right; left
        have hb' : (b : ℝ) < 0 := by exact_mod_cast hb
        have ha' : (0 : ℝ) ≤ a := by exact_mod_cast ha
        have hpos : (0 : ℝ) < a := by nlinarith [Real.sqrt_pos.2 (by norm_num : (0:ℝ) < 5)]
        refine ⟨by exact_mod_cast hpos, hb, ?_⟩
        have : 5 * (b : ℝ) ^ 2 ≤ (a : ℝ) ^ 2 := by
          nlinarith [mul_nonneg (by linarith : (0:ℝ) ≤ a + b * Real.sqrt 5)
            (by nlinarith : (0:ℝ) ≤ a - b * Real.sqrt 5)]
        exact_mod_cast this
    · right; right
      have ha' : (a : ℝ) < 0 := by exact_mod_cast ha
      have hbpos : (0 : ℝ) < b := by
        by_contra! hn; nlinarith
      refine ⟨ha, by exact_mod_cast hbpos, ?_⟩
      have : (a : ℝ) ^ 2 ≤ 5 * (b : ℝ) ^ 2 := by
        nlinarith [mul_nonneg (by linarith : (0:ℝ) ≤ a + b * Real.sqrt 5)
          (by nlinarith : (0:ℝ) ≤ b * Real.sqrt 5 - a)]
      exact_mod_cast this

/-- Helper: the real order on ℤ[φ] is the order of the real values. -/
private theorem g5_u5_aux_le_iff (s t : ZPhi) : s ≤ t ↔ g5_u5_aux_v s ≤ g5_u5_aux_v t := by
  change RealNonneg (t - s) ↔ _
  unfold RealNonneg
  rw [g5_u5_aux_ab5, g5_u5_aux_v_apply, g5_u5_aux_v_apply]
  simp only [sub_x, sub_y]
  have hg : Real.goldenRatio = (1 + Real.sqrt 5) / 2 := rfl
  rw [hg]; push_cast
  constructor <;> intro h <;> linarith

private theorem g5_u5_aux_v_inj {s t : ZPhi} (h : g5_u5_aux_v s = g5_u5_aux_v t) : s = t := by
  rw [g5_u5_aux_v_apply, g5_u5_aux_v_apply] at h
  by_cases hy : s.y = t.y
  · have hx : (s.x : ℝ) = t.x := by rw [hy] at h; linarith
    ext
    · exact_mod_cast hx
    · exact hy
  · exfalso
    have hne : ((s.y : ℝ) - t.y) ≠ 0 := by
      intro h0; apply hy; exact_mod_cast sub_eq_zero.1 h0
    have hq : Real.goldenRatio = ((t.x - s.x : ℤ) : ℝ) / ((s.y - t.y : ℤ) : ℝ) := by
      push_cast; rw [eq_div_iff hne]; linarith
    exact Real.goldenRatio_irrational.ne_rational (t.x - s.x) (s.y - t.y) hq

private theorem g5_u5_aux_antisymm {s t : ZPhi} (h1 : s ≤ t) (h2 : t ≤ s) : s = t := by
  rw [g5_u5_aux_le_iff] at h1 h2
  exact g5_u5_aux_v_inj (le_antisymm h1 h2)

private theorem g5_u5_aux_v_nonneg {t : ZPhi} (h : nonneg t) : 0 ≤ g5_u5_aux_v t := by
  rw [g5_u5_aux_v_apply]
  have hx : (0 : ℝ) ≤ t.x := by exact_mod_cast h.1
  have hy : (0 : ℝ) ≤ t.y := by exact_mod_cast h.2
  have := Real.goldenRatio_pos
  positivity

private theorem g5_u5_aux_nonneg_add {s t : ZPhi} (hs : nonneg s) (ht : nonneg t) :
    nonneg (s + t) := by
  obtain ⟨h1, h2⟩ := hs; obtain ⟨h3, h4⟩ := ht
  exact ⟨by simp only [add_x]; omega, by simp only [add_y]; omega⟩

private theorem g5_u5_aux_nonneg_mul {s t : ZPhi} (hs : nonneg s) (ht : nonneg t) :
    nonneg (s * t) := by
  obtain ⟨h1, h2⟩ := hs; obtain ⟨h3, h4⟩ := ht
  exact ⟨by simp only [mul_x]; positivity, by simp only [mul_y]; positivity⟩

private theorem g5_u5_aux_bp_nil : blockProd [] = 1 := by simp [blockProd]

private theorem g5_u5_aux_bp_cons (a : ℕ) (l : List ℕ) :
    blockProd (a :: l) = P a * blockProd l := by simp [blockProd]

private theorem g5_u5_aux_bp_append (l₁ l₂ : List ℕ) :
    blockProd (l₁ ++ l₂) = blockProd l₁ * blockProd l₂ := by
  simp [blockProd, List.prod_append]

private theorem g5_u5_aux_one_le (t : ZPhi) : 1 ≤ t ↔ 1 ≤ g5_u5_aux_v t := by
  rw [g5_u5_aux_le_iff, map_one]

/-- Helper: the `≥ I`, ℕ[φ]-entried class is closed under products. -/
private theorem g5_u5_aux_geI_mul {X Y : M2}
    (hX : ∀ i j, nonneg (X i j) ∧ (1 : M2) i j ≤ X i j)
    (hY : ∀ i j, nonneg (Y i j) ∧ (1 : M2) i j ≤ Y i j) (i j : Fin 2) :
    nonneg ((X * Y) i j) ∧ (1 : M2) i j ≤ (X * Y) i j := by
  rw [Matrix.mul_apply, Fin.sum_univ_two]
  refine ⟨g5_u5_aux_nonneg_add (g5_u5_aux_nonneg_mul (hX i 0).1 (hY 0 j).1)
    (g5_u5_aux_nonneg_mul (hX i 1).1 (hY 1 j).1), ?_⟩
  rw [g5_u5_aux_le_iff, map_add, map_mul, map_mul]
  have h := fun i j => (g5_u5_aux_le_iff _ _).1 (hX i j).2
  have k := fun i j => (g5_u5_aux_le_iff _ _).1 (hY i j).2
  have hn := fun i j => g5_u5_aux_v_nonneg (hX i j).1
  have kn := fun i j => g5_u5_aux_v_nonneg (hY i j).1
  have h00 := h 0 0; have h11 := h 1 1; have k00 := k 0 0; have k11 := k 1 1
  simp only [Matrix.one_apply_eq, map_one] at h00 h11 k00 k11
  fin_cases i <;> fin_cases j <;> simp
  · nlinarith [mul_le_mul h00 k00 zero_le_one (by linarith), mul_nonneg (hn 0 1) (kn 1 0)]
  · nlinarith [mul_nonneg (hn 0 0) (kn 0 1), mul_nonneg (hn 0 1) (kn 1 1)]
  · nlinarith [mul_nonneg (hn 1 0) (kn 0 0), mul_nonneg (hn 1 1) (kn 1 0)]
  · nlinarith [mul_le_mul h11 k11 zero_le_one (by linarith), mul_nonneg (hn 1 0) (kn 0 1)]

/-- G5-MONOa, the record's hypothesis made explicit: a product of blocks (the empty product
is `1`) has entries in ℕ[φ] and is `≥ I` entrywise in the real order. -/
theorem g5_u5_mono_prod (u : List ℕ) (hu : ∀ b ∈ u, 1 ≤ b ∧ b ≤ 4) (i j : Fin 2) :
    nonneg (blockProd u i j) ∧ (1 : M2) i j ≤ blockProd u i j := by
  induction u generalizing i j with
  | nil =>
    rw [g5_u5_aux_bp_nil]
    exact ⟨by fin_cases i <;> fin_cases j <;> decide, (g5_u5_aux_le_iff _ _).2 le_rfl⟩
  | cons a u ih =>
    rw [g5_u5_aux_bp_cons]
    exact g5_u5_aux_geI_mul (fun i j => g5_u1_ge_a a (hu a (by simp)) i j)
      (fun i j => ih (fun b hb => hu b (by simp [hb])) i j) i j

/-- G5-MONOa: for products `A, B` of blocks, `tr (A P_a B) ≥ tr (A B)` in the real order. -/
theorem g5_u5_mono_a (u v : List ℕ) (hu : ∀ b ∈ u, 1 ≤ b ∧ b ≤ 4)
    (hv : ∀ b ∈ v, 1 ≤ b ∧ b ≤ 4) (a : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) :
    (blockProd u * blockProd v).trace ≤ (blockProd u * P a * blockProd v).trace := by
  have hA := fun i j => g5_u5_aux_v_nonneg (g5_u5_mono_prod u hu i j).1
  have hB := fun i j => g5_u5_aux_v_nonneg (g5_u5_mono_prod v hv i j).1
  have hP : ∀ j k, 0 ≤ g5_u5_aux_v (P a j k) - g5_u5_aux_v ((1 : M2) j k) := fun j k =>
    sub_nonneg.2 ((g5_u5_aux_le_iff _ _).1 (g5_u1_ge_a a ha j k).2)
  have p00 : 0 ≤ g5_u5_aux_v (P a 0 0) - 1 := by simpa using hP 0 0
  have p01 : 0 ≤ g5_u5_aux_v (P a 0 1) := by simpa using hP 0 1
  have p10 : 0 ≤ g5_u5_aux_v (P a 1 0) := by simpa using hP 1 0
  have p11 : 0 ≤ g5_u5_aux_v (P a 1 1) - 1 := by simpa using hP 1 1
  rw [g5_u5_aux_le_iff]
  simp only [Matrix.trace_fin_two, Matrix.mul_apply, Fin.sum_univ_two, map_add, map_mul]
  nlinarith [mul_nonneg (mul_nonneg (hA 0 0) p00) (hB 0 0),
    mul_nonneg (mul_nonneg (hA 0 0) p01) (hB 1 0),
    mul_nonneg (mul_nonneg (hA 0 1) p10) (hB 0 0),
    mul_nonneg (mul_nonneg (hA 0 1) p11) (hB 1 0),
    mul_nonneg (mul_nonneg (hA 1 0) p00) (hB 0 1),
    mul_nonneg (mul_nonneg (hA 1 0) p01) (hB 1 1),
    mul_nonneg (mul_nonneg (hA 1 1) p10) (hB 0 1),
    mul_nonneg (mul_nonneg (hA 1 1) p11) (hB 1 1)]

/-- Helper: a list over `{1, 4}` holding both 1 and 4 carries the pair (1, 4) adjacent, or
opens with 4 and closes with 1. -/
private theorem g5_u5_aux_14 (w : List ℕ) (hw : ∀ a ∈ w, a = 1 ∨ a = 4) (h1 : 1 ∈ w)
    (h4 : 4 ∈ w) : (∃ s t, w = s ++ 1 :: 4 :: t) ∨ (∃ m, w = (4 :: m) ++ [1]) := by
  induction w with
  | nil => simp at h1
  | cons a r ih =>
    have hr : ∀ b ∈ r, b = 1 ∨ b = 4 := fun b hb => hw b (by simp [hb])
    rcases hw a (by simp) with rfl | rfl
    · have h4r : 4 ∈ r := by simpa using h4
      match r, hr, h4r, ih with
      | [], _, h, _ => simp at h
      | b :: r', hr, h4r, ih =>
        rcases hr b (by simp) with rfl | rfl
        · rcases ih hr (by simp) h4r with ⟨s, t, hst⟩ | ⟨m, hm⟩
          · exact Or.inl ⟨1 :: s, t, by rw [hst]; rfl⟩
          · simp at hm
        · exact Or.inl ⟨[], r', rfl⟩
    · have h1r : 1 ∈ r := by simpa using h1
      by_cases h4r : 4 ∈ r
      · rcases ih hr h1r h4r with ⟨s, t, hst⟩ | ⟨m, hm⟩
        · exact Or.inl ⟨4 :: s, t, by rw [hst]; rfl⟩
        · exact Or.inr ⟨4 :: m, by rw [hm]; rfl⟩
      · rcases List.eq_nil_or_concat r with h | ⟨m, b, hmb⟩
        · simp [h] at h1r
        · rw [List.concat_eq_append] at hmb
          have hb : b = 1 := by
            rcases hr b (by simp [hmb]) with h | h
            · exact h
            · exact absurd (by simp [hmb, h]) h4r
          exact Or.inr ⟨m, by rw [hmb, hb]; rfl⟩

/-- G5-MONOb, the rotation: a word other than `(1^k)`, `(4^k)` has a rotation opening
with 2, with 3, or with the whole pair (1, 4). -/
theorem g5_u5_mono_b_rot (w : List ℕ) (hw : IsWord w)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) :
    ∃ v, List.IsRotated w v ∧
      (v.head? = some 2 ∨ v.head? = some 3 ∨ v.take 2 = [1, 4]) := by
  by_cases h2 : 2 ∈ w
  · obtain ⟨s, t, rfl⟩ := List.append_of_mem h2
    exact ⟨(2 :: t) ++ s, ⟨s.length, List.rotate_append_length_eq _ _⟩, Or.inl rfl⟩
  by_cases h3 : 3 ∈ w
  · obtain ⟨s, t, rfl⟩ := List.append_of_mem h3
    exact ⟨(3 :: t) ++ s, ⟨s.length, List.rotate_append_length_eq _ _⟩, Or.inr (Or.inl rfl)⟩
  have h14 : ∀ a ∈ w, a = 1 ∨ a = 4 := by
    intro a ha
    have := hw.2 a ha
    have : a ≠ 2 := by rintro rfl; exact h2 ha
    have : a ≠ 3 := by rintro rfl; exact h3 ha
    omega
  have h1 : 1 ∈ w := by
    by_contra h
    exact hc.2 (List.eq_replicate_iff.2
      ⟨rfl, fun b hb => (h14 b hb).resolve_left (by rintro rfl; exact h hb)⟩)
  have h4 : 4 ∈ w := by
    by_contra h
    exact hc.1 (List.eq_replicate_iff.2
      ⟨rfl, fun b hb => (h14 b hb).resolve_right (by rintro rfl; exact h hb)⟩)
  rcases g5_u5_aux_14 w h14 h1 h4 with ⟨s, t, rfl⟩ | ⟨m, rfl⟩
  · exact ⟨(1 :: 4 :: t) ++ s, ⟨s.length, List.rotate_append_length_eq _ _⟩,
      Or.inr (Or.inr (by simp))⟩
  · exact ⟨[1] ++ (4 :: m), ⟨(4 :: m).length, List.rotate_append_length_eq _ _⟩,
      Or.inr (Or.inr (by simp))⟩

/-- Helper: a matrix with all entries `≥ 1` times a block product keeps all entries `≥ 1`. -/
private theorem g5_u5_aux_ge1_mul (X : M2) (hX : ∀ i j, 1 ≤ X i j) (r : List ℕ)
    (hr : ∀ b ∈ r, 1 ≤ b ∧ b ≤ 4) (i j : Fin 2) : 1 ≤ (X * blockProd r) i j := by
  have hY := g5_u5_mono_prod r hr
  have h := fun i j => (g5_u5_aux_one_le _).1 (hX i j)
  have k := fun i j => (g5_u5_aux_le_iff _ _).1 (hY i j).2
  have kn := fun i j => g5_u5_aux_v_nonneg (hY i j).1
  have k00 := k 0 0; have k11 := k 1 1
  simp only [Matrix.one_apply_eq, map_one] at k00 k11
  rw [g5_u5_aux_one_le, Matrix.mul_apply, Fin.sum_univ_two, map_add, map_mul, map_mul]
  obtain rfl | rfl : j = 0 ∨ j = 1 := by fin_cases j <;> simp
  · nlinarith [mul_le_mul (h i 0) k00 zero_le_one (by linarith [h i 0]),
      mul_nonneg (by linarith [h i 1] : (0 : ℝ) ≤ g5_u5_aux_v (X i 1)) (kn 1 0)]
  · nlinarith [mul_le_mul (h i 1) k11 zero_le_one (by linarith [h i 1]),
      mul_nonneg (by linarith [h i 0] : (0 : ℝ) ≤ g5_u5_aux_v (X i 0)) (kn 0 1)]

private theorem g5_u5_aux_open (p : List ℕ) (hp : IsWord p)
    (ho : p.head? = some 2 ∨ p.head? = some 3 ∨ p.take 2 = [1, 4]) (i j : Fin 2) :
    1 ≤ blockProd p i j := by
  match p, hp, ho with
  | [], _, ho => simp at ho
  | [a], hp, ho =>
    have hr : ∀ b ∈ ([] : List ℕ), 1 ≤ b ∧ b ≤ 4 := by simp
    rcases ho with h | h | h
    · simp only [List.head?_cons, Option.some.injEq] at h
      subst h; rw [g5_u5_aux_bp_cons]
      exact g5_u5_aux_ge1_mul _ (by intro i j; fin_cases i <;> fin_cases j <;> decide) [] hr i j
    · simp only [List.head?_cons, Option.some.injEq] at h
      subst h; rw [g5_u5_aux_bp_cons]
      exact g5_u5_aux_ge1_mul _ (by intro i j; fin_cases i <;> fin_cases j <;> decide) [] hr i j
    · exact absurd h (by simp)
  | a :: b :: r, hp, ho =>
    have hr : ∀ c ∈ b :: r, 1 ≤ c ∧ c ≤ 4 := fun c hc => hp.2 c (by simp [hc])
    have hr' : ∀ c ∈ r, 1 ≤ c ∧ c ≤ 4 := fun c hc => hp.2 c (by simp [hc])
    rcases ho with h | h | h
    · simp only [List.head?_cons, Option.some.injEq] at h
      subst h; rw [g5_u5_aux_bp_cons]
      exact g5_u5_aux_ge1_mul _ (by intro i j; fin_cases i <;> fin_cases j <;> decide) _ hr i j
    · simp only [List.head?_cons, Option.some.injEq] at h
      subst h; rw [g5_u5_aux_bp_cons]
      exact g5_u5_aux_ge1_mul _ (by intro i j; fin_cases i <;> fin_cases j <;> decide) _ hr i j
    · simp only [List.take_succ_cons, List.take_zero, List.cons.injEq, and_true] at h
      obtain ⟨rfl, rfl⟩ := h
      rw [g5_u5_aux_bp_cons, g5_u5_aux_bp_cons, ← mul_assoc]
      exact g5_u5_aux_ge1_mul _ (by intro i j; fin_cases i <;> fin_cases j <;> decide) _ hr' i j

/-- G5-MONOb, the entries: a prefix holding the opening 2 or 3, or the whole opening
pair (1, 4), has all four entries `≥ 1` in the real order. -/
theorem g5_u5_mono_b_ge1 (p : List ℕ) (hp : IsWord p)
    (ho : p.head? = some 2 ∨ p.head? = some 3 ∨ p.take 2 = [1, 4]) (i j : Fin 2) :
    1 ≤ blockProd p i j := g5_u5_aux_open p hp ho i j

private theorem g5_u5_aux_bp_single (a : ℕ) : blockProd [a] = P a := by simp [blockProd]

/-- G5-MONOb, the increments: past such a prefix, each further syllable raises the
normalized trace by `≥ φ` in the real order. -/
theorem g5_u5_mono_b_step (p : List ℕ) (hp : IsWord p)
    (ho : p.head? = some 2 ∨ p.head? = some 3 ∨ p.take 2 = [1, 4])
    (a : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) :
    ntr p + phi ≤ ntr (p ++ [a]) := by
  have h := fun i j => (g5_u5_aux_one_le _).1 (g5_u5_aux_open p hp ho i j)
  have h00 := h 0 0; have h01 := h 0 1; have h10 := h 1 0; have h11 := h 1 1
  have g1 := Real.one_lt_goldenRatio
  unfold ntr
  rw [g5_u5_aux_bp_append, g5_u5_aux_bp_single, g5_u5_aux_le_iff, map_add, g5_u5_aux_v_phi]
  simp only [Matrix.trace_fin_two, Matrix.mul_apply, Fin.sum_univ_two, map_add, map_mul]
  obtain ⟨ha1, ha4⟩ := ha
  interval_cases a <;> simp [P, g5_u5_aux_v_phi] <;>
    nlinarith [mul_nonneg (sub_nonneg.2 h00) (by linarith : (0 : ℝ) ≤ Real.goldenRatio),
      mul_nonneg (sub_nonneg.2 h01) (by linarith : (0 : ℝ) ≤ Real.goldenRatio),
      mul_nonneg (sub_nonneg.2 h10) (by linarith : (0 : ℝ) ≤ Real.goldenRatio),
      mul_nonneg (sub_nonneg.2 h11) (by linarith : (0 : ℝ) ≤ Real.goldenRatio),
      mul_nonneg (by linarith : (0 : ℝ) ≤ g5_u5_aux_v (blockProd p 0 0))
        (by linarith : (0 : ℝ) ≤ Real.goldenRatio - 1),
      mul_nonneg (by linarith : (0 : ℝ) ≤ g5_u5_aux_v (blockProd p 1 1))
        (by linarith : (0 : ℝ) ≤ Real.goldenRatio - 1)]

private theorem g5_u5_aux_base3 (a b c : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) (hb : 1 ≤ b ∧ b ≤ 4)
    (hc : 1 ≤ c ∧ c ≤ 4)
    (hn : [a, b, c] ≠ List.replicate 3 1 ∧ [a, b, c] ≠ List.replicate 3 4) :
    4 * phi ≤ ntr [a, b, c] ∧
      (ntr [a, b, c] = 4 * phi →
        [a, b, c] ∈ List.cyclicPermutations [1, 1, 2] ∨
          [a, b, c] ∈ List.cyclicPermutations [3, 4, 4]) := by
  obtain ⟨ha1, ha4⟩ := ha; obtain ⟨hb1, hb4⟩ := hb; obtain ⟨hc1, hc4⟩ := hc
  revert hn
  interval_cases a <;> interval_cases b <;> interval_cases c <;> decide

/-- G5-LADa, k = 1: a word of length 1 other than `(1)`, `(4)` has `t ≥ 2φ`. -/
theorem g5_u5_lad_a_one (w : List ℕ) (hw : IsWord w) (hk : w.length = 1)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) :
    2 * phi ≤ ntr w := by
  obtain ⟨a, rfl⟩ := List.length_eq_one_iff.1 hk
  obtain ⟨h1, h4⟩ := hw.2 a (by simp)
  revert hc
  interval_cases a <;> decide

/-- G5-LADa, k = 2: a word of length 2 other than `(1, 1)`, `(4, 4)` has `t ≥ 3 + φ`. -/
theorem g5_u5_lad_a_two (w : List ℕ) (hw : IsWord w) (hk : w.length = 2)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) :
    3 + phi ≤ ntr w := by
  obtain ⟨a, b, rfl⟩ := List.length_eq_two.1 hk
  obtain ⟨ha1, ha4⟩ := hw.2 a (by simp)
  obtain ⟨hb1, hb4⟩ := hw.2 b (by simp)
  revert hc
  interval_cases a <;> interval_cases b <;> decide

/-- Helper: natural-number casts into ℤ[φ] are `⟨n, 0⟩`. -/
private theorem g5_u5_aux_natCast (n : ℕ) : ((n : ℕ) : ZPhi) = ⟨n, 0⟩ := by
  induction n with
  | zero => ext <;> simp
  | succ n ih => rw [Nat.cast_succ, ih]; ext <;> simp

private theorem g5_u5_aux_four : (4 : ZPhi) = ⟨4, 0⟩ := by
  rw [← Nat.cast_ofNat, g5_u5_aux_natCast]; rfl

/-- Helper: the normalized trace is a rotation invariant. -/
private theorem g5_u5_aux_ntr_rotate (w : List ℕ) (n : ℕ) : ntr (w.rotate n) = ntr w := by
  unfold ntr
  rw [List.rotate_eq_drop_append_take_mod, g5_u5_aux_bp_append, Matrix.trace_mul_comm,
    ← g5_u5_aux_bp_append, List.take_append_drop]

private theorem g5_u5_aux_ntr_rot {w v : List ℕ} (h : List.IsRotated w v) : ntr v = ntr w := by
  obtain ⟨n, rfl⟩ := h
  exact g5_u5_aux_ntr_rotate w n

/-- Helper: an opening 2, 3 or (1, 4) makes a list non-constant. -/
private theorem g5_u5_aux_open_mem (p : List ℕ)
    (ho : p.head? = some 2 ∨ p.head? = some 3 ∨ p.take 2 = [1, 4]) :
    (2 ∈ p ∨ 3 ∈ p) ∨ (1 ∈ p ∧ 4 ∈ p) := by
  match p, ho with
  | [], ho => simp at ho
  | [b], ho =>
    rcases ho with h | h | h
    · simp only [List.head?_cons, Option.some.injEq] at h
      subst h; simp
    · simp only [List.head?_cons, Option.some.injEq] at h
      subst h; simp
    · exact absurd h (by simp)
  | b :: c :: r, ho =>
    simp only [List.head?_cons, Option.some.injEq, List.take_succ_cons, List.take_zero,
      List.cons.injEq, and_true] at ho
    rcases ho with rfl | rfl | ⟨rfl, rfl⟩ <;> simp

private theorem g5_u5_aux_open_nc (p : List ℕ)
    (ho : p.head? = some 2 ∨ p.head? = some 3 ∨ p.take 2 = [1, 4]) :
    p ≠ List.replicate p.length 1 ∧ p ≠ List.replicate p.length 4 := by
  have hm := g5_u5_aux_open_mem p ho
  constructor <;> intro h <;> have h' := (List.eq_replicate_iff.1 h).2 <;>
    rcases hm with (hm | hm) | ⟨hm1, hm4⟩
  all_goals first
    | exact absurd (h' _ hm) (by decide)
    | exact absurd (h' _ hm1) (by decide)
    | exact absurd (h' _ hm4) (by decide)

/-- Helper: the opening of `p ++ [a]` is the opening of `p` once `p` has length `≥ 2`. -/
private theorem g5_u5_aux_open_pref (p : List ℕ) (a : ℕ) (hl : 2 ≤ p.length)
    (ho : (p ++ [a]).head? = some 2 ∨ (p ++ [a]).head? = some 3 ∨
      (p ++ [a]).take 2 = [1, 4]) :
    p.head? = some 2 ∨ p.head? = some 3 ∨ p.take 2 = [1, 4] := by
  match p, hl with
  | b :: c :: q, _ => simpa using ho

/-- Helper: the deletion step — a non-constant word of length `n + 4` rotates to `p ++ [a]`
with `p` a non-constant word of length `n + 3` opening with 2, 3 or (1, 4). -/
private theorem g5_u5_aux_del (w : List ℕ) (hw : IsWord w) (n : ℕ) (hk : w.length = n + 4)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) :
    ∃ p a, List.IsRotated w (p ++ [a]) ∧ IsWord p ∧ p.length = n + 3 ∧
      (p.head? = some 2 ∨ p.head? = some 3 ∨ p.take 2 = [1, 4]) ∧ (1 ≤ a ∧ a ≤ 4) := by
  obtain ⟨v, hv, ho⟩ := g5_u5_mono_b_rot w hw hc
  have hvl : v.length = n + 4 := by rw [← hv.perm.length_eq, hk]
  rcases List.eq_nil_or_concat v with h | ⟨p, a, hpa⟩
  · simp [h] at hvl
  rw [List.concat_eq_append] at hpa
  subst hpa
  have hpl : p.length = n + 3 := by simpa using hvl
  have hmem : ∀ b ∈ p ++ [a], 1 ≤ b ∧ b ≤ 4 := fun b hb => hw.2 b (hv.mem_iff.2 hb)
  refine ⟨p, a, hv, ⟨?_, fun b hb => hmem b (by simp [hb])⟩, hpl,
    g5_u5_aux_open_pref p a (by omega) ho, hmem a (by simp)⟩
  intro h; simp [h] at hpl

/-- Helper: the ladder's lower bound on length `n + 3`. -/
private theorem g5_u5_aux_lad (n : ℕ) : ∀ w : List ℕ, IsWord w → w.length = n + 3 →
    (w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) →
    ((n : ZPhi) + 4) * phi ≤ ntr w := by
  induction n with
  | zero =>
    intro w hw hk hc
    obtain ⟨a, b, c, rfl⟩ := List.length_eq_three.1 hk
    simpa using (g5_u5_aux_base3 a b c (hw.2 a (by simp)) (hw.2 b (by simp))
      (hw.2 c (by simp)) hc).1
  | succ n ih =>
    intro w hw hk hc
    obtain ⟨p, a, hv, hp, hpl, ho, ha⟩ := g5_u5_aux_del w hw n hk hc
    have h1 := ih p hp hpl (g5_u5_aux_open_nc p ho)
    have h2 := g5_u5_mono_b_step p hp ho a ha
    rw [← g5_u5_aux_ntr_rot hv]
    rw [g5_u5_aux_le_iff] at h1 h2 ⊢
    simp only [map_add, map_mul, map_natCast, g5_u5_aux_v_phi, map_ofNat] at h1 h2 ⊢
    push_cast
    nlinarith [Real.goldenRatio_pos]

/-- G5-LADa, k ≥ 3: a word of length k other than `(1^k)`, `(4^k)` has `t ≥ (k + 1)φ`. -/
theorem g5_u5_lad_a_ge3 (w : List ℕ) (hw : IsWord w) (hk : 3 ≤ w.length)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) :
    ((w.length : ZPhi) + 1) * phi ≤ ntr w := by
  obtain ⟨n, hn⟩ : ∃ n, w.length = n + 3 := ⟨w.length - 3, by omega⟩
  have h := g5_u5_aux_lad n w hw hn hc
  rw [hn]
  convert h using 2
  push_cast; ring

/-- G5-LADb, k = 1: the minimum `2φ` is attained exactly at the named words (2), (3). -/
theorem g5_u5_lad_b_one (w : List ℕ) (hw : IsWord w) (hk : w.length = 1)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) :
    ntr w = 2 * phi ↔ (w = [2] ∨ w = [3]) := by
  obtain ⟨a, rfl⟩ := List.length_eq_one_iff.1 hk
  obtain ⟨h1, h4⟩ := hw.2 a (by simp)
  revert hc
  interval_cases a <;> decide

/-- G5-LADb, k = 2: the minimum `3 + φ` is attained exactly at the rotations of (1, 4). -/
theorem g5_u5_lad_b_two (w : List ℕ) (hw : IsWord w) (hk : w.length = 2)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) :
    ntr w = 3 + phi ↔ List.IsRotated w [1, 4] := by
  obtain ⟨a, b, rfl⟩ := List.length_eq_two.1 hk
  obtain ⟨ha1, ha4⟩ := hw.2 a (by simp)
  obtain ⟨hb1, hb4⟩ := hw.2 b (by simp)
  rw [← List.mem_cyclicPermutations_iff]
  revert hc
  interval_cases a <;> interval_cases b <;> decide

private theorem g5_u5_aux_bp_rep1 (m : ℕ) :
    blockProd (List.replicate m 1) = !![1, (m : ZPhi) * phi; 0, 1] := by
  induction m with
  | zero =>
    rw [List.replicate_zero, g5_u5_aux_bp_nil]
    refine Matrix.ext fun i j => ?_
    fin_cases i <;> fin_cases j <;> simp
  | succ m ih =>
    rw [List.replicate_succ, g5_u5_aux_bp_cons, ih]
    refine Matrix.ext fun i j => ?_
    fin_cases i <;> fin_cases j <;> simp [P, Matrix.mul_apply]; ring

private theorem g5_u5_aux_bp_rep4 (m : ℕ) :
    blockProd (List.replicate m 4) = !![1, 0; (m : ZPhi) * phi, 1] := by
  induction m with
  | zero =>
    rw [List.replicate_zero, g5_u5_aux_bp_nil]
    refine Matrix.ext fun i j => ?_
    fin_cases i <;> fin_cases j <;> simp
  | succ m ih =>
    rw [List.replicate_succ, g5_u5_aux_bp_cons, ih]
    refine Matrix.ext fun i j => ?_
    fin_cases i <;> fin_cases j <;> simp [P, Matrix.mul_apply]; ring

private theorem g5_u5_aux_ntr_A (m : ℕ) :
    ntr (List.replicate m 1 ++ [2]) = ((m : ZPhi) + 2) * phi := by
  unfold ntr
  rw [g5_u5_aux_bp_append, g5_u5_aux_bp_rep1, g5_u5_aux_bp_single]
  simp [Matrix.trace_fin_two, P]
  ring

private theorem g5_u5_aux_ntr_B (m : ℕ) :
    ntr (3 :: List.replicate m 4) = ((m : ZPhi) + 2) * phi := by
  unfold ntr
  rw [g5_u5_aux_bp_cons, g5_u5_aux_bp_rep4]
  simp [Matrix.trace_fin_two, P]
  ring

/-- Helper: past `2 :: 1^m`, a last syllable other than 1 leaves a non-zero `x`. -/
private theorem g5_u5_aux_xA (m a : ℕ) (ha : 2 ≤ a ∧ a ≤ 4) :
    (ntr (2 :: List.replicate m 1 ++ [a])).x ≠ 0 := by
  unfold ntr
  rw [g5_u5_aux_bp_append, g5_u5_aux_bp_cons, g5_u5_aux_bp_rep1, g5_u5_aux_bp_single]
  obtain ⟨h2, h4⟩ := ha
  interval_cases a <;>
    simp [Matrix.trace_fin_two, P, phi, g5_u5_aux_natCast] <;> omega

/-- Helper: past `3 :: 4^m`, a last syllable other than 4 leaves a non-zero `x`. -/
private theorem g5_u5_aux_xB (m a : ℕ) (ha : 1 ≤ a ∧ a ≤ 3) :
    (ntr (3 :: List.replicate m 4 ++ [a])).x ≠ 0 := by
  unfold ntr
  rw [g5_u5_aux_bp_append, g5_u5_aux_bp_cons, g5_u5_aux_bp_rep4, g5_u5_aux_bp_single]
  obtain ⟨h1, h3⟩ := ha
  interval_cases a <;>
    simp [Matrix.trace_fin_two, P, phi, g5_u5_aux_natCast] <;> omega

private theorem g5_u5_aux_x0 (n : ℕ) : ((((n + 1 : ℕ) : ZPhi) + 4) * phi).x = 0 := by
  simp [phi, g5_u5_aux_natCast, g5_u5_aux_four]

/-- Helper: the ladder's minimizers on length `n + 3`. -/
private theorem g5_u5_aux_uniq (n : ℕ) : ∀ w : List ℕ, IsWord w → w.length = n + 3 →
    (w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) →
    ntr w = ((n : ZPhi) + 4) * phi →
    (List.IsRotated w (List.replicate (n + 2) 1 ++ [2]) ∨
      List.IsRotated w (3 :: List.replicate (n + 2) 4)) := by
  induction n with
  | zero =>
    intro w hw hk hc he
    obtain ⟨a, b, c, rfl⟩ := List.length_eq_three.1 hk
    have h := (g5_u5_aux_base3 a b c (hw.2 a (by simp)) (hw.2 b (by simp))
      (hw.2 c (by simp)) hc).2 (by simpa using he)
    simpa [List.mem_cyclicPermutations_iff] using h
  | succ n ih =>
    intro w hw hk hc he
    obtain ⟨p, a, hv, hp, hpl, ho, ha⟩ := g5_u5_aux_del w hw n hk hc
    have hlow := g5_u5_aux_lad n p hp hpl (g5_u5_aux_open_nc p ho)
    have hstep := g5_u5_mono_b_step p hp ho a ha
    have hev : ntr (p ++ [a]) = (((n + 1 : ℕ) : ZPhi) + 4) * phi := by
      rw [g5_u5_aux_ntr_rot hv, he]
    have hpe : ntr p = ((n : ZPhi) + 4) * phi := by
      refine g5_u5_aux_antisymm ?_ hlow
      rw [hev, g5_u5_aux_le_iff] at hstep
      rw [g5_u5_aux_le_iff]
      simp only [map_add, map_mul, map_natCast, g5_u5_aux_v_phi, map_ofNat] at hstep ⊢
      push_cast at hstep
      linarith
    rcases ih p hp hpl (g5_u5_aux_open_nc p ho) hpe with hA | hB
    · have hp2 : p = 2 :: List.replicate (n + 2) 1 := by
        rcases ho with h | h | h
        · match p, h, hA with
          | b :: q, h, hA =>
            simp only [List.head?_cons, Option.some.injEq] at h
            subst h
            have hq : List.Perm q (List.replicate (n + 2) 1) :=
              (List.perm_cons 2).1 (hA.perm.trans (List.perm_append_singleton _ _))
            rw [List.perm_replicate.1 hq]
        · match p, h, hA with
          | b :: q, h, hA =>
            simp only [List.head?_cons, Option.some.injEq] at h
            subst h
            have h3 := hA.mem_iff.1 (List.mem_cons_self ..)
            simp at h3
        · have h4 : 4 ∈ p := List.mem_of_mem_take (by rw [h]; simp)
          have h4' := hA.mem_iff.1 h4
          simp at h4'
      subst hp2
      have ha1 : a = 1 := by
        by_contra hne
        exact g5_u5_aux_xA (n + 2) a ⟨by omega, ha.2⟩
          ((congrArg ZPhi.x hev).trans (g5_u5_aux_x0 n))
      subst ha1
      left
      refine hv.trans ?_
      have e : 2 :: List.replicate (n + 2) 1 ++ [1] = [2] ++ List.replicate (n + 1 + 2) 1 := by
        change 2 :: (List.replicate (n + 2) 1 ++ [1]) = 2 :: List.replicate (n + 2 + 1) 1
        rw [List.replicate_succ' (n := n + 2)]
      rw [e]
      exact ⟨[2].length, List.rotate_append_length_eq _ _⟩
    · have hp3 : p = 3 :: List.replicate (n + 2) 4 := by
        rcases ho with h | h | h
        · match p, h, hB with
          | b :: q, h, hB =>
            simp only [List.head?_cons, Option.some.injEq] at h
            subst h
            have h2 := hB.mem_iff.1 (List.mem_cons_self ..)
            simp at h2
        · match p, h, hB with
          | b :: q, h, hB =>
            simp only [List.head?_cons, Option.some.injEq] at h
            subst h
            rw [List.perm_replicate.1 ((List.perm_cons 3).1 hB.perm)]
        · have h1 : 1 ∈ p := List.mem_of_mem_take (by rw [h]; simp)
          have h1' := hB.mem_iff.1 h1
          simp at h1'
      subst hp3
      have ha4 : a = 4 := by
        by_contra hne
        exact g5_u5_aux_xB (n + 2) a ⟨ha.1, by omega⟩
          ((congrArg ZPhi.x hev).trans (g5_u5_aux_x0 n))
      subst ha4
      right
      refine hv.trans ?_
      have e : 3 :: List.replicate (n + 2) 4 ++ [4] = 3 :: List.replicate (n + 1 + 2) 4 := by
        change 3 :: (List.replicate (n + 2) 4 ++ [4]) = 3 :: List.replicate (n + 2 + 1) 4
        rw [List.replicate_succ' (n := n + 2)]
      rw [e]

/-- G5-LADb, k ≥ 3: the minimum `(k + 1)φ` is attained exactly at the rotations of
`(1^{k−1}, 2)` and of `(3, 4^{k−1})`. -/
theorem g5_u5_lad_b_ge3 (w : List ℕ) (hw : IsWord w) (hk : 3 ≤ w.length)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4) :
    ntr w = ((w.length : ZPhi) + 1) * phi ↔
      (List.IsRotated w (List.replicate (w.length - 1) 1 ++ [2]) ∨
        List.IsRotated w (3 :: List.replicate (w.length - 1) 4)) := by
  obtain ⟨n, hn⟩ : ∃ n, w.length = n + 3 := ⟨w.length - 3, by omega⟩
  have hl1 : w.length - 1 = n + 2 := by omega
  rw [hl1]
  constructor
  · intro he
    exact g5_u5_aux_uniq n w hw hn hc (by rw [he, hn]; push_cast; ring)
  · rintro (h | h)
    · rw [← g5_u5_aux_ntr_rot h, g5_u5_aux_ntr_A, hn]
      push_cast; ring
    · rw [← g5_u5_aux_ntr_rot h, g5_u5_aux_ntr_B, hn]
      push_cast; ring

end G5
