import Mathlib
import G5.Ring.Solution

/-!
# Unit U4 (`G5/Sector`) — the sector (Theorem B) and the floor: proofs

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
The prelude is unit U1's proved module `G5.Ring.Solution` (the prelude rule for a dependent
unit); the one definition this unit owns, `ZPhi.rabs`, is restated byte for byte from
`G5/Sector/Challenge.lean` (sha256 prefix `df5fdf79`) in the same position, and the nine
theorems carry the same names and statement texts, with proofs.
Method: each block `P_a` is the value at `λ = φ` of a matrix `Q_a` over `ℕ[λ]`, so
`t = Σ f_j φ^j` with `f_j ≥ 0` and `φ^j = F_{j−1} + F_j φ`. Hence `x − y ≤ f(0)` and
`y ≥ f(1) − f(0)`, where `f(0)` and `f(1)` are traces of products of the blocks at `λ = 0`
and `λ = 1` (matrices over ℕ), bounded by induction on the word. The equality family uses
monotonicity of the `{1, 4}`-products under deleting letters and the pattern `1, 4, 1, 4`.
-/

open G5 ZPhi

namespace G5

section g5_u4_aux

open Polynomial

private noncomputable def g5_u4_aux_Q : ℕ → Matrix (Fin 2) (Fin 2) ℕ[X]
  | 1 => !![1, X; 0, 1]
  | 2 => !![X, X; 1, X]
  | 3 => !![X, 1; X, X]
  | 4 => !![1, 0; X, 1]
  | _ => 1

private def g5_u4_aux_Z : ℕ → Matrix (Fin 2) (Fin 2) ℕ
  | 2 => !![0, 0; 1, 0]
  | 3 => !![0, 1; 0, 0]
  | _ => 1

private def g5_u4_aux_O : ℕ → Matrix (Fin 2) (Fin 2) ℕ
  | 1 => !![1, 1; 0, 1]
  | 2 => !![1, 1; 1, 1]
  | 3 => !![1, 1; 1, 1]
  | 4 => !![1, 0; 1, 1]
  | _ => 1

private noncomputable def g5_u4_aux_eps : ℕ[X] →+* ZPhi :=
  eval₂RingHom (Nat.castRingHom ZPhi) phi

private noncomputable def g5_u4_aux_T (w : List ℕ) : ℕ[X] := ((w.map g5_u4_aux_Q).prod).trace

private theorem g5_u4_aux_map_prod {β : Type*} [CommSemiring β] (f : ℕ[X] →+* β)
    (w : List ℕ) :
    ((w.map g5_u4_aux_Q).prod).map f = (w.map fun a => (g5_u4_aux_Q a).map f).prod := by
  induction w with
  | nil => simp [Matrix.map_one f (map_zero f) (map_one f)]
  | cons a w ih => simp [List.prod_cons, Matrix.map_mul, ih]

private theorem g5_u4_aux_map_trace {β : Type*} [CommSemiring β] (f : ℕ[X] →+* β)
    (M : Matrix (Fin 2) (Fin 2) ℕ[X]) : f M.trace = (M.map f).trace := by
  simp [Matrix.trace_fin_two]

private theorem g5_u4_aux_Q_eps (a : ℕ) : (g5_u4_aux_Q a).map g5_u4_aux_eps = P a := by
  rcases a with _ | _ | _ | _ | _ | a <;>
    · refine Matrix.ext fun i j => ?_
      fin_cases i <;> fin_cases j <;> simp [g5_u4_aux_Q, P, g5_u4_aux_eps]

private theorem g5_u4_aux_Q_ev0 (a : ℕ) : (g5_u4_aux_Q a).map (evalRingHom 0) = g5_u4_aux_Z a := by
  rcases a with _ | _ | _ | _ | _ | a <;>
    · ext i j; fin_cases i <;> fin_cases j <;> simp [g5_u4_aux_Q, g5_u4_aux_Z]

private theorem g5_u4_aux_Q_ev1 (a : ℕ) : (g5_u4_aux_Q a).map (evalRingHom 1) = g5_u4_aux_O a := by
  rcases a with _ | _ | _ | _ | _ | a <;>
    · ext i j; fin_cases i <;> fin_cases j <;> simp [g5_u4_aux_Q, g5_u4_aux_O]

private theorem g5_u4_aux_ntr_eq (w : List ℕ) : ntr w = g5_u4_aux_eps (g5_u4_aux_T w) := by
  rw [g5_u4_aux_T, g5_u4_aux_map_trace, g5_u4_aux_map_prod]
  simp only [g5_u4_aux_Q_eps]
  rfl

private theorem g5_u4_aux_T_ev0 (w : List ℕ) :
    (g5_u4_aux_T w).eval 0 = ((w.map g5_u4_aux_Z).prod).trace := by
  rw [← coe_evalRingHom, g5_u4_aux_T, g5_u4_aux_map_trace, g5_u4_aux_map_prod]
  simp only [g5_u4_aux_Q_ev0]

private theorem g5_u4_aux_T_ev1 (w : List ℕ) :
    (g5_u4_aux_T w).eval 1 = ((w.map g5_u4_aux_O).prod).trace := by
  rw [← coe_evalRingHom, g5_u4_aux_T, g5_u4_aux_map_trace, g5_u4_aux_map_prod]
  simp only [g5_u4_aux_Q_ev1]

private theorem g5_u4_aux_natCast (n : ℕ) : (n : ZPhi) = ⟨n, 0⟩ := by
  induction n with
  | zero => ext <;> simp
  | succ n ih => rw [Nat.cast_succ, ih]; ext <;> simp

private theorem g5_u4_aux_phi_pow (n : ℕ) : phi ^ (n + 1) = ⟨Nat.fib n, Nat.fib (n + 1)⟩ := by
  induction n with
  | zero => ext <;> simp [phi]
  | succ n ih =>
    rw [pow_succ, ih]
    ext <;> simp [phi, Nat.fib_add_two]

private theorem g5_u4_aux_coef (p : ℕ[X]) :
    0 ≤ (g5_u4_aux_eps p).x ∧ 0 ≤ (g5_u4_aux_eps p).y ∧
      ((p.eval 1 : ℕ) : ℤ) ≤ (g5_u4_aux_eps p).y + (p.eval 0 : ℕ) ∧
      (g5_u4_aux_eps p).x - (g5_u4_aux_eps p).y ≤ (p.eval 0 : ℕ) := by
  induction p using Polynomial.induction_on' with
  | add p q hp hq =>
    obtain ⟨h1, h2, h3, h4⟩ := hp
    obtain ⟨k1, k2, k3, k4⟩ := hq
    simp only [map_add, add_x, add_y, eval_add, Nat.cast_add]
    refine ⟨by linarith, by linarith, by linarith, by linarith⟩
  | monomial n a =>
    rcases n with _ | m
    · simp [g5_u4_aux_eps, g5_u4_aux_natCast]
    · have hf : 1 ≤ (Nat.fib (m + 1) : ℤ) := by exact_mod_cast Nat.fib_pos.mpr (by omega)
      have hm : (Nat.fib m : ℤ) ≤ Nat.fib (m + 1) := by exact_mod_cast Nat.fib_mono (by omega)
      have ha : (0 : ℤ) ≤ a := by positivity
      have hx : (g5_u4_aux_eps (monomial (m + 1) a)).x = a * Nat.fib m := by
        simp [g5_u4_aux_eps, g5_u4_aux_natCast, g5_u4_aux_phi_pow]
      have hy : (g5_u4_aux_eps (monomial (m + 1) a)).y = a * Nat.fib (m + 1) := by
        simp [g5_u4_aux_eps, g5_u4_aux_natCast, g5_u4_aux_phi_pow]
      have e1 : (monomial (m + 1) a).eval 1 = a := by simp
      have e0 : (monomial (m + 1) a).eval 0 = 0 := by simp
      rw [hx, hy, e1, e0]
      refine ⟨by positivity, by positivity, by push_cast; nlinarith, by push_cast; nlinarith⟩


private theorem g5_u4_aux_ntr_rotate (w : List ℕ) (n : ℕ) : ntr (w.rotate n) = ntr w := by
  induction n generalizing w with
  | zero => simp
  | succ n ih =>
    cases w with
    | nil => simp
    | cons a l =>
      rw [List.rotate_cons_succ, ih]
      simp only [ntr, blockProd, List.map_append, List.prod_append, List.map_cons, List.map_nil,
        List.prod_cons, List.prod_nil, mul_one]
      exact Matrix.trace_mul_comm _ _

private theorem g5_u4_aux_ntr_rot {w v : List ℕ} (h : List.IsRotated w v) : ntr v = ntr w := by
  obtain ⟨n, rfl⟩ := h
  exact g5_u4_aux_ntr_rotate w n

private theorem g5_u4_aux_Z_cases (a : ℕ) :
    (a = 2 ∧ g5_u4_aux_Z a = !![0, 0; 1, 0]) ∨ (a = 3 ∧ g5_u4_aux_Z a = !![0, 1; 0, 0]) ∨
      (a ≠ 2 ∧ a ≠ 3 ∧ g5_u4_aux_Z a = 1) := by
  rcases a with _ | _ | _ | _ | a <;> simp [g5_u4_aux_Z]

private theorem g5_u4_aux_Z_le (w : List ℕ) : ∀ i j, (w.map g5_u4_aux_Z).prod i j ≤ 1 := by
  induction w with
  | nil => intro i j; fin_cases i <;> fin_cases j <;> simp
  | cons a w ih =>
    intro i j
    have h00 := ih 0 0
    have h01 := ih 0 1
    have h10 := ih 1 0
    have h11 := ih 1 1
    simp only [List.map_cons, List.prod_cons]
    rcases g5_u4_aux_Z_cases a with ⟨-, h⟩ | ⟨-, h⟩ | ⟨-, -, h⟩ <;> rw [h] <;>
      fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_two] <;> omega

private theorem g5_u4_aux_Z_14 (w : List ℕ) (h : ∀ a ∈ w, a = 1 ∨ a = 4) :
    (w.map g5_u4_aux_Z).prod = 1 := by
  induction w with
  | nil => simp
  | cons a w ih =>
    simp only [List.map_cons, List.prod_cons]
    rw [ih fun b hb => h b (List.mem_cons_of_mem a hb)]
    rcases h a (List.mem_cons_self ..) with rfl | rfl <;> simp [g5_u4_aux_Z]

/-- Left multiplication by an explicit `2 × 2` matrix over ℕ, entry by entry. -/
private theorem g5_u4_aux_mul2 (a b c d : ℕ) (M : Matrix (Fin 2) (Fin 2) ℕ) :
    !![a, b; c, d] * M = !![a * M 0 0 + b * M 1 0, a * M 0 1 + b * M 1 1;
      c * M 0 0 + d * M 1 0, c * M 0 1 + d * M 1 1] := by
  refine Matrix.ext fun i j => ?_
  rw [Matrix.mul_apply, Fin.sum_univ_two]
  fin_cases i <;> fin_cases j <;> simp

/-- `T(0) ≤ 2` always. -/
private theorem g5_u4_aux_ev0_le2 (w : List ℕ) : (g5_u4_aux_T w).eval 0 ≤ 2 := by
  rw [g5_u4_aux_T_ev0, Matrix.trace_fin_two]
  have := g5_u4_aux_Z_le w 0 0
  have := g5_u4_aux_Z_le w 1 1
  omega

/-- On a `{1, 4}`-word, `T(0) = 2`. -/
private theorem g5_u4_aux_ev0_14 (w : List ℕ) (h : ∀ a ∈ w, a = 1 ∨ a = 4) :
    (g5_u4_aux_T w).eval 0 = 2 := by
  rw [g5_u4_aux_T_ev0, g5_u4_aux_Z_14 w h, Matrix.trace_fin_two]; simp

/-- A word led by a 2 or 3 has `T(0) ≤ 1`, and `T(0) = 0` when the rest lies in `{1, 4}`. -/
private theorem g5_u4_aux_ev0_23 (c : ℕ) (r : List ℕ) (hc : c = 2 ∨ c = 3) :
    (g5_u4_aux_T (c :: r)).eval 0 ≤ 1 ∧
      ((∀ a ∈ r, a = 1 ∨ a = 4) → (g5_u4_aux_T (c :: r)).eval 0 = 0) := by
  rw [g5_u4_aux_T_ev0]
  simp only [List.map_cons, List.prod_cons]
  have h01 := g5_u4_aux_Z_le r 0 1
  have h10 := g5_u4_aux_Z_le r 1 0
  rcases hc with rfl | rfl
  · refine ⟨?_, fun h => ?_⟩
    · simp only [g5_u4_aux_Z]
      rw [g5_u4_aux_mul2, Matrix.trace_fin_two]
      simp; omega
    · rw [g5_u4_aux_Z_14 r h]; simp [g5_u4_aux_Z, Matrix.trace_fin_two]
  · refine ⟨?_, fun h => ?_⟩
    · simp only [g5_u4_aux_Z]
      rw [g5_u4_aux_mul2, Matrix.trace_fin_two]
      simp; omega
    · rw [g5_u4_aux_Z_14 r h]; simp [g5_u4_aux_Z, Matrix.trace_fin_two]

/-- Products of the `λ = 1` blocks: diagonal `≥ 1` and entry sum `≥ k + 2`. -/
private theorem g5_u4_aux_O_sum (r : List ℕ) (hr : ∀ a ∈ r, 1 ≤ a ∧ a ≤ 4) :
    1 ≤ (r.map g5_u4_aux_O).prod 0 0 ∧ 1 ≤ (r.map g5_u4_aux_O).prod 1 1 ∧
      r.length + 2 ≤ (r.map g5_u4_aux_O).prod 0 0 + (r.map g5_u4_aux_O).prod 0 1 +
        (r.map g5_u4_aux_O).prod 1 0 + (r.map g5_u4_aux_O).prod 1 1 := by
  induction r with
  | nil => simp
  | cons a r ih =>
    obtain ⟨i1, i2, i3⟩ := ih fun b hb => hr b (List.mem_cons_of_mem a hb)
    obtain ⟨ha1, ha4⟩ := hr a (List.mem_cons_self ..)
    clear ih
    simp only [List.map_cons, List.prod_cons, List.length_cons]
    generalize (r.map g5_u4_aux_O).prod = M at i1 i2 i3 ⊢
    interval_cases a <;> simp only [g5_u4_aux_O] <;> rw [g5_u4_aux_mul2] <;> simp <;> omega

/-- Once a 2 or 3 occurs, the entry sum is `≥ k + 3`. -/
private theorem g5_u4_aux_O_sum2 (r : List ℕ) (hr : ∀ a ∈ r, 1 ≤ a ∧ a ≤ 4)
    (h : ∃ a ∈ r, a = 2 ∨ a = 3) :
    r.length + 3 ≤ (r.map g5_u4_aux_O).prod 0 0 + (r.map g5_u4_aux_O).prod 0 1 +
      (r.map g5_u4_aux_O).prod 1 0 + (r.map g5_u4_aux_O).prod 1 1 := by
  induction r with
  | nil => simp at h
  | cons a r ih =>
    have hr' : ∀ b ∈ r, 1 ≤ b ∧ b ≤ 4 := fun b hb => hr b (List.mem_cons_of_mem a hb)
    obtain ⟨i1, i2, i3⟩ := g5_u4_aux_O_sum r hr'
    obtain ⟨ha1, ha4⟩ := hr a (List.mem_cons_self ..)
    have i4 : a = 2 ∨ a = 3 ∨ r.length + 3 ≤ (r.map g5_u4_aux_O).prod 0 0 +
        (r.map g5_u4_aux_O).prod 0 1 + (r.map g5_u4_aux_O).prod 1 0 +
        (r.map g5_u4_aux_O).prod 1 1 := by
      obtain ⟨b, hb, hb23⟩ := h
      rcases List.mem_cons.1 hb with rfl | hb
      · omega
      · exact Or.inr (Or.inr (ih hr' ⟨b, hb, hb23⟩))
    clear ih h
    simp only [List.map_cons, List.prod_cons, List.length_cons]
    generalize (r.map g5_u4_aux_O).prod = M at i1 i2 i3 i4 ⊢
    interval_cases a <;> simp only [g5_u4_aux_O] <;> rw [g5_u4_aux_mul2] <;> simp <;> omega

/-- `{1, 4}`-products of the `λ = 1` blocks: `trace ≥ 2 + (#1)(#4)`. -/
private theorem g5_u4_aux_O_14 (r : List ℕ) (hr : ∀ a ∈ r, a = 1 ∨ a = 4) :
    1 ≤ (r.map g5_u4_aux_O).prod 0 0 ∧ 1 ≤ (r.map g5_u4_aux_O).prod 1 1 ∧
      r.count 1 ≤ (r.map g5_u4_aux_O).prod 0 1 ∧ r.count 4 ≤ (r.map g5_u4_aux_O).prod 1 0 ∧
      2 + r.count 1 * r.count 4 ≤
        (r.map g5_u4_aux_O).prod 0 0 + (r.map g5_u4_aux_O).prod 1 1 := by
  induction r with
  | nil => simp
  | cons a r ih =>
    obtain ⟨i1, i2, i3, i4, i5⟩ := ih fun b hb => hr b (List.mem_cons_of_mem a hb)
    have ha := hr a (List.mem_cons_self ..)
    clear ih
    simp only [List.map_cons, List.prod_cons, List.count_cons]
    generalize (r.map g5_u4_aux_O).prod = M at i1 i2 i3 i4 i5 ⊢
    rcases ha with rfl | rfl <;> simp only [g5_u4_aux_O] <;> rw [g5_u4_aux_mul2] <;> simp <;>
      constructorm* _ ∧ _ <;> nlinarith

/-- The defect `p(0) − (x − y)` is additive. -/
private theorem g5_u4_aux_D_add (p q : ℕ[X]) :
    (((p + q).eval 0 : ℕ) : ℤ) - ((g5_u4_aux_eps (p + q)).x - (g5_u4_aux_eps (p + q)).y) =
      (((p.eval 0 : ℕ) : ℤ) - ((g5_u4_aux_eps p).x - (g5_u4_aux_eps p).y)) +
      (((q.eval 0 : ℕ) : ℤ) - ((g5_u4_aux_eps q).x - (g5_u4_aux_eps q).y)) := by
  simp only [eval_add, map_add, add_x, add_y, Nat.cast_add]; ring

private theorem g5_u4_aux_Q_14 (a : ℕ) (ha : a = 1 ∨ a = 4) :
    ∃ N, g5_u4_aux_Q a = 1 + N := by
  rcases ha with rfl | rfl
  · refine ⟨!![0, X; 0, 0], Matrix.ext fun i j => ?_⟩
    fin_cases i <;> fin_cases j <;> simp [g5_u4_aux_Q]
  · refine ⟨!![0, 0; X, 0], Matrix.ext fun i j => ?_⟩
    fin_cases i <;> fin_cases j <;> simp [g5_u4_aux_Q]

/-- Deleting letters of a `{1, 4}`-word lowers the polynomial block product entrywise. -/
private theorem g5_u4_aux_mono {v w : List ℕ} (h : v.Sublist w) :
    (∀ a ∈ w, a = 1 ∨ a = 4) →
      ∃ N, (w.map g5_u4_aux_Q).prod = (v.map g5_u4_aux_Q).prod + N := by
  induction h with
  | slnil => intro _; exact ⟨0, by simp⟩
  | cons a h ih =>
    intro hw
    obtain ⟨N, hN⟩ := ih fun b hb => hw b (List.mem_cons_of_mem a hb)
    obtain ⟨K, hK⟩ := g5_u4_aux_Q_14 a (hw a (List.mem_cons_self ..))
    rename_i l₁ l₂
    refine ⟨N + K * (l₂.map g5_u4_aux_Q).prod, ?_⟩
    simp only [List.map_cons, List.prod_cons]
    rw [hK, add_mul, one_mul, hN]
    abel
  | cons_cons a h ih =>
    intro hw
    obtain ⟨N, hN⟩ := ih fun b hb => hw b (List.mem_cons_of_mem a hb)
    refine ⟨g5_u4_aux_Q a * N, ?_⟩
    simp only [List.map_cons, List.prod_cons, hN, mul_add]

private theorem g5_u4_aux_1414 : ntr [1, 4, 1, 4] = ⟨8, 7⟩ := by decide

/-- A `{1, 4}`-word containing `1, 4, 1, 4` in order has `x − y ≤ 1`. -/
private theorem g5_u4_aux_xy_1414 (w : List ℕ) (hw : ∀ a ∈ w, a = 1 ∨ a = 4)
    (h : [1, 4, 1, 4].Sublist w) : (ntr w).x - (ntr w).y ≤ 1 := by
  obtain ⟨N, hN⟩ := g5_u4_aux_mono h hw
  have hT : g5_u4_aux_T w = g5_u4_aux_T [1, 4, 1, 4] + N.trace := by
    simp only [g5_u4_aux_T, hN, Matrix.trace_add]
  have h0 := g5_u4_aux_ev0_14 w hw
  have h0' : (g5_u4_aux_T [1, 4, 1, 4]).eval 0 = 2 := g5_u4_aux_ev0_14 _ (by decide)
  have hv := g5_u4_aux_ntr_eq [1, 4, 1, 4]
  rw [g5_u4_aux_1414] at hv
  have hc := (g5_u4_aux_coef N.trace).2.2.2
  have hD := g5_u4_aux_D_add (g5_u4_aux_T [1, 4, 1, 4]) N.trace
  rw [← hT, h0, h0', ← hv, ← g5_u4_aux_ntr_eq] at hD
  simp only at hD
  omega

private theorem g5_u4_aux_rot_23 (w : List ℕ) (h : ∃ a ∈ w, a = 2 ∨ a = 3) :
    ∃ c r, (c = 2 ∨ c = 3) ∧ List.IsRotated w (c :: r) := by
  obtain ⟨c, hc, h23⟩ := h
  obtain ⟨s, t, rfl⟩ := List.append_of_mem hc
  exact ⟨c, t ++ s, h23, List.isRotated_append⟩

private theorem g5_u4_aux_lead4 (u : List ℕ) (h1 : 1 ∈ u) (hu : ∀ a ∈ u, a = 1 ∨ a = 4) :
    ∃ c v, u = List.replicate c 4 ++ 1 :: v := by
  induction u with
  | nil => simp at h1
  | cons a u ih =>
    rcases hu a (List.mem_cons_self ..) with rfl | rfl
    · exact ⟨0, u, by simp⟩
    · have h1' : 1 ∈ u := by simpa using h1
      obtain ⟨c, v, rfl⟩ := ih h1' fun b hb => hu b (List.mem_cons_of_mem _ hb)
      exact ⟨c + 1, v, by simp [List.replicate_succ]⟩

/-- A `{1, 4}`-word with both letters has a rotation `1 :: m ++ [4]`. -/
private theorem g5_u4_aux_rot_14 (w : List ℕ) (hw : ∀ a ∈ w, a = 1 ∨ a = 4) (h1 : 1 ∈ w)
    (h4 : 4 ∈ w) : ∃ m, (∀ a ∈ m, a = 1 ∨ a = 4) ∧ List.IsRotated w (1 :: (m ++ [4])) := by
  obtain ⟨s, t, rfl⟩ := List.append_of_mem h4
  have hrot1 : List.IsRotated (s ++ 4 :: t) (t ++ s ++ [4]) := by
    have := @List.isRotated_append _ (s ++ [4]) t
    simpa [List.append_assoc] using this
  have hu : ∀ a ∈ t ++ s, a = 1 ∨ a = 4 := fun a ha => hw a (by simp at ha ⊢; tauto)
  have h1u : 1 ∈ t ++ s := by simp at h1 ⊢; tauto
  obtain ⟨c, v, hcv⟩ := g5_u4_aux_lead4 _ h1u hu
  refine ⟨v ++ List.replicate c 4, ?_, ?_⟩
  · intro a ha
    rw [List.mem_append] at ha
    rcases ha with ha | ha
    · exact hu a (by rw [hcv]; simp [ha])
    · right; exact List.eq_of_mem_replicate ha
  · refine hrot1.trans ?_
    rw [hcv]
    have e : List.replicate c 4 ++ [4] = [4] ++ List.replicate c 4 := by
      rw [← List.replicate_succ', List.singleton_append, ← List.replicate_succ]
    have k1 : List.replicate c 4 ++ 1 :: v ++ [4] = List.replicate c 4 ++ (1 :: (v ++ [4])) := by
      simp
    have k2 : (1 :: (v ++ [4])) ++ List.replicate c 4 = 1 :: (v ++ List.replicate c 4 ++ [4]) := by
      simp only [List.cons_append, List.append_assoc, e]
    rw [k1, ← k2]
    exact List.isRotated_append

private theorem g5_u4_aux_sorted (m : List ℕ) (hm : ∀ a ∈ m, a = 1 ∨ a = 4)
    (h : ¬ [4, 1].Sublist m) : ∃ p q, m = List.replicate p 1 ++ List.replicate q 4 := by
  induction m with
  | nil => exact ⟨0, 0, rfl⟩
  | cons a m ih =>
    rcases hm a (List.mem_cons_self ..) with rfl | rfl
    · obtain ⟨p, q, rfl⟩ := ih (fun b hb => hm b (List.mem_cons_of_mem _ hb))
        (fun hs => h (List.Sublist.cons 1 hs))
      exact ⟨p + 1, q, by simp [List.replicate_succ]⟩
    · have h1 : 1 ∉ m := fun h1 => h (List.Sublist.cons_cons 4 (List.singleton_sublist.2 h1))
      have hm' : m = List.replicate m.length 4 := List.eq_replicate_iff.2 ⟨rfl, fun b hb => by
        rcases hm b (List.mem_cons_of_mem _ hb) with rfl | rfl
        · exact absurd hb h1
        · rfl⟩
      refine ⟨0, m.length + 1, ?_⟩
      conv_lhs => rw [hm']
      simp [List.replicate_succ]

private theorem g5_u4_aux_count14 (w : List ℕ) (hw : ∀ a ∈ w, a = 1 ∨ a = 4) :
    w.count 1 + w.count 4 = w.length := by
  induction w with
  | nil => simp
  | cons a w ih =>
    have := ih fun b hb => hw b (List.mem_cons_of_mem _ hb)
    rcases hw a (List.mem_cons_self ..) with rfl | rfl <;> simp <;> omega

/-- A two-letter word with exactly one `d` is a rotation of `d :: e^{k−1}`. -/
private theorem g5_u4_aux_single (w : List ℕ) (d e : ℕ) (hw : ∀ a ∈ w, a = d ∨ a = e)
    (hd : w.count d = 1) : List.IsRotated w (d :: List.replicate (w.length - 1) e) := by
  have hmem : d ∈ w := List.count_pos_iff.1 (by omega)
  obtain ⟨s, t, rfl⟩ := List.append_of_mem hmem
  have hcnt : s.count d = 0 ∧ t.count d = 0 := by
    simp [List.count_append] at hd; omega
  have hs : d ∉ s := List.count_eq_zero.1 hcnt.1
  have ht : d ∉ t := List.count_eq_zero.1 hcnt.2
  have key : t ++ s = List.replicate ((s ++ d :: t).length - 1) e := by
    refine List.eq_replicate_iff.2 ⟨by simp; omega, fun b hb => ?_⟩
    rcases hw b (by simp at hb ⊢; tauto) with rfl | rfl
    · simp at hb; tauto
    · rfl
  have := @List.isRotated_append _ s (d :: t)
  rw [List.cons_append, key] at this
  exact this

private theorem g5_u4_aux_dich (w : List ℕ) (hw : IsWord w) :
    (∀ a ∈ w, a = 1 ∨ a = 4) ∨ ∃ a ∈ w, a = 2 ∨ a = 3 := by
  by_cases h : ∀ a ∈ w, a = 1 ∨ a = 4
  · exact Or.inl h
  · push Not at h
    obtain ⟨a, ha, h1, h4⟩ := h
    have := hw.2 a ha
    exact Or.inr ⟨a, ha, by omega⟩

private theorem g5_u4_aux_both (w : List ℕ) (h14 : ∀ a ∈ w, a = 1 ∨ a = 4)
    (hnc : ∃ a ∈ w, ∃ b ∈ w, a ≠ b) : 1 ∈ w ∧ 4 ∈ w := by
  obtain ⟨a, ha, b, hb, hab⟩ := hnc
  rcases h14 a ha with rfl | rfl <;> rcases h14 b hb with rfl | rfl
  · exact absurd rfl hab
  · exact ⟨ha, hb⟩
  · exact ⟨hb, ha⟩
  · exact absurd rfl hab

private theorem g5_u4_aux_both' (w : List ℕ) (h14 : ∀ a ∈ w, a = 1 ∨ a = 4)
    (h1 : ∃ a ∈ w, a ≠ 1) (h4 : ∃ a ∈ w, a ≠ 4) : 1 ∈ w ∧ 4 ∈ w := by
  obtain ⟨a, ha, ha1⟩ := h1
  obtain ⟨b, hb, hb4⟩ := h4
  refine ⟨?_, ?_⟩
  · rcases h14 b hb with rfl | rfl
    · exact hb
    · exact absurd rfl hb4
  · rcases h14 a ha with rfl | rfl
    · exact absurd rfl ha1
    · exact ha

/-- `x ≥ 0`, `y ≥ 0`. -/
private theorem g5_u4_aux_nonneg (w : List ℕ) : 0 ≤ (ntr w).x ∧ 0 ≤ (ntr w).y := by
  rw [g5_u4_aux_ntr_eq]
  exact ⟨(g5_u4_aux_coef _).1, (g5_u4_aux_coef _).2.1⟩

/-- `x − y ≤ 2`. -/
private theorem g5_u4_aux_xy_le2 (w : List ℕ) : (ntr w).x - (ntr w).y ≤ 2 := by
  have h := (g5_u4_aux_coef (g5_u4_aux_T w)).2.2.2
  have h2 := g5_u4_aux_ev0_le2 w
  rw [g5_u4_aux_ntr_eq]
  omega

/-- A word with a 2 or 3: `x − y ≤ 1` and `y ≥ k + 1`. -/
private theorem g5_u4_aux_23 (w : List ℕ) (hw : IsWord w) (h : ∃ a ∈ w, a = 2 ∨ a = 3) :
    (ntr w).x - (ntr w).y ≤ 1 ∧ (w.length : ℤ) + 1 ≤ (ntr w).y := by
  obtain ⟨c, r, hc, hrot⟩ := g5_u4_aux_rot_23 w h
  have hlen : w.length = r.length + 1 := by rw [hrot.perm.length_eq]; simp
  have hr : ∀ a ∈ r, 1 ≤ a ∧ a ≤ 4 := fun a ha =>
    hw.2 a (hrot.mem_iff.2 (List.mem_cons_of_mem _ ha))
  rw [← g5_u4_aux_ntr_rot hrot, g5_u4_aux_ntr_eq]
  obtain ⟨-, -, hy, hxy⟩ := g5_u4_aux_coef (g5_u4_aux_T (c :: r))
  obtain ⟨h0, h0'⟩ := g5_u4_aux_ev0_23 c r hc
  have h1 : (g5_u4_aux_T (c :: r)).eval 1 = (r.map g5_u4_aux_O).prod 0 0 +
      (r.map g5_u4_aux_O).prod 0 1 + (r.map g5_u4_aux_O).prod 1 0 +
      (r.map g5_u4_aux_O).prod 1 1 := by
    rw [g5_u4_aux_T_ev1]
    simp only [List.map_cons, List.prod_cons]
    rcases hc with rfl | rfl <;> simp only [g5_u4_aux_O] <;>
      rw [g5_u4_aux_mul2, Matrix.trace_fin_two] <;> simp <;> ring
  obtain ⟨-, -, s1⟩ := g5_u4_aux_O_sum r hr
  refine ⟨by omega, ?_⟩
  by_cases h14 : ∀ a ∈ r, a = 1 ∨ a = 4
  · have := h0' h14
    omega
  · push Not at h14
    obtain ⟨a, ha, h1a, h4a⟩ := h14
    have := hr a ha
    have := g5_u4_aux_O_sum2 r hr ⟨a, ha, by omega⟩
    omega

/-- A `{1, 4}`-word has `y ≥ (#1)(#4)`. -/
private theorem g5_u4_aux_14 (w : List ℕ) (hw : ∀ a ∈ w, a = 1 ∨ a = 4) :
    ((w.count 1 : ℤ) * w.count 4) ≤ (ntr w).y := by
  rw [g5_u4_aux_ntr_eq]
  obtain ⟨-, -, hy, -⟩ := g5_u4_aux_coef (g5_u4_aux_T w)
  have h0 := g5_u4_aux_ev0_14 w hw
  have h1 := g5_u4_aux_T_ev1 w
  rw [Matrix.trace_fin_two] at h1
  obtain ⟨-, -, -, -, h5⟩ := g5_u4_aux_O_14 w hw
  rw [h0, h1] at hy
  have h5' : (2 : ℤ) + (w.count 1 : ℤ) * w.count 4 ≤
      ((w.map g5_u4_aux_O).prod 0 0 : ℤ) + ((w.map g5_u4_aux_O).prod 1 1 : ℤ) := by
    exact_mod_cast h5
  push_cast at hy
  linarith

/-- The family `1^a 4^b`: `t = (2 + ab) + ab φ`. -/
private theorem g5_u4_aux_P1_pow (a : ℕ) : P 1 ^ a = !![1, (a : ZPhi) * phi; 0, 1] := by
  induction a with
  | zero =>
    refine Matrix.ext fun i j => ?_
    fin_cases i <;> fin_cases j <;> simp
  | succ a ih =>
    rw [pow_succ, ih]
    refine Matrix.ext fun i j => ?_
    fin_cases i <;> fin_cases j <;> simp [P, Matrix.mul_apply, Fin.sum_univ_two]
    ring

private theorem g5_u4_aux_P4_pow (b : ℕ) : P 4 ^ b = !![1, 0; (b : ZPhi) * phi, 1] := by
  induction b with
  | zero =>
    refine Matrix.ext fun i j => ?_
    fin_cases i <;> fin_cases j <;> simp
  | succ b ih =>
    rw [pow_succ, ih]
    refine Matrix.ext fun i j => ?_
    fin_cases i <;> fin_cases j <;> simp [P, Matrix.mul_apply, Fin.sum_univ_two]
    ring

private theorem g5_u4_aux_tr14 (a b : ℕ) :
    ntr (List.replicate a 1 ++ List.replicate b 4) = (⟨2 + (a : ℤ) * b, (a : ℤ) * b⟩ : ZPhi) := by
  simp only [ntr, blockProd, List.map_append, List.map_replicate, List.prod_append,
    List.prod_replicate, g5_u4_aux_P1_pow, g5_u4_aux_P4_pow, Matrix.trace_fin_two]
  simp [Matrix.mul_apply, Fin.sum_univ_two, g5_u4_aux_natCast, phi]
  ext <;> simp
  ring

end g5_u4_aux

/-- G5-Ba (Theorem B, the sector inequality). For every word that is neither
`(1^k)` nor `(4^k)`, the normalized trace `x + y φ` has `y ≥ 1` and `0 ≤ x ≤ y + 2`.
Locus: TA transcript §1 "Theorem B" (l. 43–44); `candidates/LEDGER.md` row AM-2
(l. 13); `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 (l. 70–73).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u4_ba (w : List ℕ) (hw : IsWord w) (h1 : ∃ a ∈ w, a ≠ 1)
    (h4 : ∃ a ∈ w, a ≠ 4) :
    1 ≤ (ntr w).y ∧ 0 ≤ (ntr w).x ∧ (ntr w).x ≤ (ntr w).y + 2 := by
  obtain ⟨hx, hy⟩ := g5_u4_aux_nonneg w
  have hxy := g5_u4_aux_xy_le2 w
  refine ⟨?_, hx, by linarith⟩
  rcases g5_u4_aux_dich w hw with h14 | h23
  · obtain ⟨h1m, h4m⟩ := g5_u4_aux_both' w h14 h1 h4
    have c1 := List.count_pos_iff.2 h1m
    have c4 := List.count_pos_iff.2 h4m
    have := g5_u4_aux_14 w h14
    have : (1 : ℤ) ≤ (w.count 1 : ℤ) * w.count 4 := by
      have : (1 : ℤ) ≤ w.count 1 := by exact_mod_cast c1
      have : (1 : ℤ) ≤ w.count 4 := by exact_mod_cast c4
      nlinarith
    linarith
  · have := (g5_u4_aux_23 w hw h23).2
    linarith

/-- G5-Bb (Theorem B, the equality family). For every word that is neither `(1^k)`
nor `(4^k)`, `x = y + 2` iff the word is a rotation of `1^a 4^b`, `a, b ≥ 1`.
Locus: `candidates/LEDGER.md` row AM-2′ (l. 14);
`candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 (l. 75, l. 88, l. 90).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u4_bb (w : List ℕ) (hw : IsWord w) (h1 : ∃ a ∈ w, a ≠ 1)
    (h4 : ∃ a ∈ w, a ≠ 4) :
    (ntr w).x = (ntr w).y + 2 ↔
      ∃ a b : ℕ, 1 ≤ a ∧ 1 ≤ b ∧
        List.IsRotated w (List.replicate a 1 ++ List.replicate b 4) := by
  constructor
  · intro hxy
    rcases g5_u4_aux_dich w hw with h14 | h23
    · obtain ⟨h1m, h4m⟩ := g5_u4_aux_both' w h14 h1 h4
      obtain ⟨m, hm, hrot⟩ := g5_u4_aux_rot_14 w h14 h1m h4m
      by_cases hs : [4, 1].Sublist m
      · exfalso
        have h' : [1, 4, 1, 4].Sublist (1 :: (m ++ [4])) :=
          List.Sublist.cons_cons 1 (hs.append (List.Sublist.refl [4]))
        have hw' : ∀ a ∈ 1 :: (m ++ [4]), a = 1 ∨ a = 4 := by
          intro a ha
          simp only [List.mem_cons, List.mem_append, List.not_mem_nil, or_false] at ha
          rcases ha with rfl | ha | rfl
          · left; rfl
          · exact hm a ha
          · right; rfl
        have := g5_u4_aux_xy_1414 _ hw' h'
        rw [g5_u4_aux_ntr_rot hrot] at this
        omega
      · obtain ⟨p, q, rfl⟩ := g5_u4_aux_sorted m hm hs
        refine ⟨p + 1, q + 1, by omega, by omega, ?_⟩
        have e : List.replicate (q + 1) 4 = List.replicate q 4 ++ [4] := List.replicate_succ'
        rw [e, List.replicate_succ]
        simpa using hrot
    · have := (g5_u4_aux_23 w hw h23).1
      omega
  · rintro ⟨a, b, -, -, hrot⟩
    rw [← g5_u4_aux_ntr_rot hrot, g5_u4_aux_tr14]
    simp only
    ring

/-- G5-Bb (Theorem B, the family's trace). For `a, b ≥ 1` and every rotation
of `1^a 4^b`, `t = (2 + ab) + ab φ`.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 (l. 88, l. 90).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u4_bb_tr (a b : ℕ) (ha : 1 ≤ a) (hb : 1 ≤ b) (w : List ℕ)
    (hw : List.IsRotated w (List.replicate a 1 ++ List.replicate b 4)) :
    ntr w = (⟨2 + (a : ℤ) * b, (a : ℤ) * b⟩ : ZPhi) := by
  rw [← g5_u4_aux_ntr_rot hw]
  exact g5_u4_aux_tr14 a b

end G5

-- G5-Bc: the one definition this unit owns (spec G5-Bc §5).
namespace ZPhi

/-- The real absolute value: `t` if `t ≥ 0` in the real order (`RealNonneg`), else `−t`. -/
def rabs (t : ZPhi) : ZPhi := if RealNonneg t then t else -t

end ZPhi

namespace G5

private theorem g5_u4_aux_lit :
    (7 : ZPhi) = ⟨7, 0⟩ ∧ (11 : ZPhi) = ⟨11, 0⟩ ∧ (17 : ZPhi) = ⟨17, 0⟩ := by decide

/-- `(17 − 7φ) t − 11 t^σ`, in coordinates. -/
private theorem g5_u4_aux_em (x y : ℤ) :
    (17 - 7 * phi) * (⟨x, y⟩ : ZPhi) - 11 * conj ⟨x, y⟩ = ⟨6 * x - 18 * y, 21 * y - 7 * x⟩ := by
  obtain ⟨h7, h11, h17⟩ := g5_u4_aux_lit
  rw [h7, h11, h17]
  ext <;> simp [conj, phi] <;> ring

/-- `(17 − 7φ) t + 11 t^σ`, in coordinates. -/
private theorem g5_u4_aux_ep (x y : ℤ) :
    (17 - 7 * phi) * (⟨x, y⟩ : ZPhi) - 11 * -conj ⟨x, y⟩ = ⟨28 * x + 4 * y, -7 * x - y⟩ := by
  obtain ⟨h7, h11, h17⟩ := g5_u4_aux_lit
  rw [h7, h11, h17]
  ext <;> simp [conj, phi] <;> ring

/-- G5-Bc (Theorem B, the θ bound). For every word that is neither `(1^k)` nor
`(4^k)`, `11 |t^σ| ≤ (17 − 7φ) t` in the real order, with equality iff `t = 3 + φ`.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 (l. 94–114);
TA transcript §1 (l. 47); `candidates/LEDGER.md` row TA-0 (l. 28).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u4_bc (w : List ℕ) (hw : IsWord w) (h1 : ∃ a ∈ w, a ≠ 1)
    (h4 : ∃ a ∈ w, a ≠ 4) :
    11 * rabs (conj (ntr w)) ≤ (17 - 7 * phi) * ntr w ∧
      (11 * rabs (conj (ntr w)) = (17 - 7 * phi) * ntr w ↔ ntr w = 3 + phi) := by
  obtain ⟨hy, hx, hxy⟩ := g5_u4_ba w hw h1 h4
  generalize ntr w = t at hy hx hxy ⊢
  obtain ⟨x, y⟩ := t
  dsimp only at hy hx hxy
  have h3 : (3 : ZPhi) + phi = ⟨3, 1⟩ := by decide
  rw [h3]
  by_cases hc : RealNonneg (conj ⟨x, y⟩)
  · rw [rabs, if_pos hc]
    refine ⟨?_, ⟨fun h => ?_, fun h => ?_⟩⟩
    · show RealNonneg (_ - _)
      rw [g5_u4_aux_em]
      show NonnegAB5 (2 * (6 * x - 18 * y) + (21 * y - 7 * x)) (21 * y - 7 * x)
      unfold NonnegAB5
      rcases eq_or_lt_of_le (show x ≤ 3 * y by linarith) with he | hl
      · left; constructor <;> linarith
      · right; right; refine ⟨by linarith, by linarith, by nlinarith⟩
    · have h' := g5_u4_aux_em x y
      rw [h, sub_self] at h'
      have e1 := congrArg ZPhi.x h'
      have e2 := congrArg ZPhi.y h'
      simp only [zero_x, zero_y] at e1 e2
      ext <;> simp only <;> omega
    · simp only [ZPhi.mk.injEq] at h
      obtain ⟨rfl, rfl⟩ := h
      decide
  · rw [rabs, if_neg hc]
    refine ⟨?_, ⟨fun h => ?_, fun h => ?_⟩⟩
    · show RealNonneg (_ - _)
      rw [g5_u4_aux_ep]
      show NonnegAB5 (2 * (28 * x + 4 * y) + (-7 * x - y)) (-7 * x - y)
      unfold NonnegAB5
      right; left; refine ⟨by linarith, by linarith, by nlinarith⟩
    · have h' := g5_u4_aux_ep x y
      rw [h, sub_self] at h'
      have e1 := congrArg ZPhi.x h'
      simp only [zero_x] at e1
      omega
    · simp only [ZPhi.mk.injEq] at h
      obtain ⟨rfl, rfl⟩ := h
      exact absurd (by decide) hc

/-- G5-Bc (the constant). `(4 − φ) · 11 = (17 − 7φ)(3 + φ)` in ℤ[φ], the
cross-multiplied form of `(4 − φ)/(3 + φ) = (17 − 7φ)/11`.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 (l. 103, l. 105).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u4_bc_id : (4 - phi) * 11 = (17 - 7 * phi) * (3 + phi) := by decide

/-- G5-Bc (attainment). The word `(1, 4)` has `t = 3 + φ`.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 (l. 114).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u4_bc_att : ntr [1, 4] = 3 + phi := by decide

/-- G5-Fa (the floor). For every non-constant word of length `k ≥ 2`,
`|y| ≥ k − 1`.
Locus: `candidates/LEDGER.md` row AM-3 (l. 15);
AM transcript §3.5 "Theorem C" (l. 155) and §6 (l. 224).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u4_fa (w : List ℕ) (hw : IsWord w) (hk : 2 ≤ w.length)
    (hnc : ∃ a ∈ w, ∃ b ∈ w, a ≠ b) :
    (w.length : ℤ) - 1 ≤ |(ntr w).y| := by
  rw [abs_of_nonneg (g5_u4_aux_nonneg w).2]
  rcases g5_u4_aux_dich w hw with h14 | h23
  · obtain ⟨h1m, h4m⟩ := g5_u4_aux_both w h14 hnc
    have hc := g5_u4_aux_count14 w h14
    have c1 : (1 : ℤ) ≤ w.count 1 := by exact_mod_cast List.count_pos_iff.2 h1m
    have c4 : (1 : ℤ) ≤ w.count 4 := by exact_mod_cast List.count_pos_iff.2 h4m
    have hy := g5_u4_aux_14 w h14
    have hc' : (w.count 1 : ℤ) + w.count 4 = w.length := by exact_mod_cast hc
    nlinarith
  · have := (g5_u4_aux_23 w hw h23).2
    linarith

/-- G5-Fb (the minimizers). For every non-constant word of length `k ≥ 2`,
`|y| = k − 1` iff the word is a rotation of `(1, 4^{k−1})` or `(4, 1^{k−1})`.
Locus: `candidates/LEDGER.md` row AM-3 (l. 15);
AM transcript §3.5 "Theorem C" (l. 155) and §6 (l. 224).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u4_fb (w : List ℕ) (hw : IsWord w) (hk : 2 ≤ w.length)
    (hnc : ∃ a ∈ w, ∃ b ∈ w, a ≠ b) :
    |(ntr w).y| = (w.length : ℤ) - 1 ↔
      List.IsRotated w (1 :: List.replicate (w.length - 1) 4) ∨
        List.IsRotated w (4 :: List.replicate (w.length - 1) 1) := by
  rw [abs_of_nonneg (g5_u4_aux_nonneg w).2]
  have hk1 : 1 ≤ w.length - 1 := by omega
  constructor
  · intro heq
    rcases g5_u4_aux_dich w hw with h14 | h23
    · obtain ⟨h1m, h4m⟩ := g5_u4_aux_both w h14 hnc
      have hc := g5_u4_aux_count14 w h14
      have c1 := List.count_pos_iff.2 h1m
      have c4 := List.count_pos_iff.2 h4m
      have hy := g5_u4_aux_14 w h14
      have key : w.count 1 = 1 ∨ w.count 4 = 1 := by
        by_contra hne
        push Not at hne
        have d1 : (2 : ℤ) ≤ w.count 1 := by
          have : 2 ≤ w.count 1 := by omega
          exact_mod_cast this
        have d4 : (2 : ℤ) ≤ w.count 4 := by
          have : 2 ≤ w.count 4 := by omega
          exact_mod_cast this
        have hc' : (w.count 1 : ℤ) + w.count 4 = w.length := by exact_mod_cast hc
        nlinarith
      rcases key with k1 | k4
      · exact Or.inl (g5_u4_aux_single w 1 4 h14 k1)
      · exact Or.inr (g5_u4_aux_single w 4 1 (fun a ha => (h14 a ha).symm) k4)
    · have := (g5_u4_aux_23 w hw h23).2
      linarith
  · rintro (hr | hr)
    · have hr' : List.IsRotated w (List.replicate 1 1 ++ List.replicate (w.length - 1) 4) := by
        simpa using hr
      rw [← g5_u4_aux_ntr_rot hr', g5_u4_aux_tr14]
      simp only
      omega
    · have hr' : List.IsRotated w (List.replicate (w.length - 1) 1 ++ List.replicate 1 4) := by
        refine hr.trans ?_
        simpa using @List.isRotated_append _ [4] (List.replicate (w.length - 1) 1)
      rw [← g5_u4_aux_ntr_rot hr', g5_u4_aux_tr14]
      simp only
      omega

/-- G5-Fc (the 2/3 clause). For every word containing a syllable 2 or 3,
`|y| ≥ k + 1`, `k` its length.
Locus: `candidates/LEDGER.md` row AM-3 (l. 15);
AM transcript §3.5 "Theorem C" (l. 155) and §6 (l. 224).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u4_fc (w : List ℕ) (hw : IsWord w) (h23 : 2 ∈ w ∨ 3 ∈ w) :
    (w.length : ℤ) + 1 ≤ |(ntr w).y| := by
  rw [abs_of_nonneg (g5_u4_aux_nonneg w).2]
  refine (g5_u4_aux_23 w hw ?_).2
  rcases h23 with h | h
  · exact ⟨2, h, Or.inl rfl⟩
  · exact ⟨3, h, Or.inr rfl⟩

end G5
