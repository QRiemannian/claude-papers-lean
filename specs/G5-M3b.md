# G5-M3b

## 1 · Header

row: G5-M3b
unit: U6
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, digest read 2026-10-30T10:14:38Z; §4 Errata included)
locus: `candidates/LEDGER.md` row AM-5 (l. 17); AM §2.4 (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 113, l. 116) and §6 AM-5 (l. 226); DO §3.2 D-2 (iii) (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` l. 121) and §10 D-2 (l. 246); STATEMENTS.md row G5-M3 (pointer)
spec_clock: 2026-10-30T10:14:38Z

## 2 · Printed statement, verbatim

> | AM-5 | 2026-10-29T22:27:47Z, same seat | Mod 3: no trace has x ≡ y ≢ 0 (mod 3) (A₅ has no element of order 4). | a violating value | P1-PC k ≤ 12, both trees | PROVED-PENDING-CHECK |
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` l. 17

> Write t = x + yφ for the literal trace of a k-syllable word.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 113

> - **(mod 3; new):** **no trace has x ≡ y ≢ 0 (mod 3)** — the order-4 stratum is empty in A₅. Hand proof: 3 is inert, ℤ[φ]/3 ≅ 𝔽₉; the element traces of PSL(2, 𝔽₉) up to sign are 0 (order 2), ±1 (orders 1, 3), ±φ̄, ±(φ̄ − 1) (order 5), ±φ̄² (order 4); A₅ has orders {1, 2, 3, 5}; φ̄² ↔ (x, y) ≡ (1, 1). PROVED.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 116

> - **AM-5 (the mod-3 law).** No trace has x ≡ y ≢ 0 mod 3. PROVED (A₅ has no element of order 4). Falsifier: one word with x ≡ y ≢ 0 mod 3. Census: depth-12 residue table mod 3.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 226

> - (iii) never x ≡ y ≢ 0 (mod 3).
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` l. 121

> - **D-2 (local congruences).** Every trace x + yφ of G(5) satisfies: x odd ⟹ (y odd and x + y ≡ 0 mod 4); x ≡ 2 (mod 4) ⟹ y even; not (x ≡ y ≢ 0 mod 3). Equivalently the trace residues lie in the 8-element set H₄ = {(0,·), (2,0), (2,2), (1,3), (3,1)} mod 4 and avoid ±φ² mod 3. Status: proved by exact closure (COMPUTED HERE, one hand). *Falsifier:* any group element with a trace in a missed residue. *Test:* recompute the mod-4 and mod-3 images on the second instrument (impl-a's closure code); census control 0 violations at depth 12 and in the trace-complete set. → candidate L-3/L-4 after the pair agrees.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` l. 246

## 3 · Formal reading

- Words: `w : List ℕ` with `IsWord w` (U1: non-empty, every syllable in {1, 2, 3, 4}); statements are about words, not classes (STATEMENTS.md §2 note 4); k = `w.length`.
- The trace is the LITERAL trace `(W w).trace` of W = R^{a₁}S ⋯ R^{a_k}S in SL(2, ℤ[φ]) (STATEMENTS.md §2 note 2; AM §2.4 l. 113: "the literal trace of a k-syllable word"); x = `.x`, y = `.y` (U1's `ZPhi` fields).
- "x ≡ y ≢ 0 (mod 3)" is read as x ≡ y (mod 3) ∧ x ≢ 0 (mod 3) (equivalently y ≢ 0, given x ≡ y); the excluded residues are (1, 1), (2, 2) = ±φ² (DO l. 108). The set of excluded residues is closed under negation, so the literal and normalized readings coincide.
- Claim: for every word, ¬ (x ≡ y [ZMOD 3] ∧ ¬ x ≡ 0 [ZMOD 3]).

## 4 · Target mathlib declarations

```
Int.ModEq	FOUND Int Mathlib/Data/Int/ModEq.lean:30
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
```

## 5 · Intended Lean statement

In prose: for every word w, the literal trace x + yφ does not satisfy x ≡ y ≢ 0 (mod 3).

Probe: `<scratchpad>/M-U6/probe.lean` (U1's final probe, sha256 `f15f3200…af63`, copied whole as the prefix, then the U6 block). **Not run by this seat** (brief amendment 2026-10-30T10:05:25Z: no `lake` command from an M seat; the orchestrator elaborates the probes serially). The text below is the probe's text byte for byte.

```lean
open G5 ZPhi

/-- G5-M3b: no literal word has trace with `x ≡ y ≢ 0 (mod 3)`. -/
theorem g5_u6_m3b (w : List ℕ) (hw : IsWord w) :
    ¬ ((W w).trace.x ≡ (W w).trace.y [ZMOD 3] ∧ ¬ ((W w).trace.x ≡ 0 [ZMOD 3])) := by sorry
```

## 6 · What the row does not claim

- Not that the other seven residues mod 3 are all realized.
- Nothing about non-word elements of G(5) (U7).
- The hand proof (3 inert, ℤ[φ]/3 ≅ 𝔽₉; A₅ has no element of order 4, the order-4 trace being ±φ̄²) is the paper's register and is NOT a Lean target; the Lean route is the finite closure (G5-M3a's 120 matrices, STATEMENTS.md §2 note 3).

## 7 · Status

SPEC-DRAFT 2026-10-30T10:14:38Z

V1: V1-GREEN · V1-SPLIT-OK 2026-10-30T10:24:46Z — "x ≡ y ≢ 0 (mod 3)" read as x ≡ y ∧ x ≢ 0 picks out exactly the residues (1, 1), (2, 2): AM l. 103 "never (x, y) ≡ ±(1, 1)", DO l. 108 "(1,1), (2,2), i.e. ±φ²", AM l. 116 "φ̄² ↔ (1, 1)". The excluded set and the predicate are both invariant under negation, so the literal and normalized readings coincide. The record's literal trace (AM l. 113) is used, at word level. Own closure over the 120 matrices: realized residues {(0,0), (0,1), (0,2), (1,0), (1,2), (2,0), (2,1)} (7 of 9, AM l. 103), 0 violations. Parse: 0 Lean line(s) over 100 code points
