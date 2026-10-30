import Mathlib
import G5.Ring.Challenge

/-!
# Unit U2 (`G5/ModTwo`) — L-1, L-2 and the mod-2 closure: statements

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Source of record: `Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, sha256 prefix `e0df0f35`.
Rows stated: G5-U2-HOM, G5-U2-D5, G5-U2-TRD5, G5-L1, G5-L2; the definitions block is
row G5-U2-MOD2 (`G5.F4`, `red2`, `F4M`, `red2M`, `Sbar`, `Tbar`, `Rbar`, `D5bar`), byte for
byte from its spec, placed as the probe places it. Every other name is unit U1's,
imported from `G5.Ring.Challenge`.
Every proof here is `sorry`; the proofs live in `G5/ModTwo/Solution.lean`.

Loci, short forms: AM = the analytical-methods transcript of
`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/`; LEDGER =
`Claude-Papers/No1-G5/candidates/LEDGER.md`.
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

/-- G5-U2-HOM. 𝔽₄ (pairs mod 2, the ℤ[φ] product) is a field with four elements.
Locus: AM §4, the L-1 proof (l. 178); gap 3 (l. 188).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u2_f4 : IsField F4 ∧ Nat.card F4 = 4 := by sorry

/-- G5-U2-HOM. Reduction mod 2 is a ring map ℤ[φ] → 𝔽₄.
Locus: AM §4, the L-1 proof (l. 178); gap 3 (l. 188).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u2_red_hom : ∃ f : ZPhi →+* F4, ∀ t : ZPhi, f t = red2 t := by sorry

/-- G5-U2-HOM. `red2 t = 0` exactly when both coordinates of `t` are even.
Locus: AM §4, the L-1 proof (l. 178).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u2_red_eq_zero (t : ZPhi) : red2 t = 0 ↔ 2 ∣ t.x ∧ 2 ∣ t.y := by sorry

/-- G5-U2-D5. S̄, T̄ involutions, R̄ = T̄S̄ of order 5, S̄R̄S̄ = R̄⁴.
Locus: AM §4 (l. 178); AM §3.1 (l. 124); LEDGER row L-1 (l. 7).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u2_d5_gens : Sbar * Sbar = 1 ∧ Sbar ≠ 1 ∧ Tbar * Tbar = 1 ∧ Tbar ≠ 1 ∧
    Rbar = Tbar * Sbar ∧ Rbar ^ 5 = 1 ∧ Rbar ≠ 1 ∧ Sbar * Rbar * Sbar = Rbar ^ 4 := by sorry

/-- G5-U2-D5. The monoid closure of {S̄, T̄} is `D5bar`, ten elements.
Locus: AM §4 (l. 178); §3.1 (l. 124); §2.3 (l. 99); §2.2 (l. 83).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u2_d5_image :
    (Submonoid.closure ({Sbar, Tbar} : Set F4M) : Set F4M) = (D5bar : Set F4M) ∧
      D5bar.card = 10 := by sorry

/-- G5-U2-TRD5. No trace 1 on `D5bar`; trace 0 on each R̄^j S̄, j < 5.
Locus: AM §4 gap 3 (l. 188); the L-1 proof (l. 178); the L-2 proof (l. 181).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u2_d5_trace :
    (∀ M ∈ D5bar, M.trace ≠ 1) ∧
      ∀ j : ℕ, j < 5 → (Rbar ^ j * Sbar).trace = 0 := by sorry

/-- G5-L1. For every word of odd length, both coordinates of tr W are even.
Locus: LEDGER row L-1 (l. 7); AM §4 "Lemma (L-1)" (l. 177, l. 178); §2.4 (l. 114).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u2_l1 (w : List ℕ) (hw : IsWord w) (hk : Odd w.length) :
    Even (W w).trace.x ∧ Even (W w).trace.y := by sorry

/-- G5-L2. No word has trace x + y φ with x odd and y even (word level).
Locus: LEDGER row L-2 (l. 8); AM §4 "Lemma (L-2)" (l. 180, l. 181); §2.4 (l. 114).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u2_l2 (w : List ℕ) (hw : IsWord w) :
    ¬ (Odd (W w).trace.x ∧ Even (W w).trace.y) := by sorry

/-- G5-L2. The "in particular" at word level: y = 0 ⟹ x even.
Locus: LEDGER row L-2 (l. 8); AM §4 "Lemma (L-2)" (l. 180, l. 181).
STATEMENTS.md sha256 prefix `e0df0f35`. -/
theorem g5_u2_l2_int (w : List ℕ) (hw : IsWord w) (h0 : (W w).trace.y = 0) :
    Even (W w).trace.x := by sorry

end G5
