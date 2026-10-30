import Mathlib
import G5.Ring.Solution
import G5.WordLevel.Solution

/-!
# Unit U7 (`G5/Group`) — the group-level corollaries and the φ-line: proofs

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
The statements are those of `G5/Group/Challenge.lean` (sha256 prefix `689c36e6`), byte for byte,
with proofs; the `HeckeGrp`/`IsNF` block is restated byte for byte. The prelude is unit U1's
PROVED module `G5.Ring.Solution`; unit U3's PROVED `G5.WordLevel.Solution` supplies Theorem A.
NF: every element of `⟨S, T⟩` is `E · W w · R^d` with `E ∈ {±I, ±S}` (right multiplication by
`S`, `R`, `−I` keeps the form); conjugating by `R^d` and reducing exponents mod 5, an exponent
sum `≡ 0` drops two `S`'s and the syllable count falls by one (induction on the count).
INTa/INTb: the trace is a conjugation invariant; read it off the four normal forms.
φ-line: `x(t)` dominates the `x`-part of each closed-path term of the block product (ℕ[φ]
coefficientwise); a term `φ s φ t` has `x ≥ 1`; the two families are computed directly.
-/

open G5 ZPhi

namespace G5

/-- The subgroup `⟨S, T⟩` of the units of `M2`: the closure of the units whose
underlying matrices are `S` and `T`. -/
def HeckeGrp : Subgroup M2ˣ :=
  Subgroup.closure {u : M2ˣ | (u : M2) = S ∨ (u : M2) = T}

/-- The syllable forms: `±I`, `±S`, `±R^a` (`1 ≤ a ≤ 4`), `±W w` (`IsWord w`). -/
def IsNF (m : M2) : Prop :=
  m = 1 ∨ m = -1 ∨ m = S ∨ m = -S ∨
    (∃ a : ℕ, (1 ≤ a ∧ a ≤ 4) ∧ (m = R ^ a ∨ m = -(R ^ a))) ∨
    ∃ w : List ℕ, IsWord w ∧ (m = W w ∨ m = -(W w))

end G5

namespace G5

/-! ### Helpers for G5-U7-NF -/

/-- Helper: `S² = −I`. -/
private theorem g5_u7_aux_SS : S * S = -1 := by decide

/-- Helper: `T = −(R S)`, from `R = T S` and `S² = −I`. -/
private theorem g5_u7_aux_T : T = -(R * S) := by decide

/-- Helper: `T⁻¹ = −(S R⁴)`. -/
private theorem g5_u7_aux_T_inv : T * -(S * R ^ 4) = 1 := by decide

/-- Helper: `S⁻¹ = −S`. -/
private theorem g5_u7_aux_S_inv : S * -S = 1 := by decide

/-- Helper: the unit `S`. -/
private def g5_u7_aux_uS : M2ˣ := ⟨S, -S, by decide, by decide⟩

/-- Helper: the unit `T`. -/
private def g5_u7_aux_uT : M2ˣ := ⟨T, -(S * R ^ 4), by decide, by decide⟩

/-- Helper: the unit `S` lies in `⟨S, T⟩`. -/
private theorem g5_u7_aux_uS_mem : g5_u7_aux_uS ∈ HeckeGrp :=
  Subgroup.subset_closure (Or.inl rfl)

/-- Helper: the unit `T` lies in `⟨S, T⟩`. -/
private theorem g5_u7_aux_uT_mem : g5_u7_aux_uT ∈ HeckeGrp :=
  Subgroup.subset_closure (Or.inr rfl)

/-- Helper: the unit `R^a = (T S)^a` lies in `⟨S, T⟩`. -/
private theorem g5_u7_aux_uR_pow_mem (a : ℕ) :
    (g5_u7_aux_uT * g5_u7_aux_uS) ^ a ∈ HeckeGrp :=
  pow_mem (mul_mem g5_u7_aux_uT_mem g5_u7_aux_uS_mem) a

/-- Helper: the unit `(T S)^a` has matrix `R^a`. -/
private theorem g5_u7_aux_uR_pow (a : ℕ) :
    (((g5_u7_aux_uT * g5_u7_aux_uS) ^ a : M2ˣ) : M2) = R ^ a := by
  rw [Units.val_pow_eq_pow_val]
  rfl

/-- Helper: `m` has a conjugate in `⟨S, T⟩` that is a normal form. -/
private def g5_u7_aux_Q (m : M2) : Prop :=
  ∃ h ∈ HeckeGrp, IsNF ((h : M2) * m * ((h⁻¹ : M2ˣ) : M2))

/-- Helper: `I` is a normal form. -/
private theorem g5_u7_aux_nf_one : IsNF 1 := Or.inl rfl

/-- Helper: `S` is a normal form. -/
private theorem g5_u7_aux_nf_S : IsNF S := Or.inr (Or.inr (Or.inl rfl))

/-- Helper: `R^a` (`1 ≤ a ≤ 4`) is a normal form. -/
private theorem g5_u7_aux_nf_R (a : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) : IsNF (R ^ a) :=
  Or.inr (Or.inr (Or.inr (Or.inr (Or.inl ⟨a, ha, Or.inl rfl⟩))))

/-- Helper: `W w` (`IsWord w`) is a normal form. -/
private theorem g5_u7_aux_nf_W (w : List ℕ) (hw : IsWord w) : IsNF (W w) :=
  Or.inr (Or.inr (Or.inr (Or.inr (Or.inr ⟨w, hw, Or.inl rfl⟩))))

/-- Helper: the normal forms are closed under negation. -/
private theorem g5_u7_aux_nf_neg {m : M2} (h : IsNF m) : IsNF (-m) := by
  rcases h with rfl | rfl | rfl | rfl | ⟨a, ha, rfl | rfl⟩ | ⟨w, hw, rfl | rfl⟩
  · exact Or.inr (Or.inl rfl)
  · exact Or.inl (neg_neg 1)
  · exact Or.inr (Or.inr (Or.inr (Or.inl rfl)))
  · exact Or.inr (Or.inr (Or.inl (neg_neg S)))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl ⟨a, ha, Or.inr rfl⟩))))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl ⟨a, ha, Or.inl (neg_neg _)⟩))))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr ⟨w, hw, Or.inr rfl⟩))))
  · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr ⟨w, hw, Or.inl (neg_neg _)⟩))))

/-- Helper: a normal form is conjugate (by `I`) to a normal form. -/
private theorem g5_u7_aux_nf_Q {m : M2} (h : IsNF m) : g5_u7_aux_Q m :=
  ⟨1, one_mem _, by simpa using h⟩

/-- Helper: `Q` is closed under negation. -/
private theorem g5_u7_aux_Q_neg {m : M2} (h : g5_u7_aux_Q m) : g5_u7_aux_Q (-m) := by
  obtain ⟨k, hk, hn⟩ := h
  refine ⟨k, hk, ?_⟩
  rw [mul_neg, neg_mul]
  exact g5_u7_aux_nf_neg hn

/-- Helper: if `k m = m' k` for `k ∈ ⟨S, T⟩`, then `Q m'` gives `Q m`. -/
private theorem g5_u7_aux_Q_conj {m m' : M2} (k : M2ˣ) (hk : k ∈ HeckeGrp)
    (hkm : (k : M2) * m = m' * k) (h : g5_u7_aux_Q m') : g5_u7_aux_Q m := by
  obtain ⟨h, hh, hn⟩ := h
  refine ⟨h * k, mul_mem hh hk, ?_⟩
  have e : (k : M2) * m * ((k⁻¹ : M2ˣ) : M2) = m' := by
    rw [hkm, mul_assoc, Units.mul_inv, mul_one]
  have e2 : ((h * k : M2ˣ) : M2) * m * (((h * k)⁻¹ : M2ˣ) : M2) =
      (h : M2) * m' * ((h⁻¹ : M2ˣ) : M2) := by
    rw [mul_inv_rev, Units.val_mul, Units.val_mul, ← e]
    simp only [mul_assoc]
  rw [e2]
  exact hn

/-- Helper: `R^d = ± R^(d mod 5)`, from `R⁵ = −I`. -/
private theorem g5_u7_aux_Rmod (d : ℕ) : R ^ d = R ^ (d % 5) ∨ R ^ d = -(R ^ (d % 5)) := by
  have e : R ^ d = (R ^ 5) ^ (d / 5) * R ^ (d % 5) := by
    rw [← pow_mul, ← pow_add, Nat.div_add_mod]
  rw [e, g5_u1_r5]
  rcases neg_one_pow_eq_or M2 (d / 5) with h | h <;> rw [h] <;> simp

/-- Helper: `Q (R^(d mod 5) X)` gives `Q (R^d X)`. -/
private theorem g5_u7_aux_Q_mod (d : ℕ) (X : M2) (h : g5_u7_aux_Q (R ^ (d % 5) * X)) :
    g5_u7_aux_Q (R ^ d * X) := by
  rcases g5_u7_aux_Rmod d with e | e <;> rw [e]
  · exact h
  · rw [neg_mul]
    exact g5_u7_aux_Q_neg h

/-- Helper: `W [] = I`. -/
private theorem g5_u7_aux_W_nil : W [] = 1 := by simp [W]

/-- Helper: `W (a :: w) = R^a S W w`. -/
private theorem g5_u7_aux_W_cons (a : ℕ) (w : List ℕ) : W (a :: w) = R ^ a * (S * W w) := by
  simp [W, mul_assoc]

/-- Helper: `W (w ++ [a]) = W w R^a S`. -/
private theorem g5_u7_aux_W_snoc (w : List ℕ) (a : ℕ) : W (w ++ [a]) = W w * (R ^ a * S) := by
  simp [W, List.prod_append]

/-- Helper: `R^d` is conjugate to a normal form (`±I` or `±R^a`). -/
private theorem g5_u7_aux_q1_nil (d : ℕ) : g5_u7_aux_Q (R ^ d * W []) := by
  apply g5_u7_aux_Q_mod
  rw [g5_u7_aux_W_nil, mul_one]
  apply g5_u7_aux_nf_Q
  have hr := Nat.mod_lt d (by norm_num : 0 < 5)
  by_cases h0 : d % 5 = 0
  · rw [h0, pow_zero]
    exact g5_u7_aux_nf_one
  · exact g5_u7_aux_nf_R (d % 5) ⟨by omega, by omega⟩

/-- Helper: `R^d S W w` reduces to `S W w` (when `d ≡ 0`) or is `±W (r :: w)`. -/
private theorem g5_u7_aux_q2 (d : ℕ) (w : List ℕ) (hw : ∀ a ∈ w, 1 ≤ a ∧ a ≤ 4)
    (hS : g5_u7_aux_Q (S * W w)) : g5_u7_aux_Q (R ^ d * (S * W w)) := by
  apply g5_u7_aux_Q_mod
  have hr := Nat.mod_lt d (by norm_num : 0 < 5)
  by_cases h0 : d % 5 = 0
  · rw [h0, pow_zero, one_mul]
    exact hS
  · apply g5_u7_aux_nf_Q
    rw [← g5_u7_aux_W_cons]
    refine g5_u7_aux_nf_W _ ⟨List.cons_ne_nil _ _, ?_⟩
    intro a ha
    rcases List.mem_cons.1 ha with rfl | ha
    · omega
    · exact hw a ha

/-- Helper: `S` is a normal form. -/
private theorem g5_u7_aux_qS_nil : g5_u7_aux_Q (S * W []) := by
  rw [g5_u7_aux_W_nil, mul_one]
  exact g5_u7_aux_nf_Q g5_u7_aux_nf_S

/-- Helper (the length drop): `S W w R^a S` is conjugate, by `S` then `R^a`, to `−R^a W w`. -/
private theorem g5_u7_aux_qS_snoc (w : List ℕ) (a : ℕ) (h : g5_u7_aux_Q (R ^ a * W w)) :
    g5_u7_aux_Q (S * W (w ++ [a])) := by
  rw [g5_u7_aux_W_snoc]
  refine g5_u7_aux_Q_conj (m' := -(W w * R ^ a)) g5_u7_aux_uS g5_u7_aux_uS_mem ?_ ?_
  · change S * (S * (W w * (R ^ a * S))) = -(W w * R ^ a) * S
    rw [← mul_assoc S S, g5_u7_aux_SS]
    simp [mul_assoc]
  · apply g5_u7_aux_Q_neg
    refine g5_u7_aux_Q_conj (m' := R ^ a * W w) ((g5_u7_aux_uT * g5_u7_aux_uS) ^ a)
      (g5_u7_aux_uR_pow_mem a) ?_ h
    rw [g5_u7_aux_uR_pow]
    simp [mul_assoc]

/-- Helper: `R^d W (a :: w) = R^(d + a) S W w`. -/
private theorem g5_u7_aux_q1_cons (d a : ℕ) (w : List ℕ)
    (h : g5_u7_aux_Q (R ^ (d + a) * (S * W w))) : g5_u7_aux_Q (R ^ d * W (a :: w)) := by
  rw [g5_u7_aux_W_cons, ← mul_assoc, ← pow_add]
  exact h

/-- Helper (the cyclic reduction, by induction on the syllable count): `R^d W w` and
`R^d S W w` are each conjugate in `⟨S, T⟩` to a normal form. -/
private theorem g5_u7_aux_red (n : ℕ) : ∀ w : List ℕ, (∀ a ∈ w, 1 ≤ a ∧ a ≤ 4) →
    w.length ≤ n → ∀ d : ℕ, g5_u7_aux_Q (R ^ d * W w) ∧ g5_u7_aux_Q (R ^ d * (S * W w)) := by
  induction n with
  | zero =>
    intro w hw hl d
    obtain rfl : w = [] := List.eq_nil_of_length_eq_zero (by omega)
    exact ⟨g5_u7_aux_q1_nil d, g5_u7_aux_q2 d [] hw g5_u7_aux_qS_nil⟩
  | succ n ih =>
    intro w hw hl d
    refine ⟨?_, ?_⟩
    · rcases w with _ | ⟨a, w⟩
      · exact g5_u7_aux_q1_nil d
      · apply g5_u7_aux_q1_cons
        refine (ih w (fun b hb => hw b (List.mem_cons_of_mem a hb)) ?_ (d + a)).2
        simp only [List.length_cons] at hl
        omega
    · apply g5_u7_aux_q2 d w hw
      rcases List.eq_nil_or_concat' w with rfl | ⟨L, b, rfl⟩
      · exact g5_u7_aux_qS_nil
      · apply g5_u7_aux_qS_snoc
        refine (ih L (fun c hc => hw c (by simp [hc])) ?_ b).1
        simp only [List.length_append, List.length_singleton] at hl
        omega

/-- Helper: `E ∈ {I, −I, S, −S}`. -/
private def g5_u7_aux_IsE (E : M2) : Prop := E = 1 ∨ E = -1 ∨ E = S ∨ E = -S

/-- Helper: `{±I, ±S}` is closed under negation. -/
private theorem g5_u7_aux_IsE_neg {E : M2} (h : g5_u7_aux_IsE E) : g5_u7_aux_IsE (-E) := by
  unfold g5_u7_aux_IsE at h ⊢
  rcases h with rfl | rfl | rfl | rfl <;> simp

/-- Helper: `{±I, ±S}` is closed under multiplication. -/
private theorem g5_u7_aux_IsE_mul {E F : M2} (hE : g5_u7_aux_IsE E) (hF : g5_u7_aux_IsE F) :
    g5_u7_aux_IsE (E * F) := by
  unfold g5_u7_aux_IsE at hE hF ⊢
  rcases hE with rfl | rfl | rfl | rfl <;> rcases hF with rfl | rfl | rfl | rfl <;>
    simp [g5_u7_aux_SS]

/-- Helper: the representation `m = E · W w · R^d`. -/
private def g5_u7_aux_Rep (m : M2) : Prop :=
  ∃ E w d, g5_u7_aux_IsE E ∧ (∀ a ∈ w, 1 ≤ a ∧ a ≤ 4) ∧ m = E * W w * R ^ d

/-- Helper: `W w R^d S = F · W w' · R^d'` with `F ∈ {±I, ±S}`. -/
private theorem g5_u7_aux_core (w : List ℕ) (hw : ∀ a ∈ w, 1 ≤ a ∧ a ≤ 4) (d : ℕ) :
    ∃ F w' d', g5_u7_aux_IsE F ∧ (∀ a ∈ w', 1 ≤ a ∧ a ≤ 4) ∧
      W w * R ^ d * S = F * W w' * R ^ d' := by
  have hr := Nat.mod_lt d (by norm_num : 0 < 5)
  have base : ∃ F w' d', g5_u7_aux_IsE F ∧ (∀ a ∈ w', 1 ≤ a ∧ a ≤ 4) ∧
      W w * R ^ (d % 5) * S = F * W w' * R ^ d' := by
    by_cases h0 : d % 5 = 0
    · rw [h0, pow_zero, mul_one]
      rcases List.eq_nil_or_concat' w with rfl | ⟨L, b, rfl⟩
      · exact ⟨S, [], 0, Or.inr (Or.inr (Or.inl rfl)), by simp, by simp [W]⟩
      · refine ⟨-1, L, b, Or.inr (Or.inl rfl), fun c hc => hw c (by simp [hc]), ?_⟩
        rw [g5_u7_aux_W_snoc]
        simp [mul_assoc, g5_u7_aux_SS]
    · refine ⟨1, w ++ [d % 5], 0, Or.inl rfl, ?_, ?_⟩
      · intro c hc
        rcases List.mem_append.1 hc with hc | hc
        · exact hw c hc
        · rw [List.mem_singleton] at hc
          omega
      · rw [g5_u7_aux_W_snoc]
        simp [mul_assoc]
  rcases g5_u7_aux_Rmod d with e | e
  · rw [e]
    exact base
  · obtain ⟨F, w', d', hF, hw', he⟩ := base
    refine ⟨-F, w', d', g5_u7_aux_IsE_neg hF, hw', ?_⟩
    rw [e, mul_neg, neg_mul, he, neg_mul, neg_mul]

/-- Helper: the representation survives right multiplication by `S`. -/
private theorem g5_u7_aux_rep_S {m : M2} (h : g5_u7_aux_Rep m) : g5_u7_aux_Rep (m * S) := by
  obtain ⟨E, w, d, hE, hw, rfl⟩ := h
  obtain ⟨F, w', d', hF, hw', he⟩ := g5_u7_aux_core w hw d
  refine ⟨E * F, w', d', g5_u7_aux_IsE_mul hE hF, hw', ?_⟩
  calc E * W w * R ^ d * S = E * (W w * R ^ d * S) := by simp only [mul_assoc]
    _ = E * (F * W w' * R ^ d') := by rw [he]
    _ = E * F * W w' * R ^ d' := by simp only [mul_assoc]

/-- Helper: the representation survives right multiplication by `R`. -/
private theorem g5_u7_aux_rep_R {m : M2} (h : g5_u7_aux_Rep m) : g5_u7_aux_Rep (m * R) := by
  obtain ⟨E, w, d, hE, hw, rfl⟩ := h
  exact ⟨E, w, d + 1, hE, hw, by simp only [pow_succ, mul_assoc]⟩

/-- Helper: the representation survives negation. -/
private theorem g5_u7_aux_rep_neg {m : M2} (h : g5_u7_aux_Rep m) : g5_u7_aux_Rep (-m) := by
  obtain ⟨E, w, d, hE, hw, rfl⟩ := h
  exact ⟨-E, w, d, g5_u7_aux_IsE_neg hE, hw, by simp⟩

/-- Helper: every element of `⟨S, T⟩` has the representation `E · W w · R^d`. -/
private theorem g5_u7_aux_rep (g : M2ˣ) (hg : g ∈ HeckeGrp) : g5_u7_aux_Rep (g : M2) := by
  induction hg using Subgroup.closure_induction_right with
  | one => exact ⟨1, [], 0, Or.inl rfl, by simp, by simp [W]⟩
  | mul_right x hx y hy ih =>
    rw [Units.val_mul]
    rcases hy with hy | hy <;> rw [hy]
    · exact g5_u7_aux_rep_S ih
    · rw [g5_u7_aux_T, mul_neg, ← mul_assoc]
      exact g5_u7_aux_rep_neg (g5_u7_aux_rep_S (g5_u7_aux_rep_R ih))
  | mul_inv_cancel x hx y hy ih =>
    rw [Units.val_mul]
    rcases hy with hy | hy
    · rw [Units.inv_eq_of_mul_eq_one_right (a := -S) (by rw [hy]; exact g5_u7_aux_S_inv),
        mul_neg]
      exact g5_u7_aux_rep_neg (g5_u7_aux_rep_S ih)
    · rw [Units.inv_eq_of_mul_eq_one_right (a := -(S * R ^ 4))
        (by rw [hy]; exact g5_u7_aux_T_inv), mul_neg]
      have e : (x : M2) * (S * R ^ 4) = (x : M2) * S * R * R * R * R := by
        simp only [pow_succ, pow_zero, one_mul, mul_assoc]
      rw [e]
      exact g5_u7_aux_rep_neg (g5_u7_aux_rep_R (g5_u7_aux_rep_R (g5_u7_aux_rep_R
        (g5_u7_aux_rep_R (g5_u7_aux_rep_S ih)))))

/-! ### Helpers for G5-U7-INTa / INTb -/

/-- Helper: the trace is a conjugation invariant. -/
private theorem g5_u7_aux_tr_conj (h g : M2ˣ) :
    ((h * g * h⁻¹ : M2ˣ) : M2).trace = (g : M2).trace := by
  rw [Units.val_mul, Units.val_mul, Matrix.trace_mul_cycle, Units.inv_mul, one_mul]

/-- Helper: `tr W = ± t` for a word, from `t = (−1)^k tr W`. -/
private theorem g5_u7_aux_trW (w : List ℕ) (hw : IsWord w) :
    (W w).trace = ntr w ∨ (W w).trace = -ntr w := by
  rw [g5_u1_trace w hw]
  rcases neg_one_pow_eq_or ZPhi w.length with h | h <;> rw [h] <;> simp

/-- Helper: the four powers `R^a` (`1 ≤ a ≤ 4`) have traces with non-zero φ-coefficient. -/
private theorem g5_u7_aux_trR (a : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) : (R ^ a).trace.y ≠ 0 := by
  obtain ⟨h1, h4⟩ := ha
  rw [Matrix.trace_fin_two]
  interval_cases a <;> decide

/-! ### Helpers for the φ-line (G5-PHIa / PHIb / PHIc) -/

/-- Helper: ℕ[φ] is closed under addition. -/
private theorem g5_u7_aux_nonneg_add {s t : ZPhi} (hs : nonneg s) (ht : nonneg t) :
    nonneg (s + t) := by
  obtain ⟨h1, h2⟩ := hs
  obtain ⟨h3, h4⟩ := ht
  exact ⟨show 0 ≤ s.x + t.x by omega, show 0 ≤ s.y + t.y by omega⟩

/-- Helper: ℕ[φ] is closed under multiplication. -/
private theorem g5_u7_aux_nonneg_mul {s t : ZPhi} (hs : nonneg s) (ht : nonneg t) :
    nonneg (s * t) := by
  obtain ⟨h1, h2⟩ := hs
  obtain ⟨h3, h4⟩ := ht
  exact ⟨show 0 ≤ s.x * t.x + s.y * t.y from
      add_nonneg (mul_nonneg h1 h3) (mul_nonneg h2 h4),
    show 0 ≤ s.x * t.y + s.y * t.x + s.y * t.y from
      add_nonneg (add_nonneg (mul_nonneg h1 h4) (mul_nonneg h2 h3)) (mul_nonneg h2 h4)⟩

/-- Helper: entrywise ℕ[φ] matrices are closed under multiplication. -/
private theorem g5_u7_aux_mat_mul {A B : M2} (hA : ∀ i j, nonneg (A i j))
    (hB : ∀ i j, nonneg (B i j)) : ∀ i j, nonneg ((A * B) i j) := fun i j => by
  rw [Matrix.mul_apply, Fin.sum_univ_two]
  exact g5_u7_aux_nonneg_add (g5_u7_aux_nonneg_mul (hA i 0) (hB 0 j))
    (g5_u7_aux_nonneg_mul (hA i 1) (hB 1 j))

/-- Helper: non-zero elements of ℕ[φ] are closed under multiplication. -/
private theorem g5_u7_aux_pos_mul {s t : ZPhi} (hs : nonneg s ∧ 1 ≤ s.x + s.y)
    (ht : nonneg t ∧ 1 ≤ t.x + t.y) : nonneg (s * t) ∧ 1 ≤ (s * t).x + (s * t).y := by
  refine ⟨g5_u7_aux_nonneg_mul hs.1 ht.1, ?_⟩
  obtain ⟨⟨h1, h2⟩, h5⟩ := hs
  obtain ⟨⟨h3, h4⟩, h6⟩ := ht
  simp only [mul_x, mul_y]
  nlinarith [mul_nonneg h1 h3, mul_nonneg h1 h4, mul_nonneg h2 h3, mul_nonneg h2 h4]

/-- Helper: an entry of a product of ℕ[φ] matrices dominates, coefficientwise, each term
of its sum. -/
private theorem g5_u7_aux_dom {A B : M2} (hA : ∀ i j, nonneg (A i j))
    (hB : ∀ i j, nonneg (B i j)) (i j k : Fin 2) :
    nonneg ((A * B) i j - A i k * B k j) := by
  rw [Matrix.mul_apply, Fin.sum_univ_two]
  fin_cases k
  · simp only [Fin.zero_eta, Fin.isValue, add_sub_cancel_left]
    exact g5_u7_aux_nonneg_mul (hA i 1) (hB 1 j)
  · simp only [Fin.mk_one, Fin.isValue, add_sub_cancel_right]
    exact g5_u7_aux_nonneg_mul (hA i 0) (hB 0 j)

/-- Helper: an element dominating a non-zero element of ℕ[φ] is a non-zero element. -/
private theorem g5_u7_aux_mono_pos {u v : ZPhi} (h : nonneg (u - v))
    (hv : nonneg v ∧ 1 ≤ v.x + v.y) : nonneg u ∧ 1 ≤ u.x + u.y := by
  obtain ⟨h1, h2⟩ := h
  obtain ⟨⟨h3, h4⟩, h5⟩ := hv
  simp only [sub_x, sub_y] at h1 h2
  exact ⟨⟨by omega, by omega⟩, by omega⟩

/-- Helper: domination is transitive. -/
private theorem g5_u7_aux_trans {u v t : ZPhi} (h1 : nonneg (u - v)) (h2 : nonneg (v - t)) :
    nonneg (u - t) := by
  have e : u - t = (u - v) + (v - t) := by ring
  rw [e]
  exact g5_u7_aux_nonneg_add h1 h2

/-- Helper: multiplying by an element of ℕ[φ] keeps domination. -/
private theorem g5_u7_aux_mono {s u v : ZPhi} (hs : nonneg s) (h : nonneg (u - v)) :
    nonneg (s * u - s * v) := by
  rw [← mul_sub]
  exact g5_u7_aux_nonneg_mul hs h

/-- Helper: a diagonal entry of a four-fold product of ℕ[φ] matrices dominates each of its
closed-path terms. -/
private theorem g5_u7_aux_chain {A B C D : M2} (hA : ∀ i j, nonneg (A i j))
    (hB : ∀ i j, nonneg (B i j)) (hC : ∀ i j, nonneg (C i j)) (hD : ∀ i j, nonneg (D i j))
    (i j k l : Fin 2) :
    nonneg ((A * (B * (C * D))) i i - A i j * (B j k * (C k l * D l i))) := by
  have hCD := g5_u7_aux_mat_mul hC hD
  have hBCD := g5_u7_aux_mat_mul hB hCD
  refine g5_u7_aux_trans (g5_u7_aux_dom hA hBCD i i j) (g5_u7_aux_mono (hA i j) ?_)
  refine g5_u7_aux_trans (g5_u7_aux_dom hB hCD j i k) (g5_u7_aux_mono (hB j k) ?_)
  exact g5_u7_aux_dom hC hD k i l

/-- Helper: domination keeps `x ≥ 1`. -/
private theorem g5_u7_aux_x_mono {u v : ZPhi} (h : nonneg (u - v)) (hv : 1 ≤ v.x) :
    1 ≤ u.x := by
  have h1 := h.1
  simp only [sub_x] at h1
  omega

/-- Helper: the trace's `x` is at least that of either diagonal entry. -/
private theorem g5_u7_aux_tr_x {A : M2} (hA : ∀ i j, nonneg (A i j)) (k : Fin 2)
    (h : 1 ≤ (A k k).x) : 1 ≤ A.trace.x := by
  have h0 := (hA 0 0).1
  have h1 := (hA 1 1).1
  rw [Matrix.trace_fin_two, add_x]
  fin_cases k
  · simp only [Fin.zero_eta, Fin.isValue] at h
    omega
  · simp only [Fin.mk_one, Fin.isValue] at h
    omega

/-- Helper: a closed-path term `φ s φ t` with `s, t` non-zero in ℕ[φ] has `x ≥ 1`
(`φ² = 1 + φ`). -/
private theorem g5_u7_aux_phi_term {s t : ZPhi} (hs : nonneg s ∧ 1 ≤ s.x + s.y)
    (ht : nonneg t ∧ 1 ≤ t.x + t.y) : 1 ≤ (phi * (s * (phi * t))).x := by
  obtain ⟨⟨h1, h2⟩, h5⟩ := hs
  obtain ⟨⟨h3, h4⟩, h6⟩ := ht
  have key : 1 ≤ (s.x + s.y) * (t.x + t.y) := by nlinarith
  simp only [phi, mul_x, mul_y]
  nlinarith [mul_nonneg h2 h4]

/-- Helper: each block `P_a` is an ℕ[φ] matrix with non-zero diagonal. -/
private theorem g5_u7_aux_P_pos (a : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) :
    (∀ i j, nonneg (P a i j)) ∧ (nonneg (P a 0 0) ∧ 1 ≤ (P a 0 0).x + (P a 0 0).y) ∧
      (nonneg (P a 1 1) ∧ 1 ≤ (P a 1 1).x + (P a 1 1).y) := by
  obtain ⟨h1, h4⟩ := ha
  interval_cases a <;> refine ⟨fun i j => ?_, ?_, ?_⟩ <;> try decide
  all_goals fin_cases i <;> fin_cases j <;> decide

/-- Helper: the block product splits over concatenation. -/
private theorem g5_u7_aux_bp_append (l₁ l₂ : List ℕ) :
    blockProd (l₁ ++ l₂) = blockProd l₁ * blockProd l₂ := by
  simp [blockProd, List.prod_append]

/-- Helper: the block product prepends a block. -/
private theorem g5_u7_aux_bp_cons (a : ℕ) (l : List ℕ) :
    blockProd (a :: l) = P a * blockProd l := by
  simp [blockProd]

/-- Helper: on syllables in `{1, 2, 3, 4}` every entry of the block product lies in ℕ[φ],
and the two diagonal entries are non-zero. -/
private theorem g5_u7_aux_bp_pos (w : List ℕ) (hw : ∀ a ∈ w, 1 ≤ a ∧ a ≤ 4) :
    (∀ i j, nonneg (blockProd w i j)) ∧
      (nonneg (blockProd w 0 0) ∧ 1 ≤ (blockProd w 0 0).x + (blockProd w 0 0).y) ∧
      (nonneg (blockProd w 1 1) ∧ 1 ≤ (blockProd w 1 1).x + (blockProd w 1 1).y) := by
  induction w with
  | nil =>
    simp only [blockProd, List.map_nil, List.prod_nil]
    refine ⟨fun i j => ?_, ?_, ?_⟩ <;> try decide
    fin_cases i <;> fin_cases j <;> decide
  | cons a w ih =>
    obtain ⟨hP, hP0, hP1⟩ := g5_u7_aux_P_pos a (hw a (List.mem_cons_self ..))
    obtain ⟨hB, hB0, hB1⟩ := ih fun b hb => hw b (List.mem_cons_of_mem a hb)
    rw [g5_u7_aux_bp_cons]
    exact ⟨g5_u7_aux_mat_mul hP hB,
      g5_u7_aux_mono_pos (g5_u7_aux_dom hP hB 0 0 0) (g5_u7_aux_pos_mul hP0 hB0),
      g5_u7_aux_mono_pos (g5_u7_aux_dom hP hB 1 1 1) (g5_u7_aux_pos_mul hP1 hB1)⟩

/-- Helper: the normalized trace is invariant under swapping two halves of a word. -/
private theorem g5_u7_aux_ntr_swap (l₁ l₂ : List ℕ) : ntr (l₁ ++ l₂) = ntr (l₂ ++ l₁) := by
  unfold ntr
  rw [g5_u7_aux_bp_append, g5_u7_aux_bp_append, Matrix.trace_mul_comm]

/-- Helper: the normalized trace is invariant under cyclic rotation. -/
private theorem g5_u7_aux_ntr_rot {w v : List ℕ} (h : w ~r v) : ntr w = ntr v := by
  obtain ⟨n, rfl⟩ := h
  rw [List.rotate_eq_drop_append_take_mod]
  conv_lhs => rw [← List.take_append_drop (n % w.length) w]
  exact g5_u7_aux_ntr_swap _ _

/-- Helper: a word in `{1, 4}` has `x ≥ 1` in the `(0, 0)` entry (the all-`0` path,
weight `1`). -/
private theorem g5_u7_aux_x14 (w : List ℕ) (hw : ∀ a ∈ w, a = 1 ∨ a = 4) :
    1 ≤ (blockProd w 0 0).x := by
  induction w with
  | nil => simp [blockProd]
  | cons a w ih =>
    have hw' : ∀ c ∈ w, 1 ≤ c ∧ c ≤ 4 := fun c hc => by
      rcases hw c (List.mem_cons_of_mem a hc) with rfl | rfl <;> omega
    have ha := hw a (List.mem_cons_self ..)
    obtain ⟨hP, -, -⟩ := g5_u7_aux_P_pos a (by rcases ha with rfl | rfl <;> omega)
    obtain ⟨hB, -, -⟩ := g5_u7_aux_bp_pos w hw'
    have e : P a 0 0 = 1 := by rcases ha with rfl | rfl <;> decide
    have d := g5_u7_aux_dom hP hB 0 0 0
    rw [e, one_mul] at d
    rw [g5_u7_aux_bp_cons]
    exact g5_u7_aux_x_mono d (ih fun c hc => hw c (List.mem_cons_of_mem a hc))

/-- Helper: `x ≥ 1` for the trace of a block product `P_a M P_b N` whose closed path
`i → j → k → l → i` has weight `φ · M_jk · φ · N_li`. -/
private theorem g5_u7_aux_x_path (a b : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) (hb : 1 ≤ b ∧ b ≤ 4)
    (m n : List ℕ) (hm : ∀ c ∈ m, 1 ≤ c ∧ c ≤ 4) (hn : ∀ c ∈ n, 1 ≤ c ∧ c ≤ 4)
    (i j k l : Fin 2) (hij : P a i j = phi) (hkl : P b k l = phi)
    (hjk : nonneg (blockProd m j k) ∧ 1 ≤ (blockProd m j k).x + (blockProd m j k).y)
    (hli : nonneg (blockProd n l i) ∧ 1 ≤ (blockProd n l i).x + (blockProd n l i).y) :
    1 ≤ (ntr (a :: (m ++ b :: n))).x := by
  obtain ⟨hP, -, -⟩ := g5_u7_aux_P_pos a ha
  obtain ⟨hQ, -, -⟩ := g5_u7_aux_P_pos b hb
  obtain ⟨hM, -, -⟩ := g5_u7_aux_bp_pos m hm
  obtain ⟨hN, -, -⟩ := g5_u7_aux_bp_pos n hn
  unfold ntr
  rw [g5_u7_aux_bp_cons, g5_u7_aux_bp_append, g5_u7_aux_bp_cons]
  refine g5_u7_aux_tr_x (g5_u7_aux_mat_mul hP (g5_u7_aux_mat_mul hM
    (g5_u7_aux_mat_mul hQ hN))) i ?_
  refine g5_u7_aux_x_mono (g5_u7_aux_chain hP hM hQ hN i j k l) ?_
  rw [hij, hkl]
  exact g5_u7_aux_phi_term hjk hli

/-- Helper: the block product of `1^n` is `[[1, n φ], [0, 1]]`. -/
private theorem g5_u7_aux_bp_rep1 (n : ℕ) :
    blockProd (List.replicate n 1) = !![1, ⟨0, n⟩; 0, 1] := by
  induction n with
  | zero =>
    refine Matrix.ext fun i j => ?_
    fin_cases i <;> fin_cases j <;> simp [blockProd] <;> rfl
  | succ n ih =>
    rw [List.replicate_succ, g5_u7_aux_bp_cons, ih]
    refine Matrix.ext fun i j => ?_
    fin_cases i <;> fin_cases j <;> simp [P, phi, Matrix.mul_apply, Fin.sum_univ_two] <;>
      ext <;> simp

/-- Helper: the block product of `4^n` is `[[1, 0], [n φ, 1]]`. -/
private theorem g5_u7_aux_bp_rep4 (n : ℕ) :
    blockProd (List.replicate n 4) = !![1, 0; ⟨0, n⟩, 1] := by
  induction n with
  | zero =>
    refine Matrix.ext fun i j => ?_
    fin_cases i <;> fin_cases j <;> simp [blockProd] <;> rfl
  | succ n ih =>
    rw [List.replicate_succ, g5_u7_aux_bp_cons, ih]
    refine Matrix.ext fun i j => ?_
    fin_cases i <;> fin_cases j <;> simp [P, phi, Matrix.mul_apply, Fin.sum_univ_two] <;>
      ext <;> simp <;> ring

/-- Helper: `t (1^n 2) = (n + 2) φ`. -/
private theorem g5_u7_aux_ntr_fam1 (n : ℕ) :
    ntr (List.replicate n 1 ++ [2]) = ⟨0, (n : ℤ) + 2⟩ := by
  unfold ntr
  rw [g5_u7_aux_bp_append, g5_u7_aux_bp_rep1, Matrix.trace_fin_two]
  simp [blockProd, P, phi, Matrix.mul_apply, Fin.sum_univ_two]
  ext <;> simp <;> ring

/-- Helper: `t (3 4^n) = (n + 2) φ`. -/
private theorem g5_u7_aux_ntr_fam2 (n : ℕ) :
    ntr (3 :: List.replicate n 4) = ⟨0, (n : ℤ) + 2⟩ := by
  unfold ntr
  rw [g5_u7_aux_bp_cons, g5_u7_aux_bp_rep4, Matrix.trace_fin_two]
  simp [P, phi, Matrix.mul_apply, Fin.sum_univ_two]
  ext <;> simp <;> ring

/-- Helper (G5-PHIa, ⇒): a word with `x = 0` is a rotation of `1^{k−1} 2` or `3 4^{k−1}`.
No `2`/`3`: the all-`0` path has weight `1`. Two of them: the all-`0` path carries `φ²`.
One `2` with a `4`, or one `3` with a `1`: a closed path through both carries `φ²`. -/
private theorem g5_u7_aux_phi_fwd (w : List ℕ) (hw : ∀ a ∈ w, 1 ≤ a ∧ a ≤ 4)
    (hx : (ntr w).x = 0) :
    List.IsRotated w (List.replicate (w.length - 1) 1 ++ [2]) ∨
      List.IsRotated w (3 :: List.replicate (w.length - 1) 4) := by
  by_cases h23 : ∃ c ∈ w, c = 2 ∨ c = 3
  swap
  · exfalso
    push Not at h23
    have h14 : ∀ a ∈ w, a = 1 ∨ a = 4 := fun a ha => by
      have := hw a ha
      have := h23 a ha
      omega
    have hB := (g5_u7_aux_bp_pos w hw).1
    have := g5_u7_aux_tr_x hB 0 (g5_u7_aux_x14 w h14)
    unfold ntr at hx
    omega
  obtain ⟨c, hc, hc23⟩ := h23
  obtain ⟨l₁, l₂, rfl⟩ := List.append_of_mem hc
  have hcr : 1 ≤ c ∧ c ≤ 4 := by omega
  have hrest : ∀ b ∈ l₂ ++ l₁, 1 ≤ b ∧ b ≤ 4 := fun b hb => hw b (by
    simp only [List.mem_append, List.mem_cons] at hb ⊢
    tauto)
  have hrot : ntr (l₁ ++ c :: l₂) = ntr (c :: (l₂ ++ l₁)) := by
    rw [g5_u7_aux_ntr_swap]
    rfl
  rw [hrot] at hx
  by_cases hb : ∃ b ∈ l₂ ++ l₁, b = 2 ∨ b = 3
  · exfalso
    obtain ⟨b, hb, hb23⟩ := hb
    obtain ⟨m, n, hmn⟩ := List.append_of_mem hb
    rw [hmn] at hx hrest
    have hm : ∀ c ∈ m, 1 ≤ c ∧ c ≤ 4 := fun c h => hrest c (by simp [h])
    have hn : ∀ c ∈ n, 1 ≤ c ∧ c ≤ 4 := fun c h => hrest c (by simp [h])
    have hc0 : P c 0 0 = phi := by rcases hc23 with rfl | rfl <;> rfl
    have hb0 : P b 0 0 = phi := by rcases hb23 with rfl | rfl <;> rfl
    have := g5_u7_aux_x_path c b hcr (by omega) m n hm hn 0 0 0 0 hc0 hb0
      (g5_u7_aux_bp_pos m hm).2.1 (g5_u7_aux_bp_pos n hn).2.1
    omega
  push Not at hb
  have h14 : ∀ b ∈ l₂ ++ l₁, b = 1 ∨ b = 4 := fun b h => by
    have := hrest b h
    have := hb b h
    omega
  rcases hc23 with rfl | rfl
  · by_cases h4 : 4 ∈ l₂ ++ l₁
    · exfalso
      obtain ⟨m, n, hmn⟩ := List.append_of_mem h4
      rw [hmn] at hx hrest
      have hm : ∀ c ∈ m, 1 ≤ c ∧ c ≤ 4 := fun c h => hrest c (by simp [h])
      have hn : ∀ c ∈ n, 1 ≤ c ∧ c ≤ 4 := fun c h => hrest c (by simp [h])
      have := g5_u7_aux_x_path 2 4 (by omega) (by omega) m n hm hn 0 1 1 0 rfl rfl
        (g5_u7_aux_bp_pos m hm).2.2 (g5_u7_aux_bp_pos n hn).2.1
      omega
    · left
      have h1 : ∀ b ∈ l₂ ++ l₁, b = 1 := fun b h =>
        (h14 b h).resolve_right fun e => h4 (e ▸ h)
      refine ⟨(l₁ ++ [2]).length, ?_⟩
      rw [show l₁ ++ 2 :: l₂ = (l₁ ++ [2]) ++ l₂ by simp, List.rotate_append_length_eq,
        ← List.append_assoc]
      congr 1
      rw [List.eq_replicate_iff]
      refine ⟨?_, h1⟩
      simp only [List.length_append, List.length_cons, List.length_nil]
      omega
  · by_cases h1 : 1 ∈ l₂ ++ l₁
    · exfalso
      obtain ⟨m, n, hmn⟩ := List.append_of_mem h1
      rw [hmn] at hx hrest
      have hm : ∀ c ∈ m, 1 ≤ c ∧ c ≤ 4 := fun c h => hrest c (by simp [h])
      have hn : ∀ c ∈ n, 1 ≤ c ∧ c ≤ 4 := fun c h => hrest c (by simp [h])
      have := g5_u7_aux_x_path 3 1 (by omega) (by omega) m n hm hn 1 0 0 1 rfl rfl
        (g5_u7_aux_bp_pos m hm).2.1 (g5_u7_aux_bp_pos n hn).2.2
      omega
    · right
      have h4 : ∀ b ∈ l₂ ++ l₁, b = 4 := fun b h =>
        (h14 b h).resolve_left fun e => h1 (e ▸ h)
      refine ⟨l₁.length, ?_⟩
      rw [List.rotate_append_length_eq, List.cons_append]
      congr 1
      rw [List.eq_replicate_iff]
      refine ⟨?_, h4⟩
      simp only [List.length_append, List.length_cons]
      omega

/-- G5-U7-NF (normal form, existence). Every `g ∈ ⟨S, T⟩` has a conjugate `h g h⁻¹`,
`h ∈ ⟨S, T⟩`, equal to `±I`, `±S`, `±R^a` (`1 ≤ a ≤ 4`) or `±W w` for a word `w`.
Locus: `candidates/checks/AM-1-second-head.md` §4 "Scope" (l. 65–72) and the
Corollary of "Theorem as I would print it" (l. 263–267).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u7_nf (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    ∃ h ∈ HeckeGrp, IsNF ((h * g * h⁻¹ : M2ˣ) : M2) := by
  obtain ⟨E, w, d, hE, hw, he⟩ := g5_u7_aux_rep g hg
  have hQ : g5_u7_aux_Q (g : M2) := by
    refine g5_u7_aux_Q_conj (m' := R ^ d * (E * W w)) ((g5_u7_aux_uT * g5_u7_aux_uS) ^ d)
      (g5_u7_aux_uR_pow_mem d) ?_ ?_
    · rw [g5_u7_aux_uR_pow, he]
      simp [mul_assoc]
    · have hr := g5_u7_aux_red w.length w hw le_rfl d
      rcases hE with rfl | rfl | rfl | rfl
      · rw [one_mul]
        exact hr.1
      · rw [neg_one_mul, mul_neg]
        exact g5_u7_aux_Q_neg hr.1
      · exact hr.2
      · rw [neg_mul, mul_neg]
        exact g5_u7_aux_Q_neg hr.2
  obtain ⟨h, hh, hn⟩ := hQ
  refine ⟨h, hh, ?_⟩
  rw [Units.val_mul, Units.val_mul]
  exact hn

/-- G5-U7-INTa (integer traces, `⊆`). Every element of `⟨S, T⟩` whose trace has
φ-coefficient `0` has trace `0`, `2` or `−2`.
Locus: `candidates/LEDGER.md` row AM-1 (l. 12); `candidates/checks/AM-1-second-head.md`
Corollary (l. 263–267) and §4 (l. 73–77).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u7_int_a (g : M2ˣ) (hg : g ∈ HeckeGrp) (hy : phiCoeff (g : M2).trace = 0) :
    (g : M2).trace = 0 ∨ (g : M2).trace = (⟨2, 0⟩ : ZPhi) ∨
      (g : M2).trace = (⟨-2, 0⟩ : ZPhi) := by
  obtain ⟨h, -, hn⟩ := g5_u7_nf g hg
  rw [← g5_u7_aux_tr_conj h g] at hy ⊢
  generalize ((h * g * h⁻¹ : M2ˣ) : M2) = n at hy hn
  unfold phiCoeff at hy
  rcases hn with rfl | rfl | rfl | rfl | ⟨a, ha, rfl | rfl⟩ | ⟨w, hw, rfl | rfl⟩
  · right; left
    rw [Matrix.trace_fin_two]
    decide
  · right; right
    rw [Matrix.trace_fin_two]
    decide
  · left
    rw [Matrix.trace_fin_two]
    decide
  · left
    rw [Matrix.trace_fin_two]
    decide
  · exact absurd hy (g5_u7_aux_trR a ha)
  · rw [Matrix.trace_neg, neg_y, neg_eq_zero] at hy
    exact absurd hy (g5_u7_aux_trR a ha)
  · have hx := (g5_u3_a_y_eq_zero w hw).2
    have hy0 := (g5_u3_a_y_eq_zero w hw).1
    rcases g5_u7_aux_trW w hw with e | e <;> rw [e] at hy ⊢
    · have hc := hy0.1 hy
      right; left
      ext
      · exact hx hc
      · exact hy
    · rw [neg_y, neg_eq_zero] at hy
      have hc := hy0.1 hy
      right; right
      ext
      · simp [hx hc]
      · simp [hy]
  · rw [Matrix.trace_neg] at hy ⊢
    rw [neg_y, neg_eq_zero] at hy
    have hx := (g5_u3_a_y_eq_zero w hw).2
    have hy0 := (g5_u3_a_y_eq_zero w hw).1
    rcases g5_u7_aux_trW w hw with e | e <;> rw [e] at hy ⊢
    · have hc := hy0.1 hy
      right; right
      ext
      · simp [hx hc]
      · simp [hy]
    · rw [neg_y, neg_eq_zero] at hy
      have hc := hy0.1 hy
      right; left
      ext
      · simp [hx hc]
      · simp [hy]

/-- G5-U7-INTb (integer traces, `⊇`). Each of `0`, `2`, `−2` is the trace of some
element of `⟨S, T⟩`.
Locus: `candidates/checks/AM-1-second-head.md` Corollary, last sentence (l. 267) and
§4 (l. 73–76); `candidates/LEDGER.md` row AM-1 (l. 12).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u7_int_b (t : ZPhi)
    (ht : t = 0 ∨ t = (⟨2, 0⟩ : ZPhi) ∨ t = (⟨-2, 0⟩ : ZPhi)) :
    ∃ g ∈ HeckeGrp, (g : M2).trace = t := by
  rcases ht with rfl | rfl | rfl
  · refine ⟨g5_u7_aux_uS, g5_u7_aux_uS_mem, ?_⟩
    change S.trace = 0
    rw [Matrix.trace_fin_two]
    decide
  · refine ⟨1, one_mem _, ?_⟩
    rw [Units.val_one, Matrix.trace_fin_two]
    decide
  · refine ⟨g5_u7_aux_uS * g5_u7_aux_uS, mul_mem g5_u7_aux_uS_mem g5_u7_aux_uS_mem, ?_⟩
    change (S * S).trace = _
    rw [g5_u7_aux_SS, Matrix.trace_fin_two]
    decide

/-- G5-PHIa (the φ-line, characterization). For every word, `x = 0` in `t = x + y φ`
iff the word is a cyclic rotation of `(1^{k−1}, 2)` or of `(3, 4^{k−1})`.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 Remark (l. 120–128);
`candidates/LEDGER.md` row R-4 (l. 37).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u7_phi_a (w : List ℕ) (hw : IsWord w) :
    (ntr w).x = 0 ↔
      (List.IsRotated w (List.replicate (w.length - 1) 1 ++ [2]) ∨
        List.IsRotated w (3 :: List.replicate (w.length - 1) 4)) := by
  constructor
  · exact g5_u7_aux_phi_fwd w hw.2
  · rintro (h | h)
    · rw [g5_u7_aux_ntr_rot h, g5_u7_aux_ntr_fam1]
    · rw [g5_u7_aux_ntr_rot h, g5_u7_aux_ntr_fam2]

/-- G5-PHIb (the φ-line, value). For every word with `x = 0`, `t = (k + 1) φ`.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 Remark, step 6 (l. 126)
and l. 128; `candidates/LEDGER.md` row R-4 (l. 37).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u7_phi_b (w : List ℕ) (hw : IsWord w) (hx : (ntr w).x = 0) :
    ntr w = (⟨0, (w.length : ℤ) + 1⟩ : ZPhi) := by
  have hlen : 1 ≤ w.length := by
    cases w with
    | nil => exact absurd rfl hw.1
    | cons a l => simp
  rcases g5_u7_aux_phi_fwd w hw.2 hx with h | h
  · rw [g5_u7_aux_ntr_rot h, g5_u7_aux_ntr_fam1]
    ext
    · rfl
    · simp only
      omega
  · rw [g5_u7_aux_ntr_rot h, g5_u7_aux_ntr_fam2]
    ext
    · rfl
    · simp only
      omega

/-- G5-PHIc (the φ-line, realization). For every `k ≥ 1` some word of syllable count `k`
has `t = (k + 1) φ`.
Locus: RPA transcript, session `2026-10-29-g5-phase-1-structure-dig`, `transcript/rpa.md`
(l. 37); `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 "Realization" (l. 110).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u7_phi_c (k : ℕ) (hk : 1 ≤ k) :
    ∃ w : List ℕ, IsWord w ∧ w.length = k ∧ ntr w = (⟨0, (k : ℤ) + 1⟩ : ZPhi) := by
  refine ⟨List.replicate (k - 1) 1 ++ [2], ⟨by simp, ?_⟩, by simp; omega, ?_⟩
  · intro a ha
    rcases List.mem_append.1 ha with ha | ha
    · rw [List.eq_of_mem_replicate ha]
      omega
    · rw [List.mem_singleton] at ha
      omega
  · rw [g5_u7_aux_ntr_fam1]
    ext
    · rfl
    · simp only
      omega

end G5
