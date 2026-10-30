# G5-CAPb

## 1 · Header

row: G5-CAPb
unit: U13 `G5/CensusCap`
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T18:17:12Z and again at 2026-10-30T18:24:51Z; equal to the brief's edition; this edition EXTENDS the frozen units' edition — `head -c 21568` reproduces `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731`)
source_bytes: 25981 (`wc -c` at 2026-10-30T18:17:12Z and 2026-10-30T18:24:51Z; the edition pair `sha256:1fb5b03e… · 25981 B`)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U5 `G5.Ladder.Challenge` ea6b4aedd3021843c9399543ebbac30b625aeae4cdd18a0b9042b6b33513d11a · U11 `G5.Census.Challenge` ee958447349e411d839a595dd2057af8d284daedcb410f4a71a4eca3d2c2b76c (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-30T18:21:21Z matches)
locus: `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 191–193) and slip 4 (l. 353); `specs/_V3-U11.md` V3-UNCARRIED 4 (l. 48); STATEMENTS.md row G5-CAP (l. 64) and §5 (l. 57–59); the print `Claude-Papers/No1-G5/phase-4/draft/S5-geometry.md` Cor. 5.11 (l. 509–514), quoted beside the record, never instead of it; this spec carries part (b)
spec_clock: 2026-10-30T18:24:51Z

## 2 · Printed statement, verbatim

> **§3.4 Correction to the law sheet's instrument sentence.** §1 reads: "A depth-first search … that abandons a prefix as soon as tr(prefix) > X therefore visits every class with t ≤ X."
> - **Completeness HOLDS** by the lemma.
> - **Termination does not follow.** The prefixes 1^j and 4^j have trace 2 for every j (P₁^j = [[1, jφ], [0, 1]]), so they are never pruned. A search that prunes only at tr > X runs down 1, 1, 1, … without end.
> - **Proposed correction.** The ladder's cap (or an explicit bound on constant runs) is **required**, not optional. Proposed wording: "the builder MUST cap k by k ≤ X/φ − 1 (or bound constant runs explicitly)". Under the cap the search is finite and still complete, because every class with t ≤ X has k within the cap.
> - **Separately, the cap sentence itself.** "A class with t ≤ X has k ≤ X/φ − 1" fails only for the k = 2 class (1, 4) when 3 + φ ≤ X < 3φ, i.e. 4.618… ≤ X < 4.854…. This does not touch any grid X (all ≥ 25). For the record, the exact statement is: for X ≥ 3φ.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4, l. 189–193 (the whole lines; the row's locus is l. 191–193, the heading and first bullet l. 189–190 give the sentence being corrected)

> 4. **Law sheet §1, the cap sentence.** "t ≤ X ⟹ k ≤ X/φ − 1" holds for X ≥ 3φ. It fails only on (1, 4) for X ∈ [3 + φ, 3φ), so no grid point is affected (§3.4).
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` slips, l. 353 (the whole line — slip 4)

> - **V3-UNCARRIED 4 — the census-cap sentence in its corrected form.** SH-P2-1 §3.4 (l. 192–193) and slip 4 (l. 353): "'A class with t ≤ X has k ≤ X/φ − 1' fails only for the k = 2 class (1, 4) when 3 + φ ≤ X < 3φ … For the record, the exact statement is: for X ≥ 3φ"; "'t ≤ X ⟹ k ≤ X/φ − 1' holds for X ≥ 3φ. It fails only on (1, 4) for X ∈ [3 + φ, 3φ)". Row G5-LADc′ cites slip 4 as a source of (b) and U11 carries the (1, 4) uniqueness at the lattice thresholds (K + 2)φ with the strict order; the non-strict, real-threshold form (X ≥ 3φ, cap X/φ − 1) and the exact failure interval [3 + φ, 3φ) are on no theorem.
>
> — `claude-papers-lean/specs/_V3-U11.md` l. 48 (the whole line — V3-UNCARRIED 4, named by the row's third column)

> (a) For every X ∈ ℤ[φ] with 3φ ≤ X (the real order) and every non-constant word w with normalized trace t ≤ X, the syllable count k satisfies (k + 1)φ ≤ X — i.e. k ≤ X/φ − 1, the census cap. (b) The failure interval of the cap sentence is exactly the class (1, 4) at 3 + φ ≤ X < 3φ: if a non-constant word w and X satisfy t ≤ X < (k + 1)φ, then w is a rotation of (1, 4) and 3 + φ ≤ X < 3φ.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` row G5-CAP, l. 64, the statement cell (a verbatim substring; the row's pointer, not the authority)

> > **Corollary 5.11 (the trace-complete census).** *For $X \ge 3\varphi$, a depth-first search over
> > words through the syllable cap $k \le \lfloor X/\varphi\rfloor - 1$, abandoning a prefix as soon as
> > its trace exceeds $X$, visits every class with $t \le X$; for every $X$ the same holds with the cap
> > $\max(2, \lfloor X/\varphi\rfloor - 1)$. The cap sentence "$t \le X$ implies $k \le X/\varphi - 1$"
> > holds for $X \ge 3\varphi$ and fails only on the class $(1, 4)$, for $3 + \varphi \le X < 3\varphi$.
> > In particular the census of §9.4, whose grid has $X \ge 25$, is trace-complete to $X$.*
>
> — `Claude-Papers/No1-G5/phase-4/draft/S5-geometry.md` Cor. 5.11, l. 509–514 (the PRINT, quoted beside the record)

## 3 · Formal reading

- **Non-constant words, not classes.** `w : List ℕ` with U1's `IsWord w` and "non-constant" exactly as U5 writes it, `w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4` (U5's `hc`, byte for byte; U11's form). The record says "a class with t ≤ X"; the lane states words, not classes (STATEMENTS.md §2 note 4), and the record's classes here are the hyperbolic ones: the constant words (1^k), (4^k) have t = 2 for every k (SH-P2-1 l. 191: "The prefixes 1^j and 4^j have trace 2 for every j"), so the cap is FALSE on them at any fixed X — the non-constancy hypothesis is part of the statement, not a weakening (own arithmetic: (1, 1, 1, 1) has t = 2 ≤ 3φ and (4 + 1)φ > 3φ).
- **t and k.** `ntr w` is U1's normalized trace tr(P_{a₁} ⋯ P_{a_k}); k is `w.length`.
- **X and the order.** `X : ZPhi` — the row's "X ∈ ℤ[φ]" — compared in U1's real order (`instLE`: `s ≤ t ↔ RealNonneg (t − s)`, the exact sign of a + b√5; `instLT`: `s ≤ t ∧ s ≠ t`, the only `LE`/`LT` on `ZPhi` in scope). `3 * phi`, `3 + phi` and `((w.length : ZPhi) + 1) * phi` are written as U5 and U11 write them (numerals and the ℕ-cast through the ring's `NatCast`). No real number and no division enter: "k ≤ X/φ − 1" is read as "(k + 1)φ ≤ X" — the row's own gloss — equivalent because φ > 0.
- **Real X on the record, ℤ[φ] X on the row — no weaker, for V₁'s look (my reasoning, not the record's).** The source of record's X is a real threshold ("4.618… ≤ X < 4.854…", l. 193); the row quantifies over ℤ[φ] ("the census grid's X are integers, so no real number enters", the row's Lean notes). The ℤ[φ] form gives the real one back: in (a), for real X ≥ 3φ with t ≤ X, put X′ := max(t, 3φ) ∈ ℤ[φ]; then 3φ ≤ X′, t ≤ X′, so (k + 1)φ ≤ X′ ≤ X; in (b), for real X with t ≤ X < (k + 1)φ, put X′ := t; then w ≅ (1, 4) and k = 2, so 3 + φ ≤ t ≤ X and X < 3φ. So the restriction to ℤ[φ] loses nothing of the record's content.
- **(b), the failure interval.** "If a non-constant word w and X satisfy t ≤ X < (k + 1)φ" — the cap failing, k > X/φ − 1 — is `ht : ntr w ≤ X` and `hX : X < ((w.length : ZPhi) + 1) * phi` (strict, U1's `instLT`), for EVERY X (no `3φ ≤ X` hypothesis: (b) is the complement of (a)'s range). "Then w is a rotation of (1, 4) and 3 + φ ≤ X < 3φ" is `List.IsRotated w [1, 4] ∧ 3 + phi ≤ X ∧ X < 3 * phi` (mathlib's cyclic rotation, as U5 and U11 write it).
- **The converse — a second theorem, for V₁'s signature: keep or strike.** The record says the cap sentence "fails only for the k = 2 class (1, 4) when 3 + φ ≤ X < 3φ" (l. 193) and "fails only on (1, 4) for X ∈ [3 + φ, 3φ)" (l. 353), and the row says the failure interval "is exactly" that class at that interval: "only" is `g5_u13_cap_b`; that it DOES fail there is `g5_u13_cap_b_conv` — every rotation of (1, 4) and every X with `3 + phi ≤ X` and `X < 3 * phi` satisfy `ntr w ≤ X ∧ X < ((w.length : ZPhi) + 1) * phi`. The rotation hypothesis already makes w a non-constant word, so `IsWord` and `hc` are not repeated. The interval is non-empty in ℤ[φ] (3 + φ itself; also ⟨−5, 6⟩, ⟨8, −2⟩ — own arithmetic), so the converse is not vacuous. U11's precedent: its witness clause `g5_u11_census_b_wit` (the existence half of "fails at exactly one value") was kept by V₁ and froze. If V₁ strikes it, the row's (b) stands on `g5_u13_cap_b` alone and nothing else changes.
- **The route on the record (for the L seat; not part of the statement):** k = 1 or k ≥ 3 → U11's `g5_u11_census_a` at K := k − 1 contradicts t ≤ X < (k + 1)φ; so k = 2, t < 3φ, and U11's `g5_u11_census_b` gives the rotation and t = 3 + φ; then 3 + φ = t ≤ X and X < (2 + 1)φ = 3φ. The converse: a rotation of [1, 4] has length 2 (`List.IsRotated.perm`) and t = 3 + φ (U5's `g5_u5_lad_b_two`, or the two rotations by `decide`). Order transitivity on `ZPhi` as in G5-CAPa §3.
- **Own exact arithmetic** (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD2/check.py`): the same 657,760 (word, X) pairs: (b) 0 violations, and the words on which the cap fails for some X are exactly (1, 4) and (4, 1); the converse at every grid X in [3 + φ, 3φ) for both rotations: 0 violations.

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
List.IsRotated	FOUND List Mathlib/Data/List/Rotate.lean:362
List.replicate	NOT FOUND
List.length	NOT FOUND
List.IsRotated.perm	FOUND List.IsRotated Mathlib/Data/List/Rotate.lean:404
List.IsRotated.symm	FOUND List.IsRotated Mathlib/Data/List/Rotate.lean:376
List.isRotated_iff_mod	FOUND List Mathlib/Data/List/Rotate.lean:448
Nat.cast_ofNat	FOUND Nat Mathlib/Data/Nat/Cast/Defs.lean:57
```

- `List.replicate`, `List.length` NOT FOUND: Lean core (as G5-CAPa §4); used verbatim by the frozen U5/U11 Challenges.
- Targeted by the statement: `List.IsRotated` (FOUND, namespace `List`), `List.replicate`, `List.length` (core), U1's `ZPhi`, `phi`, `IsWord`, `ntr`, the real order. Proof aids: `List.IsRotated.perm` (length of a rotation), `List.IsRotated.symm`, `List.isRotated_iff_mod`, `Nat.cast_ofNat`.
- No name is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: if a non-constant word has normalized trace at most X and X is below (k + 1)φ in the real order, the word is a rotation of (1, 4) and 3 + φ ≤ X < 3φ; and conversely every rotation of (1, 4) has t ≤ X < (k + 1)φ for every X with 3 + φ ≤ X < 3φ.

Probe: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD2/probe-U13.lean` — **NOT RUN by this seat** (the brief: no `lake` command of any kind); the orchestrator elaborates it serially and returns exit and first error. The block below sits inside `namespace G5` after `open G5 ZPhi` and is the probe's text byte for byte (the second and third of the probe's three theorems).

```lean
/-- G5-CAPb (the failure interval of the cap). If a non-constant word has normalized
trace `t ≤ X < (k + 1) φ` (real order), `k` its length, then it is a rotation of
`(1, 4)` and `3 + φ ≤ X < 3φ`.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 193), slip 4
(l. 353); STATEMENTS.md row G5-CAP (l. 64), part (b).
STATEMENTS.md sha256 prefix `1fb5b03e`. -/
theorem g5_u13_cap_b (X : ZPhi) (w : List ℕ) (hw : IsWord w)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4)
    (ht : ntr w ≤ X) (hX : X < ((w.length : ZPhi) + 1) * phi) :
    List.IsRotated w [1, 4] ∧ 3 + phi ≤ X ∧ X < 3 * phi := by sorry

/-- G5-CAPb (the converse: the cap fails on that interval). A rotation of `(1, 4)` and
any `X` with `3 + φ ≤ X < 3φ` (real order) satisfy `t ≤ X < (k + 1) φ`, `k` its length.
Locus: `candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 193), slip 4
(l. 353), "fails … for X ∈ [3 + φ, 3φ)"; STATEMENTS.md row G5-CAP (l. 64), part (b),
"exactly". STATEMENTS.md sha256 prefix `1fb5b03e`. -/
theorem g5_u13_cap_b_conv (X : ZPhi) (w : List ℕ) (hr : List.IsRotated w [1, 4])
    (h1 : 3 + phi ≤ X) (h2 : X < 3 * phi) :
    ntr w ≤ X ∧ X < ((w.length : ZPhi) + 1) * phi := by sorry
```

## 6 · What the row does not claim

- The printed max(2, ⌊X/φ⌋ − 1) cap, the instrument sentences, the grid remark and Cor. 5.11's "In particular" are not claimed (as G5-CAPa §6).
- No decimal value of the interval's ends (4.618…, 4.854…, l. 193) is stated — the ends are 3 + φ and 3φ in ℤ[φ]; nothing about constant words; words, not classes.

## 7 · Status

SPEC-DRAFT 2026-10-30T18:24:51Z
