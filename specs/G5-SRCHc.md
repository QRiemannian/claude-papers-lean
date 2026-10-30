# G5-SRCHc

## 1 · Header

row: G5-SRCHc
unit: U15 `G5/CensusSearch`
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T21:19:01Z and again at 2026-10-30T21:39:23Z; equal to the brief's edition; this edition EXTENDS the two before it — `head -c 25981` reproduces `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47` (U12/U13's pin) and `head -c 21568` reproduces `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` (the frozen eleven's pin))
source_bytes: 30598 (`wc -c` at 2026-10-30T21:19:01Z and 2026-10-30T21:39:23Z; the edition pair `sha256:4a53d9ba… · 30598 B`)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U5 `G5.Ladder.Challenge` ea6b4aedd3021843c9399543ebbac30b625aeae4cdd18a0b9042b6b33513d11a · U11 `G5.Census.Challenge` ee958447349e411d839a595dd2057af8d284daedcb410f4a71a4eca3d2c2b76c · U13 `G5.CensusCap.Challenge` d10844cbc16f2b02706d4f35d5d9d232d4809812e9ecbdb6265f1339387b067e (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-30T21:19:01Z matches)
locus: `Claude-Papers/No1-G5/phase-2/impl-a/README.md` §3 (l. 99–101) and §1 (c) (l. 52); `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 189 completeness, l. 191 the 1^j / 4^j family, l. 192 the cap required) and slip 3 (l. 352); STATEMENTS.md row G5-SRCH (l. 73) and §6 (l. 66–68); the sweep `Claude-Papers/No1-G5/phase-4/close/L1-printed-uncarried-sweep.md` items 5 and 7 (l. 27, l. 29); the print `Claude-Papers/No1-G5/phase-4/draft/S5-geometry.md` Cor. 5.11 (statement l. 509–512, proof l. 519–528) and the prefix-dominance reading (l. 406–407), quoted beside the record, never instead of it; this spec carries clause (iii), the cap is needed to end
spec_clock: 2026-10-30T21:39:23Z

## 2 · Printed statement, verbatim

> - **Termination does not follow.** The prefixes 1^j and 4^j have trace 2 for every j (P₁^j = [[1, jφ], [0, 1]]), so they are never pruned. A search that prunes only at tr > X runs down 1, 1, 1, … without end.
> - **Proposed correction.** The ladder's cap (or an explicit bound on constant runs) is **required**, not optional. Proposed wording: "the builder MUST cap k by k ≤ X/φ − 1 (or bound constant runs explicitly)". Under the cap the search is finite and still complete, because every class with t ≤ X has k within the cap.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4, l. 191–192 (the whole lines — "Termination does not follow"; the cap "required, not optional")

> 3. **Law sheet §1, instrument (correction).** Pruning at tr(prefix) > X is complete but does not terminate, because 1^j and 4^j keep trace 2. The k cap is required, not optional (§3.4).
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` slips, l. 352 (the whole line — slip 3)

> X = 25, 987 at 1600, 1853 at 3000, 1976 at 3200, 7415 at 12000. The cap is REQUIRED for termination of a
> prefix-only search (erratum); in this build rule (ii) already implies it (at 1^m, B = {2, 3, 4} and
>
> — `Claude-Papers/No1-G5/phase-2/impl-a/README.md` §3, l. 102–103 (the whole lines — "The cap is REQUIRED for termination of a prefix-only search")

> (i) For every X ∈ ℤ[φ] (the real order) and every non-constant word w with normalized trace t ≤ X, the syllable count satisfies k ≤ max(2, ⌊X/φ⌋ − 1) — equivalently k ≤ 2 or (k + 1)φ ≤ X (the all-X cap; the X ≥ 3φ case is U13's G5-CAPa). (ii) The pruned search — extend a word while every prefix has trace ≤ X and the length is within the cap — visits every class with t ≤ X: every non-empty prefix of a non-constant word with t ≤ X has trace ≤ X (prefix dominance) and length within the cap, for every rotation of the word. (iii) The cap is needed for the search to end, not for completeness: the words 1^j and 4^j have trace 2 for every j ≥ 1, so for every X ≥ 2 infinitely many words pass the trace rule alone.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` row G5-SRCH, l. 73, the statement cell (a verbatim substring; the row's pointer, not the authority)

> Remark 5.10 it is the only class so cut. The cap is needed for the search to end, not for completeness: the prefixes $1^j$ and $4^j$
> have trace $2$ for every $j$ and are never abandoned by the trace rule alone. $\square$
>
> — `Claude-Papers/No1-G5/phase-4/draft/S5-geometry.md` Cor. 5.11's proof, l. 527–528 (the PRINT, quoted beside the record)

## 3 · Formal reading

- **Two theorems, for V₁'s signature.** The row's clause (iii) is a family and its consequence: **`g5_u15_srch_const`** — for every j ≥ 1, `ntr (List.replicate j 1) = 2 ∧ ntr (List.replicate j 4) = 2` ("the words 1^j and 4^j have trace 2 for every j ≥ 1"; the record's "The prefixes 1^j and 4^j have trace 2 for every j (P₁^j = [[1, jφ], [0, 1]])", l. 191); **`g5_u15_srch_inf`** — for every X with `2 ≤ X`, the set of words every non-empty prefix of which has `ntr ≤ X` is infinite (`Set.Infinite`) ("so for every X ≥ 2 infinitely many words pass the trace rule alone"; the record's "so they are never pruned. A search that prunes only at tr > X runs down 1, 1, 1, … without end", l. 191).
- **"Trace 2"** is U1's normalized trace equal to the numeral `(2 : ZPhi)` = ⟨2, 0⟩; P₄^j = [[1, 0], [jφ, 1]] likewise has trace 2 (own arithmetic).
- **`hj : 1 ≤ j`** is the row's "j ≥ 1" (words are non-empty); the identity holds at j = 0 too (`ntr [] = tr I = 2`), so `hj` is carried as the row's text, unused by a proof — V₁ may strike it (the precedent: U12's `hk` carried unused in G5-EVKb).
- **"Pass the trace rule alone"** is `IsWord v ∧ ∀ p : List ℕ, p <+: v → p ≠ [] → ntr p ≤ X` — `Visited` (G5-SRCHb) with the cap rule removed, the alphabet kept (`IsWord`). It is written inline in the set: U15's one definition stays `Visited`.
- **`2 ≤ X` (the real order) is exact, not a convenience:** every word has t ≥ 2 (U5's frozen `g5_u5_mono_prod`: a block product is ≥ I entrywise in the real order, so its trace is ≥ 2; own arithmetic: no word of length ≤ 6 has t < 2, and the twelve with t = 2 are the constant ones), so for X < 2 no word passes and the set is empty; for X ≥ 2 the 1^j all pass.
- **"Required" — my reading, as the brief asks.** The record's sense is necessity: "Termination does not follow" (l. 191), "The ladder's cap … is **required**, not optional" (l. 192), "pruning at tr(prefix) > X is complete but does not terminate" (slip 3, l. 352). The theorem form of necessity is the infinite family: without the cap the visited set is infinite, so a search that enumerates it does not end — `g5_u15_srch_inf`. The "not for completeness" half is G5-SRCHb: the capped search already visits every class, and the uncapped visited set contains the capped one. The wording "needed for the search to end, not for completeness" is the PRINT's, not the record's (whole-record grep `/usr/bin/grep -rn "needed for the search to end"` over `Claude-Papers/No1-G5/`: 6 hits — STATEMENTS.md l. 73, `phase-4/draft/S5-geometry.md` l. 527, its two print copies `phase-4/draft/scratch-back-matter/print-S5-geometry.md` l. 527 and `phase-4/draft/scratch-§5/S5.5-HELD.md` l. 50, the sweep l. 29, the brief l. 13; none under `candidates/` or `phase-2/`); the record's words are l. 191–192 above.
- **The route on the record (for the L seat; not part of the statement):** `g5_u15_srch_const` by induction on j with P₁^j = [[1, jφ], [0, 1]] (l. 191), or from U3's frozen `g5_u3_a_y_eq_zero` (constant words: y = 0 and x = 2) on the Solution's prelude rule; `g5_u15_srch_inf` by `Set.infinite_of_injective_forall_mem` on j ↦ `List.replicate (j + 1) 1` (every non-empty prefix of 1^j is some 1^i, trace 2 ≤ X).
- **Own exact arithmetic** (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/check.py` (output `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/check.out`)): j = 1, …, 40: both traces ⟨2, 0⟩, 0 violations; at X = 2 every non-empty prefix of 1^j, j ≤ 40, passes; at X = ⟨1, 0⟩ the word (1) does not.

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
Set.Infinite	FOUND Set Mathlib/Data/Finite/Defs.lean:205
Set.infinite_of_injective_forall_mem	FOUND Set Mathlib/Data/Set/Finite/Basic.lean:909
Set.infinite_of_not_bddAbove	FOUND Set Mathlib/Data/Set/Finite/Lattice.lean:430
List.replicate	NOT FOUND
List.length_replicate	NOT FOUND
List.IsPrefix	NOT FOUND
Matrix.trace_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:220
```

- `List.replicate`, `List.length_replicate` (`src/lean/Init/Data/List/Basic.lean:706`, `:713`), `List.IsPrefix` (`:1140`) NOT FOUND: Lean core (toolchain `leanprover/lean4:v4.33.0`).
- Targeted by the statements: `Set.Infinite` (FOUND, namespace `Set`), `List.replicate`, `List.IsPrefix` (core), U1's `IsWord`, `ntr`, the real order. Proof aids: `Set.infinite_of_injective_forall_mem`, `Set.infinite_of_not_bddAbove`, `List.length_replicate`, `Matrix.trace_fin_two`.
- No name is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for every j ≥ 1 the constant words 1^j and 4^j have normalized trace 2; and for every X in ℤ[φ] at least 2 in the real order, infinitely many words have every non-empty prefix of normalized trace at most X.

Probe: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/probe-U15.lean` — **NOT RUN by this seat** (the brief: no `lake` command of any kind; no Lean compiled); the orchestrator elaborates it serially and returns exit and first error. The block below sits inside `namespace G5` after `open G5 ZPhi` and is the probe's text byte for byte (the third and fourth of the probe's four theorems).

```lean
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
```

## 6 · What the row does not claim

- **Not the sufficiency half "under the cap the search is finite"** — the record's (`SH-P2-1` l. 192, "Under the cap the search is finite and still complete"; whole-record grep `/usr/bin/grep -rn "search is finite"` over `Claude-Papers/No1-G5/`: 1 hit, that line; `"finite and still complete"`: 1 hit, the same line) and not a sentence of the print (Cor. 5.11 and its proof, l. 509–528, say "needed for the search to end", the necessity half). Offered, not specced: by "print pulls the lane" the print's sentence is the necessity, which `g5_u15_srch_inf` states.
- **Not termination as a property of a program** (no algorithm is modelled; the lane states sets, §3); not "the explicit bound on constant runs" alternative (l. 192).
- **Not the counting corollary** ((4^k + 4)/5) and **not ta4's cap ⌊X/φ⌋** — the sweep's two NOT-PRINTED items (`Claude-Papers/No1-G5/phase-4/close/L1-printed-uncarried-sweep.md` items 4 and 6), the record's, off the lane by the wall's rule.

## 7 · Status

SPEC-DRAFT 2026-10-30T21:39:23Z

V1: V1-GREEN 2026-10-30T21:50:45Z — `g5_u15_srch_const` and `g5_u15_srch_inf` say exactly clause (iii) of row G5-SRCH (l. 73) against SH-P2-1 §3.4 l. 191–192 and slip 3 l. 352: 1^j and 4^j have trace 2, so for every X ≥ 2 (real order) infinitely many words pass the trace rule alone — the necessity reading of "required". `hj : 1 ≤ j` KEPT: it is the ROW's "j ≥ 1" (the record l. 191 and the print l. 528 say "for every j"; the record's j ranges over prefixes, which are non-empty), inert at j = 0, precedent U12's `hk` kept; the brief's "the record says j ≥ 1, SH-P2-1 l. 191" is the row's wording, not l. 191's. The threshold `2 ≤ X` is exact (every word has t ≥ 2; no word k ≤ 8 has t < 2). The set carries `IsWord v`, so the filler is never read. The sufficiency half "Under the cap the search is finite" left off — AGREE: it is the record's sentence only (/usr/bin/grep -rn "search is finite" over Claude-Papers/No1-G5/ and Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/: 3 hits, the record line SH-P2-1 l. 192 and two briefs issued after M closed; "finite and still complete": 1 hit, the same line), the print's Cor. 5.11 and its proof (l. 509–528) assert no finiteness, and the row's clause (iii) is the necessity alone; not a missing clause. M's print-only claim for "needed for the search to end" checked: 8 hits now over Claude-Papers/No1-G5/ (M's six plus FOLD-LOG l. 418 and this seat's brief, both written after M's grep), none under candidates/ or phase-2/; 0 under the session root. Own arithmetic: ntr 1^j = ntr 4^j = ⟨2, 0⟩ for j = 0 … 60, 0 failures. §2 quotes whole-line verbatim at the cited lines; §5 block a byte substring of probe-U15.lean (one occurrence).
V1-SPLIT-OK: G5-SRCH → SRCHc = clause (iii), with its two theorems (the family; its consequence) signed.
Parse: 0 Lean line(s) over 100 code points
