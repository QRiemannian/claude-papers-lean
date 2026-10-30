# G5-M4b

## 1 · Header

row: G5-M4b
unit: U6
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, digest read 2026-10-30T10:14:38Z; §4 Errata included)
locus: DO §3.2 "New exact congruences (D-2)" (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` l. 118–120) and §10 D-2 (l. 246); AM §2.4 (`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 113, l. 115); `phase-2/PHASE-2-DEFINITIONS.md` §1 (l. 15); STATEMENTS.md row G5-M4 (pointer)
spec_clock: 2026-10-30T10:14:38Z

## 2 · Printed statement, verbatim

> **New exact congruences (D-2):**
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` l. 118

> - (i) x odd ⟹ y odd **and x + y ≡ 0 (mod 4)**;
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` l. 119

> - (ii) x ≡ 2 (mod 4) ⟹ y even;
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` l. 120

> - **D-2 (local congruences).** Every trace x + yφ of G(5) satisfies: x odd ⟹ (y odd and x + y ≡ 0 mod 4); x ≡ 2 (mod 4) ⟹ y even; not (x ≡ y ≢ 0 mod 3). Equivalently the trace residues lie in the 8-element set H₄ = {(0,·), (2,0), (2,2), (1,3), (3,1)} mod 4 and avoid ±φ² mod 3. Status: proved by exact closure (COMPUTED HERE, one hand). *Falsifier:* any group element with a trace in a missed residue. *Test:* recompute the mod-4 and mod-3 images on the second instrument (impl-a's closure code); census control 0 violations at depth 12 and in the trace-complete set. → candidate L-3/L-4 after the pair agrees.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` l. 246

> Write t = x + yφ for the literal trace of a k-syllable word.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 113

> - **(mod 4; new):** k even and y even ⟹ **(x, y) ≡ (2, 0) mod 4**; y odd ⟹ **x ≡ 0 or x ≡ −y mod 4**; k odd: no constraint beyond x, y even. (Realized signed residues mod 4: even k {(0,1), (0,3), (1,3), (3,1), (2,0)}; odd k {(0,0), (0,2), (2,0), (2,2)}.) The first clause is the Γ(2) computation of §2.2 (hand proof). The second is NOT a Chebyshev consequence: COMPUTED HERE (scratch one-off, the t⁵ − 5t³ + 5t ≡ 2 mod 4 test) all eight y-odd residues satisfy the order-5 Chebyshev condition; the exclusion comes from the mod-4 image being index 2 in the preimage of D₅ — a genuine extra congruence, with only a computational proof so far.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` l. 115

The same law as the Phase 2 law sheet carries it (on the normalized trace):

> **The two congruence laws (proved by exact finite closure, three codes).** For the normalized (x, y): (mod 4) the residue (x mod 4, y mod 4) lies in the 8-element set H₄ = {(0,0), (0,1), (0,2), (0,3), (2,0), (2,2), (1,3), (3,1)} — equivalently: x odd ⟹ y odd and x + y ≡ 0 (mod 4); x ≡ 2 (mod 4) ⟹ y even; (mod 3) never x ≡ y ≢ 0 (mod 3). Admissible residue density (8/16)(7/9) = 7/18. "Admissible" below means: in the sector AND residue in H₄ AND not (x ≡ y ≢ 0 mod 3).
>
> — `Claude-Papers/No1-G5/phase-2/PHASE-2-DEFINITIONS.md` l. 15

## 3 · Formal reading

- Words: `w : List ℕ` with `IsWord w` (U1: non-empty, every syllable in {1, 2, 3, 4}); statements are about words, not classes (STATEMENTS.md §2 note 4); k = `w.length`.
- The trace is the LITERAL trace `(W w).trace` of W = R^{a₁}S ⋯ R^{a_k}S in SL(2, ℤ[φ]) (STATEMENTS.md §2 note 2; AM §2.4 l. 113: "the literal trace of a k-syllable word"); x = `.x`, y = `.y` (U1's `ZPhi` fields).
- Claim: for every word, `red4 (W w).trace ∈ H4`, i.e. (x mod 4, y mod 4) ∈ H₄. DO states the law for "every trace x + yφ of G(5)" and gives the H₄ membership as equivalent to its clauses (i), (ii); the row is the word-level form (design note 4; the group-level form needs a syllable representative and is U7's).
- Literal vs normalized: AM states the law on the literal trace, the law sheet on the normalized one; H₄ is closed under negation, so the two readings are the same statement (SH-P2-1 l. 272: "The residue set is closed under negation, so the normalized and literal traces obey the same law"). The row uses the literal trace.
- The equivalent clause form — x odd ⟹ y odd ∧ x + y ≡ 0 (mod 4); x ≡ 2 (mod 4) ⟹ y even — is a restatement of membership in H₄ (case check over the 16 residues) and is not a separate row.

## 4 · Target mathlib declarations

```
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
Finset	FOUND _root_ Mathlib/Data/Finset/Defs.lean:75
ZMod	FOUND _root_ Mathlib/Data/ZMod/Defs.lean:142
Finset.mem_insert	FOUND Finset Mathlib/Data/Finset/Insert.lean:366
```

## 5 · Intended Lean statement

In prose: for every word w (k ≥ 1, syllables in {1, 2, 3, 4}), the pair (x mod 4, y mod 4) of the trace x + yφ of the literal word W lies in H₄.

Probe: `<scratchpad>/M-U6/probe.lean` (U1's final probe, sha256 `f15f3200…af63`, copied whole as the prefix, then the U6 block). **Not run by this seat** (brief amendment 2026-10-30T10:05:25Z: no `lake` command from an M seat; the orchestrator elaborates the probes serially). The text below is the probe's text byte for byte.

```lean
open G5 ZPhi

/-- G5-M4b: the trace of every literal word lies in `H₄` mod 4. -/
theorem g5_u6_m4b (w : List ℕ) (hw : IsWord w) : red4 (W w).trace ∈ H4 := by sorry
```

## 6 · What the row does not claim

- Not that every residue of H₄ is realized (the record says 8 of 16 are hit — DO l. 109; AM l. 115 lists them by parity); only the inclusion.
- Not the parity-split refinement (k even and y even ⟹ (2, 0)): that is G5-M4d.
- Nothing about elements of G(5) that are not syllable words (±I, ±S, ±R^a and conjugates — U7).
- The character proof of the mod-4 law (the index-2 character χ of the preimage H of D₅ in SL(2, ℤ[φ]/4), SH-P2-1 §5) is the paper's register and is NOT a Lean target; the Lean route is the finite closure (STATEMENTS.md §2 note 3).

## 7 · Status

SPEC-DRAFT 2026-10-30T10:14:38Z

V1: V1-GREEN · V1-SPLIT-OK 2026-10-30T10:24:46Z — STATEMENTS.md's row text and DO D-2 (l. 119–120, l. 246), H₄ form, inclusion only, read on the literal trace (AM l. 113). Normalized reading (PHASE-2-DEFINITIONS l. 15) is the same statement: H₄ is closed under negation, −(0,1) = (0,3), −(1,3) = (3,1), the others fixed (SH-P2-1 l. 272 says the same). The word-level restriction of "every trace of G(5)" follows design note 4. The group level sits with U7, but no U7 spec on disk carries a mod-4 or mod-3 leg; that is a note for the orchestrator, not a defect of this row. Own closure over the 320 word states: 0 residues outside H₄, all eight realized. Parse: 0 Lean line(s) over 100 code points

V2: V2-GREEN 2026-10-30T10:40:29Z — byte-identical to §5; inclusion of red4 of the literal word trace in H4 for every IsWord word, exactly the row text's "lies in H₄", no realization claim; literal = normalized because H4 is negation-closed (SH-P2-1 l. 272); the group-level leg is U8's (§4 10:26:51Z, 10:29:26Z); own closure 0 violations
