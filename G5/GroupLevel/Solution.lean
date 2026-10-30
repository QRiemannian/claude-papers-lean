import Mathlib
import G5.Ring.Solution
import G5.Group.Solution
import G5.ModTwo.Solution
import G5.Congruence.Solution

/-!
# Unit U8 (`G5/GroupLevel`) — the group-level legs of G5-L2, G5-M4, G5-M3: proofs

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
The statements are `G5/GroupLevel/Challenge.lean` (sha256 prefix `bf7316f7`), byte for byte,
with proofs; this module does not import it. U8 defines nothing; it imports the PROVED
preludes `G5.Ring.Solution` (U1), `G5.Group.Solution` (U7: `HeckeGrp`, `IsNF`, `g5_u7_nf`),
`G5.ModTwo.Solution` (U2: `g5_u2_l2`) and `G5.Congruence.Solution` (U6: `red4`, `H4`,
`g5_u6_m4b`, `g5_u6_m3b`).
Method. ELL: four-entry computations by `decide` after `Matrix.trace_fin_two`. L2G / M4G /
M3G: the trace is a conjugation invariant, so `g5_u7_nf` reduces each law to the forms
`±I`, `±S`, `±R^a`, `±W w`; each law is sign-symmetric (`Matrix.trace_neg`), the finite forms
are ELL's values checked by `decide`, and the word forms are the word legs of the same law.
-/

open G5 ZPhi

namespace G5

/-! ### Helpers -/

/-- Helper: the trace is a conjugation invariant. -/
private theorem g5_u8_aux_tr_conj (h g : M2ˣ) :
    ((h * g * h⁻¹ : M2ˣ) : M2).trace = (g : M2).trace := by
  rw [Units.val_mul, Units.val_mul, Matrix.trace_mul_cycle, Units.inv_mul, one_mul]

/-- Helper: a sign-symmetric trace law that holds on `I`, `S`, `R^a` and every literal word
holds on every element of `⟨S, T⟩` (from the normal form `g5_u7_nf`). -/
private theorem g5_u8_aux_main (Q : ZPhi → Prop) (hneg : ∀ t, Q t → Q (-t))
    (hI : Q (1 : M2).trace) (hS : Q S.trace) (hR : ∀ a : ℕ, 1 ≤ a ∧ a ≤ 4 → Q (R ^ a).trace)
    (hW : ∀ w : List ℕ, IsWord w → Q (W w).trace) (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    Q (g : M2).trace := by
  obtain ⟨h, -, hn⟩ := g5_u7_nf g hg
  rw [← g5_u8_aux_tr_conj h g]
  generalize ((h * g * h⁻¹ : M2ˣ) : M2) = n at hn
  rcases hn with rfl | rfl | rfl | rfl | ⟨a, ha, rfl | rfl⟩ | ⟨w, hw, rfl | rfl⟩
  · exact hI
  · rw [Matrix.trace_neg]; exact hneg _ hI
  · exact hS
  · rw [Matrix.trace_neg]; exact hneg _ hS
  · exact hR a ha
  · rw [Matrix.trace_neg]; exact hneg _ (hR a ha)
  · exact hW w hw
  · rw [Matrix.trace_neg]; exact hneg _ (hW w hw)

/-- Helper: the traces of the finite forms, one value per exponent. -/
private theorem g5_u8_aux_trR (a : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) :
    (R ^ a).trace = (⟨0, 1⟩ : ZPhi) ∨ (R ^ a).trace = (⟨-1, 1⟩ : ZPhi) ∨
      (R ^ a).trace = (⟨1, -1⟩ : ZPhi) ∨ (R ^ a).trace = (⟨0, -1⟩ : ZPhi) := by
  obtain ⟨h1, h4⟩ := ha
  rw [Matrix.trace_fin_two]
  interval_cases a <;> decide

/-- Helper: `red4` commutes with negation. -/
private theorem g5_u8_aux_red4_neg (t : ZPhi) : red4 (-t) = -red4 t := by
  simp [red4, Int.cast_neg]

/-- Helper: `H₄` is closed under negation. -/
private theorem g5_u8_aux_H4_neg : ∀ p ∈ H4, -p ∈ H4 := by
  decide

/-- G5-U8-ELL. The traces of the non-word forms: `tr I = 2`, `tr S = 0`, and `tr R^a`
for `a = 1, 2, 3, 4` is `φ`, `φ − 1`, `1 − φ`, `−φ` (pairs `⟨x, y⟩ = x + y φ`).
Locus: `candidates/checks/AM-1-second-head.md` §1 table (l. 21, l. 26) and §4 (l. 73–76).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u8_ell :
    (1 : M2).trace = (⟨2, 0⟩ : ZPhi) ∧ S.trace = 0 ∧
      (R ^ 1).trace = (⟨0, 1⟩ : ZPhi) ∧ (R ^ 2).trace = (⟨-1, 1⟩ : ZPhi) ∧
      (R ^ 3).trace = (⟨1, -1⟩ : ZPhi) ∧ (R ^ 4).trace = (⟨0, -1⟩ : ZPhi) := by
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_⟩ <;> rw [Matrix.trace_fin_two] <;> decide

/-- G5-U8-L2G. No element of `⟨S, T⟩` has trace `x + y φ` with `x` odd and `y` even.
Locus: LEDGER row L-2 (l. 8); AM §4 "Lemma (L-2)" (l. 180, l. 181); AM §3.2 (l. 130);
`candidates/checks/AM-1-second-head.md` §4 (l. 72). STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u8_l2g (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    ¬ (Odd (g : M2).trace.x ∧ Even (g : M2).trace.y) := by
  refine g5_u8_aux_main (fun t => ¬ (Odd t.x ∧ Even t.y)) ?_ ?_ ?_ ?_ ?_ g hg
  · intro t ht h
    simp only [neg_x, neg_y, odd_neg, even_neg] at h
    exact ht h
  · rw [(g5_u8_ell).1]; decide
  · rw [(g5_u8_ell).2.1]; decide
  · intro a ha
    rcases g5_u8_aux_trR a ha with e | e | e | e <;> rw [e] <;> decide
  · exact g5_u2_l2

/-- G5-U8-M4G. The trace of every element of `⟨S, T⟩` lies in `H₄` mod 4.
Locus: DO §3.2 (l. 118–120) and §10 D-2 (l. 246); AM §2.3 (l. 95);
PHASE-2-DEFINITIONS §1 (l. 15). STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u8_m4g (g : M2ˣ) (hg : g ∈ HeckeGrp) : red4 (g : M2).trace ∈ H4 := by
  refine g5_u8_aux_main (fun t => red4 t ∈ H4) ?_ ?_ ?_ ?_ ?_ g hg
  · intro t ht
    show red4 (-t) ∈ H4
    rw [g5_u8_aux_red4_neg]
    exact g5_u8_aux_H4_neg _ ht
  · rw [(g5_u8_ell).1]; decide
  · rw [(g5_u8_ell).2.1]; decide
  · intro a ha
    rcases g5_u8_aux_trR a ha with e | e | e | e <;> rw [e] <;> decide
  · exact g5_u6_m4b

/-- G5-U8-M3G. No element of `⟨S, T⟩` has trace with `x ≡ y ≢ 0 (mod 3)`.
Locus: LEDGER row AM-5 (l. 17); AM §2.3 (l. 95), §2.4 (l. 116); DO §3.2 (l. 116, l. 121)
and §10 D-2 (l. 246). STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u8_m3g (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    ¬ ((g : M2).trace.x ≡ (g : M2).trace.y [ZMOD 3] ∧
      ¬ ((g : M2).trace.x ≡ 0 [ZMOD 3])) := by
  refine g5_u8_aux_main
    (fun t => ¬ (t.x ≡ t.y [ZMOD 3] ∧ ¬ (t.x ≡ 0 [ZMOD 3]))) ?_ ?_ ?_ ?_ ?_ g hg
  · intro t ht ⟨h1, h2⟩
    simp only [neg_x, neg_y] at h1 h2
    refine ht ⟨by simpa using h1.neg, fun h0 => h2 ?_⟩
    simpa using h0.neg
  · rw [(g5_u8_ell).1]; decide
  · rw [(g5_u8_ell).2.1]; decide
  · intro a ha
    rcases g5_u8_aux_trR a ha with e | e | e | e <;> rw [e] <;> decide
  · exact g5_u6_m3b

end G5
