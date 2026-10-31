import Mathlib
import G5.Ring.Solution
import G5.Group.Solution
import G5.Containment.Solution

/-!
# Unit U18 (`G5/EveryRung`) — Cor. 3.6′, every rung of the golden ladder (row G5-RUNG):
proofs

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Statements: `G5/EveryRung/Challenge.lean` (sha256 prefix `5bccdfeb`), the two definitions and
three theorems under the same names and texts, byte for byte. This module imports the proved
preludes `G5.Ring.Solution`, `G5.Group.Solution` and `G5.Containment.Solution` (the prelude rule
for dependent units) and restates the unit's two definitions `fibZ`, `lucasZ` byte for byte.
Method (`phase-4/proofs/RUNG/COROLLARY-RUNG.md` §3, §5): unit U10's containment `g5_u10_cor`
puts every trace at one of seven pairs or at `±⟨x, y⟩` with `x ≥ 0`, `y ≥ 1`, which reads as a
shape on the coordinates. RUNGa: `⟨±L_n, 0⟩` has `y = 0` and `L_n ≥ 3`; RUNGb: `±⟨−F_n, 2F_n⟩`
has `|y| ≥ 2` and the sign that makes `y` positive makes `x` negative. RUNGc: `φ⁻¹ = ⟨−1, 1⟩`
(`Ring.inverse_unit`), `φ^(m+1) = ⟨F_m, F_{m+1}⟩` and
`(φ⁻¹)^(m+1) = ⟨(−1)^(m+1) F_{m+2}, (−1)^m F_{m+1}⟩` by induction, `L_{m+1} = F_m + F_{m+2}`,
so `φⁿ + φ⁻ⁿ` is RUNGa's pair at even `n` and RUNGb's at odd `n` (Lemma R.1).
-/

open G5 ZPhi

namespace G5

/-- U18's first definition (row G5-RUNG): the Fibonacci numbers as integers, `F₀ = 0`,
`F₁ = 1`, `F_{n+2} = F_{n+1} + F_n`.
Locus: `phase-4/proofs/RUNG/COROLLARY-RUNG.md` §2 (C-5) (l. 25); the print
`phase-4/draft/S3-theorem-a.md` l. 96. STATEMENTS.md sha256 prefix `9ebf3004`. -/
def fibZ : ℕ → ℤ
  | 0 => 0
  | 1 => 1
  | n + 2 => fibZ (n + 1) + fibZ n

/-- U18's second definition (row G5-RUNG): the Lucas numbers as integers, `L₀ = 2`,
`L₁ = 1`, `L_{n+2} = L_{n+1} + L_n` — the record's `L_n := F_{n−1} + F_{n+1}`, `F₋₁ = 1`.
Locus: `phase-4/proofs/RUNG/COROLLARY-RUNG.md` §2 (C-5) (l. 25); the print
`phase-4/draft/S3-theorem-a.md` l. 271. STATEMENTS.md sha256 prefix `9ebf3004`. -/
def lucasZ : ℕ → ℤ
  | 0 => 2
  | 1 => 1
  | n + 2 => lucasZ (n + 1) + lucasZ n

/-- Helper: `F_{n+1} ≥ 1` and `F_{n+2} ≥ 1`. -/
private theorem g5_u18_aux_fib_pos (n : ℕ) : 1 ≤ fibZ (n + 1) ∧ 1 ≤ fibZ (n + 2) := by
  induction n with
  | zero => exact ⟨le_refl _, le_refl _⟩
  | succ n ih =>
    have e : fibZ (n + 1 + 2) = fibZ (n + 2) + fibZ (n + 1) := rfl
    refine ⟨ih.2, ?_⟩
    rw [e]
    omega

/-- Helper: `L_{n+1} ≥ 1` and `L_{n+2} ≥ 3`. -/
private theorem g5_u18_aux_lucas_pos (n : ℕ) : 1 ≤ lucasZ (n + 1) ∧ 3 ≤ lucasZ (n + 2) := by
  induction n with
  | zero => exact ⟨le_refl _, le_refl _⟩
  | succ n ih =>
    have e : lucasZ (n + 1 + 2) = lucasZ (n + 2) + lucasZ (n + 1) := rfl
    refine ⟨(by norm_num : (1 : ℤ) ≤ 3).trans ih.2, ?_⟩
    rw [e]
    omega

/-- Helper: `L_{n+1} = F_n + F_{n+2}` (the record's `L_n = F_{n−1} + F_{n+1}`). -/
private theorem g5_u18_aux_lucas_fib (n : ℕ) :
    lucasZ (n + 1) = fibZ n + fibZ (n + 2) ∧ lucasZ (n + 2) = fibZ (n + 1) + fibZ (n + 3) := by
  induction n with
  | zero => exact ⟨rfl, rfl⟩
  | succ n ih =>
    have e1 : lucasZ (n + 1 + 2) = lucasZ (n + 2) + lucasZ (n + 1) := rfl
    have e2 : fibZ (n + 1 + 3) = fibZ (n + 3) + fibZ (n + 2) := rfl
    have e3 : fibZ (n + 3) = fibZ (n + 2) + fibZ (n + 1) := rfl
    have e4 : fibZ (n + 2) = fibZ (n + 1) + fibZ n := rfl
    refine ⟨ih.2, ?_⟩
    rw [e1, e2, ih.1, ih.2, e3, e4]
    ring

/-- Helper: the coordinates of every trace of `⟨S, T⟩`, read from unit U10's containment:
one of the seven listed pairs, or `±⟨x, y⟩` with `x ≥ 0`, `y ≥ 1`. -/
private theorem g5_u18_aux_shape (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    ∃ x y : ℤ, (g : M2).trace = (⟨x, y⟩ : ZPhi) ∧
      ((y = 0 ∧ (x = 2 ∨ x = -2 ∨ x = 0)) ∨ y = 1 ∨ y = -1 ∨
        (0 ≤ x ∧ 1 ≤ y) ∨ (x ≤ 0 ∧ y ≤ -1)) := by
  rcases g5_u10_cor g hg with h | ⟨x, y, hx, hy, h | h⟩
  · rcases h with h | h | h | h | h | h | h
    · exact ⟨2, 0, h, by omega⟩
    · exact ⟨-2, 0, h, by omega⟩
    · refine ⟨0, 0, h.trans ?_, by omega⟩
      ext <;> simp
    · exact ⟨0, 1, h, by omega⟩
    · exact ⟨0, -1, h, by omega⟩
    · exact ⟨-1, 1, h, by omega⟩
    · exact ⟨1, -1, h, by omega⟩
  · exact ⟨x, y, h, by omega⟩
  · refine ⟨-x, -y, h.trans ?_, by omega⟩
    ext <;> simp

/-- Helper: the unit `φ` of ℤ[φ], with inverse `⟨−1, 1⟩ = φ − 1`. -/
private def g5_u18_aux_uphi : ZPhiˣ := ⟨phi, ⟨-1, 1⟩, by decide, by decide⟩

/-- Helper: `φ⁻¹ = ⟨−1, 1⟩` (`Ring.inverse` of the unit `φ`). -/
private theorem g5_u18_aux_inv : Ring.inverse phi = (⟨-1, 1⟩ : ZPhi) :=
  Ring.inverse_unit g5_u18_aux_uphi

/-- Helper (Lemma R.1 (a)): `φ^(n+1) = ⟨F_n, F_{n+1}⟩`. -/
private theorem g5_u18_aux_phi_pow (n : ℕ) : phi ^ (n + 1) = (⟨fibZ n, fibZ (n + 1)⟩ : ZPhi) := by
  induction n with
  | zero => rw [zero_add, pow_one]; rfl
  | succ n ih =>
    have e : fibZ (n + 1 + 1) = fibZ (n + 1) + fibZ n := rfl
    rw [pow_succ, ih, e]
    ext <;> simp [phi]
    ring

/-- Helper (Lemma R.1 (b)): `(φ⁻¹)^(n+1) = ⟨(−1)^(n+1) F_{n+2}, (−1)^n F_{n+1}⟩`. -/
private theorem g5_u18_aux_inv_pow (n : ℕ) :
    (⟨-1, 1⟩ : ZPhi) ^ (n + 1) =
      (⟨(-1) ^ (n + 1) * fibZ (n + 2), (-1) ^ n * fibZ (n + 1)⟩ : ZPhi) := by
  induction n with
  | zero => rw [zero_add, pow_one]; rfl
  | succ n ih =>
    have e1 : fibZ (n + 1 + 2) = fibZ (n + 2) + fibZ (n + 1) := rfl
    have e2 : fibZ (n + 1 + 1) = fibZ (n + 2) := rfl
    rw [pow_succ, ih, e1, e2]
    ext <;> simp
    ring

/-- Helper (Lemma R.1 (c)): `φ^(m+1) + (φ⁻¹)^(m+1)` as a pair. -/
private theorem g5_u18_aux_sum (m : ℕ) :
    phi ^ (m + 1) + Ring.inverse phi ^ (m + 1) =
      (⟨fibZ m + (-1) ^ (m + 1) * fibZ (m + 2), fibZ (m + 1) + (-1) ^ m * fibZ (m + 1)⟩ :
        ZPhi) := by
  rw [g5_u18_aux_inv, g5_u18_aux_phi_pow, g5_u18_aux_inv_pow]
  ext <;> simp

/-- G5-RUNGa (Cor. 3.6′, every rung, the even leg). For every even `n ≥ 1`, no element of
`⟨S, T⟩` has trace `±(L_n, 0)` — the pair of `φⁿ + φ⁻ⁿ` at even `n`, (3.12).
Locus: `phase-4/proofs/RUNG/COROLLARY-RUNG.md` §1 (l. 13, l. 15) and §5 Step 2 (l. 77);
SKELETON.md row Cor. 3.6′ (l. 121). STATEMENTS.md sha256 prefix `9ebf3004`. -/
theorem g5_u18_rung_a (n : ℕ) (hn : 1 ≤ n) (he : Even n) (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    (g : M2).trace ≠ (⟨lucasZ n, 0⟩ : ZPhi) ∧
      (g : M2).trace ≠ -(⟨lucasZ n, 0⟩ : ZPhi) := by
  obtain ⟨k, hk⟩ := he
  obtain ⟨m, rfl⟩ : ∃ m, n = m + 2 := ⟨n - 2, by omega⟩
  have hL := (g5_u18_aux_lucas_pos m).2
  obtain ⟨x, y, ht, hs⟩ := g5_u18_aux_shape g hg
  refine ⟨fun h => ?_, fun h => ?_⟩
  · have e := ht.symm.trans h
    have ex := congrArg ZPhi.x e
    have ey := congrArg ZPhi.y e
    dsimp only at ex ey
    omega
  · have e := ht.symm.trans h
    have ex := congrArg ZPhi.x e
    have ey := congrArg ZPhi.y e
    simp only [neg_x, neg_y] at ex ey
    omega

/-- G5-RUNGb (Cor. 3.6′, every rung, the odd leg). For every odd `n`, no element of `⟨S, T⟩`
has trace `±(−F_n, 2F_n)` — the pair of `φⁿ + φ⁻ⁿ = F_n √5` at odd `n`, (3.12).
Locus: `phase-4/proofs/RUNG/COROLLARY-RUNG.md` §1 (l. 13, l. 15) and §5 Step 3 (l. 79);
SKELETON.md row Cor. 3.6′ (l. 121). STATEMENTS.md sha256 prefix `9ebf3004`. -/
theorem g5_u18_rung_b (n : ℕ) (ho : Odd n) (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    (g : M2).trace ≠ (⟨-fibZ n, 2 * fibZ n⟩ : ZPhi) ∧
      (g : M2).trace ≠ -(⟨-fibZ n, 2 * fibZ n⟩ : ZPhi) := by
  obtain ⟨k, hk⟩ := ho
  obtain ⟨m, rfl⟩ : ∃ m, n = m + 1 := ⟨n - 1, by omega⟩
  have hF := (g5_u18_aux_fib_pos m).1
  obtain ⟨x, y, ht, hs⟩ := g5_u18_aux_shape g hg
  refine ⟨fun h => ?_, fun h => ?_⟩
  · have e := ht.symm.trans h
    have ex := congrArg ZPhi.x e
    have ey := congrArg ZPhi.y e
    dsimp only at ex ey
    omega
  · have e := ht.symm.trans h
    have ex := congrArg ZPhi.x e
    have ey := congrArg ZPhi.y e
    simp only [neg_x, neg_y] at ex ey
    omega

/-- G5-RUNGc (Cor. 3.6′, every rung, as printed). For every `n ≥ 1`, no element of `⟨S, T⟩`
has trace `±(φⁿ + φ⁻ⁿ)`, with `φ⁻¹` the inverse of the unit `φ` of ℤ[φ] (`Ring.inverse`).
Locus: `phase-4/proofs/RUNG/COROLLARY-RUNG.md` §1 (l. 13) and Lemma R.1 (b) (l. 31);
SKELETON.md row Cor. 3.6′ (l. 121). STATEMENTS.md sha256 prefix `9ebf3004`. -/
theorem g5_u18_rung_c (n : ℕ) (hn : 1 ≤ n) (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    (g : M2).trace ≠ phi ^ n + Ring.inverse phi ^ n ∧
      (g : M2).trace ≠ -(phi ^ n + Ring.inverse phi ^ n) := by
  obtain ⟨m, rfl⟩ : ∃ m, n = m + 1 := ⟨n - 1, by omega⟩
  have hp : ((-1 : ℤ) ^ (m + 1)) = -((-1 : ℤ) ^ m) := by ring
  rw [g5_u18_aux_sum]
  rcases Nat.even_or_odd (m + 1) with he | ho
  · have h1 : ((-1 : ℤ) ^ (m + 1)) = 1 := he.neg_one_pow
    have h0 : ((-1 : ℤ) ^ m) = -1 := by linarith
    have hc : (⟨fibZ m + (-1) ^ (m + 1) * fibZ (m + 2), fibZ (m + 1) + (-1) ^ m * fibZ (m + 1)⟩ :
        ZPhi) = ⟨lucasZ (m + 1), 0⟩ := by
      rw [h1, h0, (g5_u18_aux_lucas_fib m).1]
      congr 1 <;> ring
    rw [hc]
    exact g5_u18_rung_a (m + 1) hn he g hg
  · have h1 : ((-1 : ℤ) ^ (m + 1)) = -1 := ho.neg_one_pow
    have h0 : ((-1 : ℤ) ^ m) = 1 := by linarith
    have e : fibZ (m + 2) = fibZ (m + 1) + fibZ m := rfl
    have hc : (⟨fibZ m + (-1) ^ (m + 1) * fibZ (m + 2), fibZ (m + 1) + (-1) ^ m * fibZ (m + 1)⟩ :
        ZPhi) = ⟨-fibZ (m + 1), 2 * fibZ (m + 1)⟩ := by
      rw [h1, h0, e]
      congr 1 <;> ring
    rw [hc]
    exact g5_u18_rung_b (m + 1) ho g hg

end G5
