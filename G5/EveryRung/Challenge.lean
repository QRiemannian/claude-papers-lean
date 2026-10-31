import Mathlib
import G5.Ring.Challenge
import G5.Group.Challenge
import G5.Containment.Challenge

/-!
# Unit U18 (`G5/EveryRung`) — Cor. 3.6′, every rung of the golden ladder (row G5-RUNG):
statements

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Source of record: `Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, edition sha256
`5f2f0ed820a3acf6e2be57f5f11fe12a0c0c3010e74a0ae89ef33eec8783bdf3` · 36526 B (the
fourth extending edition: §7 appended with this wave's sheet lines), which EXTENDS the
editions before it: its first 31612 B are the edition sha256
`9ebf30048d9d246295226f9f8aa7ac86da0d72956e1c1d6e0c45d4eda57c79b3` · 31612 B (the specs'
edition; the docstrings below carry its prefix `9ebf3004`), its first 30598 B the edition
`4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f`, its first 25981 B the
edition `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47` and its first
21568 B the edition `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731`.
Rows stated (STATEMENTS.md §7, l. 87): G5-RUNGa (the even leg, `±(L_n, 0)`), G5-RUNGb
(the odd leg, `±(−F_n, 2F_n)`), G5-RUNGc (as printed, `±(φⁿ + φ⁻ⁿ)`).
This unit defines TWO things, the integer Fibonacci and Lucas numbers `fibZ` and `lucasZ`.
`ZPhi` and its fields, `phi`, `M2` are unit U1's (`G5.Ring.Challenge`); `HeckeGrp` is unit
U7's (`G5.Group.Challenge`); unit U10 (`G5.Containment.Challenge`) is imported for the legs
the proof composes with. All three imported units are frozen. Every proof here is `sorry`.
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

/-- G5-RUNGa (Cor. 3.6′, every rung, the even leg). For every even `n ≥ 1`, no element of
`⟨S, T⟩` has trace `±(L_n, 0)` — the pair of `φⁿ + φ⁻ⁿ` at even `n`, (3.12).
Locus: `phase-4/proofs/RUNG/COROLLARY-RUNG.md` §1 (l. 13, l. 15) and §5 Step 2 (l. 77);
SKELETON.md row Cor. 3.6′ (l. 121). STATEMENTS.md sha256 prefix `9ebf3004`. -/
theorem g5_u18_rung_a (n : ℕ) (hn : 1 ≤ n) (he : Even n) (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    (g : M2).trace ≠ (⟨lucasZ n, 0⟩ : ZPhi) ∧
      (g : M2).trace ≠ -(⟨lucasZ n, 0⟩ : ZPhi) := by sorry

/-- G5-RUNGb (Cor. 3.6′, every rung, the odd leg). For every odd `n`, no element of `⟨S, T⟩`
has trace `±(−F_n, 2F_n)` — the pair of `φⁿ + φ⁻ⁿ = F_n √5` at odd `n`, (3.12).
Locus: `phase-4/proofs/RUNG/COROLLARY-RUNG.md` §1 (l. 13, l. 15) and §5 Step 3 (l. 79);
SKELETON.md row Cor. 3.6′ (l. 121). STATEMENTS.md sha256 prefix `9ebf3004`. -/
theorem g5_u18_rung_b (n : ℕ) (ho : Odd n) (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    (g : M2).trace ≠ (⟨-fibZ n, 2 * fibZ n⟩ : ZPhi) ∧
      (g : M2).trace ≠ -(⟨-fibZ n, 2 * fibZ n⟩ : ZPhi) := by sorry

/-- G5-RUNGc (Cor. 3.6′, every rung, as printed). For every `n ≥ 1`, no element of `⟨S, T⟩`
has trace `±(φⁿ + φ⁻ⁿ)`, with `φ⁻¹` the inverse of the unit `φ` of ℤ[φ] (`Ring.inverse`).
Locus: `phase-4/proofs/RUNG/COROLLARY-RUNG.md` §1 (l. 13) and Lemma R.1 (b) (l. 31);
SKELETON.md row Cor. 3.6′ (l. 121). STATEMENTS.md sha256 prefix `9ebf3004`. -/
theorem g5_u18_rung_c (n : ℕ) (hn : 1 ≤ n) (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    (g : M2).trace ≠ phi ^ n + Ring.inverse phi ^ n ∧
      (g : M2).trace ≠ -(phi ^ n + Ring.inverse phi ^ n) := by sorry

end G5
