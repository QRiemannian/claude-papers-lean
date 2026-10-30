import Mathlib
import G5.Ring.Challenge
import G5.Ladder.Challenge
import G5.Census.Challenge
import G5.CensusCap.Challenge

/-!
# Unit U15 (`G5/CensusSearch`) — Cor. 5.11's cap and search family (row G5-SRCH): statements

Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)* (QRiemannian Research).
Source of record: `Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, edition sha256
`9ebf30048d9d246295226f9f8aa7ac86da0d72956e1c1d6e0c45d4eda57c79b3` · 31612 B (the
§6 errata appended after V₁), which EXTENDS the editions before it: its first 30598 B
are the edition sha256 `4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f`
· 30598 B (the specs' edition; the docstrings below carry its prefix `4a53d9ba`), its
first 25981 B the edition `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47`
and its first 21568 B the edition
`a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731`.
Rows stated (STATEMENTS.md §6, l. 73): G5-SRCHa (clause (i), the all-X cap), G5-SRCHb
(clause (ii), the search visits every class), G5-SRCHc (clause (iii), the cap is needed).
This unit defines ONE thing, the visited predicate `Visited`. `ZPhi`, `phi`, the real
order, `IsWord`, `ntr` are unit U1's (`G5.Ring.Challenge`); unit U5 (`G5.Ladder.Challenge`,
the non-constancy form), unit U11 (`G5.Census.Challenge`) and unit U13
(`G5.CensusCap.Challenge`) are imported for the pieces the proof composes with. All four
imported units are frozen. Every proof here is `sorry`.
-/

open G5 ZPhi

namespace G5

/-- G5-SRCHa (Cor. 5.11, the all-X cap). For every `X` in ℤ[φ], every non-constant word
with normalized trace `t ≤ X` (real order) has `k ≤ 2` or `(k + 1) φ ≤ X`, `k` its length
— the cap `k ≤ max(2, ⌊X/φ⌋ − 1)`, floor-free.
Locus: `phase-2/impl-a/README.md` §3 (l. 99–101), §1 (c) (l. 52); STATEMENTS.md row
G5-SRCH (l. 73), clause (i). STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u15_srch_cap (X : ZPhi) (w : List ℕ) (hw : IsWord w)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4)
    (ht : ntr w ≤ X) :
    w.length ≤ 2 ∨ ((w.length : ZPhi) + 1) * phi ≤ X := by sorry

/-- G5-SRCH, the one definition: the pruned search's visited set at the bound `X`. A list
is visited when every non-empty prefix passes both rules of the search: normalized trace
`≤ X`, and length `k` within the cap of G5-SRCHa (`k ≤ 2` or `(k + 1) φ ≤ X`, real order).
Locus: `phase-2/impl-a/README.md` §3 (l. 99–101);
`candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 189, l. 192);
STATEMENTS.md row G5-SRCH (l. 73), clause (ii). STATEMENTS.md sha256 prefix `4a53d9ba`. -/
def Visited (X : ZPhi) (v : List ℕ) : Prop :=
  ∀ p : List ℕ, p <+: v → p ≠ [] →
    ntr p ≤ X ∧ (p.length ≤ 2 ∨ ((p.length : ZPhi) + 1) * phi ≤ X)

/-- G5-SRCHb (Cor. 5.11, the search visits every class). For every `X` in ℤ[φ] and every
non-constant word with normalized trace `t ≤ X` (real order), every rotation of the word
is visited: each of its non-empty prefixes has trace `≤ X` and length within the cap.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 189, l. 192),
slip 3 (l. 352); STATEMENTS.md row G5-SRCH (l. 73), clause (ii).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u15_srch_visit (X : ZPhi) (w : List ℕ) (hw : IsWord w)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4)
    (ht : ntr w ≤ X) (v : List ℕ) (hv : List.IsRotated w v) :
    Visited X v := by sorry

/-- G5-SRCHc (Cor. 5.11, the cap is needed to end: the family). For every `j ≥ 1` the
constant words `1^j` and `4^j` have normalized trace `2`.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 191), slip 3
(l. 352); STATEMENTS.md row G5-SRCH (l. 73), clause (iii).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u15_srch_const (j : ℕ) (hj : 1 ≤ j) :
    ntr (List.replicate j 1) = 2 ∧ ntr (List.replicate j 4) = 2 := by sorry

/-- G5-SRCHc (Cor. 5.11, the cap is needed to end). For every `X` in ℤ[φ] with `2 ≤ X`
(real order), infinitely many words pass the trace rule alone: every non-empty prefix has
normalized trace `≤ X`.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 191, l. 192),
slip 3 (l. 352); STATEMENTS.md row G5-SRCH (l. 73), clause (iii).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u15_srch_inf (X : ZPhi) (hX : 2 ≤ X) :
    Set.Infinite
      {v : List ℕ | IsWord v ∧ ∀ p : List ℕ, p <+: v → p ≠ [] → ntr p ≤ X} := by sorry

end G5
