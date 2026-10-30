# G5-U2-HOM

## 1 · Header

row: G5-U2-HOM
unit: U2
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, §4 Errata included, digest read 2026-10-30T10:05:56Z)
locus: AM transcript §4, the L-1 proof (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 178); gap 3 (l. 188); STATEMENTS.md §2 note 3 (l. 31) (pointer); the G5-L1 row's mod-2 reduction (gap 3 in STATEMENTS.md row G5-L1's Lean notes)
spec_clock: 2026-10-30T10:16:34Z

## 2 · Printed statement, verbatim

> *Proof.* Reduction modulo the inert prime 2 is a ring map ℤ[φ] → 𝔽₄ and induces a homomorphism SL(2, ℤ[φ]) → SL(2, 𝔽₄) = PSL(2, 𝔽₄).
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 178

> Thus tr W ≡ 0 mod 2, i.e. x ≡ y ≡ 0 mod 2.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 178

> Define 𝔽₄ concretely as ℤ[φ]/2 (pairs mod 2) rather than `GaloisField 2 2` (noncomputable)
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 188

## 3 · Formal reading

- "Reduction modulo the inert prime 2 is a ring map ℤ[φ] → 𝔽₄" carries three claims, stated as three theorems: (i) the target is the field with four elements — `IsField F4 ∧ Nat.card F4 = 4` (the "inert prime" makes ℤ[φ]/2 a field; the name 𝔽₄ its size); (ii) `red2` is a ring map — there is a `ZPhi →+* F4` whose underlying function is `red2`; (iii) it is reduction modulo 2 — `red2 t = 0` exactly when both coordinates are even (the record's "tr W ≡ 0 mod 2, i.e. x ≡ y ≡ 0 mod 2").
- The induced map on SL(2, ·) is not a separate statement: with (ii), `red2M` is entrywise application of a ring map, and `RingHom.map_matrix_mul` (§4) gives multiplicativity — a proof step, not a record claim of its own. The record's "SL(2, 𝔽₄) = PSL(2, 𝔽₄)" (char 2) is not stated.
- `Nat.card` is used so that no `Fintype F4` instance is presupposed.

## 4 · Target mathlib declarations

```
IsField	FOUND _root_ Mathlib/Algebra/Field/IsField.lean:33
Nat.card	FOUND Nat Mathlib/SetTheory/Cardinal/Finite.lean:41
RingHom	FOUND _root_ Mathlib/Algebra/Ring/Hom/Defs.lean:296
RingHom.mapMatrix	FOUND RingHom Mathlib/Data/Matrix/Basic.lean:593
RingHom.map_matrix_mul	FOUND RingHom Mathlib/Data/Matrix/Mul.lean:1261
ZMod.intCast_zmod_eq_zero_iff_dvd	FOUND ZMod Mathlib/Data/ZMod/Basic.lean:513
ZMod.intCast_cast	FOUND ZMod Mathlib/Data/ZMod/Basic.lean:268
```

(`ZMod.intCast_zmod_eq_zero_iff_dvd` is the expected aid for (iii); `RingHom.map_matrix_mul` reads `f ((M * N) i j) = (M.map f * N.map f) i j` at `Mathlib/Data/Matrix/Mul.lean:1261`.)

## 5 · Intended Lean statement

In prose: (i) 𝔽₄ (pairs mod 2 with the ℤ[φ] product) is a field with exactly four elements; (ii) reduction mod 2 is a ring homomorphism ℤ[φ] → 𝔽₄; (iii) an element of ℤ[φ] reduces to 0 exactly when both its coordinates are even.

Probe: `<scratchpad>/M-U2/probe.lean` (U1's final probe, sha256 `f15f320065142f9533d7c775430280434d4ec3533a27927dd740d2210e04af63`, copied whole and unedited as the prefix, then this unit's block); NOT RUN by this seat (the brief's amendment of 2026-10-30T10:05:25Z: the orchestrator elaborates the six probes serially and returns any error to the row). The text below is the probe's text byte for byte.

```lean
theorem g5_u2_f4 : IsField F4 ∧ Nat.card F4 = 4 := by sorry

theorem g5_u2_red_hom : ∃ f : ZPhi →+* F4, ∀ t : ZPhi, f t = red2 t := by sorry

theorem g5_u2_red_eq_zero (t : ZPhi) : red2 t = 0 ↔ 2 ∣ t.x ∧ 2 ∣ t.y := by sorry
```

## 6 · What the row does not claim

- Not that the induced map SL(2, ℤ[φ]) → SL(2, 𝔽₄) is surjective, nor anything about its kernel Γ(2) (AM §2.2; not on the lane).
- Not the identification SL(2, 𝔽₄) = PSL(2, 𝔽₄) ≅ A₅, and nothing mod 3 or mod 4.

## 7 · Status

SPEC-DRAFT 2026-10-30T10:16:34Z

V1: V1-GREEN 2026-10-30T10:26:54Z — the three §2 quotes match AM l. 178 (twice) and l. 188 verbatim. The three theorems are no stronger than the record: (i) `IsField F4 ∧ Nat.card F4 = 4` is what the record's "the inert prime 2" (ℤ[φ]/2 a field) and its name 𝔽₄ for ℤ[φ]/2 (gap 3) assert, made explicit; `Nat.card … = 4` is non-vacuous (an infinite type has `Nat.card` 0); (ii) a ring map with underlying function `red2` — the clause itself; (iii) kernel = 2ℤ[φ], the record's "≡ 0 mod 2, i.e. x ≡ y ≡ 0 mod 2" (l. 178). Not weaker: the record's second clause "induces a homomorphism SL(2, ℤ[φ]) → SL(2, 𝔽₄)" follows from (ii) through `RingHom.mapMatrix` (a mathlib consequence, not an independent claim), and "SL(2, 𝔽₄) = PSL(2, 𝔽₄)" is a characteristic-2 remark no lane statement reads; both omissions are declared in §3/§6. Arithmetic: `red2` additive and multiplicative and its kernel = both coordinates even, on every pair in [−4, 4]². Parse: 0 Lean line(s) over 100 code points

V2: V2-GREEN 2026-10-30T10:57:07Z — g5_u2_f4, g5_u2_red_hom, g5_u2_red_eq_zero byte-identical to §5; AM l. 178 "a ring map ℤ[φ] → 𝔽₄" read as field of four elements + ring map + kernel 2ℤ[φ] (both directions), no stronger, no weaker.
