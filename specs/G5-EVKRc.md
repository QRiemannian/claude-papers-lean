# G5-EVKRc

## 1 · Header

row: G5-EVKRc
unit: U14 `G5/EvenKRemark`
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T21:19:01Z and again at 2026-10-30T21:39:23Z; equal to the brief's edition; this edition EXTENDS the two before it — `head -c 25981` reproduces `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47` (U12/U13's pin) and `head -c 21568` reproduces `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` (the frozen eleven's pin))
source_bytes: 30598 (`wc -c` at 2026-10-30T21:19:01Z and 2026-10-30T21:39:23Z; the edition pair `sha256:4a53d9ba… · 30598 B`)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U2 `G5.ModTwo.Challenge` c342ab92ba8ef07e5a9fba82422968b9de4410974583210dc1dcded53354c78c · U12 `G5.EvenK.Challenge` 321dfbf5abdc78157328a8f7d1c53d40ae09a60b6a5cf027824d09da8f967565 (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-30T21:19:01Z matches)
locus: `Claude-Papers/No1-G5/candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)" (l. 58, the mechanism and clause (b) in the remark's statement), its proof (l. 60), "Rotation (the brief's question)" (l. 63); STATEMENTS.md row G5-EVKR (l. 72) and §6 (l. 66–68); the sweep `Claude-Papers/No1-G5/phase-4/close/L1-printed-uncarried-sweep.md` items 1–3 (l. 23–25); the print `Claude-Papers/No1-G5/phase-4/draft/S4-congruence.md` Rem. 4.4 (l. 56–67, display (4.5) l. 75, proof l. 77), quoted beside the record, never instead of it; this spec carries clause (3), the exact rotation identity
spec_clock: 2026-10-30T21:39:23Z

## 2 · Printed statement, verbatim

> **Rotation (the brief's question).** For even k the one-step rotation w′ = (a₂, …, a_k, a₁) gives A(w′) = a₂ − a₃ + ⋯ + a_k − a₁ = −A(w) **exactly, as integers**. So A is defined on a cyclic word only up to sign, ±A mod 5 is the invariant, and the clause "A ≡ 0 (mod 5)" is **rotation-invariant**. The reason, group-theoretically: rotation conjugates W by R^{a₁}S, whose image r^{a₁}s is a reflection and inverts r^A. (Equally, at even k, reversal and flip each send A to −A — reversal by re-signing, flip by Σ(−1)^{i+1}(5 − a_i) = −A since the signs sum to 0 — consistent with Prop. 2.6.) At odd k the alternating sum is NOT rotation-invariant even up to sign ((1, 1, 2): A′ = 2; its rotation (1, 2, 1): A′ = 0), which is harmless because the clause is vacuous there. The printed clause should say "for any rotation" or "up to sign" once, so the reader sees that the choice of starting letter does not matter.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3, l. 63 (the whole line — the rotation remark)

> For every word W = R^{a₁}S ⋯ R^{a_k}S with k even and A(W) the alternating sum of U12: (1) the image W̄ of W in PSL(2, 𝔽₄) ≅ D₅ is r^{A(W)} — the mechanism; (2) 5 ∣ A(W) exactly when W̄ = 1, and otherwise W̄ has order exactly 5 — so (a) of the even-k law is equivalent to the record's (b), "the image of W has order other than 5" (the Atlas's test (11.4)); (3) a one-step rotation W′ of W has A(W′) = −A(W) exactly, as integers.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` row G5-EVKR, l. 72, the statement cell (a verbatim substring; the row's pointer, not the authority)

> So the test (11.4) at even k *is* the congruence A(W) ≡ 0 (mod 5), and that congruence holds exactly when y is even, indeed exactly when tr W ∈ 2ℤ[φ]. The criterion does not depend on where the cyclic word is cut: a one-step rotation (a₂, …, a_k, a₁) changes A to −A exactly, as integers, so the congruence is invariant under rotation.
> Since r has order 5, W̄ = 1 if 5 ∣ A and W̄ has order 5 otherwise; this is (a) ⟺ (b). If 5 ∣ A then tr W̄ = 0, which is (d) by (4.1), and (d) implies (c). Conversely, if 5 ∤ A then tr W̄ ∈ {ω, ω²} by (4.2), so y is odd by (4.1); by contraposition (c) implies (a). For the rotation, A(a₂, …, a_k, a₁) = a₂ − a₃ + ⋯ + a_k − a₁ = −A(a₁, …, a_k), because k is even; group-theoretically, the rotation conjugates W by R^{a₁}S, whose image r^{a₁}s is a reflection of D₅ and inverts r^{A}. ∎
>
> — `Claude-Papers/No1-G5/phase-4/draft/S4-congruence.md` Rem. 4.4, l. 67 (the rotation sentence) and l. 77 (the proof) (the PRINT, quoted beside the record)

## 3 · Formal reading

- **A is U12's, frozen** (`A [] = 0`, `A (a :: l) = (a : ℤ) − A l`), imported from `G5.EvenK.Challenge`. U14 defines nothing.
- **"A one-step rotation W′ of W" is the record's w′ = (a₂, …, a_k, a₁)** (l. 63; print l. 67 "(a₂, …, a_k, a₁)"): for w = `a :: l` (a = a₁), w′ = `l ++ [a]`. The statement writes the record's display literally; mathlib's `List.rotate_cons_succ` (FOUND) relates it to `List.rotate` (Batteries, `Batteries/Data/List/Basic.lean:653`), which the statement does not use.
- **"Exactly, as integers"** is equality in ℤ (`A : List ℕ → ℤ`), not a congruence mod 5: `A (l ++ [a]) = -A (a :: l)`.
- **"k even"** is `Even (a :: l).length` — the record's "For even k" (l. 63). It carries content: at odd k the identity fails — the record's own example "(1, 1, 2): A′ = 2; its rotation (1, 2, 1): A′ = 0" (l. 63), reproduced by own arithmetic (A [1, 1, 2] = 2, A [1, 2, 1] = 0), and every one of the 1,092 words of odd length ≤ 5 fails it (at odd k the two sides differ by 2a: `A (l ++ [a]) = A l + a` against `-A (a :: l) = A l - a`, my arithmetic).
- **No `IsWord` — for V₁'s look.** The identity is list arithmetic: the record's proof is "A(w′) = a₂ − a₃ + ⋯ + a_k − a₁ = −A(w) exactly, as integers" (l. 63), using only that k is even; the brief: "pure list arithmetic, no `IsWord` needed (say so)". So the statement quantifies over every `a : ℕ` and `l : List ℕ`, which is a widening of the record's domain (words: syllables in {1, …, 4}) on an identity that holds there and everywhere; non-emptiness is automatic from the cons. The alternative carries `(hw : IsWord (a :: l))` and says the record's sentence on its own domain; V₁ weighs which is the record's "one-step rotation" statement.
- **Own exact arithmetic** (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/check.py` (output `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/check.out`)): the 69,904 words of even length ≤ 8: 0 violations; every list over {0, …, 6} of even length 2, 4, 6 and the first 300,000 of length 8 in lexicographic order (420,099 lists, syllables outside {1, …, 4} included): 0 violations.

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
Even	AMBIGUOUS 2 sites
IsSquare	FOUND _root_ Mathlib/Algebra/Group/Even.lean:57
Nat.even_add_one	FOUND Nat Mathlib/Algebra/Group/Nat/Even.lean:47
List.rotate_cons_succ	FOUND List Mathlib/Data/List/Rotate.lean:108
List.length_append	NOT FOUND
List.length_cons	NOT FOUND
```

- `Even` AMBIGUOUS as in G5-EVKRa §4. `List.length_append`, `List.length_cons` NOT FOUND: Lean core (`src/lean/Init/Data/List/Basic.lean:631` and `:89`).
- Targeted by the statement: `Even`, `List.length` (core), `++` and `::` (core `List`), the negation on ℤ, U12's `A`. Proof aids: `Nat.even_add_one`, `List.length_append`, `List.length_cons`; `List.rotate_cons_succ` only to relate the display to `List.rotate` if a later reader wants it.
- No name is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for a list a :: l of even length, the alternating sum of its one-step rotation l ++ [a] is exactly the negative of the alternating sum of a :: l, as integers.

Probe: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/probe-U14.lean` — **NOT RUN by this seat** (the brief: no `lake` command of any kind; no Lean compiled); the orchestrator elaborates it serially and returns exit and first error. The block below sits inside `namespace G5` after `open G5 ZPhi` and is the probe's text byte for byte (the fifth of the probe's five theorems).

```lean
/-- G5-EVKRc (Rem. 4.4, the rotation). For a list `a :: l` of even length, the one-step
rotation `l ++ [a]` has alternating sum exactly `−A (a :: l)`, as integers.
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Rotation (the brief's
question)" (l. 63); STATEMENTS.md row G5-EVKR (l. 72), clause (3).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u14_evkr_rot (a : ℕ) (l : List ℕ) (hk : Even (a :: l).length) :
    A (l ++ [a]) = -A (a :: l) := by sorry
```

## 6 · What the row does not claim

- **Not the consequence "the congruence is invariant under rotation"** (print l. 67; record "the clause 'A ≡ 0 (mod 5)' is rotation-invariant", l. 63) — immediate from the identity, not stated; **not the inverse rotation** (a_k, a₁, …, a_{k−1}) (the identity applied to it gives it back); **not reversal or flip** ("reversal and flip each send A to −A", l. 63, a parenthesis); **not the group-theoretic reason** (rotation conjugates W by R^{a₁}S, l. 63; print l. 77).
- **Not the odd-k remark** (A′ not rotation-invariant, l. 63) and **not the counting corollary** ((4^k + 4)/5, l. 64 — the sweep's item 4, NOT-ON-THE-LANE: not printed).
- Words, not classes; no `IsWord` (§3).

## 7 · Status

SPEC-DRAFT 2026-10-30T21:39:23Z

V1: V1-GREEN 2026-10-30T21:50:38Z — faithful to SH-P4-LW-A §3 l. 63 ("For even k the one-step rotation w′ = (a₂, …, a_k, a₁) gives A(w′) = a₂ − a₃ + ⋯ + a_k − a₁ = −A(w) exactly, as integers") and the row's clause (3) (STATEMENTS l. 72): `l ++ [a]` for `a :: l` is the record's w′ for w = (a₁, a₂, …, a_k) with a = a₁, l = (a₂, …, a_k), the record's own display, no `List.rotate` convention needed; equality in ℤ is "exactly, as integers"; `Even (a :: l).length` is "for even k" and carries content (own arithmetic: fails on all 1,092 words of odd length ≤ 5; the record's (1, 1, 2) ↦ (1, 2, 1): A 2 vs 0). **The dropped `IsWord` — GREEN with the note:** the statement quantifies over every `a : ℕ`, `l : List ℕ`, a domain wider than the record's words; it is a TRUE identity on the frozen `A`'s whole domain (by hand: A (l ++ [a]) = A l + (−1)^{|l|} a, and |l| odd gives A l − a = −(a − A l)), it specializes to the record's sentence on words with nothing to discharge, and the record's own proof (l. 63, the print l. 77 "because k is even") uses only the parity of k, never the syllable range — so it adds no content the record does not prove, the convention (U12's `A`) is unchanged, and the form `(hw : IsWord (a :: l))` would be equally faithful; `A` U12's frozen `G5.A`; §2 quotes byte-equal (REC l. 63 whole line; STATEMENTS l. 72 substring; print l. 67, l. 77 whole lines); §5 a byte substring of the probe; own exact check, 69,904 words of even length ≤ 8 and all 266,304 lists over {0, …, 7} of even length 2–6: 0 violations.
V1-parse: 0 Lean line(s) over 100 code points
V1-split: V1-SPLIT-OK 2026-10-30T21:50:38Z — G5-EVKR → G5-EVKRc carries the row's clause (3), the exact rotation identity, whole.
