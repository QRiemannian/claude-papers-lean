# G5-SRCHa

## 1 · Header

row: G5-SRCHa
unit: U15 `G5/CensusSearch`
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T21:19:01Z and again at 2026-10-30T21:39:23Z; equal to the brief's edition; this edition EXTENDS the two before it — `head -c 25981` reproduces `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47` (U12/U13's pin) and `head -c 21568` reproduces `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` (the frozen eleven's pin))
source_bytes: 30598 (`wc -c` at 2026-10-30T21:19:01Z and 2026-10-30T21:39:23Z; the edition pair `sha256:4a53d9ba… · 30598 B`)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U5 `G5.Ladder.Challenge` ea6b4aedd3021843c9399543ebbac30b625aeae4cdd18a0b9042b6b33513d11a · U11 `G5.Census.Challenge` ee958447349e411d839a595dd2057af8d284daedcb410f4a71a4eca3d2c2b76c · U13 `G5.CensusCap.Challenge` d10844cbc16f2b02706d4f35d5d9d232d4809812e9ecbdb6265f1339387b067e (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-30T21:19:01Z matches)
locus: `Claude-Papers/No1-G5/phase-2/impl-a/README.md` §3 (l. 99–101) and §1 (c) (l. 52); `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 189 completeness, l. 191 the 1^j / 4^j family, l. 192 the cap required) and slip 3 (l. 352); STATEMENTS.md row G5-SRCH (l. 73) and §6 (l. 66–68); the sweep `Claude-Papers/No1-G5/phase-4/close/L1-printed-uncarried-sweep.md` items 5 and 7 (l. 27, l. 29); the print `Claude-Papers/No1-G5/phase-4/draft/S5-geometry.md` Cor. 5.11 (statement l. 509–512, proof l. 519–528) and the prefix-dominance reading (l. 406–407), quoted beside the record, never instead of it; this spec carries clause (i), the all-X cap
spec_clock: 2026-10-30T21:39:23Z

## 2 · Printed statement, verbatim

> K = max(2, ⌊X/φ⌋ − 1), with ⌊X/φ⌋ the largest n with nφ ≤ X decided exactly (§4). Why: the ladder (TA
> Theorem 4) gives min t = (k + 1)φ at k ≥ 3, so t ≤ X forces k ≤ X/φ − 1; k ≤ 2 is always admitted (the
> k = 2 minimum 3 + φ lies below 3φ, the sheet erratum's (1, 4) case). For the grid, K = ⌊X/φ⌋ − 1: 14 at
>
> — `Claude-Papers/No1-G5/phase-2/impl-a/README.md` §3 "The syllable cap", l. 99–101 (the whole lines)

> **(c) The syllable cap is required (sheet erratum 00:08:03Z).** This build caps k from its first line
> (§3), and its pruning rule (§2) terminates on its own: the run counter `cap_cuts` (children refused by the
> cap alone) is 0 at every X run. Recorded as the erratum asks: the cap is K = max(2, ⌊X/φ⌋ − 1) and the
> reason is the ladder.
>
> — `Claude-Papers/No1-G5/phase-2/impl-a/README.md` §1 (c), l. 50–53 (the whole lines; the row's locus is l. 52)

> - **Proposed correction.** The ladder's cap (or an explicit bound on constant runs) is **required**, not optional. Proposed wording: "the builder MUST cap k by k ≤ X/φ − 1 (or bound constant runs explicitly)". Under the cap the search is finite and still complete, because every class with t ≤ X has k within the cap.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4, l. 192 (the whole line — "every class with t ≤ X has k within the cap")

> (i) For every X ∈ ℤ[φ] (the real order) and every non-constant word w with normalized trace t ≤ X, the syllable count satisfies k ≤ max(2, ⌊X/φ⌋ − 1) — equivalently k ≤ 2 or (k + 1)φ ≤ X (the all-X cap; the X ≥ 3φ case is U13's G5-CAPa). (ii) The pruned search — extend a word while every prefix has trace ≤ X and the length is within the cap — visits every class with t ≤ X: every non-empty prefix of a non-constant word with t ≤ X has trace ≤ X (prefix dominance) and length within the cap, for every rotation of the word. (iii) The cap is needed for the search to end, not for completeness: the words 1^j and 4^j have trace 2 for every j ≥ 1, so for every X ≥ 2 infinitely many words pass the trace rule alone.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` row G5-SRCH, l. 73, the statement cell (a verbatim substring; the row's pointer, not the authority)

> > **Corollary 5.11 (the trace-complete census).** *For $X \ge 3\varphi$, a depth-first search over
> > words through the syllable cap $k \le \lfloor X/\varphi\rfloor - 1$, abandoning a prefix as soon as
> > its trace exceeds $X$, visits every class with $t \le X$; for every $X$ the same holds with the cap
> > $\max(2, \lfloor X/\varphi\rfloor - 1)$. The cap sentence "$t \le X$ implies $k \le X/\varphi - 1$"
> either. For $X < 3\varphi$ the cap $\max(2, \lfloor X/\varphi\rfloor - 1)$ is at least $2$, and a
> class with $t \le X$ has $k \le 2$, since $k \ge 3$ gives $t \ge 4\varphi > X$ (Theorem 5.8); so
> again nothing is cut. With the cap $\lfloor X/\varphi\rfloor - 1 = 1$ at
>
> — `Claude-Papers/No1-G5/phase-4/draft/S5-geometry.md` Cor. 5.11, l. 509–512 (statement) and l. 523–525 (the proof's all-X step) (the PRINT, quoted beside the record)

## 3 · Formal reading

- **Non-constant words, not classes.** `w : List ℕ` with U1's `IsWord w` and "non-constant" exactly as U5 writes it, `w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4` (U5's `hc`, byte for byte; U11's and U13's form). The record's classes are the hyperbolic ones; the constant words (1^j), (4^j) have t = 2 at every length (SH-P2-1 l. 191), so the clause is FALSE on them — the hypothesis is part of the statement, not a weakening (own arithmetic: 776 (constant word, X) pairs with t ≤ X break the cap; e.g. (1, 1, 1, 1, 1) at X = 2).
- **t, k, X and the order.** `ntr w` is U1's normalized trace tr(P_{a₁} ⋯ P_{a_k}); k is `w.length`; `X : ZPhi`, the row's "X ∈ ℤ[φ]", in U1's real order (`instLE`/`instLT`, the only order instances on `ZPhi`, no `Preorder`). `((w.length : ZPhi) + 1) * phi` is U5's `g5_u5_lad_a_ge3` form, byte for byte.
- **The cap, floor-free — why it is the print's max(2, ⌊X/φ⌋ − 1).** For an integer k ≥ 1: k ≤ max(2, m) ⟺ k ≤ 2 ∨ k ≤ m; and with m = ⌊X/φ⌋ − 1, k ≤ ⌊X/φ⌋ − 1 ⟺ k + 1 ≤ ⌊X/φ⌋ ⟺ k + 1 ≤ X/φ (k + 1 is an integer, the floor's defining property) ⟺ (k + 1)φ ≤ X (φ > 0). The record's own floor is "⌊X/φ⌋ the largest n with nφ ≤ X decided exactly" (impl-a l. 99), so k + 1 ≤ ⌊X/φ⌋ ⟺ (k + 1)φ ≤ X by its words. Hence the conclusion `w.length ≤ 2 ∨ ((w.length : ZPhi) + 1) * phi ≤ X` — the row's own gloss ("equivalently k ≤ 2 or (k + 1)φ ≤ X", l. 73). No real number, no floor and no `max` enter. Own arithmetic: over the grid of X below and k < 40, the two forms disagree 0 times.
- **For every X** — no lower bound on X (the record: "k ≤ 2 is always admitted", impl-a l. 100). At X ≥ 3φ the clause is U13's frozen `g5_u13_cap_a` (there k ≤ 2 already gives (k + 1)φ ≤ 3φ ≤ X); the new content is X < 3φ, where k ≥ 3 would give t ≥ (k + 1)φ ≥ 4φ > X (the print l. 523–524).
- **Real X on the record, ℤ[φ] X on the row — no weaker (my reasoning, as U13's V₁ signed for CAPa):** for a real X with t ≤ X, put X′ := t ∈ ℤ[φ]; the ℤ[φ] form at X′ gives k ≤ 2 or (k + 1)φ ≤ t ≤ X.
- **The route on the record (for the L seat; not part of the statement):** k ≤ 2 → the left disjunct; k ≥ 3 → U5's frozen `g5_u5_lad_a_ge3` gives (k + 1)φ ≤ t, and t ≤ X (order transitivity on `ZPhi` is not an instance; U13's Solution proved what it needed, or U5's Solution device — the real order through a ring map to ℝ). The statement imports U1, U5, U11, U13 (the row's Lean notes) and uses no U5/U11/U13 declaration.
- **Own exact arithmetic** (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/check.py` (output `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/check.out`)): every word of length ≤ 6 against every X = ⟨x, y⟩ with −6 ≤ x, y < 30 (657,760 (word, X) pairs with t ≤ X): 0 violations; at X = 25 the largest capped length is 14 = ⌊25/φ⌋ − 1 (impl-a l. 101: "14 at X = 25").

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
List.replicate	NOT FOUND
List.length	NOT FOUND
Nat.cast_ofNat	FOUND Nat Mathlib/Data/Nat/Cast/Defs.lean:57
le_trans	FOUND _root_ Mathlib/Order/Defs/PartialOrder.lean:70
Int.floor	FOUND Int Mathlib/Algebra/Order/Floor/Defs.lean:250
Nat.floor	FOUND Nat Mathlib/Algebra/Order/Floor/Defs.lean:119
```

- `List.replicate`, `List.length` NOT FOUND: Lean core (`List.replicate` at the toolchain's `src/lean/Init/Data/List/Basic.lean:706`, `leanprover/lean4:v4.33.0`); both used verbatim by U5's, U11's and U13's frozen Challenges.
- `Int.floor`, `Nat.floor` FOUND and NOT used: named so that the floor-free reading (§3) is a choice and not an absence. `le_trans` FOUND but not applicable to `ZPhi` as it stands (no `Preorder`).
- Targeted by the statement: `List.replicate`, `List.length` (core), U1's `ZPhi`, `phi`, `IsWord`, `ntr`, the real order. Proof aids: `Nat.cast_ofNat`, U5's `g5_u5_lad_a_ge3`.
- No name is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for every X in ℤ[φ], every non-constant word whose normalized trace is at most X has at most 2 syllables or satisfies (k + 1)φ ≤ X, k its syllable count.

Probe: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/probe-U15.lean` — **NOT RUN by this seat** (the brief: no `lake` command of any kind; no Lean compiled); the orchestrator elaborates it serially and returns exit and first error. The block below sits inside `namespace G5` after `open G5 ZPhi` and is the probe's text byte for byte (the first of the probe's four theorems).

```lean
/-- G5-SRCHa (Cor. 5.11, the all-X cap). For every `X` in ℤ[φ], every non-constant word
with normalized trace `t ≤ X` (real order) has `k ≤ 2` or `(k + 1) φ ≤ X`, `k` its length
— the cap `k ≤ max(2, ⌊X/φ⌋ − 1)`, floor-free.
Locus: `phase-2/impl-a/README.md` §3 (l. 99–101), §1 (c) (l. 52); STATEMENTS.md row
G5-SRCH (l. 73), clause (i). STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u15_srch_cap (X : ZPhi) (w : List ℕ) (hw : IsWord w)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4)
    (ht : ntr w ≤ X) :
    w.length ≤ 2 ∨ ((w.length : ZPhi) + 1) * phi ≤ X := by sorry
```

## 6 · What the row does not claim

- **Not ta4's cap ⌊X/φ⌋** (the sweep's item 6, NOT-ON-THE-LANE: not printed — named only in Record 9.5 as kept off; `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` l. 55) — the record's, off the lane by the wall's rule.
- **Not the failure interval** (the cap ⌊X/φ⌋ − 1 failing on (1, 4) at 3 + φ ≤ X < 3φ) — U13's frozen G5-CAPb; **not the X ≥ 3φ form** — U13's frozen G5-CAPa; this row adds the all-X form only.
- **Not the census grid's values** (14 at X = 25, …, impl-a l. 101–102) and not the build's counter `cap_cuts` (l. 51–52) — computations, not clauses. Nothing about constant words; words, not classes.

## 7 · Status

SPEC-DRAFT 2026-10-30T21:39:23Z

V1: V1-GREEN 2026-10-30T21:50:45Z — the formal reading and `g5_u15_srch_cap` say exactly clause (i) of row G5-SRCH (STATEMENTS.md l. 73, edition 4a53d9ba… · 30598 B) and impl-a README §3 l. 99–101 / §1 (c) l. 52: for every X in ℤ[φ] (no lower bound; U1's real order) and every non-constant word (U5's `hc`, byte for byte against `G5/Ladder/Challenge.lean` l. 87), k ≤ 2 or (k + 1)φ ≤ X. Convention confirmed: the floor-free cap is EXACT — with the record's ⌊X/φ⌋ := the largest integer n with nφ ≤ X, the set {n : nφ ≤ X} is downward closed (φ > 0), so k + 1 ≤ ⌊X/φ⌋ ⟺ (k + 1)φ ≤ X, and k ≤ max(2, m) ⟺ k ≤ 2 ∨ k ≤ m; own exact arithmetic 512,000 (X, k) pairs, X = ⟨x, y⟩ with −20 ≤ x, y < 60, k = 0 … 79, 0 mismatches; caps 14 / 987 / 1853 / 1976 / 7415 at X = 25 / 1600 / 3000 / 3200 / 12000 reproduce l. 101–102. Own check of the clause at the strongest X (X = t, all X ≥ t follow by the order): 87,364 non-constant words k ≤ 8, 0 violations; `hc` is needed (constant words have t = 2 at every length; lengths 3 … 8 fail at X = 2; M's 776 reproduced on M's grid). Every §2 quote matches its source at the cited lines, whole lines (STATEMENTS.md a declared substring of l. 73); the §5 block is a byte substring of probe-U15.lean (e2bca919…, one occurrence). The X ≥ 3φ case agrees with frozen `g5_u13_cap_a` (U13 d10844cb… = its signed statement_sha256). U1 IsWord guard present.
V1-SPLIT-OK: G5-SRCH → SRCHa = clause (i), the row's own numbering.
Parse: 0 Lean line(s) over 100 code points
V2: V2-GREEN 2026-10-30T22:10:28Z — g5_u15_srch_cap says clause (i) exactly: the record's all-X cap K = max(2, ⌊X/φ⌋ − 1) with ⌊X/φ⌋ the largest n with nφ ≤ X (impl-a l. 99–101, l. 52) is k ≤ 2 ∨ (k + 1)φ ≤ X for every X in ℤ[φ] (U1 real order, no lower bound), non-constant as U5's hc; Challenge c17de521… = statement_sha256_draft, signed.
