# G5-M4c

## 1 · Header

row: G5-M4c
unit: U6
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, digest read 2026-10-30T10:14:38Z; §4 Errata included)
locus: SH-P2-1 §5 (`Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 212, l. 214–216, l. 288) and "Slips and notes" 6 (l. 357); `candidates/LEDGER.md` row AM-4 (l. 16, the SH-P2-1 note); STATEMENTS.md row G5-M4 ("equivalently y odd ⟹ N(t) ≡ 3 (mod 4)", pointer)
spec_clock: 2026-10-30T10:14:38Z

## 2 · Printed statement, verbatim

> **Claim (AM §2.4).** If γ ∈ G(5) has tr γ = x + yφ with y odd, then x ≡ 0 or x ≡ −y (mod 4).
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 212

> The proof below covers every element of G(5), not only words. A hand-found restatement: the clause says N(t) = x² + xy − y² ≡ 3 (mod 4) whenever y is odd.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 214

> - The four allowed y-odd residues have N ≡ 3: (0,1), (0,3), (1,3), (3,1).
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 215

> - The four excluded ones have N ≡ 1: (1,1), (2,1), (2,3), (3,3).
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 216

> | y-odd residues of Γ₄ | exactly {(0,1), (0,3), (1,3), (3,1)}, all with N ≡ 3 (mod 4) |
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 288

>    - The mod-4 law in the norm form N(t) ≡ 3 (mod 4) for y odd.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 357

> | AM-4 | 2026-10-29T22:27:47Z, same seat | Mod 4: k even and y even ⟹ (x, y) ≡ (2, 0) mod 4; y odd ⟹ x ≡ 0 or −y mod 4 (the second clause by finite image computation only). | a violating value | P1-PC k ≤ 12, both trees | PROVED-PENDING-CHECK (clause 2 computation-proved)  **HAND PROOF of the second clause CLOSED 2026-10-30T00:08:03Z (SH-P2-1 item 5):** the index-2 character of the preimage of D₅ is χ(w(I + 2X)) = Tr_{𝔽₄/𝔽₂}(tr(R̄X̄)/tr R̄), D₅-invariant, killing R⁵, S², (SR)²; the −I relator picks the constant 1/tr R̄ and forces the y-odd residues into {(0,1), (0,3), (1,3), (3,1)} — equivalently y odd ⟹ N(t) ≡ 3 (mod 4); exact closure `sh_chi4.py`: |H| = 640, |ker χ| = 320, 0 homomorphism violations. One hand; the wall next. |
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` l. 16

## 3 · Formal reading

- Words: `w : List ℕ` with `IsWord w` (U1: non-empty, every syllable in {1, 2, 3, 4}); statements are about words, not classes (STATEMENTS.md §2 note 4); k = `w.length`.
- The trace is the LITERAL trace `(W w).trace` of W = R^{a₁}S ⋯ R^{a_k}S in SL(2, ℤ[φ]) (STATEMENTS.md §2 note 2; AM §2.4 l. 113: "the literal trace of a k-syllable word"); x = `.x`, y = `.y` (U1's `ZPhi` fields).
- N(t) = x² + xy − y² is U1's `nrm` (SH-P2-1 l. 214 gives this formula). Since `nrm` is invariant under t ↦ −t, the literal and normalized readings coincide.
- Claim: for every word whose trace has y odd, `nrm (W w).trace ≡ 3 [ZMOD 4]`.
- The record calls this a restatement of the second mod-4 clause ("y odd ⟹ x ≡ 0 or x ≡ −y (mod 4)"): over the eight y-odd residues mod 4 the four allowed have N ≡ 3 and the four excluded have N ≡ 1 (SH-P2-1 l. 215–216). The row states the norm form only; the clause form is inside G5-M4b and G5-M4d.

## 4 · Target mathlib declarations

```
Int.ModEq	FOUND Int Mathlib/Data/Int/ModEq.lean:30
Odd	FOUND _root_ Mathlib/Algebra/Ring/Parity.lean:101
Int.odd_iff	FOUND Int Mathlib/Algebra/Ring/Int/Parity.lean:29
```

## 5 · Intended Lean statement

In prose: for every word w whose literal trace x + yφ has y odd, the norm x² + xy − y² of the trace is congruent to 3 mod 4.

Probe: `<scratchpad>/M-U6/probe.lean` (U1's final probe, sha256 `f15f3200…af63`, copied whole as the prefix, then the U6 block). **Not run by this seat** (brief amendment 2026-10-30T10:05:25Z: no `lake` command from an M seat; the orchestrator elaborates the probes serially). The text below is the probe's text byte for byte.

```lean
open G5 ZPhi

/-- G5-M4c: `y` odd forces `N(t) ≡ 3 (mod 4)`. -/
theorem g5_u6_m4c (w : List ℕ) (hw : IsWord w) (hy : Odd (W w).trace.y) :
    nrm (W w).trace ≡ 3 [ZMOD 4] := by sorry
```

## 6 · What the row does not claim

- Not the converse, and nothing for y even (for y even, N ≡ x² mod 4; the row is silent).
- Not the equivalence with the clause form as a theorem (a 16-case residue check, not frozen).
- SH-P2-1 proves the clause for every element of G(5) ("not only words", l. 214); the row is the word-level form, the group-level form is U7's.
- The character proof of the mod-4 law (the index-2 character χ of the preimage H of D₅ in SL(2, ℤ[φ]/4), SH-P2-1 §5) is the paper's register and is NOT a Lean target; the Lean route is the finite closure (STATEMENTS.md §2 note 3).

## 7 · Status

SPEC-DRAFT 2026-10-30T10:14:38Z
