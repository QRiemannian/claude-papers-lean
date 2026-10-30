# G5-U2-MOD2

## 1 · Header

row: G5-U2-MOD2
unit: U2
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, §4 Errata included, digest read 2026-10-30T10:05:56Z)
locus: AM transcript §4, the L-1 proof (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 178) and gap 3 (l. 188); AM §2.2 (l. 83), §2.3 table row n = 2 (l. 99), §3.1 (l. 124); STATEMENTS.md §2 note 3 (l. 31) and row G5-L1's Lean notes (pointers)
spec_clock: 2026-10-30T10:16:34Z

## 2 · Printed statement, verbatim (the record's definitions for the mod-2 closure)

The reduction and its image:

> *Proof.* Reduction modulo the inert prime 2 is a ring map ℤ[φ] → 𝔽₄ and induces a homomorphism SL(2, ℤ[φ]) → SL(2, 𝔽₄) = PSL(2, 𝔽₄). Since T² = [[1, 2φ], [0, 1]] ≡ I and S² = −I ≡ I, the images S̄, T̄ are involutions and R̄ = T̄S̄ has order 5 (R⁵ = −I ≡ I, R̄ ≠ I); so the image of G(5) is the dihedral group ⟨R̄, S̄⟩ of order 10
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 178

The concrete 𝔽₄ the Lean gaps name:

> 3. **"The image mod 2".** Define 𝔽₄ concretely as ℤ[φ]/2 (pairs mod 2) rather than `GaloisField 2 2` (noncomputable); then "every element of the closure of {S̄, R̄} has trace ≠ 1" and the parity-graded closure ("trace 0 whenever the S-count is odd") are `decide`-able over ≤ 120 states. Same for mod 3 (240 states) and mod 4 (320 matrices × parity).
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 188

> 3. **Finite images.** 𝔽₄ := ℤ[φ]/2 as pairs mod 2, and likewise mod 3, mod 4; the closures are finite and decidable (120 / 240 / 320 states).
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` l. 31

The dihedral group, as the record presents it:

> In D₅ = ⟨r, s | r⁵, s², srs = r⁻¹⟩ with r = R̄, s = S̄
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 124

> reduce modulo 2 instead, where 2φ ≡ 0 makes T an involution: G(5) → ⟨S̄, T̄⟩ = Δ(2, 2, 5) = D₅ (RECONCILIATION row 22, pinned; the quotient ⟨S, R | S², R⁵, T²⟩ is the dihedral triangle group of order 10)
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 83

> | 2 | 10 | D₅ = Δ(2,2,5) | 3 of 4: never (x, y) ≡ (1, 0) |
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 99

## 3 · Formal reading

- **𝔽₄** (`G5.F4`): the structure of pairs `⟨x, y⟩` with `x y : ZMod 2`, read as x̄ + ȳφ̄; addition, negation, subtraction coordinatewise; multiplication (x, y)(u, v) = (xu + yv, xv + yu + yv), the product of `ZPhi` (U1) read mod 2 (φ̄² = φ̄ + 1); zero ⟨0, 0⟩, one ⟨1, 0⟩. This is the record's "𝔽₄ concretely as ℤ[φ]/2 (pairs mod 2)", not `GaloisField 2 2` (gap 3: noncomputable). Its `CommRing` instance carries its own proofs (each axiom by `ext`, `simp only` on the definitional field lemmas, then `ring` in `ZMod 2`; a plain `simp` is avoided because the `ZMod 2` simp set rewrites −a to a). `DecidableEq` is derived. That `F4` is a field with four elements is a stated theorem (row G5-U2-HOM), not an assumption.
- **The reduction** (`red2`): x + yφ ↦ (x mod 2) + (y mod 2)φ̄, by `Int.cast` into `ZMod 2` on each coordinate. That it is a ring map with kernel 2ℤ[φ] is row G5-U2-HOM. Named `red2` (not `red`) to keep clear of mathlib's `FreeGroup.reduce.red` (classifier, §4).
- **Matrices** (`F4M` = `Matrix (Fin 2) (Fin 2) F4`; `red2M A` = `A.map red2`, the entrywise reduction); `Sbar`, `Tbar`, `Rbar` are the reductions of U1's `S`, `T`, `R` (R̄ = T̄S̄ is a stated conjunct of row G5-U2-D5, not a definition).
- **D₅** (`D5bar`): the explicit `Finset` of the ten matrices R̄^j and R̄^j S̄ for j < 5 — the record's ⟨R̄, S̄⟩ written as {r^j, r^j s}. Its having ten distinct members, equalling the image, and carrying the dihedral relations are rows G5-U2-D5 and G5-U2-TRD5.
- Words, the literal lift, `M2`, `S`, `T`, `R`, `W`, `IsWord`: U1's, by name (`G5-U1-DEFS` §5); nothing U1 defines is redefined.

## 4 · Target mathlib declarations (classifier of record at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`)

```
ZMod	FOUND _root_ Mathlib/Data/ZMod/Defs.lean:142
ZMod.commRing	FOUND ZMod Mathlib/Data/ZMod/Defs.lean:175
ZMod.decidableEq	FOUND ZMod Mathlib/Data/ZMod/Defs.lean:146
Matrix.map	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Defs.lean:134
Matrix.map_apply	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Defs.lean:138
Matrix.decidableEq	FOUND Matrix Mathlib/Data/Matrix/Basic.lean:45
Matrix.semiring	FOUND Matrix Mathlib/Data/Matrix/Mul.lean:496
Finset.image	FOUND Finset Mathlib/Data/Finset/Image.lean:280
Finset.range	FOUND Finset Mathlib/Data/Finset/Range.lean:53
GaloisField	FOUND _root_ Mathlib/FieldTheory/Finite/GaloisField.lean:69
red	FOUND FreeGroup.reduce Mathlib/GroupTheory/FreeGroup/Reduce.lean:69
red2	NOT FOUND
F4	NOT FOUND
F4M	NOT FOUND
red2M	NOT FOUND
Sbar	NOT FOUND
Tbar	NOT FOUND
Rbar	NOT FOUND
D5bar	NOT FOUND
```

Notes: `GaloisField` exists at the pin and is deliberately NOT used (gap 3). `red` is FOUND only inside `FreeGroup.reduce` (not opened here); the unit's map is `red2`. The unit's own names (`F4`, `F4M`, `red2`, `red2M`, `Sbar`, `Tbar`, `Rbar`, `D5bar`) read NOT FOUND, as new names should; they live in namespace `G5`. `Int.cast` (the coercion ℤ → `ZMod 2`) is Lean core (`Init/Data/Int/Basic.lean:458`, `protected def Int.cast`), not mathlib. `nsmulRec` is core, `zsmulRec` mathlib (as in U1).

## 5 · Intended Lean statement

In prose: the definitions the unit's rows read — 𝔽₄ as pairs mod 2 with its `CommRing` instance, the reduction ℤ[φ] → 𝔽₄, 2 × 2 matrices over 𝔽₄ and the entrywise reduction, S̄, T̄, R̄, and the ten-element set {R̄^j, R̄^j S̄ : j < 5}. No theorem is stated here. The block opens after U1's definitions block (and U1's theorems) and closes with `open G5 ZPhi`.

Probe: `<scratchpad>/M-U2/probe.lean` (U1's final probe, sha256 `f15f320065142f9533d7c775430280434d4ec3533a27927dd740d2210e04af63`, copied whole and unedited as the prefix, then this unit's block); NOT RUN by this seat (the brief's amendment of 2026-10-30T10:05:25Z: the orchestrator elaborates the six probes serially and returns any error to the row). The text below is the probe's text byte for byte.

```lean
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
```

## 6 · What the row does not claim

- No theorem: that `F4` is a field of four elements, that `red2` is a ring map, the image, the traces — each is a stated row (G5-U2-HOM, -D5, -TRD5).
- Nothing mod 3 or mod 4 (U6); no `Fintype F4` instance is declared (none is needed by the statements; a proof stage may derive one); no group structure (`SpecialLinearGroup`, `DihedralGroup`) is used — "dihedral" is read through the explicit set and its relations (row G5-U2-D5).

## 7 · Status

SPEC-DRAFT 2026-10-30T10:16:34Z

V1: V1-GREEN 2026-10-30T10:26:54Z — all six §2 quotes match their source lines verbatim (script over AM l. 178, 188, 124, 83, 99 and STATEMENTS.md l. 31). Conventions confirmed: `F4`'s product (x, y)(u, v) = (xu + yv, xv + yu + yv) is U1's `ZPhi` product read mod 2, so φ̄² = (1, 1) = 1 + φ̄ and F4 = 𝔽₂[φ̄]/(φ̄² + φ̄ + 1) = 𝔽₂[φ̄]/(φ̄² − φ̄ − 1), irreducible over 𝔽₂ (no root), the record's "𝔽₄ concretely as ℤ[φ]/2 (pairs mod 2)" (gap 3); exhaustive over the 4 elements: commutative ring axioms hold, every non-zero element invertible. `red2` coordinatewise `Int.cast`; `Sbar`, `Tbar`, `Rbar` are reductions of U1's `S`, `T`, `R = T * S` in U1's sense (no U1 name redefined). `D5bar` = {R̄^j, R̄^j S̄ : j < 5} is AM l. 124's normal form {r^j, r^j s} with r = R̄, s = S̄, not a set tuned to the closure: its equality with the closure is a stated theorem (G5-U2-D5) that would be false for a wrong set, and it holds (monoid closure of {S̄, T̄} and of {S̄, R̄} both equal it, 10 elements). The quoted "(120 / 240 / 320 states)" is the sheet note corrected by STATEMENTS.md §4 (10:18:27Z); no U2 statement uses a state count. Parse: 0 Lean line(s) over 100 code points

V2: V2-GREEN 2026-10-30T10:57:07Z — the MOD2 block is byte-identical to §5 in G5/ModTwo/Challenge.lean (c342ab92…); F4 is the record's 𝔽₄ = ℤ[φ]/2 (φ̄² = φ̄ + 1, commutative-ring axioms and inverses exhaustive over 4 elements); every name in U1's or MOD2's sense; nothing redefined.
