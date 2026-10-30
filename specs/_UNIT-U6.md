# Unit U6 — the mod-4 and mod-3 closures (Claude Paper No. 1, *The Realized Trace Set of the Hecke Group G(5)*) — unit summary

*Seat M-U6 (statement author, step 2 of the lean-papers loop), opened 2026-10-30T10:06:26Z, closed 2026-10-30T10:16:49Z. Brief: `Orchestrator/Claude-Papers/No1-G5/briefs/SEAT-P3-LEAN-M-U6.md` (BRIEF READY 2026-10-30T10:04:41Z, probe amendment 10:05:25Z). No git, no web, nothing under `NMC-Phase-1-Research/`, no `lake` command of any kind.*

source_sha256: 0b277844f9aa258cd009b52e71d7e4e1b143ed1eaa08a044f5b5917018a147d6 — `Orchestrator/Claude-Papers/No1-G5/phase-3/STATEMENTS.md` (§4 Errata included), `shasum -a 256` at 2026-10-30T10:14:38Z (first read 10:06Z, same digest); it matches the brief's digest. Mathlib pin `db584cd6d46c92f209a44c0f1c829460d327499d`.

## Rows

| id | state | proposed declaration |
|---|---|---|
| G5-U6-DEFS | SPEC-DRAFT | `ZPhi.red4 : ZPhi → ZMod 4 × ZMod 4`, `ZPhi.red3 : ZPhi → ZMod 3 × ZMod 3` (pairs mod n), `G5.H4 : Finset (ZMod 4 × ZMod 4)` |
| G5-M4a | SPEC-DRAFT (SPLIT of G5-M4: the finite image) | `g5_u6_m4a : ((fun w : List ℕ => (W w).map red4) '' {w \| IsWord w}).ncard = 320` |
| G5-M4b | SPEC-DRAFT (SPLIT of G5-M4: the residue statement, row-text form) | `g5_u6_m4b (w) (hw : IsWord w) : red4 (W w).trace ∈ H4` |
| G5-M4c | SPEC-DRAFT (SPLIT of G5-M4: the norm form, SH-P2-1 item 5) | `g5_u6_m4c (w) (hw) (hy : Odd (W w).trace.y) : nrm (W w).trace ≡ 3 [ZMOD 4]` |
| G5-M4d | SPEC-DRAFT (SPLIT of G5-M4: the ledger row AM-4's own two clauses) | `g5_u6_m4d (w) (hw) : (Even w.length → Even y → x ≡ 2 ∧ y ≡ 0 [ZMOD 4]) ∧ (Odd y → x ≡ 0 ∨ x ≡ −y [ZMOD 4])` (x, y of `(W w).trace`) |
| G5-M3a | SPEC-DRAFT (SPLIT of G5-M3: the finite image) | `g5_u6_m3a : ((fun w : List ℕ => (W w).map red3) '' {w \| IsWord w}).ncard = 120` |
| G5-M3b | SPEC-DRAFT (SPLIT of G5-M3: the residue statement) | `g5_u6_m3b (w) (hw) : ¬ (x ≡ y [ZMOD 3] ∧ ¬ (x ≡ 0 [ZMOD 3]))` |

Specced 7 · split 2 rows into 6 legs (G5-M4 → a, b, c, d; G5-M3 → a, b) · stopped 0 · CC-CANDIDATE 0 · NEEDS-DEVELOPMENT 0.

**The splits, for V₁'s sign-off.**
- **G5-M4d is beyond the brief's three legs, and is why the cut is four.** The source of record STATEMENTS.md names first for G5-M4, LEDGER row AM-4 (l. 16; also AM §2.4 l. 115, AM §6 l. 225), states the law parity-split: "k even and y even ⟹ (x, y) ≡ (2, 0) mod 4; y odd ⟹ x ≡ 0 or −y mod 4". The STATEMENTS.md row text gives the H₄ form (DO §3.2 D-2, PHASE-2-DEFINITIONS l. 15). The two are not the same statement: H₄ contains (0, 0), (0, 2), (2, 2), which AM l. 115 records as realized only at odd k, so H₄ membership does not give AM-4's first clause. M4b carries the row text, M4d the ledger's text; V₁ keeps both or drops M4d.
- **The finite-image legs state the record's image ORDERS, at the word level.** The record: image of G(5) in SL(2, ℤ[φ]/4) of order 320 (AM l. 100, DO l. 109, SH-P2-1 l. 284), in SL(2, ℤ[φ]/3) of order 120 (AM l. 103, DO l. 108). M4a/M3a state that the set of entrywise reductions of the literal words has exactly 320 / 120 elements. The word image equals the group image: it is a sub-semigroup of a finite group, so a subgroup, and it contains R̄ = (R̄²S̄)(R̄S̄)⁻¹ and S̄ = R̄⁻¹(R̄S̄) (spec G5-M4a §3).
- **State counts.** The brief's "320 states × parity" and "240 states" are (matrix, k mod 2) counts. This seat's scratch closure (`M-U6/closure.py`, own arithmetic, output `closure.out`) finds 320 states over 320 matrices at level 4 (there the matrix fixes k mod 2) and 240 states over 120 matrices at level 3. Those are the seat's counts, not the record's, and no statement carries them. The same run finds the word-level residues inside H₄ (all eight realized), M4c and M4d with no exception over the 320 states, and M3b with no exception (7 residues mod 3) — a check on the statement forms, not a proof. STATEMENTS.md §2 note 3's "(120 / 240 / 320 states)" reads against the record as mod 3 matrices / mod 3 states / mod 4 states (the mod-2 image is 10, AM l. 99). That is a note for the orchestrator, not a defect in any U6 row.
- **No ring on pairs mod n in the statements.** `red4`, `red3` map into `ZMod n × ZMod n` (pairs mod n, STATEMENTS.md §2 note 3). Mathlib's product ring on that type multiplies componentwise, which is NOT ℤ[φ]/n. No U6 statement multiplies on the target; it compares only sets of reduced matrices and reduced traces. The φ-multiplication on pairs mod n, and the multiplicativity of `red4`/`red3` for it, are L-seat proof material.
- **The character proof** (the index-2 character χ of the preimage of D₅, SH-P2-1 §5) and the A₅ order argument for mod 3 are the paper's register and are NOT Lean targets (said in each spec's §6).

## Names this unit adds (block opens `open G5 ZPhi`, after U1's block)

`ZPhi.red4`, `ZPhi.red3`, `G5.H4`; theorems `g5_u6_m4a`, `g5_u6_m4b`, `g5_u6_m4c`, `g5_u6_m4d`, `g5_u6_m3a`, `g5_u6_m3b`. U1 names used: `ZPhi` (fields `x`, `y`), `nrm`, `M2`, `W`, `IsWord`. Nothing U1 defines is redefined. Literal trace `(W w).trace` throughout (AM l. 113). H₄ and the mod-3 exclusion set are closed under negation, and `nrm` is even in t, so the normalized readings are the same statements (SH-P2-1 l. 272).

## Mathlib names (classifier of record, `tools/ledger_names.py`, plain form, at the pin)

One hit with its namespace: `Int.ModEq	FOUND Int Mathlib/Data/Int/ModEq.lean:30`.

Per row (verdict lines pasted whole in each spec's §4):
- DEFS: `ZMod`, `Finset`, `Matrix.map` (FOUND); `Int.cast` NOT FOUND.
- M4a: `Set.ncard`, `Set.image`, `Matrix.map`, `Set.ncard_eq_toFinset_card'` (FOUND); `Subgroup.closure`, `Matrix.SpecialLinearGroup`, `Nat.card` (FOUND, the rejected group-level form).
- M4b: `Matrix.trace`, `Finset`, `ZMod`, `Finset.mem_insert` (FOUND).
- M4c: `Int.ModEq`, `Odd`, `Int.odd_iff` (FOUND).
- M4d: `Int.ModEq`, `Odd`, `IsSquare`, `Int.ModEq.neg` (FOUND); `Even` AMBIGUOUS 2 sites.
- M3a: `Set.ncard`, `Set.image`, `Matrix.map`, `ZMod` (FOUND).
- M3b: `Int.ModEq`, `Matrix.trace` (FOUND).

**Not found / not resolved at the pin, with the resolution:**
- `Int.cast` (and its class `IntCast`): Lean CORE at the pinned toolchain, `Init/Data/Int/Basic.lean:458`.
- `Even` AMBIGUOUS: the sites are `Function.Even` and `DirichletCharacter.Even`. The root predicate is generated by `@[to_additive]` from `IsSquare` (`Mathlib/Algebra/Group/Even.lean:57`).
- `Int.emod_emod_of_dvd`: tried as a proof aid, NOT FOUND in mathlib (core, `Init/Data/Int/DivMod/Bootstrap.lean:259`); no row targets it.

No row is NEEDS-DEVELOPMENT.

## Probe

`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-U6/probe.lean`, sha256 `b6212752f5d423779ae6c505d0a12295a54b84241933edf80b31622e687ce2aa`. Its prefix is U1's final probe (sha256 `f15f320065142f9533d7c775430280434d4ec3533a27927dd740d2210e04af63`), copied whole and unedited (a `cmp` of the prefix bytes matches). The U6 block follows, every theorem `:= by sorry`. **NOT RUN by this seat**, per the brief's amendment: exit and first error are pending the orchestrator's serial elaboration. Every spec's §5 Lean text is a byte-for-byte substring of the probe (asserted by `M-U6/gen.py`). Risk points for the elaboration: the Finset literal for `H4` (needs `DecidableEq (ZMod 4 × ZMod 4)`), dot notation `(W w).map` through the `abbrev M2` (U1's `(W w).trace` used the same route and elaborated), and the `[ZMOD n]` notation (unscoped at `Mathlib/Data/Int/ModEq.lean:34`).

## Line counts (the template's one-liner, per spec)

- `specs/G5-U6-DEFS.md`: 0 Lean line(s) over 100 code points
- `specs/G5-M4a.md`: 0 Lean line(s) over 100 code points
- `specs/G5-M4b.md`: 0 Lean line(s) over 100 code points
- `specs/G5-M4c.md`: 0 Lean line(s) over 100 code points
- `specs/G5-M4d.md`: 0 Lean line(s) over 100 code points
- `specs/G5-M3a.md`: 0 Lean line(s) over 100 code points
- `specs/G5-M3b.md`: 0 Lean line(s) over 100 code points

## The one thing V₁ should look hardest at, per row

- **G5-U6-DEFS:** that a map into `ZMod n × ZMod n` with NO φ-ring is enough for every U6 statement (nothing multiplies on the target), and that this does not let a reader mistake mathlib's componentwise product for ℤ[φ]/n.
- **G5-M4a:** the translation from the record's GROUP image order (⟨S̄, R̄⟩ / ⟨S̄, T̄⟩ in SL(2, ℤ[φ]/4)) to the WORD image count. Is the semigroup-equals-group step a faithful reading, or should the leg be the group-level `Nat.card (Subgroup.closure …)` form?
- **G5-M4b:** that "every trace" in DO is read on the literal word trace (AM l. 113), with the normalized reading equal by H₄'s negation-closure, and that inclusion only (not realization of all eight) is claimed.
- **G5-M4c:** that the norm form is stated alone (only y odd ⟹ N ≡ 3 mod 4), without the clause-form equivalence and without any converse.
- **G5-M4d:** whether this fourth leg belongs on the lane. It is the ledger's adopted statement and strictly stronger than M4b at even k.
- **G5-M3a:** the record's 120 (matrices) against STATEMENTS.md's "240 states" (matrices × parity), and the same word-vs-group translation as M4a.
- **G5-M3b:** the reading of "x ≡ y ≢ 0 (mod 3)" as x ≡ y ∧ x ≢ 0 (the excluded residues (1, 1), (2, 2) = ±φ², DO l. 108).

## Files

Specs (write path `~/Claude/projects/claude-papers-lean/specs/`): `G5-U6-DEFS.md`, `G5-M4a.md`, `G5-M4b.md`, `G5-M4c.md`, `G5-M4d.md`, `G5-M3a.md`, `G5-M3b.md`, `_UNIT-U6.md` (this file).

Scratch a later stage must read: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-U6/probe.lean` (the probe for the orchestrator's serial elaboration; the source of every §5 block). Also there:
- `gen.py` writes the probe and the specs. It pulls every §2 quote by file and line from the record and asserts each §5 block is a probe substring.
- `closure.py` / `closure.out` (sha256 `60aa0592…7619` / `819a9e19…9a5a`): the seat's sanity closure.
- `clock.txt`.

## Status

SPEC-DRAFT 2026-10-30T10:16:49Z — U6 on disk; V₁-U6 may open.

## Probe elaboration (the orchestrator's serial run, 2026-10-30T10:21:46Z)

`lake env lean <scratchpad>/M-U6/probe.lean`: exit 0; errors 0; warnings: U1's five `sorry` lines plus six at l. 172, 178, 183, 189, 198, 204 (the six U6 theorems); maximum resident set size 4,641,030,144 bytes; 23 s wall (10:20:23Z → 10:20:46Z). Log: `<scratchpad>/M-U6/probe-orch-run.log`.
