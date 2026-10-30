import Mathlib
import G5.Ring.Solution
import G5.Ladder.Solution
import G5.Census.Solution
import G5.CensusCap.Solution

/-!
# Unit U15 (`G5/CensusSearch`) — Cor. 5.11's cap and search family (row G5-SRCH): proofs

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Statements: `G5/CensusSearch/Challenge.lean` (sha256 prefix `c17de521`), four theorems under the
same names and statement texts, byte for byte. This module does not import the Challenge: it
imports the proved preludes `G5.Ring.Solution`, `G5.Ladder.Solution`, `G5.Census.Solution`,
`G5.CensusCap.Solution` and restates the unit's one definition `Visited` byte for byte.
Method: the real order on ℤ[φ] is read through the ring map `x + y φ ↦ x + y φ ∈ ℝ` (U13's
device, restated privately here). (cap) For `3φ ≤ X` it is U13's `g5_u13_cap_a`; for `X < 3φ`,
`t < 4φ` and U11's `g5_u11_census_a` at `K = 2` gives `k ≤ 2`. (visit) Appending a syllable
does not lower the normalized trace (U5's `g5_u5_mono_a` with an empty right factor), so every
prefix has `t ≤` the whole list's; `t` is a rotation invariant and a rotation keeps the length,
so the cap carries down to every prefix. (const) `P₁^j` and `P₄^j` are unipotent, trace 2.
(inf) The lists `1^(n+1)` are distinct and each prefix is again `1^i`, trace `2 ≤ X`.
-/

open G5 ZPhi

namespace G5

/-! ### Helpers (private, `g5_u15_aux_*`): the real order through the ring map to ℝ (U13's
device), the block product on lists, prefix dominance, the constant words -/

/-- Helper: the real value `x + y φ` of an element of ℤ[φ], as a ring map to ℝ. -/
private noncomputable def g5_u15_aux_v : ZPhi →+* ℝ where
  toFun t := t.x + t.y * Real.goldenRatio
  map_one' := by simp
  map_mul' s t := by
    simp only [mul_x, mul_y]; push_cast
    linear_combination (-(s.y : ℝ) * t.y) * Real.goldenRatio_sq
  map_zero' := by simp
  map_add' s t := by simp only [add_x, add_y]; push_cast; ring

private theorem g5_u15_aux_v_apply (t : ZPhi) :
    g5_u15_aux_v t = t.x + t.y * Real.goldenRatio := rfl

private theorem g5_u15_aux_v_phi : g5_u15_aux_v phi = Real.goldenRatio := by
  simp [g5_u15_aux_v_apply, phi]

private theorem g5_u15_aux_ab5 (a b : ℤ) :
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
private theorem g5_u15_aux_le_iff (s t : ZPhi) : s ≤ t ↔ g5_u15_aux_v s ≤ g5_u15_aux_v t := by
  change RealNonneg (t - s) ↔ _
  unfold RealNonneg
  rw [g5_u15_aux_ab5, g5_u15_aux_v_apply, g5_u15_aux_v_apply]
  simp only [sub_x, sub_y]
  have hg : Real.goldenRatio = (1 + Real.sqrt 5) / 2 := rfl
  rw [hg]; push_cast
  constructor <;> intro h <;> linarith

private theorem g5_u15_aux_v_inj {s t : ZPhi} (h : g5_u15_aux_v s = g5_u15_aux_v t) : s = t := by
  rw [g5_u15_aux_v_apply, g5_u15_aux_v_apply] at h
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
private theorem g5_u15_aux_lt {s t : ZPhi} (h : s < t) : g5_u15_aux_v s < g5_u15_aux_v t :=
  lt_of_le_of_ne ((g5_u15_aux_le_iff s t).1 h.1) (fun e => h.2 (g5_u15_aux_v_inj e))
/-- Helper: the strict order of the real values gives the strict real order. -/
private theorem g5_u15_aux_lt_of {s t : ZPhi} (h : g5_u15_aux_v s < g5_u15_aux_v t) :
    s < t :=
  ⟨(g5_u15_aux_le_iff s t).2 h.le, fun e => by rw [e] at h; exact lt_irrefl _ h⟩

/-- Helper: transitivity of the real order on ℤ[φ]. -/
private theorem g5_u15_aux_le_trans {r s t : ZPhi} (h1 : r ≤ s) (h2 : s ≤ t) : r ≤ t :=
  (g5_u15_aux_le_iff _ _).2 (((g5_u15_aux_le_iff _ _).1 h1).trans ((g5_u15_aux_le_iff _ _).1 h2))

private theorem g5_u15_aux_bp_nil : blockProd [] = 1 := by simp [blockProd]

private theorem g5_u15_aux_bp_cons (a : ℕ) (l : List ℕ) :
    blockProd (a :: l) = P a * blockProd l := by simp [blockProd]

private theorem g5_u15_aux_bp_append (l₁ l₂ : List ℕ) :
    blockProd (l₁ ++ l₂) = blockProd l₁ * blockProd l₂ := by
  simp [blockProd, List.prod_append]

private theorem g5_u15_aux_bp_single (a : ℕ) : blockProd [a] = P a := by simp [blockProd]

/-- Helper: the normalized trace is a rotation invariant (U5's argument). -/
private theorem g5_u15_aux_ntr_rot {w v : List ℕ} (h : List.IsRotated w v) : ntr v = ntr w := by
  obtain ⟨n, rfl⟩ := h
  unfold ntr
  rw [List.rotate_eq_drop_append_take_mod, g5_u15_aux_bp_append, Matrix.trace_mul_comm,
    ← g5_u15_aux_bp_append, List.take_append_drop]

/-- Helper: appending one syllable does not lower the normalized trace (U5's `mono_a`). -/
private theorem g5_u15_aux_snoc (u : List ℕ) (hu : ∀ b ∈ u, 1 ≤ b ∧ b ≤ 4) (a : ℕ)
    (ha : 1 ≤ a ∧ a ≤ 4) : ntr u ≤ ntr (u ++ [a]) := by
  have h := g5_u5_mono_a u [] hu (by simp) a ha
  unfold ntr
  rw [g5_u15_aux_bp_append, g5_u15_aux_bp_single]
  simpa [g5_u15_aux_bp_nil] using h

/-- Helper: a list's normalized trace dominates that of each of its prefixes. -/
private theorem g5_u15_aux_pref : ∀ (s u : List ℕ), (∀ b ∈ u, 1 ≤ b ∧ b ≤ 4) →
    (∀ b ∈ s, 1 ≤ b ∧ b ≤ 4) → ntr u ≤ ntr (u ++ s)
  | [], u, _, _ => by rw [List.append_nil]; exact (g5_u15_aux_le_iff _ _).2 le_rfl
  | a :: s, u, hu, hs => by
    have h1 := g5_u15_aux_snoc u hu a (hs a (by simp))
    have h2 := g5_u15_aux_pref s (u ++ [a])
      (fun b hb => by
        rcases List.mem_append.1 hb with hb | hb
        · exact hu b hb
        · exact hs b (by simp at hb; simp [hb]))
      (fun b hb => hs b (by simp [hb]))
    rw [List.append_assoc, List.singleton_append] at h2
    exact g5_u15_aux_le_trans h1 h2

/-- Helper: `P₁^j` is unipotent. -/
private theorem g5_u15_aux_bp_rep1 :
    ∀ j : ℕ, blockProd (List.replicate j 1) = !![1, (j : ZPhi) * phi; 0, 1]
  | 0 => by
    rw [List.replicate_zero, g5_u15_aux_bp_nil]
    refine Matrix.ext fun i k => ?_
    fin_cases i <;> fin_cases k <;> simp
  | j + 1 => by
    rw [List.replicate_succ, g5_u15_aux_bp_cons, g5_u15_aux_bp_rep1 j]
    refine Matrix.ext fun i k => ?_
    fin_cases i <;> fin_cases k <;> simp [P, Matrix.mul_apply, Fin.sum_univ_two]
    ring

/-- Helper: `P₄^j` is unipotent. -/
private theorem g5_u15_aux_bp_rep4 :
    ∀ j : ℕ, blockProd (List.replicate j 4) = !![1, 0; (j : ZPhi) * phi, 1]
  | 0 => by
    rw [List.replicate_zero, g5_u15_aux_bp_nil]
    refine Matrix.ext fun i k => ?_
    fin_cases i <;> fin_cases k <;> simp
  | j + 1 => by
    rw [List.replicate_succ, g5_u15_aux_bp_cons, g5_u15_aux_bp_rep4 j]
    refine Matrix.ext fun i k => ?_
    fin_cases i <;> fin_cases k <;> simp [P, Matrix.mul_apply, Fin.sum_univ_two]
    ring

/-- G5-SRCHa (Cor. 5.11, the all-X cap). For every `X` in ℤ[φ], every non-constant word
with normalized trace `t ≤ X` (real order) has `k ≤ 2` or `(k + 1) φ ≤ X`, `k` its length
— the cap `k ≤ max(2, ⌊X/φ⌋ − 1)`, floor-free.
Locus: `phase-2/impl-a/README.md` §3 (l. 99–101), §1 (c) (l. 52); STATEMENTS.md row
G5-SRCH (l. 73), clause (i). STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u15_srch_cap (X : ZPhi) (w : List ℕ) (hw : IsWord w)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4)
    (ht : ntr w ≤ X) :
    w.length ≤ 2 ∨ ((w.length : ZPhi) + 1) * phi ≤ X := by
  by_cases h3 : 3 * phi ≤ X
  · exact Or.inr (g5_u13_cap_a X h3 w hw hc ht)
  · left
    have hX := (not_congr (g5_u15_aux_le_iff _ _)).1 h3
    rw [not_le] at hX
    have ht' := (g5_u15_aux_le_iff _ _).1 ht
    have h4 : ntr w < (((2 : ℕ) : ZPhi) + 2) * phi := by
      apply g5_u15_aux_lt_of
      simp only [map_mul, map_add, map_natCast, map_ofNat, g5_u15_aux_v_phi] at hX ⊢
      have := Real.goldenRatio_pos
      push_cast
      linarith
    exact g5_u11_census_a 2 (Or.inr le_rfl) w hw hc h4

/-- G5-SRCH, the one definition: the pruned search's visited set at the bound `X`. A list
is visited when every non-empty prefix passes both rules of the search: normalized trace
`≤ X`, and length `k` within the cap of G5-SRCHa (`k ≤ 2` or `(k + 1) φ ≤ X`, real order).
Locus: `phase-2/impl-a/README.md` §3 (l. 99–101);
`candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 189, l. 192);
STATEMENTS.md row G5-SRCH (l. 73), clause (ii). STATEMENTS.md sha256 prefix `4a53d9ba`. -/
def Visited (X : ZPhi) (v : List ℕ) : Prop :=
  ∀ p : List ℕ, p <+: v → p ≠ [] →
    ntr p ≤ X ∧ (p.length ≤ 2 ∨ ((p.length : ZPhi) + 1) * phi ≤ X)

/-- G5-SRCHb (Cor. 5.11, the search visits every class). For every `X` in ℤ[φ] and every
non-constant word with normalized trace `t ≤ X` (real order), every rotation of the word
is visited: each of its non-empty prefixes has trace `≤ X` and length within the cap.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 189, l. 192),
slip 3 (l. 352); STATEMENTS.md row G5-SRCH (l. 73), clause (ii).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u15_srch_visit (X : ZPhi) (w : List ℕ) (hw : IsWord w)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4)
    (ht : ntr w ≤ X) (v : List ℕ) (hv : List.IsRotated w v) :
    Visited X v := by
  intro p hp _
  have hlen : w.length = v.length := hv.perm.length_eq
  have hvw : ∀ b ∈ v, 1 ≤ b ∧ b ≤ 4 := fun b hb => hw.2 b (hv.perm.mem_iff.2 hb)
  have htv : ntr v = ntr w := g5_u15_aux_ntr_rot hv
  obtain ⟨s, rfl⟩ := hp
  have hpv : ntr p ≤ ntr (p ++ s) :=
    g5_u15_aux_pref s p (fun b hb => hvw b (by simp [hb])) (fun b hb => hvw b (by simp [hb]))
  rw [htv] at hpv
  refine ⟨g5_u15_aux_le_trans hpv ht, ?_⟩
  have hpl : p.length ≤ w.length := by rw [hlen, List.length_append]; omega
  rcases g5_u15_srch_cap X w hw hc ht with h2 | h3
  · exact Or.inl (by omega)
  · right
    refine g5_u15_aux_le_trans ?_ h3
    rw [g5_u15_aux_le_iff]
    simp only [map_mul, map_add, map_natCast, map_one, g5_u15_aux_v_phi]
    have hc' : (p.length : ℝ) ≤ w.length := by exact_mod_cast hpl
    exact mul_le_mul_of_nonneg_right (by linarith) Real.goldenRatio_pos.le

/-- G5-SRCHc (Cor. 5.11, the cap is needed to end: the family). For every `j ≥ 1` the
constant words `1^j` and `4^j` have normalized trace `2`.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 191), slip 3
(l. 352); STATEMENTS.md row G5-SRCH (l. 73), clause (iii).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u15_srch_const (j : ℕ) (hj : 1 ≤ j) :
    ntr (List.replicate j 1) = 2 ∧ ntr (List.replicate j 4) = 2 := by
  refine ⟨?_, ?_⟩
  · rw [ntr, g5_u15_aux_bp_rep1, Matrix.trace_fin_two]
    simp only [Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.empty_val', Matrix.cons_val_fin_one]
    exact one_add_one_eq_two
  · rw [ntr, g5_u15_aux_bp_rep4, Matrix.trace_fin_two]
    simp only [Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.empty_val', Matrix.cons_val_fin_one]
    exact one_add_one_eq_two

/-- G5-SRCHc (Cor. 5.11, the cap is needed to end). For every `X` in ℤ[φ] with `2 ≤ X`
(real order), infinitely many words pass the trace rule alone: every non-empty prefix has
normalized trace `≤ X`.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 191, l. 192),
slip 3 (l. 352); STATEMENTS.md row G5-SRCH (l. 73), clause (iii).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u15_srch_inf (X : ZPhi) (hX : 2 ≤ X) :
    Set.Infinite
      {v : List ℕ | IsWord v ∧ ∀ p : List ℕ, p <+: v → p ≠ [] → ntr p ≤ X} := by
  have hmem : ∀ n : ℕ, List.replicate (n + 1) 1 ∈
      {v : List ℕ | IsWord v ∧ ∀ p : List ℕ, p <+: v → p ≠ [] → ntr p ≤ X} := by
    intro n
    refine ⟨⟨by simp, fun b hb => by rw [List.eq_of_mem_replicate hb]; omega⟩, ?_⟩
    intro p hp hne
    have hp1 : p = List.replicate p.length 1 :=
      List.eq_replicate_iff.2 ⟨rfl, fun b hb => List.eq_of_mem_replicate (hp.subset hb)⟩
    have hl : 1 ≤ p.length := by
      rcases p with _ | ⟨c, p⟩
      · exact absurd rfl hne
      · simp
    rw [hp1, (g5_u15_srch_const p.length hl).1]
    exact hX
  refine Set.infinite_of_injective_forall_mem (f := fun n : ℕ => List.replicate (n + 1) 1)
    (fun a b h => ?_) hmem
  simpa using congrArg List.length h

end G5
