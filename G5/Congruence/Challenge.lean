import Mathlib
import G5.Ring.Challenge

/-!
# Unit U6 (`G5/Congruence`) — the mod-4 and mod-3 closures: statements

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Source of record: `Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, sha256 prefix `c6abadff`.
Rows stated: G5-M4a, G5-M4b, G5-M4c, G5-M4d, G5-M3a, G5-M3b; the definitions block is
row G5-U6-DEFS (`ZPhi.red4`, `ZPhi.red3`, `G5.H4`), byte for byte from its spec, placed
as the probe places it. Every other name is unit U1's, imported from `G5.Ring.Challenge`.
Every proof here is `sorry`; the proofs live in `G5/Congruence/Solution.lean`.

Loci, short forms: AM, DO = the analytical-methods and depth-operations transcripts of
`Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/`; under
`Claude-Papers/No1-G5/`: LEDGER = `candidates/LEDGER.md`, SH-P2-1 =
`candidates/checks/SH-P2-1-sector-ladder-pruning.md`, PHASE-2-DEFINITIONS =
`phase-2/PHASE-2-DEFINITIONS.md`.
-/

/- G5-U6-DEFS. Locus: AM §2.3 (l. 95); DO §3.2 (l. 103), §10 D-2 (l. 246);
PHASE-2-DEFINITIONS §1 (l. 15). STATEMENTS.md sha256 prefix `c6abadff`. -/
open G5 ZPhi

/-- Reduction of ℤ[φ] mod 4 as pairs mod 4: `x + y φ ↦ (x mod 4, y mod 4)`. -/
def ZPhi.red4 (t : ZPhi) : ZMod 4 × ZMod 4 := ((t.x : ZMod 4), (t.y : ZMod 4))

/-- Reduction of ℤ[φ] mod 3 as pairs mod 3: `x + y φ ↦ (x mod 3, y mod 3)`. -/
def ZPhi.red3 (t : ZPhi) : ZMod 3 × ZMod 3 := ((t.x : ZMod 3), (t.y : ZMod 3))

/-- `H₄`: the eight residues `(x mod 4, y mod 4)` the record allows. -/
def G5.H4 : Finset (ZMod 4 × ZMod 4) :=
  {(0, 0), (0, 1), (0, 2), (0, 3), (2, 0), (2, 2), (1, 3), (3, 1)}

namespace G5

/- G5-M4a. Locus: AM §2.3 (l. 95, l. 100); DO §3.2 (l. 103, l. 109);
SH-P2-1 §5 (l. 276, l. 284). Image order 320, read at the word level.
STATEMENTS.md sha256 prefix `c6abadff`. -/
/-- G5-M4a: the literal words reduce mod 4 to exactly 320 matrices. -/
theorem g5_u6_m4a :
    ((fun w : List ℕ => (W w).map red4) '' {w | IsWord w}).ncard = 320 := by sorry

/- G5-M4b. Locus: DO §3.2 D-2 (l. 118–120) and §10 D-2 (l. 246); AM §2.4 (l. 113, l. 115);
PHASE-2-DEFINITIONS §1 (l. 15). The row text, H₄ form; inclusion only.
STATEMENTS.md sha256 prefix `c6abadff`. -/
/-- G5-M4b: the trace of every literal word lies in `H₄` mod 4. -/
theorem g5_u6_m4b (w : List ℕ) (hw : IsWord w) : red4 (W w).trace ∈ H4 := by sorry

/- G5-M4c. Locus: SH-P2-1 §5 (l. 212, l. 214–216, l. 288) and note 6 (l. 357);
LEDGER row AM-4 (l. 16). No converse is stated.
STATEMENTS.md sha256 prefix `c6abadff`. -/
/-- G5-M4c: `y` odd forces `N(t) ≡ 3 (mod 4)`. -/
theorem g5_u6_m4c (w : List ℕ) (hw : IsWord w) (hy : Odd (W w).trace.y) :
    nrm (W w).trace ≡ 3 [ZMOD 4] := by sorry

/- G5-M4d. Locus: LEDGER row AM-4 (l. 16, the adopted statement); AM §2.4 (l. 113, l. 115),
§6 (l. 225); SH-P2-1 §5 "Bonus" (l. 274).
STATEMENTS.md sha256 prefix `c6abadff`. -/
/-- G5-M4d: the ledger's two clauses (row AM-4). -/
theorem g5_u6_m4d (w : List ℕ) (hw : IsWord w) :
    (Even w.length → Even (W w).trace.y →
        (W w).trace.x ≡ 2 [ZMOD 4] ∧ (W w).trace.y ≡ 0 [ZMOD 4]) ∧
      (Odd (W w).trace.y →
        (W w).trace.x ≡ 0 [ZMOD 4] ∨ (W w).trace.x ≡ -(W w).trace.y [ZMOD 4]) := by sorry

/- G5-M3a. Locus: AM §2.3 (l. 95, l. 103); DO §3.2 (l. 103, l. 108).
Image order 120, read at the word level.
STATEMENTS.md sha256 prefix `c6abadff`. -/
/-- G5-M3a: the literal words reduce mod 3 to exactly 120 matrices. -/
theorem g5_u6_m3a :
    ((fun w : List ℕ => (W w).map red3) '' {w | IsWord w}).ncard = 120 := by sorry

/- G5-M3b. Locus: LEDGER row AM-5 (l. 17); AM §2.4 (l. 113, l. 116), §6 (l. 226);
DO §3.2 D-2 (iii) (l. 121), §10 D-2 (l. 246).
STATEMENTS.md sha256 prefix `c6abadff`. -/
/-- G5-M3b: no literal word has trace with `x ≡ y ≢ 0 (mod 3)`. -/
theorem g5_u6_m3b (w : List ℕ) (hw : IsWord w) :
    ¬ ((W w).trace.x ≡ (W w).trace.y [ZMOD 3] ∧ ¬ ((W w).trace.x ≡ 0 [ZMOD 3])) := by sorry

end G5
