# G5-U2-TRD5

## 1 · Header

row: G5-U2-TRD5
unit: U2
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, §4 Errata included, digest read 2026-10-30T10:05:56Z)
locus: AM transcript §4 gap 3 (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 188); the L-1 proof (l. 178), the involution-trace step; the L-2 proof (l. 181), the trace list; AM §3.1 (l. 124) (pointer)
spec_clock: 2026-10-30T10:16:34Z

## 2 · Printed statement, verbatim

> then "every element of the closure of {S̄, R̄} has trace ≠ 1" and the parity-graded closure ("trace 0 whenever the S-count is odd") are `decide`-able over ≤ 120 states.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 188

> For k odd, W̄ lies outside ⟨R̄⟩, hence is an involution; an involution M ≠ I of SL(2, 𝔽₄) satisfies (M + I)² = 0, so M is unipotent and tr M = 0.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 178

> Every element of D₅ has order 1, 2 or 5; in PSL(2, 𝔽₄) these have traces 0, 0, ω^{±1}, and trace 1 occurs only in order 3.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 181

## 3 · Formal reading

- (i) every element of the closure has trace ≠ 1 in 𝔽₄ — stated over `D5bar`, which row G5-U2-D5 identifies with the closure; (ii) the "parity-graded" clause — trace 0 whenever the S-count is odd — stated on the odd half {R̄^j S̄ : j < 5} of `D5bar` (the elements outside ⟨R̄⟩, the reflections). Trace is `Matrix.trace` over `F4`; 1 is ⟨1, 0⟩, 0 is ⟨0, 0⟩.
- The record's proofs reach these by orders (involution ⟹ unipotent ⟹ trace 0; orders 1, 2, 5 ⟹ traces 0, 0, ω^{±1}); the row states the trace facts only, which the gap says are decidable over the finite set.
- Stated on `D5bar` rather than on `Submonoid.closure` so that each conjunct is a finite check on ten explicit matrices; with G5-U2-D5 the two forms are equivalent.

## 4 · Target mathlib declarations

```
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
Matrix.trace_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:220
Finset.mem_union	FOUND Finset Mathlib/Data/Finset/Lattice/Basic.lean:103
Finset.mem_image	FOUND Finset Mathlib/Data/Finset/Image.lean:294
```

## 5 · Intended Lean statement

In prose: no element of {R̄^j, R̄^j S̄ : j < 5} has trace 1, and each R̄^j S̄ (j < 5) has trace 0.

Probe: `<scratchpad>/M-U2/probe.lean` (U1's final probe, sha256 `f15f320065142f9533d7c775430280434d4ec3533a27927dd740d2210e04af63`, copied whole and unedited as the prefix, then this unit's block); NOT RUN by this seat (the brief's amendment of 2026-10-30T10:05:25Z: the orchestrator elaborates the six probes serially and returns any error to the row). The text below is the probe's text byte for byte.

```lean
theorem g5_u2_d5_trace :
    (∀ M ∈ D5bar, M.trace ≠ 1) ∧
      ∀ j : ℕ, j < 5 → (Rbar ^ j * Sbar).trace = 0 := by sorry
```

## 6 · What the row does not claim

- Not the order of each element, nor the full trace table (traces 0, ω, ω² on the rotations); not the even-k criterion "y even ⟺ a₁ − a₂ + ⋯ − a_k ≡ 0 mod 5" (AM §3.1, §2.4; not on the lane).
- Not the gap's mod-3 / mod-4 counterparts (U6).

## 7 · Status

SPEC-DRAFT 2026-10-30T10:16:34Z

V1: V1-GREEN 2026-10-30T10:26:54Z — the three §2 quotes match AM l. 188, 178 and 181 verbatim. (i) "every element of the closure of {S̄, R̄} has trace ≠ 1" stated over `D5bar`: the monoid closure of {S̄, R̄} equals that of {S̄, T̄} equals `D5bar` (computed; the equivalence on the lane is G5-U2-D5's theorem). (ii) "trace 0 whenever the S-count is odd" read as trace 0 on the reflection half {R̄^j S̄}: this is the record's mathematical content at l. 178 ("W̄ lies outside ⟨R̄⟩ … tr M = 0"); the grading itself (odd S-count ⟺ the reflection half; checked on every R̄/S̄ word to length 8) is a step of the L-1 proof, declared out of the row in G5-U2-D5 §6, and the claim it feeds is the stated row G5-L1 — so nothing the record asserts is dropped from the lane. Values: traces on `D5bar` are 0 (the identity and the five reflections), φ̄ and 1 + φ̄ (= ω, ω²) on the rotations, never 1 — AM l. 181's "0, 0, ω^{±1}". Parse: 0 Lean line(s) over 100 code points
