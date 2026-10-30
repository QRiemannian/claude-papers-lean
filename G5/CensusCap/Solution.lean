import Mathlib
import G5.Ring.Solution
import G5.Ladder.Solution
import G5.Census.Solution

/-!
# Unit U13 (`G5/CensusCap`) — the census cap clause (row G5-CAP): proofs

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Statements: `G5/CensusCap/Challenge.lean` (sha256 prefix `d10844cb`), three theorems under the
same names and statement texts, byte for byte. U13 defines nothing; this module imports the
proved preludes `G5.Ring.Solution`, `G5.Ladder.Solution`, `G5.Census.Solution` (the prelude
rule for dependent units) and restates nothing.
Method: the real order on ℤ[φ] is read through the ring map `x + y φ ↦ x + y φ ∈ ℝ` (U5's and
U11's method, restated privately here). (a) If `X < (k + 1)φ`, then `k = 2` contradicts
`3φ ≤ X`, and otherwise U11's `g5_u11_census_a` at `K = k − 1` forces `k ≤ k − 1`. (b) The
same dichotomy leaves `k = 2` and `t < 3φ`, and U11's `g5_u11_census_b` gives the rotation and
`t = 3 + φ`. (conv) The two rotations of `(1, 4)` are decided.
-/

open G5 ZPhi

namespace G5

/-! ### Helpers: the real order through the ring map to ℝ (U11's method, private here) -/

/-- Helper: the real value `x + y φ` of an element of ℤ[φ], as a ring map to ℝ. -/
private noncomputable def g5_u13_aux_v : ZPhi →+* ℝ where
  toFun t := t.x + t.y * Real.goldenRatio
  map_one' := by simp
  map_mul' s t := by
    simp only [mul_x, mul_y]; push_cast
    linear_combination (-(s.y : ℝ) * t.y) * Real.goldenRatio_sq
  map_zero' := by simp
  map_add' s t := by simp only [add_x, add_y]; push_cast; ring

private theorem g5_u13_aux_v_apply (t : ZPhi) :
    g5_u13_aux_v t = t.x + t.y * Real.goldenRatio := rfl

private theorem g5_u13_aux_v_phi : g5_u13_aux_v phi = Real.goldenRatio := by
  simp [g5_u13_aux_v_apply, phi]

private theorem g5_u13_aux_ab5 (a b : ℤ) :
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
private theorem g5_u13_aux_le_iff (s t : ZPhi) : s ≤ t ↔ g5_u13_aux_v s ≤ g5_u13_aux_v t := by
  change RealNonneg (t - s) ↔ _
  unfold RealNonneg
  rw [g5_u13_aux_ab5, g5_u13_aux_v_apply, g5_u13_aux_v_apply]
  simp only [sub_x, sub_y]
  have hg : Real.goldenRatio = (1 + Real.sqrt 5) / 2 := rfl
  rw [hg]; push_cast
  constructor <;> intro h <;> linarith

private theorem g5_u13_aux_v_inj {s t : ZPhi} (h : g5_u13_aux_v s = g5_u13_aux_v t) : s = t := by
  rw [g5_u13_aux_v_apply, g5_u13_aux_v_apply] at h
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

/-- Helper: the strict real order maps to the strict order of the real values. -/
private theorem g5_u13_aux_lt {s t : ZPhi} (h : s < t) : g5_u13_aux_v s < g5_u13_aux_v t :=
  lt_of_le_of_ne ((g5_u13_aux_le_iff s t).1 h.1) (fun e => h.2 (g5_u13_aux_v_inj e))
/-- Helper: the strict order of the real values gives the strict real order. -/
private theorem g5_u13_aux_lt_of {s t : ZPhi} (h : g5_u13_aux_v s < g5_u13_aux_v t) :
    s < t :=
  ⟨(g5_u13_aux_le_iff s t).2 h.le, fun e => by rw [e] at h; exact lt_irrefl _ h⟩

/-- Helper: for `k = 1` or `k ≥ 3`, U11's census at `K = k − 1` excludes
`t < (k + 1) φ` in real values. -/
private theorem g5_u13_aux_not_lt (w : List ℕ) (hw : IsWord w)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4)
    (hk : w.length ≠ 2)
    (h : g5_u13_aux_v (ntr w) < ((w.length : ℝ) + 1) * Real.goldenRatio) : False := by
  have hk1 : 1 ≤ w.length := by
    rcases w with _ | ⟨a, w⟩
    · exact absurd rfl hw.1
    · simp
  have hK : w.length - 1 = 0 ∨ 2 ≤ w.length - 1 := by omega
  have hlt : ntr w < (((w.length - 1 : ℕ) : ZPhi) + 2) * phi := by
    apply g5_u13_aux_lt_of
    simp only [map_mul, map_add, map_natCast, map_ofNat, g5_u13_aux_v_phi]
    rw [Nat.cast_sub hk1]
    push_cast
    linarith
  have := g5_u11_census_a (w.length - 1) hK w hw hc hlt
  omega

/-- G5-CAPa (the census cap, X ≥ 3φ). For `X` in ℤ[φ] with `3φ ≤ X` (real order), every
non-constant word with normalized trace `t ≤ X` has `(k + 1) φ ≤ X`, `k` its length.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 193), slip 4
(l. 353); STATEMENTS.md row G5-CAP (l. 64), part (a).
STATEMENTS.md sha256 prefix `1fb5b03e`. -/
theorem g5_u13_cap_a (X : ZPhi) (hX : 3 * phi ≤ X) (w : List ℕ) (hw : IsWord w)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4)
    (ht : ntr w ≤ X) :
    ((w.length : ZPhi) + 1) * phi ≤ X := by
  have hX' := (g5_u13_aux_le_iff _ _).1 hX
  have ht' := (g5_u13_aux_le_iff _ _).1 ht
  rw [g5_u13_aux_le_iff]
  simp only [map_mul, map_add, map_natCast, map_one, map_ofNat, g5_u13_aux_v_phi] at hX' ⊢
  by_contra hlt
  rw [not_le] at hlt
  by_cases h2 : w.length = 2
  · rw [h2] at hlt
    push_cast at hlt
    linarith
  · exact g5_u13_aux_not_lt w hw hc h2 (lt_of_le_of_lt ht' hlt)

/-- G5-CAPb (the failure interval of the cap). If a non-constant word has normalized
trace `t ≤ X < (k + 1) φ` (real order), `k` its length, then it is a rotation of
`(1, 4)` and `3 + φ ≤ X < 3φ`.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 193), slip 4
(l. 353); STATEMENTS.md row G5-CAP (l. 64), part (b).
STATEMENTS.md sha256 prefix `1fb5b03e`. -/
theorem g5_u13_cap_b (X : ZPhi) (w : List ℕ) (hw : IsWord w)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4)
    (ht : ntr w ≤ X) (hX : X < ((w.length : ZPhi) + 1) * phi) :
    List.IsRotated w [1, 4] ∧ 3 + phi ≤ X ∧ X < 3 * phi := by
  have ht' := (g5_u13_aux_le_iff _ _).1 ht
  have hX' := g5_u13_aux_lt hX
  simp only [map_mul, map_add, map_natCast, map_one, g5_u13_aux_v_phi] at hX'
  have h2 : w.length = 2 := by
    by_contra hne
    exact g5_u13_aux_not_lt w hw hc hne (lt_of_le_of_lt ht' hX')
  rw [h2] at hX'
  push_cast at hX'
  have hX3 : X < 3 * phi := by
    apply g5_u13_aux_lt_of
    simp only [map_mul, map_ofNat, g5_u13_aux_v_phi]
    linarith
  have ht3 : ntr w < 3 * phi := by
    apply g5_u13_aux_lt_of
    simp only [map_mul, map_ofNat, g5_u13_aux_v_phi]
    linarith
  obtain ⟨hr, he⟩ := g5_u11_census_b w hw hc ht3 (by omega)
  refine ⟨hr, ?_, hX3⟩
  rw [← he]
  exact ht

/-- G5-CAPb (the converse: the cap fails on that interval). A rotation of `(1, 4)` and
any `X` with `3 + φ ≤ X < 3φ` (real order) satisfy `t ≤ X < (k + 1) φ`, `k` its length.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 193), slip 4
(l. 353), "fails … for X ∈ [3 + φ, 3φ)"; STATEMENTS.md row G5-CAP (l. 64), part (b),
"exactly". STATEMENTS.md sha256 prefix `1fb5b03e`. -/
theorem g5_u13_cap_b_conv (X : ZPhi) (w : List ℕ) (hr : List.IsRotated w [1, 4])
    (h1 : 3 + phi ≤ X) (h2 : X < 3 * phi) :
    ntr w ≤ X ∧ X < ((w.length : ZPhi) + 1) * phi := by
  have hcyc : List.cyclicPermutations [1, 4] = [[1, 4], [4, 1]] := by decide
  have hmem := List.mem_cyclicPermutations_iff.2 hr
  rw [hcyc] at hmem
  have hw2 : w = [1, 4] ∨ w = [4, 1] := by simpa using hmem
  have he : ntr w = 3 + phi := by rcases hw2 with rfl | rfl <;> decide
  have hl : w.length = 2 := by rcases hw2 with rfl | rfl <;> rfl
  have h3 : ((2 : ℕ) : ZPhi) + 1 = 3 := by norm_num
  refine ⟨by rw [he]; exact h1, ?_⟩
  rw [hl, h3]
  exact h2

end G5
