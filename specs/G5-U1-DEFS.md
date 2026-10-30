# G5-U1-DEFS

## 1 · Header

row: G5-U1-DEFS
unit: U1
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 64a12aa2fe2609a5c1ad8776ec01c5584daf8f292b3b8748871e80455867d034 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, digest read 2026-10-30T09:45:42Z)
locus: `phase-0/DEFINITIONS.md` §1 (l. 7, l. 11) and §2 (l. 16); `phase-2/PHASE-2-DEFINITIONS.md` §1 (l. 7, l. 9) and §2 (l. 22); `candidates/checks/AM-1-second-head.md` "Theorem as I would print it" (l. 253, l. 255, l. 257); AM transcript §4 gaps 1 and 6 (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 186, l. 191); `phase-0/impl-a/zphi.py` `sign_ab5` (l. 72–83) and `sign5` (l. 85–88), read-only; `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §5 (l. 214) for the norm; STATEMENTS.md §0 and §2 notes 1, 2, 4, 5 (pointers); the U1 cut of STATEMENTS.md §2 note 6
spec_clock: 2026-10-30T09:59:55Z

## 2 · Printed statement, verbatim (the record's definitions)

The ring, σ and the real value:

> - The trace ring at q = 5 is ℤ[φ] = { x + yφ : x, y ∈ ℤ }. Represent an element EXACTLY as the integer pair (x, y); multiply by (x + yφ)(u + vφ) = (xu + yv) + (xv + yu + yv)φ. The nontrivial automorphism σ of ℚ(√5) sends φ ↦ 1 − φ = −1/φ, so (x + yφ)^σ = (x + y) − yφ. Real value: x + yφ with φ = 1.6180339887…; use floats ONLY to report a decimal or to order values, never inside an identity.
>
> — `Claude-Papers/No1-G5/phase-0/DEFINITIONS.md` l. 11

The literal lift and R:

> - ℍ the upper half-plane; PSL(2, ℝ) acting by Möbius maps. The trace of an element of PSL(2, ℝ) is defined up to sign. Throughout, matrices are taken LITERALLY in SL(2, ℝ) so that a product has a definite trace; "up to sign" is applied only where a quantity is stated to be so.
>
> — `Claude-Papers/No1-G5/phase-0/DEFINITIONS.md` l. 7

> - Write R = TS. In PSL(2, ℝ) the element R has order q (at q = 5: order 5; in SL(2, ℝ) the literal matrix R satisfies R⁵ = −I, so R has order 10 there — mind the sign). The group is the free product G(q) = ⟨S⟩ ∗ ⟨R⟩ ≅ ℤ/2 ∗ ℤ/q.
>
> — `Claude-Papers/No1-G5/phase-0/DEFINITIONS.md` l. 16

The generators, R and the blocks, as the second head would print them:

> **Theorem.** Let G(5) = ⟨S, T⟩ ⊂ SL(2, ℤ[φ]) with S = (0 −1; 1 0), T = (1 φ; 0 1), R = TS. Put P_a := −R^aS for a = 1, …, 4:
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 253

> P₁ = (1 φ; 0 1), P₂ = (φ φ; 1 φ), P₃ = (φ 1; φ φ), P₄ = (1 0; φ 1).
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 255

> Then for every k ≥ 1 and a₁, …, a_k ∈ {1, 2, 3, 4},
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 257

The order on ℤ[φ], exact:

> - **Order on ℤ[φ]:** exact. t ≤ X for integer X ⟺ 2X − 2x − y ≥ 0 ∧ 5y² ≤ (2X − 2x − y)² (for y ≥ 0). |t^σ| < C and the window bounds are decided by exact sign tests on a + b√5, never by floats. Floats appear only in the declared statistics (medians of logs, slopes) and are declared there.
>
> — `Claude-Papers/No1-G5/phase-2/PHASE-2-DEFINITIONS.md` l. 22

The order's sign test, as the Phase 0 library does it (`Claude-Papers/No1-G5/phase-0/impl-a/zphi.py`, l. 72–88, verbatim):

```python
def sign_ab5(a, b):
    """exact sign of a + b*sqrt(5) for integers a, b."""
    if a >= 0 and b >= 0:
        return 0 if (a == 0 and b == 0) else 1
    if a <= 0 and b <= 0:
        return -1
    # opposite signs
    aa, bb = a*a, 5*b*b
    if a > 0:            # b < 0
        return 1 if aa > bb else (-1 if aa < bb else 0)
    else:                # a < 0, b > 0
        return 1 if bb > aa else (-1 if bb < aa else 0)

def sign5(t):
    """exact sign of x + y*phi = (2x + y + y*sqrt5)/2."""
    x, y = t
    return sign_ab5(2*x + y, y)
```

The ring and the ℕ[φ] predicate as the Lean gaps name them:

> 1. **The ring.** Mathlib has `goldenRatio : ℝ` and `ℤ√d` (`Zsqrtd`), but ℤ[φ] ≠ ℤ[√5]. Extracting "the φ-coefficient y" from a subring of ℝ needs a basis and the irrationality of φ. Cleanest: define ℤ[φ] as pairs with (x, y)(u, v) = (xu + yv, xv + yu + yv), prove `CommRing`, define `phiCoeff`; the real embedding only to tie to the Atlas's G(5) ⊂ PSL(2, ℝ).
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 186

> 6. **The ℕ[φ] order.** Define `nonneg (x, y) := 0 ≤ x ∧ 0 ≤ y`, prove closure under + and ×; Theorem A then needs the path argument only in the two-path form of §3.2 (a constant path and, for {1, 4} words, one jump pair), which is an explicit lower bound on two entries — no general path combinatorics.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 191

The norm:

> N(t) = x² + xy − y²
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 214

The word population (k ≥ 1, syllables in {1, 2, 3, 4}): the second head's display above ("for every k ≥ 1 and a₁, …, a_k ∈ {1, 2, 3, 4}") and

> Every hyperbolic class has a cyclically reduced representative (a₁, …, a_k), a_i ∈ {1, 2, 3, 4}, k ≥ 1
>
> — `Claude-Papers/No1-G5/phase-2/PHASE-2-DEFINITIONS.md` l. 7

## 3 · Formal reading

- **The ring.** `ZPhi` is the structure of integer pairs `⟨x, y⟩`, read as x + yφ; addition, negation and subtraction coordinatewise; multiplication (x, y)(u, v) = (xu + yv, xv + yu + yv), the record's product (φ² = φ + 1); zero ⟨0, 0⟩, one ⟨1, 0⟩. Its `CommRing` instance carries its own proofs of the ring axioms (each by `ext` and `ring`; they elaborated in the probe, no `sorry`). Design note 1 is followed: neither `goldenRatio : ℝ` nor `Zsqrtd` is used for the coefficient ring (ℤ[φ] ≠ ℤ[√5]).
- **`phi`** = ⟨0, 1⟩; **`phiCoeff t`** = t.y, the φ-coefficient; the rational coefficient is the field `t.x`.
- **σ** (`conj`): ⟨x, y⟩ ↦ ⟨x + y, −y⟩, the record's (x + yφ)^σ = (x + y) − yφ.
- **The norm** (`nrm`): x² + xy − y² ∈ ℤ, the record's N(t) (it equals t·t^σ read as an integer; that identity is not stated in U1).
- **The exact order.** `NonnegAB5 a b` is the predicate `sign_ab5(a, b) ≥ 0` written out case by case: both coefficients non-negative; or a > 0 > b with 5b² ≤ a²; or a < 0 < b with a² ≤ 5b². (Read against `sign_ab5`: the first branch returns 0 or 1; the second returns −1 except at (0, 0), which the first branch caught; the opposite-sign branches return ≥ 0 exactly when aa ≥ bb, resp. bb ≥ aa; at a = 0 > b and at a < 0 = b no disjunct holds, as `sign_ab5` returns −1 there.) `RealNonneg t` is `NonnegAB5 (2x + y) y`, the record's `sign5` (x + yφ = (2x + y + y√5)/2). The order is the instance `LE ZPhi`: s ≤ t ⟺ `RealNonneg (t − s)`; the strict order `LT ZPhi` is s ≤ t ∧ s ≠ t (an element a + b√5 with a, b ∈ ℤ vanishes only at a = b = 0, so this is `sign5 (t − s) = 1`). Both are decidable, so concrete comparisons close by `decide`. No `Preorder` / `LinearOrder` structure is asserted in U1.
- **ℕ[φ]** (`nonneg`): 0 ≤ x ∧ 0 ≤ y (gap 6), decidable.
- **Matrices.** `M2` = `Matrix (Fin 2) (Fin 2) ZPhi`, entries written with mathlib's `!![a, b; c, d]` (`Matrix.of`). S = [[0, −1], [1, 0]], T = [[1, φ], [0, 1]], R = T * S, all LITERAL in SL(2, ℤ[φ]) (design note 2: no PSL quotient anywhere in U1).
- **The blocks.** `P a` for a = 1, 2, 3, 4 is the printed matrix P_a (the Atlas's (5.19) blocks, in the record's order); the record's DEFINITION P_a := −R^aS is the identity of G5-U1-RAS, so that identity has content. Off {1, 2, 3, 4} `P` takes the value `1` (a total-function filler, never read: every statement that uses `P` carries the hypothesis 1 ≤ a ≤ 4 or `IsWord`).
- **Words** (design note 4): a word is a `List ℕ`; `IsWord w` holds when w is non-empty (k ≥ 1, the record's population) and every syllable lies in {1, 2, 3, 4}. k is `w.length`. `W w` is the literal product R^{a₁}S ⋯ R^{a_k}S (`List.prod` of the mapped list, left to right, a₁ first); `blockProd w` is P_{a₁} ⋯ P_{a_k}; `ntr w` is the normalized trace t = tr(P_{a₁} ⋯ P_{a_k}) (`Matrix.trace`).
- **Not in U1** (each later unit defines what it alone needs): the finite images mod 2, 3, 4 (U2, U6); |t| and |t^σ| (U4); rotations, constant words, the hyperbolic predicate y ≥ 1 (U3–U5); the subgroup ⟨S, T⟩ and conjugacy (U7); a real embedding ZPhi → ℝ (none is defined; the order above is exact and needs none).

## 4 · Target mathlib declarations (classifier of record at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`)

```
CommRing	FOUND _root_ Mathlib/Algebra/Ring/Defs.lean:415
Matrix	FOUND _root_ Mathlib/LinearAlgebra/Matrix/Defs.lean:57
Matrix.of	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Defs.lean:88
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
Matrix.det	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:60
zsmulRec	FOUND _root_ Mathlib/Algebra/Group/Defs.lean:891
List.prod	NOT FOUND
nsmulRec	NOT FOUND
goldenRatio	FOUND Real Mathlib/NumberTheory/Real/GoldenRatio.lean:37
Zsqrtd	FOUND _root_ Mathlib/NumberTheory/Zsqrtd/Basic.lean:33
```

Notes: `List.prod` and `nsmulRec` read NOT FOUND because they are declared in Lean core, not mathlib, at the pinned toolchain `leanprover/lean4:v4.33.0`: `List.prod` at `Init/Data/List/Basic.lean:2083` (`def prod {α} [Mul α] [One α] : List α → α`), `nsmulRec` at `Init/Data/Zero.lean:51`; both resolved in the probe. `goldenRatio` (namespace `Real`) and `Zsqrtd` exist at the pin and are deliberately NOT used (design note 1). Notation `!![…]` is mathlib's `Matrix.of` notation.

## 5 · Intended Lean statement

In prose: the definitions every later unit imports — the pair ring ℤ[φ] with its `CommRing` instance, φ, the φ-coefficient, σ, the norm, the exact real order (≤, <) by the sign of a + b√5 as `sign_ab5` decides it, the ℕ[φ] predicate; the 2 × 2 matrices over it; S, T, R = TS; the four blocks P₁ … P₄; words over {1, 2, 3, 4} (k ≥ 1); the literal word W, the block product, the normalized trace. No theorem is stated here; the `simp` lemmas `zero_x … mul_y` are definitional (`rfl`) companions of the instance. Statements in U1–U7 are read after the closing `open G5 ZPhi`.

Probe: `<scratchpad>/M-U1/probe.lean` (sha256 recorded in `_UNIT-U1.md`), run 3 of 3, exit 0, no error; the text below is the probe's text byte for byte.

```lean
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
```

## 6 · What the row does not claim

- No theorem: the row fixes names and conventions only; the identities about them are the rows G5-U1-R5, -RAS, -DET, -GEa, -TRACE (and the stopped -GEb).
- No claim that `≤` is a total or even a partial order on `ZPhi` (true, but not stated in U1); no claim that `nrm t` equals the constant coefficient of t · conj t; no tie to ℝ (no embedding is defined); nothing about PSL(2, ℝ), the group G(5) as a subgroup, conjugacy classes or the normal form (U7).
- `P` off {1, 2, 3, 4} is a filler value and carries no reading.

## 7 · Status

SPEC-DRAFT 2026-10-30T09:59:55Z

V1: V1-GREEN 2026-10-30T10:10:55Z — every §2 quote matches its source line verbatim (script over all eleven cites) and the python block is byte-identical to `zphi.py` l. 72–88. Conventions confirmed: ℤ[φ] as pairs with the record's product (DEFINITIONS §1 l. 11, AM gap 1), σ = ⟨x + y, −y⟩, N = x² + xy − y² (SH-P2-1 l. 214; N(3 + φ) = 11 as G5-B uses it), `nonneg` = gap 6. `NonnegAB5` equals `sign_ab5(a, b) ≥ 0` and the true sign of a + b√5 on every (a, b) with |a|, |b| ≤ 60 (0 mismatches), including a = 0 > b and a < 0 = b (both false, `sign_ab5` = −1 there); `RealNonneg` equals `sign5 ≥ 0` and the real sign of x + yφ (0 mismatches); s < t equals `sign5(t − s) = 1`; for integer X the order reproduces PHASE-2-DEFINITIONS l. 22's test. Literal SL matrices, S, T as printed, R = T * S, `!![…]` row-major, `W` left to right (a₁ first), `ntr` = STATEMENTS.md §0's t. I freeze the filler `P a = 1` off {1, …, 4} (never read; every later statement must carry 1 ≤ a ≤ 4 or `IsWord`, which each later V₁ checks, since the filler makes an unguarded ≥ I or det statement silently true off range) and the non-empty `IsWord` (the record's k ≥ 1: AM-1-second-head l. 257, PHASE-2-DEFINITIONS l. 7). Names: no U1 name collides with a root declaration or an `export` at the pin (`tools/ledger_names.py` plus an export sweep; see `_V1-U1.md`). Parse: 0 Lean line(s) over 100 code points
