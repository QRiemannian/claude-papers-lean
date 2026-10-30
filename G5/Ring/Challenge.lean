import Mathlib

/-!
# Unit U1 (`G5/Ring`) — the ring and the blocks: statements

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Source of record: `Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, sha256 prefix `0b277844`.
Rows stated: G5-U1-R5, G5-U1-RAS, G5-U1-DET, G5-U1-GEa, G5-U1-TRACE; the definitions block
is row G5-U1-DEFS, byte for byte from its spec. G5-U1-GEb (correction track) has no statement.
Every proof here is `sorry`; the proofs live in `G5/Ring/Solution.lean`.
-/

/-- ℤ[φ] as integer pairs: `⟨x, y⟩` stands for `x + y φ`, `φ² = φ + 1`. -/
@[ext] structure ZPhi where
  x : ℤ
  y : ℤ
deriving DecidableEq

namespace ZPhi

instance instZero : Zero ZPhi := ⟨⟨0, 0⟩⟩
instance instOne : One ZPhi := ⟨⟨1, 0⟩⟩
instance instAdd : Add ZPhi := ⟨fun s t => ⟨s.x + t.x, s.y + t.y⟩⟩
instance instNeg : Neg ZPhi := ⟨fun s => ⟨-s.x, -s.y⟩⟩
instance instSub : Sub ZPhi := ⟨fun s t => ⟨s.x - t.x, s.y - t.y⟩⟩
/-- `(x, y)(u, v) = (xu + yv, xv + yu + yv)`. -/
instance instMul : Mul ZPhi :=
  ⟨fun s t => ⟨s.x * t.x + s.y * t.y, s.x * t.y + s.y * t.x + s.y * t.y⟩⟩

@[simp] lemma zero_x : (0 : ZPhi).x = 0 := rfl
@[simp] lemma zero_y : (0 : ZPhi).y = 0 := rfl
@[simp] lemma one_x : (1 : ZPhi).x = 1 := rfl
@[simp] lemma one_y : (1 : ZPhi).y = 0 := rfl
@[simp] lemma add_x (s t : ZPhi) : (s + t).x = s.x + t.x := rfl
@[simp] lemma add_y (s t : ZPhi) : (s + t).y = s.y + t.y := rfl
@[simp] lemma neg_x (s : ZPhi) : (-s).x = -s.x := rfl
@[simp] lemma neg_y (s : ZPhi) : (-s).y = -s.y := rfl
@[simp] lemma sub_x (s t : ZPhi) : (s - t).x = s.x - t.x := rfl
@[simp] lemma sub_y (s t : ZPhi) : (s - t).y = s.y - t.y := rfl
@[simp] lemma mul_x (s t : ZPhi) : (s * t).x = s.x * t.x + s.y * t.y := rfl
@[simp] lemma mul_y (s t : ZPhi) : (s * t).y = s.x * t.y + s.y * t.x + s.y * t.y := rfl

instance instCommRing : CommRing ZPhi where
  add_assoc := by intros; ext <;> simp <;> ring
  zero_add := by intros; ext <;> simp
  add_zero := by intros; ext <;> simp
  add_comm := by intros; ext <;> simp <;> ring
  mul_assoc := by intros; ext <;> simp <;> ring
  one_mul := by intros; ext <;> simp
  mul_one := by intros; ext <;> simp
  zero_mul := by intros; ext <;> simp
  mul_zero := by intros; ext <;> simp
  left_distrib := by intros; ext <;> simp <;> ring
  right_distrib := by intros; ext <;> simp <;> ring
  mul_comm := by intros; ext <;> simp <;> ring
  neg_add_cancel := by intros; ext <;> simp
  sub_eq_add_neg := by intros; ext <;> simp <;> ring
  nsmul := nsmulRec
  zsmul := zsmulRec

/-- `φ = ⟨0, 1⟩`. -/
def phi : ZPhi := ⟨0, 1⟩

/-- The φ-coefficient `y` of `x + y φ`. -/
def phiCoeff (t : ZPhi) : ℤ := t.y

/-- σ : φ ↦ 1 − φ, so `(x + y φ)^σ = (x + y) − y φ`. -/
def conj (t : ZPhi) : ZPhi := ⟨t.x + t.y, -t.y⟩

/-- The norm `N(x + y φ) = x² + x y − y²`. -/
def nrm (t : ZPhi) : ℤ := t.x ^ 2 + t.x * t.y - t.y ^ 2

/-- `a + b √5 ≥ 0` for integers `a, b`, by the exact sign test of `sign_ab5`. -/
def NonnegAB5 (a b : ℤ) : Prop :=
  (0 ≤ a ∧ 0 ≤ b) ∨ (0 < a ∧ b < 0 ∧ 5 * b ^ 2 ≤ a ^ 2) ∨
    (a < 0 ∧ 0 < b ∧ a ^ 2 ≤ 5 * b ^ 2)

instance instDecNonnegAB5 (a b : ℤ) : Decidable (NonnegAB5 a b) := by
  unfold NonnegAB5; infer_instance

/-- `x + y φ ≥ 0` as a real number: `x + y φ = (2x + y + y √5) / 2`. -/
def RealNonneg (t : ZPhi) : Prop := NonnegAB5 (2 * t.x + t.y) t.y

instance instDecRealNonneg (t : ZPhi) : Decidable (RealNonneg t) := by
  unfold RealNonneg; infer_instance

/-- The real order on ℤ[φ], decided exactly: `s ≤ t ↔ t − s ≥ 0` in ℝ. -/
instance instLE : LE ZPhi := ⟨fun s t => RealNonneg (t - s)⟩

/-- The strict real order: `s < t ↔ s ≤ t ∧ s ≠ t`. -/
instance instLT : LT ZPhi := ⟨fun s t => s ≤ t ∧ s ≠ t⟩

instance instDecLE : DecidableRel (α := ZPhi) (· ≤ ·) := fun s t =>
  inferInstanceAs (Decidable (RealNonneg (t - s)))

instance instDecLT : DecidableRel (α := ZPhi) (· < ·) := fun s t =>
  inferInstanceAs (Decidable (s ≤ t ∧ s ≠ t))

/-- ℕ[φ]: both coefficients non-negative. -/
def nonneg (t : ZPhi) : Prop := 0 ≤ t.x ∧ 0 ≤ t.y

instance instDecNonneg (t : ZPhi) : Decidable (nonneg t) := by
  unfold nonneg; infer_instance

end ZPhi

namespace G5

open ZPhi

/-- 2 × 2 matrices over ℤ[φ]. -/
abbrev M2 := Matrix (Fin 2) (Fin 2) ZPhi

/-- `S = [[0, −1], [1, 0]]`. -/
def S : M2 := !![0, -1; 1, 0]

/-- `T = [[1, φ], [0, 1]]`. -/
def T : M2 := !![1, phi; 0, 1]

/-- `R = T S`. -/
def R : M2 := T * S

/-- The four blocks `P₁ … P₄` (the Atlas's (5.19)); `1` off `{1, 2, 3, 4}`. -/
def P : ℕ → M2
  | 1 => !![1, phi; 0, 1]
  | 2 => !![phi, phi; 1, phi]
  | 3 => !![phi, 1; phi, phi]
  | 4 => !![1, 0; phi, 1]
  | _ => 1

/-- A word: a non-empty list of syllables (`k ≥ 1`), each in `{1, 2, 3, 4}`. -/
def IsWord (w : List ℕ) : Prop := w ≠ [] ∧ ∀ a ∈ w, 1 ≤ a ∧ a ≤ 4

/-- The literal word `W = R^{a₁} S ⋯ R^{a_k} S`. -/
def W (w : List ℕ) : M2 := (w.map fun a => R ^ a * S).prod

/-- The block product `P_{a₁} ⋯ P_{a_k}`. -/
def blockProd (w : List ℕ) : M2 := (w.map P).prod

/-- The normalized trace `t = tr (P_{a₁} ⋯ P_{a_k})`. -/
def ntr (w : List ℕ) : ZPhi := (blockProd w).trace

end G5

open G5 ZPhi

namespace G5

/-- G5-U1-R5. The literal fifth power of `R = T S` is `−I` (in SL, not PSL).
Locus: `phase-0/DEFINITIONS.md` §2 (l. 16).
STATEMENTS.md sha256 prefix `0b277844`. -/
theorem g5_u1_r5 : R ^ 5 = -1 := by sorry

/-- G5-U1-RAS. For `a = 1, …, 4`, `R^a S = −P_a`.
Locus: `candidates/checks/AM-1-second-head.md` §1 (l. 22, l. 28–32).
STATEMENTS.md sha256 prefix `0b277844`. -/
theorem g5_u1_ras (a : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) : R ^ a * S = -P a := by sorry

/-- G5-U1-DET. For `a = 1, …, 4`, `det P_a = 1`.
Locus: `candidates/checks/AM-1-second-head.md` §1 table (l. 23).
STATEMENTS.md sha256 prefix `0b277844`. -/
theorem g5_u1_det (a : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) : (P a).det = 1 := by sorry

/-- G5-U1-GEa. For `a = 1, …, 4`, every entry of `P_a` is in ℕ[φ] and is `≥` the
identity's entry in the real order.
Locus: AM transcript §5.1 "Pruning lemma" (l. 198), session
`2026-10-29-g5-phase-1-structure-dig`, `transcript/analytical-methods.md`.
STATEMENTS.md sha256 prefix `0b277844`. -/
theorem g5_u1_ge_a (a : ℕ) (ha : 1 ≤ a ∧ a ≤ 4) (i j : Fin 2) :
    nonneg (P a i j) ∧ (1 : M2) i j ≤ P a i j := by sorry

/-- G5-U1-TRACE. For every word (`k ≥ 1`), `t = (−1)^k · tr W`.
Locus: `phase-2/PHASE-2-DEFINITIONS.md` §1, "Theorem A" paragraph (l. 9).
STATEMENTS.md sha256 prefix `0b277844`. -/
theorem g5_u1_trace (w : List ℕ) (hw : IsWord w) :
    ntr w = (-1) ^ w.length * (W w).trace := by sorry

end G5
