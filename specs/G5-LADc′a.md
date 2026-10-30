# G5-LADc′a

## 1 · Header

row: G5-LADc′a
unit: U11 `G5/Census`
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T13:02:59Z; equal to the brief's edition — nothing appended since)
source_bytes: 21568 (`wc -c` at 2026-10-30T13:02:59Z; the edition pair `sha256:a84cecdd… · 21568 B`, UPGRADE-697)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U5 `G5.Ladder.Challenge` ea6b4aedd3021843c9399543ebbac30b625aeae4cdd18a0b9042b6b33513d11a (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-30T13:02:59Z matches)
locus: STATEMENTS.md row G5-LADc′ (l. 26, the statement cell — the row's own wording is the corrected form and the source of record, per the brief); the corrected sentence `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` §1 l. 55 with its JC-9 forward-pointer l. 56 (Event 27); STATEMENTS.md §4 (l. 51, the 10:22:16Z erratum); `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 193) and slip 4 (l. 353); §2 item 7 (l. 39); part (a)
spec_clock: 2026-10-30T13:02:59Z

## 2 · Printed statement, verbatim

> (a) For K = 0 and for every K ≥ 2, every non-constant word w with normalized trace t < (K + 2)φ has syllable count ≤ K — the depth-K census realizes every trace below (K + 2)φ. (b) At K = 1 the law fails at exactly one value: a non-constant word with t < 3φ and syllable count > 1 is a rotation of (1, 4), with t = 3 + φ.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` row G5-LADc′, l. 26, the statement cell (verbatim — the source of record for this row; this spec carries part (a))

> **Consequence for saturation:** the depth-K census is complete for |t| < (K+2)φ;
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` §1, l. 55 (a verbatim substring — the uncorrected consequence sentence the row corrects)

> *JC-9 forward-pointer (Event 27, 2026-10-30T10:39:40Z, Orchestrator A): the consequence sentence above — a depth-K census complete exactly below (K + 2)φ — is FALSE at K = 1 (the word (1, 4), trace 3 + φ < 3φ; the ladder's k = 2 exception does not carry into the consequence) and holds at K = 0 and every K ≥ 2. Corrected by `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` §4 (2026-10-30T10:22:16Z), found by the Lean lane's M-U5 seat; the census-completeness claims at K = 12 stand. Ledger: `canon/erratum-event-ledger.md` Event 27.*
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` §1, l. 56 (the JC-9 forward-pointer, Event 27)

> the sentence is FALSE at K = 1 — the word (1, 4) has length 2 and normalized trace 3 + φ < 3φ (3φ − (3 + φ) = −2 + √5 > 0, exact) — because the ladder's k = 2 exception (minimum 3 + φ, not 3φ) does not carry into the consequence. It holds at K = 0 and at every K ≥ 2, so every census-completeness claim the record makes at K = 12 and the Phase 2 cap stand; SH-P2-1 §3.4 had caught the same boundary in the census-cap sentence ("for X ≥ 3φ") but not here, and TA §1 l. 55, the audit, the synthesis and the FOLD-LOG repeat the unrestricted form. The paper's sentence will read "for K ≥ 2 (and K = 0)" or carry the k = 2 exception; the lane states LADc, if at all, as a NEW unit with the restriction (STATEMENTS.md §3). Decided by the orchestrator under the 2026-09-03 ruling (a wording defect in the lab's own record, reversible, no proof or census result affected)
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` §4, l. 51 (a verbatim substring of the 10:22:16Z erratum)

## 3 · Formal reading

- **Words, non-constancy, length.** `w : List ℕ` with U1's `IsWord w` (non-empty, every syllable in {1, 2, 3, 4}); "non-constant" exactly as U5 writes it, `w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4` (U5's `hc`, byte for byte); the syllable count is `w.length`.
- **The normalized trace and the order.** `ntr w` (U1, `tr (P_{a₁} ⋯ P_{a_k})`), compared in U1's strict real order `<` (`instLT`: `s ≤ t ∧ s ≠ t`). U5's frozen Challenge carries no strict inequality; it writes the cast as `((w.length : ZPhi) + 1) * phi`, and this row writes `((K : ZPhi) + 2) * phi` the same way (ℕ → `ZPhi` through the ring's `NatCast`).
- **The two cases of K.** `K : ℕ` with `hK : K = 0 ∨ 2 ≤ K` — the record's "For K = 0 and for every K ≥ 2"; K = 1 is part (b) (G5-LADc′b).
- **The conclusion** `w.length ≤ K`; the record's gloss "the depth-K census realizes every trace below (K + 2)φ" is the reading of this clause for the census (every non-constant word below the bound has length ≤ K, so the depth-K census contains it), not a further statement.
- **The pieces on the record (named by the row; the L seat's route, cited for the record's strength):** K = 0 from U5's `g5_u5_lad_a_one` (t ≥ 2φ at length 1) with `g5_u5_lad_a_two` (t ≥ 3 + φ ≥ 2φ) and `g5_u5_lad_a_ge3` (t ≥ (k + 1)φ); K ≥ 2 from `g5_u5_lad_a_ge3`: a non-constant word of length k ≥ K + 1 ≥ 3 has t ≥ (k + 1)φ ≥ (K + 2)φ, contradicting t < (K + 2)φ.
- Own exact arithmetic (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD/check.py`): no violation over every non-constant word of length ≤ 8 and K ∈ {0, 2, …, 11}.

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin):

```
List.replicate	NOT FOUND
List.length	NOT FOUND
Nat.cast_ofNat	FOUND Nat Mathlib/Data/Nat/Cast/Defs.lean:57
```

- `List.replicate` and `List.length` read NOT FOUND because they are Lean core, not mathlib: `List.replicate` at the toolchain's `src/lean/Init/Data/List/Basic.lean:706` (`leanprover/lean4:v4.33.0`), `List.length` in core's `Init/Prelude.lean`; both are used verbatim by U5's frozen Challenge, which elaborated.
- Targeted by the statement: `List.replicate`, `List.length` (core), U1's `IsWord`, `ntr`, `phi`, the order. `Nat.cast_ofNat` is a proof aid (numerals against casts).
- No name is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for K = 0 or K ≥ 2, every non-constant word whose normalized trace is below (K + 2)φ in the real order has at most K syllables.

Probe: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD/probe-U11.lean` — **NOT RUN by this seat** (the brief: no `lake` command of any kind); the orchestrator elaborates it serially and returns exit and first error. The block below sits inside `namespace G5` after `open G5 ZPhi` and is the probe's text byte for byte (one of the probe's three theorems).

```lean
/-- G5-LADc′a (census completeness, the law). For `K = 0` and every `K ≥ 2`, every
non-constant word with normalized trace `t < (K + 2) φ` (real order) has length `≤ K`.
Locus: STATEMENTS.md row G5-LADc′ (l. 26), part (a); the corrected form of TA
transcript §1 l. 55 (JC-9 Event 27, l. 56); STATEMENTS.md §4 (l. 51).
STATEMENTS.md sha256 prefix `a84cecdd`. -/
theorem g5_u11_census_a (K : ℕ) (hK : K = 0 ∨ 2 ≤ K) (w : List ℕ) (hw : IsWord w)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4)
    (ht : ntr w < ((K : ZPhi) + 2) * phi) :
    w.length ≤ K := by sorry
```

## 6 · What the row does not claim

- **K = 0 is vacuously true by design, and that is not the vacuous-statement class.** No non-constant word has t < 2φ (U5: t ≥ 2φ at length 1, ≥ 3 + φ at length 2, ≥ (k + 1)φ beyond), so at K = 0 the clause says only that; the record states K = 0 so, and the K ≥ 2 half carries the content. No `CC-CANDIDATE`.
- Nothing about K = 1 (part (b), G5-LADc′b); no claim about which traces below the bound are realized, nor that the bound is sharp (TA l. 55's "the first value missing from the depth-12 census is exactly 14φ" is a computation, not in the row); no class statement — words only.
- The struck LADc (G5-LAD's consequence clause, false at K = 1; §4 l. 51) is not restated; this row replaces it.

## 7 · Status

SPEC-DRAFT 2026-10-30T13:02:59Z

V1: V1-GREEN 2026-10-30T13:12:20Z — faithful to STATEMENTS.md row G5-LADc′ (l. 26) part (a), "For K = 0 and for every K ≥ 2, every non-constant word w with normalized trace t < (K + 2)φ has syllable count ≤ K": `hK : K = 0 ∨ 2 ≤ K` is exactly K ≠ 1 on ℕ, so K = 1 (where the law is FALSE — (1, 4), t = 3 + φ < 3φ; JC-9 Event 27, STATEMENTS.md §4 l. 51, the struck G5-LADc's V1-CC) is excluded and K = 0 is kept; `ntr w < ((K : ZPhi) + 2) * phi` is "t < (K + 2)φ" in U1's strict real order (`ZPhi.instLT`, s ≤ t ∧ s ≠ t — the only `LT ZPhi` in scope: U1 defines no Preorder and CommRing carries no order), the cast written as U5's `((w.length : ZPhi) + 1) * phi`; `w.length ≤ K` is "syllable count ≤ K". Conventions confirmed: "non-constant" = U5's `hc` byte for byte, the record's own convention (§1 G5-A "the constant words (1^k), (4^k)"; l. 24 "constant words t = 2"; and the row's proof cell, which covers (2), (3) at K = 0 through `g5_u5_lad_a_one`); words, not classes; t the §0 normalized trace (TA l. 55's |t| is t, entries in ℕ[φ]). The gloss "the depth-K census realizes every trace below (K + 2)φ" is a reading of the clause, not a further statement — agreed. K = 0 vacuous by design, stated so in the row's proof cell; not the vacuous-statement class (the K ≥ 2 half carries the content) — agreed, no CC. §2 quotes: each a verbatim substring of its locus (l. 26 statement cell whole, 321 code points; TA l. 55; TA l. 56 whole line; §4 l. 51). U1/U5 names in U1's sense. §5 block a byte substring of probe-U11.lean (sha 47e238dd…; probe out: 3 sorry warnings, no error). Own exact check: 0 violations over non-constant words of length ≤ 8, K ∈ {0, 2, …, 7}. Parse: 0 Lean line(s) over 100 code points
V1: V1-SPLIT-OK 2026-10-30T13:12:20Z — G5-LADc′ → G5-LADc′a carries the row's own part (a); the split follows the row's (a)/(b) markers.
V2: V2-GREEN 2026-10-30T13:25:31Z — the statement says what STATEMENTS.md row G5-LADc′ (l. 26) part (a) says, no stronger, no weaker: `∀ K, K = 0 ∨ 2 ≤ K →` is the record's "For K = 0 and for every K ≥ 2" (exactly K ≠ 1 on ℕ, so K = 1, where the struck LADc is false — JC-9 Event 27, §4 l. 51 — is excluded); `IsWord w` + U5's `hc` is "non-constant word" in the record's own sense (l. 15 "the constant words (1^k), (4^k)"); `ntr w < ((K : ZPhi) + 2) * phi` is "t < (K + 2)φ" strict, through U1's `instLT` (the only `LT ZPhi` in scope; the NatCast ⟨K, 0⟩ written U5's way, product ⟨0, K + 2⟩); `w.length ≤ K` is "syllable count ≤ K"; nothing quantified away, the P filler unreachable under `IsWord`; K = 0 vacuous by the row's own design (no non-constant word has t < 2φ), K ≥ 2 satisfiable ([2] at K = 2). The census gloss after the dash is a reading, not stated. Theorem text byte-identical to §5; own exact check 0 violations over 349506 non-constant words of length ≤ 9, K ∈ {0, 2, …, 10}. Freeze: Challenge sha256 ee958447349e411d839a595dd2057af8d284daedcb410f4a71a4eca3d2c2b76c = statement_sha256_draft.
