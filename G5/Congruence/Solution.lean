import Mathlib
import G5.Ring.Solution

/-!
# Unit U6 (`G5/Congruence`) — the mod-4 and mod-3 closures: proofs

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
The statements are `G5/Congruence/Challenge.lean` (sha256 prefix `d576229b`); this module does
not import it. It imports the proved U1 prelude `G5.Ring.Solution` and restates the U6
definitions block byte for byte, then proves the six theorems under the same names and texts.

Method. Reduced matrices mod `n` (`n = 4, 3`) are coded as base-`n` numbers with eight digits.
The reduction of a product is the reduced product (`g5_u6_aux_map_mul`), so the reduction of a
literal word is a fold of reduced syllables (`g5_u6_aux_bridge`). Kernel `decide` checks over
explicit code lists give the closure under the four syllables (mod 4 split by word-length
parity: 160 codes each, disjoint; mod 3: 120 codes), the trace laws on every listed code, and
one literal word for each listed code; the image orders 320 and 120 follow.
-/

/- G5-U6-DEFS. Locus: AM §2.3 (l. 95); DO §3.2 (l. 103), §10 D-2 (l. 246);
PHASE-2-DEFINITIONS §1 (l. 15). STATEMENTS.md sha256 prefix `c6abadff`. -/
open G5 ZPhi

/-- Reduction of ℤ[φ] mod 4 as pairs mod 4: `x + y φ ↦ (x mod 4, y mod 4)`. -/
def ZPhi.red4 (t : ZPhi) : ZMod 4 × ZMod 4 := ((t.x : ZMod 4), (t.y : ZMod 4))

/-- Reduction of ℤ[φ] mod 3 as pairs mod 3: `x + y φ ↦ (x mod 3, y mod 3)`. -/
def ZPhi.red3 (t : ZPhi) : ZMod 3 × ZMod 3 := ((t.x : ZMod 3), (t.y : ZMod 3))

/-- `H₄`: the eight residues `(x mod 4, y mod 4)` the record allows. -/
def G5.H4 : Finset (ZMod 4 × ZMod 4) :=
  {(0, 0), (0, 1), (0, 2), (0, 3), (2, 0), (2, 2), (1, 3), (3, 1)}

namespace G5

/-! ## Helpers (private, `g5_u6_aux_*`): reduction mod `n`, digit codes, the bridge -/

/-- Reduction mod `n` of `x + y φ` as a pair; `red4`, `red3` are the cases `n = 4, 3`. -/
private def g5_u6_aux_red (n : ℕ) (t : ZPhi) : ZMod n × ZMod n :=
  ((t.x : ZMod n), (t.y : ZMod n))

/-- The product of ℤ[φ] carried to pairs mod `n`. -/
private def g5_u6_aux_pmul {n : ℕ} (a b : ZMod n × ZMod n) : ZMod n × ZMod n :=
  (a.1 * b.1 + a.2 * b.2, a.1 * b.2 + a.2 * b.1 + a.2 * b.2)

/-- The matrix product carried to reduced matrices. -/
private def g5_u6_aux_rmul {n : ℕ} (X Y : Matrix (Fin 2) (Fin 2) (ZMod n × ZMod n)) :
    Matrix (Fin 2) (Fin 2) (ZMod n × ZMod n) :=
  Matrix.of fun i j => g5_u6_aux_pmul (X i 0) (Y 0 j) + g5_u6_aux_pmul (X i 1) (Y 1 j)

private theorem g5_u6_aux_red_add (n : ℕ) (s t : ZPhi) :
    g5_u6_aux_red n (s + t) = g5_u6_aux_red n s + g5_u6_aux_red n t := by
  simp [g5_u6_aux_red]

private theorem g5_u6_aux_red_mul (n : ℕ) (s t : ZPhi) :
    g5_u6_aux_red n (s * t) = g5_u6_aux_pmul (g5_u6_aux_red n s) (g5_u6_aux_red n t) := by
  simp [g5_u6_aux_red, g5_u6_aux_pmul]

private theorem g5_u6_aux_map_mul (n : ℕ) (A B : M2) :
    (A * B).map (g5_u6_aux_red n) =
      g5_u6_aux_rmul (A.map (g5_u6_aux_red n)) (B.map (g5_u6_aux_red n)) := by
  refine Matrix.ext fun i j => ?_
  simp [Matrix.mul_apply, Fin.sum_univ_two, g5_u6_aux_rmul, g5_u6_aux_red_add,
    g5_u6_aux_red_mul]

/-- A reduced matrix as a base-`n` number, digits `(0,0).x, (0,0).y, (0,1).x, …`. -/
private def g5_u6_aux_enc (n : ℕ) (X : Matrix (Fin 2) (Fin 2) (ZMod n × ZMod n)) : ℕ :=
  (X 0 0).1.val + n * ((X 0 0).2.val + n * ((X 0 1).1.val + n * ((X 0 1).2.val +
    n * ((X 1 0).1.val + n * ((X 1 0).2.val + n * ((X 1 1).1.val + n * (X 1 1).2.val))))))

/-- The reduced matrix read off the base-`n` digits of `c`. -/
private def g5_u6_aux_dec (n : ℕ) (c : ℕ) : Matrix (Fin 2) (Fin 2) (ZMod n × ZMod n) :=
  !![((c % n : ℕ), (c / n % n : ℕ)), ((c / n / n % n : ℕ), (c / n / n / n % n : ℕ));
    ((c / n / n / n / n % n : ℕ), (c / n / n / n / n / n % n : ℕ)),
    ((c / n / n / n / n / n / n % n : ℕ), (c / n / n / n / n / n / n / n % n : ℕ))]

private theorem g5_u6_aux_hmod {n v r : ℕ} (hv : v < n) : (v + n * r) % n = v := by
  rw [Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt hv]

private theorem g5_u6_aux_hdiv {n v r : ℕ} (hv : v < n) : (v + n * r) / n = r := by
  rw [Nat.add_mul_div_left _ _ (by omega), Nat.div_eq_of_lt hv, zero_add]

private theorem g5_u6_aux_dec_enc (n : ℕ) [NeZero n]
    (X : Matrix (Fin 2) (Fin 2) (ZMod n × ZMod n)) :
    g5_u6_aux_dec n (g5_u6_aux_enc n X) = X := by
  have h : ∀ z : ZMod n, z.val < n := fun z => ZMod.val_lt z
  refine Matrix.ext fun i j => ?_
  fin_cases i <;> fin_cases j <;> refine Prod.ext ?_ ?_ <;>
    simp [g5_u6_aux_dec, g5_u6_aux_enc, g5_u6_aux_hmod (h _), g5_u6_aux_hdiv (h _)]

private theorem g5_u6_aux_enc_inj (n : ℕ) [NeZero n] : Function.Injective (g5_u6_aux_enc n) := by
  intro X Y hXY
  rw [← g5_u6_aux_dec_enc n X, ← g5_u6_aux_dec_enc n Y, hXY]

/-- The reduced product on codes. -/
private def g5_u6_aux_rmulC (n : ℕ) (g c : ℕ) : ℕ :=
  g5_u6_aux_enc n (g5_u6_aux_rmul (g5_u6_aux_dec n g) (g5_u6_aux_dec n c))

/-- The code of the reduced word, syllable codes `gen a`, identity code `idc`. -/
private def g5_u6_aux_foldC (n : ℕ) (gen : ℕ → ℕ) (idc : ℕ) (w : List ℕ) : ℕ :=
  w.foldr (fun a c => g5_u6_aux_rmulC n (gen a) c) idc

private theorem g5_u6_aux_bridge (n : ℕ) [NeZero n] (gen : ℕ → ℕ) (idc : ℕ)
    (hg : ∀ a, 1 ≤ a ∧ a ≤ 4 → (R ^ a * S).map (g5_u6_aux_red n) = g5_u6_aux_dec n (gen a))
    (hid : (1 : M2).map (g5_u6_aux_red n) = g5_u6_aux_dec n idc)
    (w : List ℕ) (hw : ∀ a ∈ w, 1 ≤ a ∧ a ≤ 4) :
    (W w).map (g5_u6_aux_red n) = g5_u6_aux_dec n (g5_u6_aux_foldC n gen idc w) := by
  induction w with
  | nil => simpa [W, g5_u6_aux_foldC] using hid
  | cons a w ih =>
    have ih' := ih fun b hb => hw b (List.mem_cons_of_mem a hb)
    have hW : W (a :: w) = (R ^ a * S) * W w := by simp [W]
    rw [hW, g5_u6_aux_map_mul, ih', hg a (hw a (List.mem_cons_self ..))]
    simp only [g5_u6_aux_foldC, List.foldr_cons, g5_u6_aux_rmulC, g5_u6_aux_dec_enc]

private theorem g5_u6_aux_enc_dec_fold (n : ℕ) [NeZero n] (gen : ℕ → ℕ) (idc : ℕ)
    (w : List ℕ) (hw : w ≠ []) :
    g5_u6_aux_enc n (g5_u6_aux_dec n (g5_u6_aux_foldC n gen idc w)) =
      g5_u6_aux_foldC n gen idc w := by
  cases w with
  | nil => exact absurd rfl hw
  | cons a w => simp only [g5_u6_aux_foldC, List.foldr_cons, g5_u6_aux_rmulC, g5_u6_aux_dec_enc]

private theorem g5_u6_aux_inv (n : ℕ) (gen : ℕ → ℕ) (idc : ℕ) (Le Lo : List ℕ)
    (hid : idc ∈ Le)
    (hE : ∀ c ∈ Le, ∀ a ∈ [1, 2, 3, 4], g5_u6_aux_rmulC n (gen a) c ∈ Lo)
    (hO : ∀ c ∈ Lo, ∀ a ∈ [1, 2, 3, 4], g5_u6_aux_rmulC n (gen a) c ∈ Le)
    (w : List ℕ) (hw : ∀ a ∈ w, 1 ≤ a ∧ a ≤ 4) :
    g5_u6_aux_foldC n gen idc w ∈ (if w.length % 2 = 0 then Le else Lo) := by
  induction w with
  | nil => simpa [g5_u6_aux_foldC] using hid
  | cons a w ih =>
    have ih' := ih fun b hb => hw b (List.mem_cons_of_mem a hb)
    have ha : a ∈ [1, 2, 3, 4] := by
      obtain ⟨h1, h4⟩ := hw a (List.mem_cons_self ..)
      interval_cases a <;> simp
    simp only [g5_u6_aux_foldC, List.foldr_cons, List.length_cons] at ih' ⊢
    by_cases h : w.length % 2 = 0
    · rw [if_pos h] at ih'
      rw [if_neg (by omega)]
      exact hE _ ih' a ha
    · rw [if_neg h] at ih'
      rw [if_pos (by omega)]
      exact hO _ ih' a ha

/-- The reduced trace of the matrix with code `c`. -/
private def g5_u6_aux_trp (n : ℕ) (c : ℕ) : ZMod n × ZMod n :=
  g5_u6_aux_dec n c 0 0 + g5_u6_aux_dec n c 1 1

private theorem g5_u6_aux_trace (n : ℕ) (A : M2) (c : ℕ)
    (h : A.map (g5_u6_aux_red n) = g5_u6_aux_dec n c) :
    ((A.trace.x : ZMod n), (A.trace.y : ZMod n)) = g5_u6_aux_trp n c := by
  have h00 := congrFun (congrFun h 0) 0
  have h11 := congrFun (congrFun h 1) 1
  simp only [Matrix.map_apply] at h00 h11
  rw [g5_u6_aux_trp, ← h00, ← h11, Matrix.trace_fin_two]
  simp [g5_u6_aux_red]

private theorem g5_u6_aux_emod (n : ℕ) [NeZero n] (z : ℤ) (q : ZMod n)
    (h : (z : ZMod n) = q) : z % n = (q.val : ℤ) := by
  rw [← h, ZMod.val_intCast]

private theorem g5_u6_aux_ncard (n : ℕ) [NeZero n] (gen : ℕ → ℕ) (idc : ℕ) (L : List ℕ)
    (ws : List (List ℕ))
    (hg : ∀ a, 1 ≤ a ∧ a ≤ 4 → (R ^ a * S).map (g5_u6_aux_red n) = g5_u6_aux_dec n (gen a))
    (hid : (1 : M2).map (g5_u6_aux_red n) = g5_u6_aux_dec n idc)
    (hsub : ∀ w, IsWord w → g5_u6_aux_foldC n gen idc w ∈ L)
    (hws : ws.map (g5_u6_aux_foldC n gen idc) = L)
    (hwv : ∀ w ∈ ws, w ≠ [] ∧ ∀ a ∈ w, 1 ≤ a ∧ a ≤ 4)
    (hnd : L.Nodup) :
    ((fun w : List ℕ => (W w).map (g5_u6_aux_red n)) '' {w | IsWord w}).ncard = L.length := by
  rw [← Set.ncard_image_of_injective _ (g5_u6_aux_enc_inj n)]
  have hset : g5_u6_aux_enc n ''
      ((fun w : List ℕ => (W w).map (g5_u6_aux_red n)) '' {w | IsWord w}) =
      (L.toFinset : Set ℕ) := by
    ext c
    simp only [Set.mem_image, Set.mem_ofPred_eq, List.coe_toFinset]
    constructor
    · rintro ⟨M, ⟨w, hw, rfl⟩, rfl⟩
      rw [g5_u6_aux_bridge n gen idc hg hid w hw.2, g5_u6_aux_enc_dec_fold n gen idc w hw.1]
      exact hsub w hw
    · intro hc
      rw [← hws] at hc
      obtain ⟨w, hw, rfl⟩ := List.mem_map.mp hc
      refine ⟨_, ⟨w, hwv w hw, rfl⟩, ?_⟩
      rw [g5_u6_aux_bridge n gen idc hg hid w (hwv w hw).2,
        g5_u6_aux_enc_dec_fold n gen idc w (hwv w hw).1]
  rw [hset, Set.ncard_coe_finset, List.toFinset_card_of_nodup hnd]

/-! ## The mod-4 instance -/

/-- Codes of the reduced syllables `R^a S` mod 4. -/
private def g5_u6_aux_gen4 : ℕ → ℕ
  | 1 => 12483
  | 2 => 50124
  | 3 => 52284
  | 4 => 15363
  | _ => 4097

private theorem g5_u6_aux_hg4 (a : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) :
    (R ^ a * S).map (g5_u6_aux_red 4) = g5_u6_aux_dec 4 (g5_u6_aux_gen4 a) := by
  obtain ⟨h1, h4⟩ := ha
  interval_cases a <;> decide

private theorem g5_u6_aux_hid4 : (1 : M2).map (g5_u6_aux_red 4) = g5_u6_aux_dec 4 4097 := by
  decide

private def g5_u6_aux_Le4 : List ℕ :=
  [308, 316, 788, 796, 2484, 2492, 2964, 2972, 4097, 4225, 4641, 4769,
   5190, 5324, 5734, 5868, 6145, 6273, 6689, 6817, 7244, 7366, 7788, 7910,
   8630, 8638, 9110, 9118, 10550, 10558, 11030, 11038, 12291, 12419, 12835, 12963,
   13390, 13508, 13934, 14052, 14339, 14467, 14883, 15011, 15428, 15566, 15972, 16110,
   16688, 16792, 17168, 17336, 17513, 17603, 17993, 18147, 18712, 18864, 19256, 19344,
   19523, 19689, 20067, 20169, 24858, 25010, 25402, 25490, 25665, 25835, 26209, 26315,
   26930, 27034, 27410, 27578, 27755, 27841, 28235, 28385, 33172, 33180, 33716, 33724,
   35092, 35100, 35636, 35644, 36905, 37033, 37385, 37513, 37988, 38126, 38468, 38606,
   38953, 39081, 39433, 39561, 40046, 40164, 40526, 40644, 41238, 41246, 41782, 41790,
   43414, 43422, 43958, 43966, 45099, 45227, 45579, 45707, 46188, 46310, 46668, 46790,
   47147, 47275, 47627, 47755, 48230, 48364, 48710, 48844, 49456, 49560, 49936, 50104,
   50283, 50369, 50763, 50913, 51480, 51632, 52024, 52112, 52289, 52459, 52833, 52939,
   57626, 57778, 58170, 58258, 58435, 58601, 58979, 59081, 59698, 59802, 60178, 60346,
   60521, 60611, 61001, 61155]

private def g5_u6_aux_Lo4 : List ℕ :=
  [304, 312, 784, 792, 2482, 2490, 2962, 2970, 4161, 4289, 4713, 4841,
   5121, 5259, 5673, 5795, 6219, 6347, 6755, 6883, 7169, 7307, 7721, 7843,
   8498, 8506, 8978, 8986, 10672, 10680, 11152, 11160, 12355, 12483, 12907, 13035,
   13315, 13449, 13867, 13985, 14409, 14537, 14945, 15073, 15363, 15497, 15915, 16033,
   16708, 16876, 17260, 17348, 17428, 17598, 17980, 18070, 18790, 18894, 19278, 19430,
   19508, 19614, 19996, 20150, 24902, 25070, 25454, 25542, 25622, 25788, 26174, 26260,
   26980, 27084, 27468, 27620, 27702, 27804, 28190, 28340, 33072, 33080, 33552, 33560,
   35250, 35258, 35730, 35738, 36937, 37065, 37473, 37601, 37897, 38019, 38433, 38571,
   38979, 39107, 39531, 39659, 39945, 40067, 40481, 40619, 41266, 41274, 41746, 41754,
   43440, 43448, 43920, 43928, 45131, 45259, 45667, 45795, 46091, 46209, 46627, 46761,
   47169, 47297, 47721, 47849, 48139, 48257, 48675, 48809, 49484, 49636, 50020, 50124,
   50204, 50358, 50740, 50846, 51566, 51654, 52038, 52206, 52284, 52374, 52756, 52926,
   57678, 57830, 58214, 58318, 58398, 58548, 58934, 59036, 59756, 59844, 60228, 60396,
   60478, 60564, 60950, 61116]

private def g5_u6_aux_L4 : List ℕ :=
  [304, 308, 312, 316, 784, 788, 792, 796, 2482, 2484, 2490, 2492,
   2962, 2964, 2970, 2972, 4097, 4161, 4225, 4289, 4641, 4713, 4769, 4841,
   5121, 5190, 5259, 5324, 5673, 5734, 5795, 5868, 6145, 6219, 6273, 6347,
   6689, 6755, 6817, 6883, 7169, 7244, 7307, 7366, 7721, 7788, 7843, 7910,
   8498, 8506, 8630, 8638, 8978, 8986, 9110, 9118, 10550, 10558, 10672, 10680,
   11030, 11038, 11152, 11160, 12291, 12355, 12419, 12483, 12835, 12907, 12963, 13035,
   13315, 13390, 13449, 13508, 13867, 13934, 13985, 14052, 14339, 14409, 14467, 14537,
   14883, 14945, 15011, 15073, 15363, 15428, 15497, 15566, 15915, 15972, 16033, 16110,
   16688, 16708, 16792, 16876, 17168, 17260, 17336, 17348, 17428, 17513, 17598, 17603,
   17980, 17993, 18070, 18147, 18712, 18790, 18864, 18894, 19256, 19278, 19344, 19430,
   19508, 19523, 19614, 19689, 19996, 20067, 20150, 20169, 24858, 24902, 25010, 25070,
   25402, 25454, 25490, 25542, 25622, 25665, 25788, 25835, 26174, 26209, 26260, 26315,
   26930, 26980, 27034, 27084, 27410, 27468, 27578, 27620, 27702, 27755, 27804, 27841,
   28190, 28235, 28340, 28385, 33072, 33080, 33172, 33180, 33552, 33560, 33716, 33724,
   35092, 35100, 35250, 35258, 35636, 35644, 35730, 35738, 36905, 36937, 37033, 37065,
   37385, 37473, 37513, 37601, 37897, 37988, 38019, 38126, 38433, 38468, 38571, 38606,
   38953, 38979, 39081, 39107, 39433, 39531, 39561, 39659, 39945, 40046, 40067, 40164,
   40481, 40526, 40619, 40644, 41238, 41246, 41266, 41274, 41746, 41754, 41782, 41790,
   43414, 43422, 43440, 43448, 43920, 43928, 43958, 43966, 45099, 45131, 45227, 45259,
   45579, 45667, 45707, 45795, 46091, 46188, 46209, 46310, 46627, 46668, 46761, 46790,
   47147, 47169, 47275, 47297, 47627, 47721, 47755, 47849, 48139, 48230, 48257, 48364,
   48675, 48710, 48809, 48844, 49456, 49484, 49560, 49636, 49936, 50020, 50104, 50124,
   50204, 50283, 50358, 50369, 50740, 50763, 50846, 50913, 51480, 51566, 51632, 51654,
   52024, 52038, 52112, 52206, 52284, 52289, 52374, 52459, 52756, 52833, 52926, 52939,
   57626, 57678, 57778, 57830, 58170, 58214, 58258, 58318, 58398, 58435, 58548, 58601,
   58934, 58979, 59036, 59081, 59698, 59756, 59802, 59844, 60178, 60228, 60346, 60396,
   60478, 60521, 60564, 60611, 60950, 61001, 61116, 61155]

private def g5_u6_aux_words4 : List (List ℕ) :=
  [[1, 2, 2, 2, 1], [2, 1, 1, 1], [4, 3, 4, 1, 1], [1, 1, 2, 1, 1, 1], [4, 1, 1, 1, 2],
   [2, 2, 2, 1], [1, 2, 1, 1, 1], [3, 1, 1, 2, 1, 1], [2, 1, 4, 1, 1], [4, 3, 1, 1],
   [4, 2, 3], [2, 3, 1, 4], [1, 4, 3, 1, 1], [4, 4, 2, 1], [2, 3, 1],
   [1, 4, 2, 3], [1, 1, 1, 1], [4, 1, 1, 1, 3], [1, 1], [2, 1, 1, 2, 1],
   [3, 3, 2, 2], [3, 4, 2], [3, 1, 4, 1], [3, 4, 2, 1, 1], [1, 3, 3, 3, 1],
   [1, 4], [3, 2, 4, 2, 1], [1, 1, 1, 4], [3, 1, 2], [4, 3, 2, 1],
   [2, 1, 4, 2, 1], [3, 4, 1, 3], [4, 4], [2, 2, 1, 1, 1], [4, 4, 1, 1],
   [2, 2, 1], [4, 1, 4, 2], [2, 4, 3, 2, 2], [4, 1, 4, 2, 1, 1], [4, 1, 4, 2, 1],
   [3, 3, 4, 1, 1], [1, 4, 4, 4], [4, 3, 3], [2, 1, 4, 3], [2, 2, 4, 1, 1],
   [2, 4, 1, 2], [1, 4, 2, 1, 1], [1, 2, 1, 3, 1, 1], [3, 1, 3], [2, 1, 4, 2, 2],
   [4, 3, 2, 2], [3, 4, 1, 4], [2, 4, 2], [1, 4, 3, 2, 2], [4, 4, 3, 2],
   [1, 3, 1, 3], [3, 2, 1, 1], [2, 4, 2, 4], [3, 2, 4, 1, 1], [4, 1, 2],
   [3, 3, 2, 1], [1, 4, 1, 2], [1, 3, 2, 1, 1], [3, 4, 1], [2, 1, 1, 2, 1, 1],
   [1, 1, 1], [2, 1, 1, 2], [1], [2, 4, 3, 1, 1, 1], [4, 1, 3, 1, 1],
   [2, 4, 3, 1], [4, 1, 3], [4, 4, 4], [1, 4, 3, 3], [3, 2, 3, 1, 1],
   [3, 1, 1, 1], [2, 3, 1, 2, 1], [1, 1, 4, 2, 1, 1], [2, 1, 3, 1, 1], [4, 2, 1, 1],
   [1, 2, 2, 1], [1, 4, 4, 1, 1], [1, 2, 2, 1, 1, 1], [1, 4, 4], [3, 4, 3, 2],
   [3, 4, 3, 2, 1], [3, 4, 3, 2, 1, 1], [3, 1, 4, 2, 2], [4], [3, 3, 3, 1],
   [1, 1, 4], [2, 1, 2, 1, 1, 1], [2, 4, 1], [4, 4, 3, 1], [1, 4, 3, 2, 1],
   [1, 3, 1, 2], [1, 1, 1, 2], [4, 1, 1, 1, 4], [1, 2], [2, 2, 2, 1, 1],
   [1, 2, 2, 2], [2, 1, 1], [4, 3, 4, 1], [1, 1, 2, 1, 1], [1, 4, 4, 4, 1],
   [1, 3], [2, 1, 4, 3, 1], [1, 1, 1, 3], [4, 4, 3], [2, 4],
   [2, 1, 3, 2, 1], [1, 4, 3, 2], [3, 4], [2, 4, 4, 1, 1], [1, 3, 2, 1],
   [3, 3, 2], [4, 1, 2, 1], [3, 2, 1, 1, 1], [3, 4, 2, 2], [2, 4, 2, 4, 1],
   [2, 2, 3, 1, 1], [1, 3, 3, 3], [3, 2, 2], [3, 2, 4, 2], [4, 2, 1, 1, 1],
   [2, 4, 3, 3], [3, 4, 1, 4, 2], [3, 1, 3, 2], [3, 1, 4, 2], [3, 4, 3],
   [2, 4, 2, 1], [4, 4, 3, 2, 1], [2, 4, 3, 2, 1, 1], [4, 1, 4, 1, 1], [3, 4, 3, 3],
   [3, 4, 3, 2, 2], [2, 1, 2], [4, 1], [3, 3, 3, 1, 1], [1, 1, 4, 1],
   [1, 2, 1, 3, 1], [1, 4, 2, 1], [3, 4, 4, 1, 1], [2, 2, 4, 1], [1, 4, 3, 1],
   [2, 3, 3, 1, 1], [2, 3], [4, 4, 2], [2, 3, 2, 2], [4, 3, 1, 1, 1],
   [4, 2, 3, 1], [2, 3, 1, 4, 1], [1, 1, 3, 1, 1], [3, 2, 3, 1], [3, 1, 1],
   [3, 4, 1, 2], [4, 3, 2, 1, 1], [3, 1, 2, 1], [3, 4, 1, 3, 1], [2, 1, 4, 2, 1, 1],
   [3, 3, 4, 1, 2], [4, 3, 4], [2, 1], [1, 1, 2, 1], [1, 1, 1, 2, 1],
   [1, 2, 1], [1, 4, 3, 4], [3, 1, 1, 2], [4, 3], [1, 1, 4, 3],
   [2, 1, 4], [4, 2, 3, 1, 1], [1, 2, 1, 4], [2, 3, 3, 1], [1, 4, 3],
   [2, 3, 1, 1, 1], [4, 2, 4, 1], [2, 3, 2], [4, 4, 2, 2], [2, 3, 2, 1, 1],
   [4, 1, 3, 1], [2, 4, 3], [4, 4, 3, 3], [2, 4, 3, 1, 1], [3, 2, 3],
   [3, 1], [4, 4, 4, 1, 1], [1, 1, 3, 1], [2, 1, 3], [4, 2],
   [3, 1, 3, 2, 1], [1, 1, 4, 2], [2, 2, 1, 1], [4, 4, 1, 1, 1], [2, 2],
   [4, 4, 1], [3, 3, 1, 1], [3, 3, 1, 1, 1], [3, 3], [3, 3, 1],
   [1, 1, 4, 1, 1], [2, 1, 2, 1], [4, 1, 1], [2, 4, 2, 3], [1, 1, 4, 2, 2],
   [2, 1, 3, 2], [4, 2, 2], [2, 3, 1, 3], [4, 1, 4, 1], [3, 4, 1, 4, 1, 1],
   [3, 1, 3, 1, 1], [2, 4, 3, 2, 1], [2, 4, 2, 1, 1], [3, 1, 4, 2, 1], [4, 4, 3, 2, 1, 1],
   [3, 4, 3, 1], [3, 2], [1, 1, 3, 2], [3, 2, 4], [4, 1, 2, 1, 1],
   [1, 3, 2], [3, 4, 1, 1, 1], [1, 3, 2, 4], [2, 4, 4, 1], [2, 3, 2, 1],
   [4, 2, 4, 1, 1], [2, 3, 2, 1, 1, 1], [4, 2, 4], [3, 4, 2, 1], [3, 1, 4, 1, 1],
   [3, 4, 2, 1, 1, 1], [3, 1, 4], [1, 2, 1, 2, 1], [2, 2, 3, 1], [4, 2, 1, 1, 2],
   [1, 4, 1, 1], [1, 2, 1, 3, 2], [2, 2, 4, 2], [3, 1, 2, 1, 1], [1, 4, 2, 2],
   [1, 4, 4, 1, 1, 1], [1, 2, 2, 1, 1], [1, 4, 4, 1], [1, 2, 2], [1, 3, 3, 1, 1, 1],
   [1, 3, 3, 1, 1], [1, 3, 3, 1], [1, 3, 3], [1, 3, 1], [1, 3, 2, 3],
   [3, 3, 4], [4, 1, 1, 2], [1, 4, 2], [1, 2, 1, 3], [2, 2, 4],
   [3, 4, 4, 1], [1, 1, 1, 2, 1, 1], [2, 2, 2], [1, 2, 1, 1], [3, 1, 1, 2, 1],
   [1, 2, 2, 2, 1, 1], [1, 1, 2], [2, 1, 1, 3], [2], [3, 3, 3],
   [1, 3, 2, 2], [2, 1, 2, 1, 1], [4, 1, 1, 1], [3, 4, 4], [2, 4, 2, 2],
   [4, 4, 3, 2, 2], [3, 1, 4, 3], [3, 4, 1, 1], [3, 3, 2, 1, 1], [4, 1, 3, 2],
   [2, 4, 4], [1, 3, 3, 2], [1, 1, 3, 2, 1], [3, 2, 4, 1], [3, 2, 1],
   [3], [4, 4, 4, 1], [1, 1, 3], [2, 1, 1, 4], [2, 2, 4, 2, 1],
   [2, 1, 4, 2], [4, 3, 2], [1, 4, 4, 3], [3, 1, 4, 2, 1, 1], [4, 1, 4, 2, 2],
   [4, 1, 4, 3], [3, 4, 3, 1, 1], [2, 4, 3, 2], [3, 4, 1, 4, 1], [3, 1, 3, 1],
   [4, 1, 4], [1, 3, 2, 3, 1], [3, 3, 4, 1], [4, 1, 1, 2, 1], [1, 3, 1, 1],
   [1, 3, 1, 2, 1], [1, 4, 3, 2, 1, 1], [4, 4, 3, 1, 1], [2, 4, 1, 1], [4, 2, 4, 2],
   [4, 4, 2, 1, 1], [2, 3, 1, 1], [2, 3, 3], [2, 1, 4, 1], [1, 1, 4, 3, 1],
   [1, 4, 4, 2], [4, 3, 1], [1, 4, 1], [1, 2, 1, 2], [2, 2, 3],
   [1, 3, 3, 3, 1, 1], [1, 1, 4, 2, 1], [2, 3, 1, 2], [4, 2, 1], [2, 1, 3, 1]]

private theorem g5_u6_aux_clE4 : ∀ c ∈ g5_u6_aux_Le4, ∀ a ∈ [1, 2, 3, 4],
    g5_u6_aux_rmulC 4 (g5_u6_aux_gen4 a) c ∈ g5_u6_aux_Lo4 := by
  decide +kernel

private theorem g5_u6_aux_clO4 : ∀ c ∈ g5_u6_aux_Lo4, ∀ a ∈ [1, 2, 3, 4],
    g5_u6_aux_rmulC 4 (g5_u6_aux_gen4 a) c ∈ g5_u6_aux_Le4 := by
  decide +kernel

private theorem g5_u6_aux_subE4 : ∀ c ∈ g5_u6_aux_Le4, c ∈ g5_u6_aux_L4 := by
  decide +kernel

private theorem g5_u6_aux_subO4 : ∀ c ∈ g5_u6_aux_Lo4, c ∈ g5_u6_aux_L4 := by
  decide +kernel

private theorem g5_u6_aux_mem4 (w : List ℕ) (hw : ∀ a ∈ w, 1 ≤ a ∧ a ≤ 4) :
    g5_u6_aux_foldC 4 g5_u6_aux_gen4 4097 w ∈ g5_u6_aux_L4 ∧
      (w.length % 2 = 0 → g5_u6_aux_foldC 4 g5_u6_aux_gen4 4097 w ∈ g5_u6_aux_Le4) := by
  have hm := g5_u6_aux_inv 4 g5_u6_aux_gen4 4097 _ _ (by decide +kernel)
    g5_u6_aux_clE4 g5_u6_aux_clO4 w hw
  by_cases h : w.length % 2 = 0
  · rw [if_pos h] at hm
    exact ⟨g5_u6_aux_subE4 _ hm, fun _ => hm⟩
  · rw [if_neg h] at hm
    exact ⟨g5_u6_aux_subO4 _ hm, fun h' => absurd h' h⟩

private theorem g5_u6_aux_word4 (w : List ℕ) (hw : IsWord w) :
    ∃ c, (((W w).trace.x : ZMod 4), ((W w).trace.y : ZMod 4)) = g5_u6_aux_trp 4 c ∧
      c ∈ g5_u6_aux_L4 ∧ (w.length % 2 = 0 → c ∈ g5_u6_aux_Le4) :=
  ⟨_, g5_u6_aux_trace 4 (W w) _ (g5_u6_aux_bridge 4 _ _ g5_u6_aux_hg4 g5_u6_aux_hid4 w hw.2),
    g5_u6_aux_mem4 w hw.2⟩

private theorem g5_u6_aux_chkB4 : ∀ c ∈ g5_u6_aux_L4, g5_u6_aux_trp 4 c ∈ H4 := by
  decide +kernel

private theorem g5_u6_aux_chkC4 : ∀ c ∈ g5_u6_aux_L4, (g5_u6_aux_trp 4 c).2.val % 2 = 1 →
    (g5_u6_aux_trp 4 c).1 ^ 2 + (g5_u6_aux_trp 4 c).1 * (g5_u6_aux_trp 4 c).2 -
      (g5_u6_aux_trp 4 c).2 ^ 2 = 3 := by
  decide +kernel

private theorem g5_u6_aux_chkDe4 : ∀ c ∈ g5_u6_aux_Le4, (g5_u6_aux_trp 4 c).2.val % 2 = 0 →
    (g5_u6_aux_trp 4 c).1.val = 2 ∧ (g5_u6_aux_trp 4 c).2.val = 0 := by
  decide +kernel

private theorem g5_u6_aux_chkDo4 : ∀ c ∈ g5_u6_aux_L4, (g5_u6_aux_trp 4 c).2.val % 2 = 1 →
    (g5_u6_aux_trp 4 c).1.val = 0 ∨
      ((g5_u6_aux_trp 4 c).1.val + (g5_u6_aux_trp 4 c).2.val) % 4 = 0 := by
  decide +kernel

private theorem g5_u6_aux_ws4 :
    g5_u6_aux_words4.map (g5_u6_aux_foldC 4 g5_u6_aux_gen4 4097) = g5_u6_aux_L4 := by
  decide +kernel

private theorem g5_u6_aux_wv4 : ∀ w ∈ g5_u6_aux_words4, w ≠ [] ∧ ∀ a ∈ w, 1 ≤ a ∧ a ≤ 4 := by
  decide +kernel

private theorem g5_u6_aux_nd4 : g5_u6_aux_L4.Nodup := by
  decide +kernel

private theorem g5_u6_aux_len4 : g5_u6_aux_L4.length = 320 := by
  decide +kernel

/-! ## The mod-3 instance -/

/-- Codes of the reduced syllables `R^a S` mod 3. -/
private def g5_u6_aux_gen3 : ℕ → ℕ
  | 1 => 1514
  | 2 => 4596
  | 3 => 4884
  | 4 => 1946
  | _ => 730

private theorem g5_u6_aux_hg3 (a : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) :
    (R ^ a * S).map (g5_u6_aux_red 3) = g5_u6_aux_dec 3 (g5_u6_aux_gen3 a) := by
  obtain ⟨h1, h4⟩ := ha
  interval_cases a <;> decide

private theorem g5_u6_aux_hid3 : (1 : M2).map (g5_u6_aux_red 3) = g5_u6_aux_dec 3 730 := by
  decide

private def g5_u6_aux_L3 : List ℕ :=
  [99, 102, 105, 171, 174, 177, 360, 365, 367, 720, 725, 727,
   730, 757, 784, 973, 1004, 1032, 1216, 1248, 1274, 1460, 1487, 1514,
   1703, 1735, 1758, 1946, 1974, 2005, 2286, 2298, 2337, 2358, 2400, 2406,
   2442, 2482, 2486, 2616, 2626, 2663, 2694, 2702, 2743, 2769, 2807, 2815,
   2924, 2969, 2987, 3329, 3373, 3390, 3491, 3534, 3553, 3916, 3929, 3939,
   4001, 4005, 4021, 4083, 4093, 4103, 4186, 4200, 4208, 4272, 4283, 4291,
   4352, 4363, 4365, 4473, 4488, 4521, 4545, 4584, 4596, 4632, 4667, 4672,
   4800, 4811, 4846, 4884, 4888, 4928, 4953, 4990, 5000, 5375, 5389, 5394,
   5461, 5463, 5477, 5538, 5549, 5557, 5645, 5655, 5668, 5727, 5737, 5747,
   5812, 5819, 5823, 5836, 5881, 5899, 6241, 6287, 6303, 6403, 6447, 6467]

private def g5_u6_aux_words3 : List (List ℕ) :=
  [[4, 1, 1, 2], [1, 3, 4, 4, 1], [4, 4, 3], [3, 4, 4, 1], [4, 1, 1, 2, 4],
   [2, 1, 1], [2, 3, 2, 1, 1, 1], [3, 3, 1], [1, 2, 3, 2], [2, 3, 2],
   [4, 3, 2, 1], [1, 1, 2, 3, 2], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1], [1, 1],
   [4, 1, 1, 1], [1, 4], [4, 4, 2], [4, 4], [3, 1, 1],
   [1, 1, 4, 4], [1, 1, 1], [1, 1, 1, 1, 1], [1], [4, 4, 1, 1, 1],
   [1, 3, 1, 1], [1, 4, 4], [4], [1, 1, 4], [2, 2, 1, 1],
   [3, 4, 4, 1, 1], [2, 1, 1, 1], [1, 2], [4, 4, 1, 1, 2], [1, 3, 4, 4],
   [1, 2, 1], [3, 1, 1, 1], [1, 3], [4, 4, 1], [1, 1, 2, 4],
   [2, 4], [4, 3, 3, 2], [4, 3, 4], [4, 1, 1], [1, 2, 4, 4],
   [3, 4], [2, 3, 1, 1], [1, 1, 3, 4], [3, 3, 2, 1], [2, 3, 3],
   [1, 1, 2, 3, 3], [1, 3, 2], [3, 2, 1, 1, 1], [4, 3, 1], [1, 2, 3, 3, 4],
   [4, 2, 1], [1, 2, 3, 1], [4, 1], [2, 2, 1, 1, 1], [1, 2, 2],
   [3, 3, 1, 1, 1], [1, 3, 3], [4, 3, 2], [3, 3, 4], [3, 2, 1],
   [1, 1, 3, 3, 4], [4, 4, 1, 1], [2, 3, 4, 4], [1, 3, 1], [1, 1, 2, 3],
   [2, 3], [4, 3, 3, 1], [3, 3, 3], [3, 3, 1, 1], [1, 2, 3, 4],
   [3, 4, 4], [4, 4, 3, 1, 1], [2, 1], [1, 1, 2], [4, 4, 3, 1],
   [2], [4, 4, 2, 1, 1], [2, 2, 1], [2, 4, 4], [4, 2, 1, 1],
   [4, 3, 3], [1, 3, 4], [3], [1, 1, 3], [4, 4, 3, 2],
   [4, 3], [1, 2, 4], [3, 2, 1, 1], [1, 1, 3, 1], [4, 4, 3, 2, 1],
   [3, 1], [4, 3, 2, 1, 1], [2, 3, 2, 1], [2, 3, 4], [4, 2],
   [1, 2, 3], [2, 3, 1, 1, 1], [1, 1, 2, 2], [4, 4, 2, 1], [2, 2],
   [4, 3, 1, 1], [1, 3, 2, 1], [1, 3, 3, 4], [3, 3], [1, 1, 3, 3],
   [2, 3, 2, 1, 1], [1, 2, 3, 3], [3, 3, 2], [3, 3, 2, 1, 1], [2, 3, 1],
   [4, 3, 3, 1, 1], [2, 3, 3, 4], [4, 3, 3, 2, 1], [1, 1, 3, 2], [3, 2]]

private theorem g5_u6_aux_cl3 : ∀ c ∈ g5_u6_aux_L3, ∀ a ∈ [1, 2, 3, 4],
    g5_u6_aux_rmulC 3 (g5_u6_aux_gen3 a) c ∈ g5_u6_aux_L3 := by
  decide +kernel

private theorem g5_u6_aux_mem3 (w : List ℕ) (hw : ∀ a ∈ w, 1 ≤ a ∧ a ≤ 4) :
    g5_u6_aux_foldC 3 g5_u6_aux_gen3 730 w ∈ g5_u6_aux_L3 := by
  have hm := g5_u6_aux_inv 3 g5_u6_aux_gen3 730 _ _ (by decide +kernel)
    g5_u6_aux_cl3 g5_u6_aux_cl3 w hw
  split_ifs at hm <;> exact hm

private theorem g5_u6_aux_word3 (w : List ℕ) (hw : IsWord w) :
    ∃ c, (((W w).trace.x : ZMod 3), ((W w).trace.y : ZMod 3)) = g5_u6_aux_trp 3 c ∧
      c ∈ g5_u6_aux_L3 :=
  ⟨_, g5_u6_aux_trace 3 (W w) _ (g5_u6_aux_bridge 3 _ _ g5_u6_aux_hg3 g5_u6_aux_hid3 w hw.2),
    g5_u6_aux_mem3 w hw.2⟩

private theorem g5_u6_aux_chk3 : ∀ c ∈ g5_u6_aux_L3,
    ¬ ((g5_u6_aux_trp 3 c).1.val = (g5_u6_aux_trp 3 c).2.val ∧
      (g5_u6_aux_trp 3 c).1.val ≠ 0) := by
  decide +kernel

private theorem g5_u6_aux_ws3 :
    g5_u6_aux_words3.map (g5_u6_aux_foldC 3 g5_u6_aux_gen3 730) = g5_u6_aux_L3 := by
  decide +kernel

private theorem g5_u6_aux_wv3 : ∀ w ∈ g5_u6_aux_words3, w ≠ [] ∧ ∀ a ∈ w, 1 ≤ a ∧ a ≤ 4 := by
  decide +kernel

private theorem g5_u6_aux_nd3 : g5_u6_aux_L3.Nodup := by
  decide +kernel

private theorem g5_u6_aux_len3 : g5_u6_aux_L3.length = 120 := by
  decide +kernel

/- G5-M4a. Locus: AM §2.3 (l. 95, l. 100); DO §3.2 (l. 103, l. 109);
SH-P2-1 §5 (l. 276, l. 284). Image order 320, read at the word level.
STATEMENTS.md sha256 prefix `c6abadff`. -/
/-- G5-M4a: the literal words reduce mod 4 to exactly 320 matrices. -/
theorem g5_u6_m4a :
    ((fun w : List ℕ => (W w).map red4) '' {w | IsWord w}).ncard = 320 := by
  refine (g5_u6_aux_ncard 4 g5_u6_aux_gen4 4097 g5_u6_aux_L4 g5_u6_aux_words4 g5_u6_aux_hg4
    g5_u6_aux_hid4 (fun w hw => (g5_u6_aux_mem4 w hw.2).1) g5_u6_aux_ws4 g5_u6_aux_wv4
    g5_u6_aux_nd4).trans g5_u6_aux_len4

/- G5-M4b. Locus: DO §3.2 D-2 (l. 118–120) and §10 D-2 (l. 246); AM §2.4 (l. 113, l. 115);
PHASE-2-DEFINITIONS §1 (l. 15). The row text, H₄ form; inclusion only.
STATEMENTS.md sha256 prefix `c6abadff`. -/
/-- G5-M4b: the trace of every literal word lies in `H₄` mod 4. -/
theorem g5_u6_m4b (w : List ℕ) (hw : IsWord w) : red4 (W w).trace ∈ H4 := by
  obtain ⟨c, hk, hL, -⟩ := g5_u6_aux_word4 w hw
  rw [show red4 (W w).trace = g5_u6_aux_trp 4 c from hk]
  exact g5_u6_aux_chkB4 c hL

/- G5-M4c. Locus: SH-P2-1 §5 (l. 212, l. 214–216, l. 288) and note 6 (l. 357);
LEDGER row AM-4 (l. 16). No converse is stated.
STATEMENTS.md sha256 prefix `c6abadff`. -/
/-- G5-M4c: `y` odd forces `N(t) ≡ 3 (mod 4)`. -/
theorem g5_u6_m4c (w : List ℕ) (hw : IsWord w) (hy : Odd (W w).trace.y) :
    nrm (W w).trace ≡ 3 [ZMOD 4] := by
  obtain ⟨c, hk, hL, -⟩ := g5_u6_aux_word4 w hw
  have hx : ((W w).trace.x : ZMod 4) = (g5_u6_aux_trp 4 c).1 := congrArg Prod.fst hk
  have hy' : ((W w).trace.y : ZMod 4) = (g5_u6_aux_trp 4 c).2 := congrArg Prod.snd hk
  have hym := g5_u6_aux_emod 4 _ _ hy'
  have hodd := Int.odd_iff.mp hy
  push_cast at hym
  have h3 := g5_u6_aux_chkC4 c hL (by omega)
  have hz : ((nrm (W w).trace : ℤ) : ZMod 4) = ((3 : ℤ) : ZMod 4) := by
    simp only [nrm]
    push_cast
    rw [hx, hy']
    exact h3
  exact_mod_cast (ZMod.intCast_eq_intCast_iff _ _ 4).mp hz

/- G5-M4d. Locus: LEDGER row AM-4 (l. 16, the adopted statement); AM §2.4 (l. 113, l. 115),
§6 (l. 225); SH-P2-1 §5 "Bonus" (l. 274).
STATEMENTS.md sha256 prefix `c6abadff`. -/
/-- G5-M4d: the ledger's two clauses (row AM-4). -/
theorem g5_u6_m4d (w : List ℕ) (hw : IsWord w) :
    (Even w.length → Even (W w).trace.y →
        (W w).trace.x ≡ 2 [ZMOD 4] ∧ (W w).trace.y ≡ 0 [ZMOD 4]) ∧
      (Odd (W w).trace.y →
        (W w).trace.x ≡ 0 [ZMOD 4] ∨ (W w).trace.x ≡ -(W w).trace.y [ZMOD 4]) := by
  obtain ⟨c, hk, hL, hE⟩ := g5_u6_aux_word4 w hw
  have hxm := g5_u6_aux_emod 4 _ _ (congrArg Prod.fst hk)
  have hym := g5_u6_aux_emod 4 _ _ (congrArg Prod.snd hk)
  push_cast at hxm hym
  refine ⟨fun hl hy => ?_, fun hy => ?_⟩
  · have hev := Int.even_iff.mp hy
    have h := g5_u6_aux_chkDe4 c (hE (Nat.even_iff.mp hl)) (by omega)
    simp only [Int.ModEq]
    omega
  · have hod := Int.odd_iff.mp hy
    have h := g5_u6_aux_chkDo4 c hL (by omega)
    simp only [Int.ModEq]
    omega

/- G5-M3a. Locus: AM §2.3 (l. 95, l. 103); DO §3.2 (l. 103, l. 108).
Image order 120, read at the word level.
STATEMENTS.md sha256 prefix `c6abadff`. -/
/-- G5-M3a: the literal words reduce mod 3 to exactly 120 matrices. -/
theorem g5_u6_m3a :
    ((fun w : List ℕ => (W w).map red3) '' {w | IsWord w}).ncard = 120 := by
  refine (g5_u6_aux_ncard 3 g5_u6_aux_gen3 730 g5_u6_aux_L3 g5_u6_aux_words3 g5_u6_aux_hg3
    g5_u6_aux_hid3 (fun w hw => g5_u6_aux_mem3 w hw.2) g5_u6_aux_ws3 g5_u6_aux_wv3
    g5_u6_aux_nd3).trans g5_u6_aux_len3

/- G5-M3b. Locus: LEDGER row AM-5 (l. 17); AM §2.4 (l. 113, l. 116), §6 (l. 226);
DO §3.2 D-2 (iii) (l. 121), §10 D-2 (l. 246).
STATEMENTS.md sha256 prefix `c6abadff`. -/
/-- G5-M3b: no literal word has trace with `x ≡ y ≢ 0 (mod 3)`. -/
theorem g5_u6_m3b (w : List ℕ) (hw : IsWord w) :
    ¬ ((W w).trace.x ≡ (W w).trace.y [ZMOD 3] ∧ ¬ ((W w).trace.x ≡ 0 [ZMOD 3])) := by
  obtain ⟨c, hk, hL⟩ := g5_u6_aux_word3 w hw
  have hxm := g5_u6_aux_emod 3 _ _ (congrArg Prod.fst hk)
  have hym := g5_u6_aux_emod 3 _ _ (congrArg Prod.snd hk)
  push_cast at hxm hym
  rintro ⟨h1, h2⟩
  simp only [Int.ModEq] at h1 h2
  exact g5_u6_aux_chk3 c hL ⟨by omega, by omega⟩

end G5
