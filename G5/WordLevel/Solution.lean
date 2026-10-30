import Mathlib
import G5.Ring.Solution

/-!
# Unit U3 (`G5/WordLevel`) — Theorem A at the word level, and the separation: proofs

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
The statements are those of `G5/WordLevel/Challenge.lean` (sha256 prefix `69533d2d`), byte for
byte, with proofs. The prelude is unit U1's PROVED module `G5.Ring.Solution` (its definitions
block is byte-identical to `G5.Ring.Challenge`'s); this unit defines nothing.
Aa: every entry of the block product lies in ℕ[φ] (induction on the word). Ab: a word dominates
entrywise each block and each ordered pair of blocks it contains, so a `2`, a `3`, or a `1` with
a `4` forces `y ≥ 1`; constant words in `1` or `4` are unipotent with trace `2`. SEPa, SEPb:
`t − t^σ = ⟨−y, 2y⟩`, ring algebra, and the order unfolded on the components.
-/

open G5 ZPhi

namespace G5

/-- Helper: ℕ[φ] is closed under addition. -/
private theorem g5_u3_aux_nonneg_add {s t : ZPhi} (hs : nonneg s) (ht : nonneg t) :
    nonneg (s + t) := by
  obtain ⟨h1, h2⟩ := hs
  obtain ⟨h3, h4⟩ := ht
  exact ⟨show 0 ≤ s.x + t.x by omega, show 0 ≤ s.y + t.y by omega⟩

/-- Helper: ℕ[φ] is closed under multiplication, from
`(x₁, y₁)(x₂, y₂) = (x₁x₂ + y₁y₂, x₁y₂ + y₁x₂ + y₁y₂)`. -/
private theorem g5_u3_aux_nonneg_mul {s t : ZPhi} (hs : nonneg s) (ht : nonneg t) :
    nonneg (s * t) := by
  obtain ⟨h1, h2⟩ := hs
  obtain ⟨h3, h4⟩ := ht
  exact ⟨show 0 ≤ s.x * t.x + s.y * t.y from
      add_nonneg (mul_nonneg h1 h3) (mul_nonneg h2 h4),
    show 0 ≤ s.x * t.y + s.y * t.x + s.y * t.y from
      add_nonneg (add_nonneg (mul_nonneg h1 h4) (mul_nonneg h2 h3)) (mul_nonneg h2 h4)⟩

/-- Helper: entrywise ℕ[φ] matrices are closed under addition. -/
private theorem g5_u3_aux_mat_add {A B : M2} (hA : ∀ i j, nonneg (A i j))
    (hB : ∀ i j, nonneg (B i j)) : ∀ i j, nonneg ((A + B) i j) := fun i j => by
  rw [Matrix.add_apply]
  exact g5_u3_aux_nonneg_add (hA i j) (hB i j)

/-- Helper: entrywise ℕ[φ] matrices are closed under multiplication. -/
private theorem g5_u3_aux_mat_mul {A B : M2} (hA : ∀ i j, nonneg (A i j))
    (hB : ∀ i j, nonneg (B i j)) : ∀ i j, nonneg ((A * B) i j) := fun i j => by
  rw [Matrix.mul_apply, Fin.sum_univ_two]
  exact g5_u3_aux_nonneg_add (g5_u3_aux_nonneg_mul (hA i 0) (hB 0 j))
    (g5_u3_aux_nonneg_mul (hA i 1) (hB 1 j))

/-- Helper: `s` is a non-zero element of ℕ[φ] (`x, y ≥ 0`, `x + y ≥ 1`); such elements are
closed under multiplication. -/
private theorem g5_u3_aux_pos_mul {s t : ZPhi} (hs : nonneg s ∧ 1 ≤ s.x + s.y)
    (ht : nonneg t ∧ 1 ≤ t.x + t.y) : nonneg (s * t) ∧ 1 ≤ (s * t).x + (s * t).y := by
  refine ⟨g5_u3_aux_nonneg_mul hs.1 ht.1, ?_⟩
  obtain ⟨⟨h1, h2⟩, h5⟩ := hs
  obtain ⟨⟨h3, h4⟩, h6⟩ := ht
  simp only [mul_x, mul_y]
  nlinarith [mul_nonneg h1 h3, mul_nonneg h1 h4, mul_nonneg h2 h3, mul_nonneg h2 h4]

/-- Helper: a non-zero element of ℕ[φ] times an element of ℕ[φ] with `y ≥ 1` has `y ≥ 1`. -/
private theorem g5_u3_aux_y_mul {s t : ZPhi} (hs : nonneg s ∧ 1 ≤ s.x + s.y) (ht : nonneg t)
    (hty : 1 ≤ t.y) : 1 ≤ (s * t).y := by
  obtain ⟨⟨h1, h2⟩, h5⟩ := hs
  obtain ⟨h3, h4⟩ := ht
  simp only [mul_y]
  nlinarith [mul_nonneg h2 h3]

/-- Helper: `φ` times a non-zero element of ℕ[φ] has `y ≥ 1` (`φ (x + y φ) = y + (x + y) φ`). -/
private theorem g5_u3_aux_phi_mul {s : ZPhi} (hs : nonneg s ∧ 1 ≤ s.x + s.y) :
    1 ≤ (phi * s).y := by
  have e : (phi * s).y = s.x + s.y := by simp [phi]
  rw [e]
  exact hs.2

/-- Helper: in a product of ℕ[φ] matrices each entry dominates, coefficientwise, each of the
two terms of its sum. -/
private theorem g5_u3_aux_dom {A B : M2} (hA : ∀ i j, nonneg (A i j))
    (hB : ∀ i j, nonneg (B i j)) (i j k : Fin 2) :
    nonneg ((A * B) i j - A i k * B k j) := by
  rw [Matrix.mul_apply, Fin.sum_univ_two]
  fin_cases k
  · simp only [Fin.zero_eta, Fin.isValue, add_sub_cancel_left]
    exact g5_u3_aux_nonneg_mul (hA i 1) (hB 1 j)
  · simp only [Fin.mk_one, Fin.isValue, add_sub_cancel_right]
    exact g5_u3_aux_nonneg_mul (hA i 0) (hB 0 j)

/-- Helper: an element dominating a non-zero element of ℕ[φ] is a non-zero element of ℕ[φ]. -/
private theorem g5_u3_aux_mono_pos {u v : ZPhi} (h : nonneg (u - v))
    (hv : nonneg v ∧ 1 ≤ v.x + v.y) : nonneg u ∧ 1 ≤ u.x + u.y := by
  obtain ⟨h1, h2⟩ := h
  obtain ⟨⟨h3, h4⟩, h5⟩ := hv
  simp only [sub_x, sub_y] at h1 h2
  exact ⟨⟨by omega, by omega⟩, by omega⟩

/-- Helper: domination keeps `y ≥ 1`. -/
private theorem g5_u3_aux_mono_y {u v : ZPhi} (h : nonneg (u - v)) (hv : 1 ≤ v.y) :
    1 ≤ u.y := by
  have h2 := h.2
  simp only [sub_y] at h2
  omega

/-- Helper: each block `P_a` (`a = 1, …, 4`) is an ℕ[φ] matrix with non-zero diagonal. -/
private theorem g5_u3_aux_P_pos (a : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) :
    (∀ i j, nonneg (P a i j)) ∧ (nonneg (P a 0 0) ∧ 1 ≤ (P a 0 0).x + (P a 0 0).y) ∧
      (nonneg (P a 1 1) ∧ 1 ≤ (P a 1 1).x + (P a 1 1).y) := by
  obtain ⟨h1, h4⟩ := ha
  interval_cases a <;> refine ⟨fun i j => ?_, ?_, ?_⟩ <;> try decide
  all_goals fin_cases i <;> fin_cases j <;> decide

/-- Helper: the block product splits over concatenation. -/
private theorem g5_u3_aux_bp_append (l₁ l₂ : List ℕ) :
    blockProd (l₁ ++ l₂) = blockProd l₁ * blockProd l₂ := by
  simp [blockProd, List.prod_append]

/-- Helper: the block product prepends a block. -/
private theorem g5_u3_aux_bp_cons (a : ℕ) (l : List ℕ) :
    blockProd (a :: l) = P a * blockProd l := by
  simp [blockProd]

/-- Helper (the invariant of Theorem A's positivity): on syllables in `{1, 2, 3, 4}` every
entry of the block product lies in ℕ[φ], and the two diagonal entries are non-zero. -/
private theorem g5_u3_aux_bp_pos (w : List ℕ) (hw : ∀ a ∈ w, 1 ≤ a ∧ a ≤ 4) :
    (∀ i j, nonneg (blockProd w i j)) ∧
      (nonneg (blockProd w 0 0) ∧ 1 ≤ (blockProd w 0 0).x + (blockProd w 0 0).y) ∧
      (nonneg (blockProd w 1 1) ∧ 1 ≤ (blockProd w 1 1).x + (blockProd w 1 1).y) := by
  induction w with
  | nil =>
    simp only [blockProd, List.map_nil, List.prod_nil]
    refine ⟨fun i j => ?_, ?_, ?_⟩ <;> try decide
    fin_cases i <;> fin_cases j <;> decide
  | cons a w ih =>
    obtain ⟨hP, hP0, hP1⟩ := g5_u3_aux_P_pos a (hw a (List.mem_cons_self ..))
    obtain ⟨hB, hB0, hB1⟩ := ih fun b hb => hw b (List.mem_cons_of_mem a hb)
    rw [g5_u3_aux_bp_cons]
    exact ⟨g5_u3_aux_mat_mul hP hB,
      g5_u3_aux_mono_pos (g5_u3_aux_dom hP hB 0 0 0) (g5_u3_aux_pos_mul hP0 hB0),
      g5_u3_aux_mono_pos (g5_u3_aux_dom hP hB 1 1 1) (g5_u3_aux_pos_mul hP1 hB1)⟩

/-- Helper: the trace's φ-coefficient is at least that of either diagonal entry. -/
private theorem g5_u3_aux_tr_y {A : M2} (hA : ∀ i j, nonneg (A i j)) (k : Fin 2)
    (h : 1 ≤ (A k k).y) : 1 ≤ A.trace.y := by
  have h0 := (hA 0 0).2
  have h1 := (hA 1 1).2
  rw [Matrix.trace_fin_two, add_y]
  fin_cases k
  · simp only [Fin.zero_eta, Fin.isValue] at h
    omega
  · simp only [Fin.mk_one, Fin.isValue] at h
    omega

/-- Helper: a word containing a `2` or a `3` has `y ≥ 1`: the `(0, 0)` entry of
`X P_a Z` dominates `X₀₀ φ Z₀₀`. -/
private theorem g5_u3_aux_y_of_23 (w : List ℕ) (hw : ∀ c ∈ w, 1 ≤ c ∧ c ≤ 4) (a : ℕ)
    (h : a ∈ w) (ha : a = 2 ∨ a = 3) : 1 ≤ (ntr w).y := by
  obtain ⟨l₁, l₂, rfl⟩ := List.append_of_mem h
  obtain ⟨hX, hX0, -⟩ := g5_u3_aux_bp_pos l₁ fun b hb => hw b (by simp [hb])
  obtain ⟨hZ, hZ0, -⟩ := g5_u3_aux_bp_pos l₂ fun b hb => hw b (by simp [hb])
  obtain ⟨hP, -, -⟩ := g5_u3_aux_P_pos a (hw a (by simp))
  have e : P a 0 0 = phi := by rcases ha with rfl | rfl <;> rfl
  unfold ntr
  rw [g5_u3_aux_bp_append, g5_u3_aux_bp_cons]
  have hPZ := g5_u3_aux_mat_mul hP hZ
  refine g5_u3_aux_tr_y (g5_u3_aux_mat_mul hX hPZ) 0 ?_
  refine g5_u3_aux_mono_y (g5_u3_aux_dom hX hPZ 0 0 0) (g5_u3_aux_y_mul hX0 (hPZ 0 0) ?_)
  refine g5_u3_aux_mono_y (g5_u3_aux_dom hP hZ 0 0 0) ?_
  rw [e]
  exact g5_u3_aux_phi_mul hZ0

/-- Helper: a word containing both a `1` and a `4` has `y ≥ 1`: for `1` before `4` the
`(0, 0)` entry of `X P₁ M P₄ Z` dominates `X₀₀ φ M₁₁ φ Z₀₀`; for `4` before `1` the `(1, 1)`
entry of `X P₄ M P₁ Z` dominates `X₁₁ φ M₀₀ φ Z₁₁`. -/
private theorem g5_u3_aux_y_of_14 (w : List ℕ) (hw : ∀ c ∈ w, 1 ≤ c ∧ c ≤ 4)
    (h1 : 1 ∈ w) (h4 : 4 ∈ w) : 1 ≤ (ntr w).y := by
  obtain ⟨l₁, l₂, rfl⟩ := List.append_of_mem h1
  unfold ntr
  rcases List.mem_append.1 h4 with h | h
  · obtain ⟨m₁, m₂, rfl⟩ := List.append_of_mem h
    have e : m₁ ++ 4 :: m₂ ++ 1 :: l₂ = m₁ ++ 4 :: (m₂ ++ 1 :: l₂) := by simp
    rw [e] at hw ⊢
    obtain ⟨hX, -, hX1⟩ := g5_u3_aux_bp_pos m₁ fun b hb => hw b (by simp [hb])
    obtain ⟨hM, hM0, -⟩ := g5_u3_aux_bp_pos m₂ fun b hb => hw b (by simp [hb])
    obtain ⟨hZ, -, hZ1⟩ := g5_u3_aux_bp_pos l₂ fun b hb => hw b (by simp [hb])
    obtain ⟨hP4, -, -⟩ := g5_u3_aux_P_pos 4 ⟨by omega, by omega⟩
    obtain ⟨hP1, -, -⟩ := g5_u3_aux_P_pos 1 ⟨by omega, by omega⟩
    rw [g5_u3_aux_bp_append, g5_u3_aux_bp_cons, g5_u3_aux_bp_append, g5_u3_aux_bp_cons]
    have q1 := g5_u3_aux_mat_mul hP1 hZ
    have q2 := g5_u3_aux_mat_mul hM q1
    have q3 := g5_u3_aux_mat_mul hP4 q2
    -- (P₁ Z)₀₁ ≥ φ Z₁₁ ; (M P₁ Z)₀₁ ≥ M₀₀ (P₁ Z)₀₁ ; (P₄ M P₁ Z)₁₁ ≥ φ (M P₁ Z)₀₁
    have r1 := g5_u3_aux_mono_pos (g5_u3_aux_dom hP1 hZ 0 1 1)
      (g5_u3_aux_pos_mul (by decide) hZ1)
    have r2 := g5_u3_aux_mono_pos (g5_u3_aux_dom hM q1 0 1 0) (g5_u3_aux_pos_mul hM0 r1)
    have r3 := g5_u3_aux_mono_y (g5_u3_aux_dom hP4 q2 1 1 0)
      (show 1 ≤ (P 4 1 0 * _).y from g5_u3_aux_phi_mul r2)
    refine g5_u3_aux_tr_y (g5_u3_aux_mat_mul hX q3) 1 ?_
    exact g5_u3_aux_mono_y (g5_u3_aux_dom hX q3 1 1 1) (g5_u3_aux_y_mul hX1 (q3 1 1) r3)
  · rcases List.mem_cons.1 h with h | h
    · omega
    · obtain ⟨m₁, m₂, rfl⟩ := List.append_of_mem h
      obtain ⟨hX, hX0, -⟩ := g5_u3_aux_bp_pos l₁ fun b hb => hw b (by simp [hb])
      obtain ⟨hM, -, hM1⟩ := g5_u3_aux_bp_pos m₁ fun b hb => hw b (by simp [hb])
      obtain ⟨hZ, hZ0, -⟩ := g5_u3_aux_bp_pos m₂ fun b hb => hw b (by simp [hb])
      obtain ⟨hP4, -, -⟩ := g5_u3_aux_P_pos 4 ⟨by omega, by omega⟩
      obtain ⟨hP1, -, -⟩ := g5_u3_aux_P_pos 1 ⟨by omega, by omega⟩
      rw [g5_u3_aux_bp_append, g5_u3_aux_bp_cons, g5_u3_aux_bp_append, g5_u3_aux_bp_cons]
      have q1 := g5_u3_aux_mat_mul hP4 hZ
      have q2 := g5_u3_aux_mat_mul hM q1
      have q3 := g5_u3_aux_mat_mul hP1 q2
      -- (P₄ Z)₁₀ ≥ φ Z₀₀ ; (M P₄ Z)₁₀ ≥ M₁₁ (P₄ Z)₁₀ ; (P₁ M P₄ Z)₀₀ ≥ φ (M P₄ Z)₁₀
      have r1 := g5_u3_aux_mono_pos (g5_u3_aux_dom hP4 hZ 1 0 0)
        (g5_u3_aux_pos_mul (by decide) hZ0)
      have r2 := g5_u3_aux_mono_pos (g5_u3_aux_dom hM q1 1 0 1) (g5_u3_aux_pos_mul hM1 r1)
      have r3 := g5_u3_aux_mono_y (g5_u3_aux_dom hP1 q2 0 0 1)
        (show 1 ≤ (P 1 0 1 * _).y from g5_u3_aux_phi_mul r2)
      refine g5_u3_aux_tr_y (g5_u3_aux_mat_mul hX q3) 0 ?_
      exact g5_u3_aux_mono_y (g5_u3_aux_dom hX q3 0 0 0) (g5_u3_aux_y_mul hX0 (q3 0 0) r3)

/-- Helper: a constant word in `1` has block product `[[1, ∗], [0, 1]]`. -/
private theorem g5_u3_aux_const1 (w : List ℕ) (h : ∀ a ∈ w, a = 1) :
    blockProd w 0 0 = 1 ∧ blockProd w 1 0 = 0 ∧ blockProd w 1 1 = 1 := by
  induction w with
  | nil => simp [blockProd]
  | cons a w ih =>
    obtain ⟨e0, e1, e2⟩ := ih fun b hb => h b (List.mem_cons_of_mem a hb)
    obtain rfl : a = 1 := h a (List.mem_cons_self ..)
    rw [g5_u3_aux_bp_cons]
    simp only [Matrix.mul_apply, Fin.sum_univ_two, e0, e1, e2]
    simp [P, phi]

/-- Helper: a constant word in `4` has block product `[[1, 0], [∗, 1]]`. -/
private theorem g5_u3_aux_const4 (w : List ℕ) (h : ∀ a ∈ w, a = 4) :
    blockProd w 0 0 = 1 ∧ blockProd w 0 1 = 0 ∧ blockProd w 1 1 = 1 := by
  induction w with
  | nil => simp [blockProd]
  | cons a w ih =>
    obtain ⟨e0, e1, e2⟩ := ih fun b hb => h b (List.mem_cons_of_mem a hb)
    obtain rfl : a = 4 := h a (List.mem_cons_self ..)
    rw [g5_u3_aux_bp_cons]
    simp only [Matrix.mul_apply, Fin.sum_univ_two, e0, e1, e2]
    simp [P, phi]

/-- Helper: a constant word in `{1, 4}` has trace `2`, i.e. `x = 2`, `y = 0`. -/
private theorem g5_u3_aux_const (w : List ℕ)
    (h : (∀ a ∈ w, a = 1) ∨ (∀ a ∈ w, a = 4)) : (ntr w).x = 2 ∧ (ntr w).y = 0 := by
  unfold ntr
  rw [Matrix.trace_fin_two]
  rcases h with h | h
  · obtain ⟨e0, -, e2⟩ := g5_u3_aux_const1 w h
    rw [e0, e2]
    exact ⟨rfl, rfl⟩
  · obtain ⟨e0, -, e2⟩ := g5_u3_aux_const4 w h
    rw [e0, e2]
    exact ⟨rfl, rfl⟩

/-- Helper: natural-number casts into ℤ[φ] are `⟨n, 0⟩`. -/
private theorem g5_u3_aux_natCast (n : ℕ) : ((n : ℕ) : ZPhi) = ⟨n, 0⟩ := by
  induction n with
  | zero => ext <;> simp
  | succ n ih => rw [Nat.cast_succ, ih]; ext <;> simp

/-- Helper: integer casts into ℤ[φ] are `⟨n, 0⟩`. -/
private theorem g5_u3_aux_intCast (n : ℤ) : ((n : ℤ) : ZPhi) = ⟨n, 0⟩ := by
  cases n with
  | ofNat n => rw [Int.ofNat_eq_natCast, Int.cast_natCast, g5_u3_aux_natCast]
  | negSucc n =>
    rw [Int.cast_negSucc, g5_u3_aux_natCast]
    ext <;> simp [Int.negSucc_eq]

/-- Helper: the numeral `2` of ℤ[φ] is `⟨2, 0⟩`. -/
private theorem g5_u3_aux_two : (2 : ZPhi) = ⟨2, 0⟩ := by
  rw [← Nat.cast_ofNat, g5_u3_aux_natCast]; rfl

/-- Helper: the numeral `5` of ℤ[φ] is `⟨5, 0⟩`. -/
private theorem g5_u3_aux_five : (5 : ZPhi) = ⟨5, 0⟩ := by
  rw [← Nat.cast_ofNat, g5_u3_aux_natCast]; rfl

/-- Helper: `t − t^σ = ⟨−y, 2y⟩` (that is, `y √5` with `√5 = 2φ − 1 = ⟨−1, 2⟩`). -/
private theorem g5_u3_aux_diff (t : ZPhi) : t - conj t = ⟨-t.y, 2 * t.y⟩ := by
  ext <;> simp [conj]
  ring


/-- G5-Aa (Theorem A, positivity). For every word (`k ≥ 1`), the normalized trace
`t = x + y φ` has `x, y ≥ 0`.
Locus: `candidates/checks/AM-1-second-head.md` "Theorem as I would print it"
(l. 253–259); `candidates/LEDGER.md` row AM-1 (l. 12).
STATEMENTS.md sha256 prefix `51324441`. -/
theorem g5_u3_a_nonneg (w : List ℕ) (hw : IsWord w) : nonneg (ntr w) := by
  have h := (g5_u3_aux_bp_pos w hw.2).1
  unfold ntr
  rw [Matrix.trace_fin_two]
  exact g5_u3_aux_nonneg_add (h 0 0) (h 1 1)

/-- G5-Ab (Theorem A, `y = 0`). For every word, `y = 0` iff `a₁ = ⋯ = a_k ∈ {1, 4}`,
in which case `x = 2`.
Locus: `candidates/checks/AM-1-second-head.md` "Theorem as I would print it"
(l. 257–261) and §3 "Constant words" (l. 60).
STATEMENTS.md sha256 prefix `51324441`. -/
theorem g5_u3_a_y_eq_zero (w : List ℕ) (hw : IsWord w) :
    ((ntr w).y = 0 ↔ (∀ a ∈ w, a = 1) ∨ (∀ a ∈ w, a = 4)) ∧
      ((∀ a ∈ w, a = 1) ∨ (∀ a ∈ w, a = 4) → (ntr w).x = 2) := by
  refine ⟨⟨fun hy0 => ?_, fun hc => (g5_u3_aux_const w hc).2⟩,
    fun hc => (g5_u3_aux_const w hc).1⟩
  by_contra hc
  push Not at hc
  obtain ⟨⟨a, ha, ha1⟩, ⟨b, hb, hb4⟩⟩ := hc
  have key : 1 ≤ (ntr w).y := by
    have ra := hw.2 a ha
    have rb := hw.2 b hb
    by_cases h23 : a = 2 ∨ a = 3
    · exact g5_u3_aux_y_of_23 w hw.2 a ha h23
    by_cases h23' : b = 2 ∨ b = 3
    · exact g5_u3_aux_y_of_23 w hw.2 b hb h23'
    have e4 : a = 4 := by omega
    have e1 : b = 1 := by omega
    subst e4 e1
    exact g5_u3_aux_y_of_14 w hw.2 hb ha
  omega

/-- G5-SEPa (separation, linear clause). For every word with `y ≥ 1`,
`t − t^σ = y √5 ≥ √5`, with `√5` the ring element `2φ − 1`.
Locus: `candidates/LEDGER.md` row D-E2 (l. 26);
`candidates/checks/SH-P2-1-sector-ladder-pruning.md` §4 "Item 4" (l. 198–200).
STATEMENTS.md sha256 prefix `51324441`. -/
theorem g5_u3_sep_lin (w : List ℕ) (hw : IsWord w) (hy : 1 ≤ (ntr w).y) :
    ntr w - conj (ntr w) = (ntr w).y • (2 * phi - 1) ∧
      2 * phi - 1 ≤ ntr w - conj (ntr w) := by
  rw [g5_u3_aux_diff]
  refine ⟨?_, ?_⟩
  · rw [zsmul_eq_mul, g5_u3_aux_intCast, g5_u3_aux_two]
    ext <;> simp [phi]
    ring
  · change RealNonneg (_ - _)
    rw [g5_u3_aux_two]
    unfold RealNonneg NonnegAB5
    left
    simp [phi]
    omega

/-- G5-SEPb (separation, distance clause, squared). For every word with `y ≥ 1`,
`(t − t^σ)² = 5 y² ≥ 5`.
Locus: `candidates/LEDGER.md` row D-E2 (l. 26);
`candidates/checks/SH-P2-1-sector-ladder-pruning.md` §4 "Item 4" (l. 198–200).
STATEMENTS.md sha256 prefix `51324441`. -/
theorem g5_u3_sep_sq (w : List ℕ) (hw : IsWord w) (hy : 1 ≤ (ntr w).y) :
    (ntr w - conj (ntr w)) ^ 2 = (⟨5 * (ntr w).y ^ 2, 0⟩ : ZPhi) ∧
      (5 : ZPhi) ≤ (ntr w - conj (ntr w)) ^ 2 := by
  rw [g5_u3_aux_diff]
  have e : (⟨-(ntr w).y, 2 * (ntr w).y⟩ : ZPhi) ^ 2 = ⟨5 * (ntr w).y ^ 2, 0⟩ := by
    rw [sq]
    ext <;> simp <;> ring
  refine ⟨e, ?_⟩
  change RealNonneg (_ - _)
  rw [e, g5_u3_aux_five]
  unfold RealNonneg NonnegAB5
  left
  refine ⟨?_, ?_⟩ <;> simp only [sub_x, sub_y] <;> nlinarith

end G5
