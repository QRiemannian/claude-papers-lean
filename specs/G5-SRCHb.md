# G5-SRCHb

## 1 · Header

row: G5-SRCHb
unit: U15 `G5/CensusSearch`
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T21:19:01Z and again at 2026-10-30T21:39:23Z; equal to the brief's edition; this edition EXTENDS the two before it — `head -c 25981` reproduces `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47` (U12/U13's pin) and `head -c 21568` reproduces `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` (the frozen eleven's pin))
source_bytes: 30598 (`wc -c` at 2026-10-30T21:19:01Z and 2026-10-30T21:39:23Z; the edition pair `sha256:4a53d9ba… · 30598 B`)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U5 `G5.Ladder.Challenge` ea6b4aedd3021843c9399543ebbac30b625aeae4cdd18a0b9042b6b33513d11a · U11 `G5.Census.Challenge` ee958447349e411d839a595dd2057af8d284daedcb410f4a71a4eca3d2c2b76c · U13 `G5.CensusCap.Challenge` d10844cbc16f2b02706d4f35d5d9d232d4809812e9ecbdb6265f1339387b067e (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-30T21:19:01Z matches)
locus: `Claude-Papers/No1-G5/phase-2/impl-a/README.md` §3 (l. 99–101) and §1 (c) (l. 52); `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 189 completeness, l. 191 the 1^j / 4^j family, l. 192 the cap required) and slip 3 (l. 352); STATEMENTS.md row G5-SRCH (l. 73) and §6 (l. 66–68); the sweep `Claude-Papers/No1-G5/phase-4/close/L1-printed-uncarried-sweep.md` items 5 and 7 (l. 27, l. 29); the print `Claude-Papers/No1-G5/phase-4/draft/S5-geometry.md` Cor. 5.11 (statement l. 509–512, proof l. 519–528) and the prefix-dominance reading (l. 406–407), quoted beside the record, never instead of it; this spec carries clause (ii), the search visits every class, and the unit's ONE definition `Visited`
spec_clock: 2026-10-30T21:39:23Z

## 2 · Printed statement, verbatim

> **§3.4 Correction to the law sheet's instrument sentence.** §1 reads: "A depth-first search … that abandons a prefix as soon as tr(prefix) > X therefore visits every class with t ≤ X."
> - **Completeness HOLDS** by the lemma.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4, l. 189–190 (the whole lines — the instrument sentence and "Completeness HOLDS")

> - **Proposed correction.** The ladder's cap (or an explicit bound on constant runs) is **required**, not optional. Proposed wording: "the builder MUST cap k by k ≤ X/φ − 1 (or bound constant runs explicitly)". Under the cap the search is finite and still complete, because every class with t ≤ X has k within the cap.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4, l. 192 (the whole line — "Under the cap the search is finite and still complete, because every class with t ≤ X has k within the cap")

> **Census on L1/L3.** Over 1,398,100 nodes, every node's trace is ≥ its parent's trace, with tr I = 2 above k = 1: 0 violations. Every product has entries in ℕ[φ]: 0 violations.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.3, l. 187 (the whole line — the census of prefix dominance, "every node's trace is ≥ its parent's trace")

> 3. **Law sheet §1, instrument (correction).** Pruning at tr(prefix) > X is complete but does not terminate, because 1^j and 4^j keep trace 2. The k cap is required, not optional (§3.4).
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` slips, l. 352 (the whole line — slip 3)

> K = max(2, ⌊X/φ⌋ − 1), with ⌊X/φ⌋ the largest n with nφ ≤ X decided exactly (§4). Why: the ladder (TA
> Theorem 4) gives min t = (k + 1)φ at k ≥ 3, so t ≤ X forces k ≤ X/φ − 1; k ≤ 2 is always admitted (the
> k = 2 minimum 3 + φ lies below 3φ, the sheet erratum's (1, 4) case). For the grid, K = ⌊X/φ⌋ − 1: 14 at
>
> — `Claude-Papers/No1-G5/phase-2/impl-a/README.md` §3, l. 99–101 (the whole lines — the cap the search runs through)

> (i) For every X ∈ ℤ[φ] (the real order) and every non-constant word w with normalized trace t ≤ X, the syllable count satisfies k ≤ max(2, ⌊X/φ⌋ − 1) — equivalently k ≤ 2 or (k + 1)φ ≤ X (the all-X cap; the X ≥ 3φ case is U13's G5-CAPa). (ii) The pruned search — extend a word while every prefix has trace ≤ X and the length is within the cap — visits every class with t ≤ X: every non-empty prefix of a non-constant word with t ≤ X has trace ≤ X (prefix dominance) and length within the cap, for every rotation of the word. (iii) The cap is needed for the search to end, not for completeness: the words 1^j and 4^j have trace 2 for every j ≥ 1, so for every X ≥ 2 infinitely many words pass the trace rule alone.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` row G5-SRCH, l. 73, the statement cell (a verbatim substring; the row's pointer, not the authority)

> The first clause, with $B$ empty, says that the trace of a word dominates the trace of each of its
> prefixes; it is the pruning rule of the census (§5.5, §9.4).
>
> — `Claude-Papers/No1-G5/phase-4/draft/S5-geometry.md` l. 406–407 (prefix dominance, Lemma 5.7 with B empty) (the PRINT)

> > **Corollary 5.11 (the trace-complete census).** *For $X \ge 3\varphi$, a depth-first search over
> > words through the syllable cap $k \le \lfloor X/\varphi\rfloor - 1$, abandoning a prefix as soon as
> > its trace exceeds $X$, visits every class with $t \le X$; for every $X$ the same holds with the cap
> > $\max(2, \lfloor X/\varphi\rfloor - 1)$. The cap sentence "$t \le X$ implies $k \le X/\varphi - 1$"
> *Proof.* Let $w$ be a class with $t \le X$. Every prefix of a rotation of $w$ has trace at most
> $t \le X$ by Lemma 5.7 (with $B$ empty), so the trace rule abandons no prefix of $w$. Since
> $X < (\lfloor X/\varphi\rfloor + 1)\varphi$, Theorem 5.9 with $K = \lfloor X/\varphi\rfloor - 1$,
> which is at least $2$ when $X \ge 3\varphi$, gives $k \le K$, so the cap cuts no prefix of $w$
> either. For $X < 3\varphi$ the cap $\max(2, \lfloor X/\varphi\rfloor - 1)$ is at least $2$, and a
> class with $t \le X$ has $k \le 2$, since $k \ge 3$ gives $t \ge 4\varphi > X$ (Theorem 5.8); so
> again nothing is cut. With the cap $\lfloor X/\varphi\rfloor - 1 = 1$ at
>
> — `Claude-Papers/No1-G5/phase-4/draft/S5-geometry.md` Cor. 5.11, l. 509–512 (statement) and l. 519–525 (proof) (the PRINT, quoted beside the record)

## 3 · Formal reading

- **Non-constant words, not classes.** `w : List ℕ` with U1's `IsWord w` and "non-constant" exactly as U5 writes it, `w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4` (U5's `hc`, byte for byte; U11's and U13's form). The record's classes are the hyperbolic ones; the constant words (1^j), (4^j) have t = 2 at every length (SH-P2-1 l. 191), so the clause is FALSE on them — the hypothesis is part of the statement, not a weakening (own arithmetic: 776 (constant word, X) pairs with t ≤ X break the cap; e.g. (1, 1, 1, 1, 1) at X = 2).
- **t, k, X and the order.** `ntr w` is U1's normalized trace tr(P_{a₁} ⋯ P_{a_k}); k is `w.length`; `X : ZPhi`, the row's "X ∈ ℤ[φ]", in U1's real order (`instLE`/`instLT`, the only order instances on `ZPhi`, no `Preorder`). `((w.length : ZPhi) + 1) * phi` is U5's `g5_u5_lad_a_ge3` form, byte for byte.
- **The search, as the record runs it:** depth-first over syllable lists from the empty root, each node extended by a syllable in {1, 2, 3, 4} (impl-a §2–§3; the print l. 509–511: "a depth-first search over words through the syllable cap …, abandoning a prefix as soon as its trace exceeds X"). A node is reached exactly when each of its proper non-empty prefixes passed both rules, and kept when it passes too. So **"v is visited" ⟺ every non-empty prefix of v passes both rules** — the trace rule `ntr p ≤ X` and the cap rule of G5-SRCHa (`p.length ≤ 2 ∨ ((p.length : ZPhi) + 1) * phi ≤ X`, the all-X cap max(2, ⌊X/φ⌋ − 1), floor-free as in G5-SRCHa §3).
- **The ONE definition of U15, for V₁'s signature: `Visited (X : ZPhi) (v : List ℕ) : Prop`** — `∀ p : List ℕ, p <+: v → p ≠ [] → ntr p ≤ X ∧ (p.length ≤ 2 ∨ ((p.length : ZPhi) + 1) * phi ≤ X)`. "Prefix" is core's `List.IsPrefix` (`p <+: v` ⟺ ∃ t, p ++ t = v; the toolchain's `src/lean/Init/Data/List/Basic.lean:1140`), not a new definition; "non-empty" is `p ≠ []` (the root, tr I = 2, is not a word — the record's "tr I = 2 above k = 1", l. 187). The alphabet {1, …, 4} is not in `Visited`: the theorem's hypothesis `IsWord w` carries it and rotation preserves it. **Equivalent form:** "every non-empty prefix has trace ≤ X, and v's own length is within the cap" — the cap rule is downward-monotone in k ((k + 1)φ ≤ X ⟹ (j + 1)φ ≤ X for j ≤ k, φ > 0), own arithmetic 0 violations over the grid and k < 40; the both-rules-on-every-prefix form is chosen because it is the search's own rule, not a consequence of it.
- **"Visits every class with t ≤ X" is: every rotation of the word is visited.** The record's class is a cyclic word; the lane states words (STATEMENTS.md §2 note 4); the row says "for every rotation of the word" and the print proves "Every prefix of a rotation of w has trace at most t ≤ X" (l. 519). This is at least the class being visited (a representative suffices for the census) — for V₁'s look: every rotation, as the row and print say, rather than some rotation.
- **The cap the search runs through:** the all-X cap (the print's "for every X the same holds with the cap max(2, ⌊X/φ⌋ − 1)", l. 511–512); it contains the print's first clause, X ≥ 3φ with cap ⌊X/φ⌋ − 1, because there ⌊X/φ⌋ ≥ 3 and the two caps coincide.
- **Real X — no weaker (my reasoning):** for a real X with t ≤ X, every prefix p of a rotation v has ntr p ≤ t, so `Visited t v` (t ∈ ℤ[φ]) gives both rules at X.
- **The route on the record (for the L seat; not part of the statement):** a rotation v of w is a word, non-constant, of the same length (`List.IsRotated.perm`) and the same normalized trace (the cyclic trace; U7's Solution proved rotation invariance of `ntr`, STATUS row G5-PHIb); prefix dominance ntr p ≤ ntr v is U5's frozen `g5_u5_mono_a` with `v` empty, iterated over the syllables v adds to p (the print's Lemma 5.7 "with B empty", l. 406–407; record l. 187); the cap rule on p from G5-SRCHa on v and downward monotonicity, `List.IsPrefix.length_le`. The statement imports U1, U5, U11, U13 (the row) and no U3: `g5_u3_*` is not needed by the statement (the brief's "U3 only if a word lemma is needed").
- **Own exact arithmetic** (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/check.py` (output `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/check.out`)): the 657,760 (word, X) pairs of G5-SRCHa, every rotation of every non-constant word, both rules on every non-empty prefix: 0 violations; prefix dominance on all words k ≤ 6 and every non-empty prefix: 0 violations; rotation invariance of `ntr`, k ≤ 6: 0 violations; without `hc` the clause fails ((1, 1, 1, 1, 1) at X = 2 and at X = 4).

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
List.IsPrefix	NOT FOUND
List.IsRotated	FOUND List Mathlib/Data/List/Rotate.lean:362
List.IsRotated.perm	FOUND List.IsRotated Mathlib/Data/List/Rotate.lean:404
List.IsRotated.symm	FOUND List.IsRotated Mathlib/Data/List/Rotate.lean:376
List.isRotated_iff_mod	FOUND List Mathlib/Data/List/Rotate.lean:448
List.IsPrefix.length_le	NOT FOUND
List.take_prefix	NOT FOUND
List.prefix_refl	NOT FOUND
List.replicate	NOT FOUND
Nat.cast_ofNat	FOUND Nat Mathlib/Data/Nat/Cast/Defs.lean:57
```

- `List.IsPrefix` (the `<+:` notation, `src/lean/Init/Data/List/Basic.lean:1140–1142`), `List.IsPrefix.length_le` (`Init/Data/List/Sublist.lean:797`), `List.take_prefix` (`:1112`), `List.prefix_refl` (`:696`), `List.replicate` (`Init/Data/List/Basic.lean:706`) read NOT FOUND because they are Lean core (toolchain `leanprover/lean4:v4.33.0`), not mathlib.
- Targeted by the statement and the definition: `List.IsPrefix` (core), `List.IsRotated` (FOUND, namespace `List`), `List.replicate`, `List.length` (core), U1's `ZPhi`, `phi`, `IsWord`, `ntr`, the real order. Proof aids: `List.IsRotated.perm`, `List.IsRotated.symm`, `List.isRotated_iff_mod`, `List.IsPrefix.length_le`, `List.take_prefix`, `List.prefix_refl`, `Nat.cast_ofNat`, U5's `g5_u5_mono_a`, `g5_u5_lad_a_ge3`.
- No name is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: a syllable list is visited at the bound X when every non-empty prefix has normalized trace at most X and length within the all-X cap; for every X in ℤ[φ], every rotation of every non-constant word whose normalized trace is at most X is visited.

Probe: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/probe-U15.lean` — **NOT RUN by this seat** (the brief: no `lake` command of any kind; no Lean compiled); the orchestrator elaborates it serially and returns exit and first error. The block below sits inside `namespace G5` after `open G5 ZPhi` and is the probe's text byte for byte (the probe's one definition and the second of its four theorems).

```lean
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
```

## 6 · What the row does not claim

- **Not the procedure as a program:** no search is executed or modelled step by step; the visited set is characterized by the rules (§3). Not the census's outputs, the class lists or their digests; not "In particular the census of §9.4 … is trace-complete to X" (print l. 514) as a computation.
- **Not "finite"** (the record's "Under the cap the search is finite", l. 192 — see G5-SRCHc §6) and **not the failure of the cap ⌊X/φ⌋ − 1 on (1, 4)** (U13's frozen G5-CAPb). Not ta4's cap ⌊X/φ⌋ (NOT-ON-THE-LANE, the sweep item 6).
- **Not the stronger pruning clause** (the increment ≥ φ past an opening 2/3 or (1, 4), SH-P2-1 §3.3) — U5's frozen G5-MONOb. Prefix dominance itself is the route (STATEMENTS.md §2 item 7 ruled it proof-internal for U5); here it enters only as part of "visited".
- Nothing about constant words; words, not classes (every rotation, §3).

## 7 · Status

SPEC-DRAFT 2026-10-30T21:39:23Z
