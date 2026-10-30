# G5-LADc′b

## 1 · Header

row: G5-LADc′b
unit: U11 `G5/Census`
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T13:02:59Z; equal to the brief's edition — nothing appended since)
source_bytes: 21568 (`wc -c` at 2026-10-30T13:02:59Z; the edition pair `sha256:a84cecdd… · 21568 B`, UPGRADE-697)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U5 `G5.Ladder.Challenge` ea6b4aedd3021843c9399543ebbac30b625aeae4cdd18a0b9042b6b33513d11a (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-30T13:02:59Z matches)
locus: STATEMENTS.md row G5-LADc′ (l. 26, the statement cell — the row's own wording is the corrected form and the source of record, per the brief); the corrected sentence `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` §1 l. 55 with its JC-9 forward-pointer l. 56 (Event 27); STATEMENTS.md §4 (l. 51, the 10:22:16Z erratum); `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 193) and slip 4 (l. 353); §2 item 7 (l. 39); part (b)
spec_clock: 2026-10-30T13:02:59Z

## 2 · Printed statement, verbatim

> (a) For K = 0 and for every K ≥ 2, every non-constant word w with normalized trace t < (K + 2)φ has syllable count ≤ K — the depth-K census realizes every trace below (K + 2)φ. (b) At K = 1 the law fails at exactly one value: a non-constant word with t < 3φ and syllable count > 1 is a rotation of (1, 4), with t = 3 + φ.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` row G5-LADc′, l. 26, the statement cell (verbatim — the source of record for this row; this spec carries part (b))

> - **Separately, the cap sentence itself.** "A class with t ≤ X has k ≤ X/φ − 1" fails only for the k = 2 class (1, 4) when 3 + φ ≤ X < 3φ, i.e. 4.618… ≤ X < 4.854…. This does not touch any grid X (all ≥ 25). For the record, the exact statement is: for X ≥ 3φ.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4, l. 193 (the whole line)

> 4. **Law sheet §1, the cap sentence.** "t ≤ X ⟹ k ≤ X/φ − 1" holds for X ≥ 3φ. It fails only on (1, 4) for X ∈ [3 + φ, 3φ), so no grid point is affected (§3.4).
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` "slips", item 4, l. 353 (the whole line)

> the sentence is FALSE at K = 1 — the word (1, 4) has length 2 and normalized trace 3 + φ < 3φ (3φ − (3 + φ) = −2 + √5 > 0, exact)
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` §4, l. 51 (a verbatim substring of the 10:22:16Z erratum — the witness)

## 3 · Formal reading

- **Words, non-constancy, length, `ntr`, the order:** as G5-LADc′a §3 (U1's `IsWord`, U5's `hc` byte for byte, `w.length`, U1's strict real order; `3 * phi` with the numeral `3 : ZPhi`).
- **The main clause** (`g5_u11_census_b`): a non-constant word with `ntr w < 3 * phi` and `1 < w.length` satisfies `List.IsRotated w [1, 4]` (mathlib's cyclic rotation, as U5's `g5_u5_lad_b_two` writes "a rotation of (1, 4)") and `ntr w = 3 + phi` — the record's sentence after the colon, "a non-constant word with t < 3φ and syllable count > 1 is a rotation of (1, 4), with t = 3 + φ". This is the "at most one value" half of "fails at exactly one value".
- **The witness clause** (`g5_u11_census_b_wit : ntr [1, 4] < 3 * phi`) — the "the law fails" half: the word (1, 4), visibly a non-constant word of length 2 > 1, has t < 3φ, so (a)'s conclusion `w.length ≤ 1` fails for it. With the main clause this is the record's "exactly one value". **Offered for V₁'s signature: the brief lists two statements for U11; this third, one-line clause is the existence half the record's "fails" asserts.** On the frozen units the existence is in pieces — U4's `g5_u4_bc_att` (ntr [1, 4] = 3 + φ) or U5's `g5_u5_lad_b_two` (the rotations of (1, 4) have t = 3 + φ), and 3 + φ < 3φ, which is on no unit (the §4 l. 51 erratum computes it: 3φ − (3 + φ) = −3 + 2φ = √5 − 2 > 0). V₁ may strike it, leaving "fails" to the paper's register.
- **The pieces on the record for the main clause (named by the row):** length ≥ 3 is impossible by U5's `g5_u5_lad_a_ge3` (t ≥ (k + 1)φ ≥ 4φ > 3φ); so length 2, where `g5_u5_lad_a_two` gives t ≥ 3 + φ and `g5_u5_lad_b_two` gives t = 3 + φ ⟺ a rotation of (1, 4); the remaining non-constant length-2 words have t ≥ 3φ (own exact arithmetic over all sixteen, `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD/check.py`: (1, 2), (2, 1), (3, 4), (4, 3) → 3φ; the rest above), so t < 3φ forces the rotation.

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin):

```
List.IsRotated	FOUND List Mathlib/Data/List/Rotate.lean:362
List.IsRotated.refl	FOUND List.IsRotated Mathlib/Data/List/Rotate.lean:372
List.IsRotated.symm	FOUND List.IsRotated Mathlib/Data/List/Rotate.lean:376
List.isRotated_iff_mod	FOUND List Mathlib/Data/List/Rotate.lean:448
List.replicate	NOT FOUND
List.length	NOT FOUND
```

- Targeted by the statement: `List.IsRotated` (FOUND, `List`, `Mathlib/Data/List/Rotate.lean:362`), `List.replicate`, `List.length` (Lean core — NOT FOUND in mathlib by construction; `List.replicate` at the toolchain's `src/lean/Init/Data/List/Basic.lean:706`). `List.IsRotated.refl`, `.symm`, `List.isRotated_iff_mod` are proof aids (the length-2 case split).
- No name is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: a non-constant word with normalized trace below 3φ in the real order and more than one syllable is a cyclic rotation of (1, 4) with normalized trace 3 + φ; and the word (1, 4) has normalized trace below 3φ.

Probe: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD/probe-U11.lean` — **NOT RUN by this seat** (the brief: no `lake` command of any kind); the orchestrator elaborates it serially and returns exit and first error. The block below sits inside `namespace G5` after `open G5 ZPhi` and is the probe's text byte for byte (two of the probe's three theorems).

```lean
/-- G5-LADc′b (census completeness, the K = 1 case). A non-constant word with
normalized trace `t < 3φ` (real order) and length `> 1` is a rotation of `(1, 4)`,
with `t = 3 + φ`.
Locus: STATEMENTS.md row G5-LADc′ (l. 26), part (b);
`candidates/checks/SH-P2-1-sector-ladder-pruning.md` §3.4 (l. 193), slip 4 (l. 353).
STATEMENTS.md sha256 prefix `a84cecdd`. -/
theorem g5_u11_census_b (w : List ℕ) (hw : IsWord w)
    (hc : w ≠ List.replicate w.length 1 ∧ w ≠ List.replicate w.length 4)
    (ht : ntr w < 3 * phi) (hk : 1 < w.length) :
    List.IsRotated w [1, 4] ∧ ntr w = 3 + phi := by sorry

/-- G5-LADc′b (the witness: the law fails at K = 1). The word `(1, 4)` — non-constant,
of length 2 — has normalized trace `< 3φ` in the real order.
Locus: STATEMENTS.md row G5-LADc′ (l. 26), part (b), "the law fails";
STATEMENTS.md §4 (l. 51). STATEMENTS.md sha256 prefix `a84cecdd`. -/
theorem g5_u11_census_b_wit : ntr [1, 4] < 3 * phi := by sorry
```

## 6 · What the row does not claim

- Nothing about length 1 (a non-constant word of length 1 has t ≥ 2φ and may lie below 3φ — (2), (3) at 2φ — and length 1 ≤ K = 1 is the law holding there); nothing at K ≠ 1.
- No claim that (1, 4) is the only WORD (its rotation (4, 1) is the other word, the same value; "exactly one value", not one word); no class statement.
- The census-cap reading of SH-P2-1 l. 193 ("t ≤ X ⟹ k ≤ X/φ − 1", exact "for X ≥ 3φ" — a non-strict bound on the trace and a different cap on k) is a sibling sentence with a non-strict bound and a different cap; it is quoted as the record's boundary catch, not stated.

## 7 · Status

SPEC-DRAFT 2026-10-30T13:02:59Z

V1: V1-GREEN 2026-10-30T13:12:20Z — faithful to STATEMENTS.md row G5-LADc′ (l. 26) part (b), "At K = 1 the law fails at exactly one value: a non-constant word with t < 3φ and syllable count > 1 is a rotation of (1, 4), with t = 3 + φ": `g5_u11_census_b` is the sentence after the colon clause for clause (`hc` = non-constant, U5's convention; `ntr w < 3 * phi` = "t < 3φ", strict, U1's `instLT`, the record's literal 3φ; `1 < w.length` = "syllable count > 1"; `List.IsRotated w [1, 4]` = "a rotation of (1, 4)", as U5's signed `g5_u5_lad_b_two` writes it, covering (1, 4) and (4, 1); `ntr w = 3 + phi` = "with t = 3 + φ") — the "at most one value" half. **Witness clause KEPT:** `g5_u11_census_b_wit : ntr [1, 4] < 3 * phi` is the existence half of "fails at exactly one value" — without it the unit states only "at most one", weaker than the row; the record carries the witness at full strength (the row's Lean notes: "(b) as the remark naming its witness … 'exactly one' is printed because the record carries it at full strength"; §4 l. 51 "the word (1, 4) has length 2 and normalized trace 3 + φ < 3φ"; SH-P2-1 l. 353 "fails only on (1, 4)", where "fails" is existential and "only" is the main clause). That [1, 4] is a word, non-constant and of length 2 > 1 is closed and decidable on the literal and named in the docstring; not stated, not a drift. §2 quotes: verbatim substrings of their loci (l. 26 cell whole; SH-P2-1 l. 193 and l. 353 whole lines; §4 l. 51). §5 blocks byte substrings of probe-U11.lean (3 sorry warnings, no error). Own exact check: the non-constant words of length ≤ 8 with t < 3φ and length > 1 are exactly (1, 4), (4, 1), both t = (3, 1) = 3 + φ; 3 + φ < 3φ in the exact order. Parse: 0 Lean line(s) over 100 code points
V1: V1-SPLIT-OK 2026-10-30T13:12:20Z — G5-LADc′ → G5-LADc′b carries the row's own part (b), main clause plus witness; the split follows the row's (a)/(b) markers.
