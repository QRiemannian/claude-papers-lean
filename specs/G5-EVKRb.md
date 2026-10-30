# G5-EVKRb

## 1 · Header

row: G5-EVKRb
unit: U14 `G5/EvenKRemark`
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T21:19:01Z and again at 2026-10-30T21:39:23Z; equal to the brief's edition; this edition EXTENDS the two before it — `head -c 25981` reproduces `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47` (U12/U13's pin) and `head -c 21568` reproduces `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` (the frozen eleven's pin))
source_bytes: 30598 (`wc -c` at 2026-10-30T21:19:01Z and 2026-10-30T21:39:23Z; the edition pair `sha256:4a53d9ba… · 30598 B`)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U2 `G5.ModTwo.Challenge` c342ab92ba8ef07e5a9fba82422968b9de4410974583210dc1dcded53354c78c · U12 `G5.EvenK.Challenge` 321dfbf5abdc78157328a8f7d1c53d40ae09a60b6a5cf027824d09da8f967565 (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-30T21:19:01Z matches)
locus: `Claude-Papers/No1-G5/candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)" (l. 58, the mechanism and clause (b) in the remark's statement), its proof (l. 60), "Rotation (the brief's question)" (l. 63); STATEMENTS.md row G5-EVKR (l. 72) and §6 (l. 66–68); the sweep `Claude-Papers/No1-G5/phase-4/close/L1-printed-uncarried-sweep.md` items 1–3 (l. 23–25); the print `Claude-Papers/No1-G5/phase-4/draft/S4-congruence.md` Rem. 4.4 (l. 56–67, display (4.5) l. 75, proof l. 77), quoted beside the record, never instead of it; this spec carries clause (2), the order clause — the record's (a) ⟺ (b)
spec_clock: 2026-10-30T21:39:23Z

## 2 · Printed statement, verbatim

> **Remark 4.4 (even k).** Let k be even and A(w) = a₁ − a₂ + a₃ − ⋯ − a_k. Then W̄ = r^{A(w)}, and the following are equivalent: (a) A(w) ≡ 0 (mod 5); (b) the image of W in PSL(2, 𝔽₄) has order ≠ 5 (the test (11.4)); (c) y is even; (d) x ≡ y ≡ 0 (mod 2).
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3, l. 58 (the whole line — the remark's statement, clause (b): "the image of W in PSL(2, 𝔽₄) has order ≠ 5 (the test (11.4))")

> *Proof.* Grouping W̄ = (r^{a₁}s r^{a₂}s)(r^{a₃}s r^{a₄}s)⋯ gives W̄ = r^{(a₁−a₂)+(a₃−a₄)+⋯} = r^{A(w)}. Since r has order 5, W̄ = 1 iff 5 ∣ A and otherwise W̄ has order 5: (a) ⟺ (b). If 5 ∣ A, tr W̄ = 0, which is (d), which implies (c). **(⟸)** If 5 ∤ A, tr W̄ ∈ {ω, ω²}, whose ω-coefficient is 1: y is odd. By contraposition y even ⟹ 5 ∣ A, closing (c) ⟹ (a). ∎
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3, l. 60 (the whole line — the proof: "Since r has order 5, W̄ = 1 iff 5 ∣ A and otherwise W̄ has order 5: (a) ⟺ (b)")

> For every word W = R^{a₁}S ⋯ R^{a_k}S with k even and A(W) the alternating sum of U12: (1) the image W̄ of W in PSL(2, 𝔽₄) ≅ D₅ is r^{A(W)} — the mechanism; (2) 5 ∣ A(W) exactly when W̄ = 1, and otherwise W̄ has order exactly 5 — so (a) of the even-k law is equivalent to the record's (b), "the image of W has order other than 5" (the Atlas's test (11.4)); (3) a one-step rotation W′ of W has A(W′) = −A(W) exactly, as integers.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` row G5-EVKR, l. 72, the statement cell (a verbatim substring; the row's pointer, not the authority)

> **Remark 4.4 (the Atlas's (11.4), read through D₅).** The Atlas records the necessary condition (11.4) [Atlas, §11.1]: if tr W ∈ ℤ, the image of W in PSL(2, 𝔽₄) ≅ A₅ has order 1, 2 or 3, never 5. Since the image of G(5) lies in D₅, which has no element of order 3, the condition reads: the image of W has order 1 or 2. At odd syllable count it is vacuous, for there the image is an involution (the proof of Theorem 4.1). At even syllable count it is an exact criterion for the parity of y. Let k be even and write the alternating sum
>  (b) the image of W has order other than 5 — the test (11.4);
> Since r has order 5, W̄ = 1 if 5 ∣ A and W̄ has order 5 otherwise; this is (a) ⟺ (b). If 5 ∣ A then tr W̄ = 0, which is (d) by (4.1), and (d) implies (c). Conversely, if 5 ∤ A then tr W̄ ∈ {ω, ω²} by (4.2), so y is odd by (4.1); by contraposition (c) implies (a). For the rotation, A(a₂, …, a_k, a₁) = a₂ − a₃ + ⋯ + a_k − a₁ = −A(a₁, …, a_k), because k is even; group-theoretically, the rotation conjugates W by R^{a₁}S, whose image r^{a₁}s is a reflection of D₅ and inverts r^{A}. ∎
>
> — `Claude-Papers/No1-G5/phase-4/draft/S4-congruence.md` Rem. 4.4, l. 56 (the reading of (11.4)), l. 63 (clause (b)), l. 77 (the proof) (the PRINT, quoted beside the record)

## 3 · Formal reading

- **Words and k.** `w : List ℕ` with U1's `IsWord w` (non-empty, every syllable in {1, 2, 3, 4}); the syllable count k is `w.length`; "k even" is `Even w.length` (mathlib's root `Even`), as U12's frozen rows write it. `IsWord` excludes the empty list, so the even case begins at k = 2.
- **A is U12's, frozen.** `A : List ℕ → ℤ` from `G5.EvenK.Challenge` (`A [] = 0`, `A (a :: l) = (a : ℤ) − A l`, so `A [a₁, …, a_k] = a₁ − a₂ + a₃ − ⋯`, the record's A(w), l. 58), imported, not restated. **U14 defines nothing.**
- **W̄, the image in PSL(2, 𝔽₄), is `red2M (W w)`:** U2's entrywise reduction mod 2 of U1's LITERAL word `W w` = R^{a₁}S ⋯ R^{a_k}S, a matrix in U2's `F4M` (2 × 2 over U2's 𝔽₄ = pairs mod 2 with the ℤ[φ] product). The record's s, t, r are U2's `Sbar`, `Tbar`, `Rbar` ("s = S̄ … r = R̄ = ts", l. 54; U2's `Rbar = red2M R`, `g5_u2_d5_gens` gives `Rbar = Tbar * Sbar`). **SL = PSL here (my reasoning, the record's own relations):** in characteristic 2, −1 = 1 in 𝔽₄, so the centre {±I} of SL(2, 𝔽₄) is trivial and the reduced matrix IS the image in PSL(2, 𝔽₄) — the record writes "S² = −I ≡ I", "R⁵ = −I ≡ I" (l. 54). No PSL quotient is formed.
- **The order is mathlib's `orderOf`** in the monoid `F4M` (the matrix ring's multiplication; U2's frozen statements already use `Rbar ^ 5 = 1` and `Submonoid.closure` there). By the SL = PSL remark above, the order of `red2M (W w)` is the order of the image of W in PSL(2, 𝔽₄), the record's (b). `orderOf` is 0 on an element of infinite order; none occurs (`F4M` is finite).
- **Three theorems, for V₁'s signature.** The row's clause (2) has two legs and a consequence: **`g5_u14_evkr_one`** — `(5 : ℤ) ∣ A w ↔ red2M (W w) = 1` ("5 ∣ A(W) exactly when W̄ = 1"; the record's "W̄ = 1 iff 5 ∣ A", l. 60); **`g5_u14_evkr_ord`** — `¬ (5 : ℤ) ∣ A w → orderOf (red2M (W w)) = 5` ("and otherwise W̄ has order exactly 5"; "otherwise W̄ has order 5", l. 60); **`g5_u14_evkr_b`** — `(5 : ℤ) ∣ A w ↔ orderOf (red2M (W w)) ≠ 5` ("so (a) of the even-k law is equivalent to the record's (b)"; "(a) ⟺ (b)", l. 60, with (b) "order ≠ 5", l. 58). `_b` follows from the two legs (order of 1 is 1); it is kept because the row and the record state it as the clause's point. "A ≡ 0 (mod 5)" is `(5 : ℤ) ∣ A w`, U12's form.
- **Not stated: "order 1 or 2".** The print reads (11.4) as "the image of W has order 1 or 2" (S4 l. 56) over every k; at even k the image lies in ⟨r⟩ and order 2 does not occur (own arithmetic: the orders met at even k ≤ 8 are exactly {1, 5}), so at even k "order other than 5" is "order 1", which `g5_u14_evkr_one` states. The row's clause (2) does not carry the print's "1 or 2" reading, and neither does this spec (the sweep left the shape to M, l. 41).
- **Own exact arithmetic** (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/check.py` (output `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/check.out`)): the 69,904 words of even length ≤ 8: `evkr_one` 0 violations, `evkr_ord` 0 violations, `evkr_b` 0 violations; orders seen {1, 5}; sample (1, 2): A = −1, order 5.

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
orderOf	FOUND _root_ Mathlib/GroupTheory/OrderOfElement.lean:180
orderOf_eq_prime	FOUND _root_ Mathlib/GroupTheory/OrderOfElement.lean:537
orderOf_eq_one_iff	FOUND _root_ Mathlib/GroupTheory/OrderOfElement.lean:260
pow_orderOf_eq_one	FOUND _root_ Mathlib/GroupTheory/OrderOfElement.lean:200
orderOf_eq_iff	FOUND _root_ Mathlib/GroupTheory/OrderOfElement.lean:227
ZMod.intCast_zmod_eq_zero_iff_dvd	FOUND ZMod Mathlib/Data/ZMod/Basic.lean:513
Dvd.dvd	NOT FOUND
Even	AMBIGUOUS 2 sites
IsSquare	FOUND _root_ Mathlib/Algebra/Group/Even.lean:57
```

- `Dvd.dvd` NOT FOUND: Lean core (`class Dvd`, the toolchain's `src/lean/Init/Prelude.lean:1561`); `∣` on ℤ is used by U12's frozen `g5_u12_evk_a`. `Even` AMBIGUOUS as in G5-EVKRa §4.
- Targeted by the statement: `orderOf` (FOUND, `_root_`), `∣` (core), `Even`, U1's `IsWord`, `W`, U2's `red2M`, U12's `A`. Proof aids: `orderOf_eq_prime` (order exactly 5 from x⁵ = 1, x ≠ 1), `orderOf_eq_one_iff`, `pow_orderOf_eq_one`, `orderOf_eq_iff`, `ZMod.intCast_zmod_eq_zero_iff_dvd` (U12's Solution used it).
- No name is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for a word of even length, 5 divides A(w) exactly when the reduction mod 2 of the literal word is the identity; when 5 does not divide A(w), that reduction has order exactly 5; hence 5 divides A(w) exactly when the order is not 5.

Probe: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/probe-U14.lean` — **NOT RUN by this seat** (the brief: no `lake` command of any kind; no Lean compiled); the orchestrator elaborates it serially and returns exit and first error. The block below sits inside `namespace G5` after `open G5 ZPhi` and is the probe's text byte for byte (the second, third and fourth of the probe's five theorems).

```lean
/-- G5-EVKRb (Rem. 4.4, clause (b): the first leg). For a word of even length, `5 ∣ A w`
exactly when the reduction mod 2 of the literal word is the identity.
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)"
(l. 58, proof l. 60); STATEMENTS.md row G5-EVKR (l. 72), clause (2).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u14_evkr_one (w : List ℕ) (hw : IsWord w) (hk : Even w.length) :
    (5 : ℤ) ∣ A w ↔ red2M (W w) = 1 := by sorry

/-- G5-EVKRb (Rem. 4.4, clause (b): the second leg). For a word of even length with
`5 ∤ A w`, the reduction mod 2 of the literal word has order exactly 5.
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)"
(l. 58, proof l. 60); STATEMENTS.md row G5-EVKR (l. 72), clause (2).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u14_evkr_ord (w : List ℕ) (hw : IsWord w) (hk : Even w.length)
    (h5 : ¬ (5 : ℤ) ∣ A w) : orderOf (red2M (W w)) = 5 := by sorry

/-- G5-EVKRb (Rem. 4.4, (a) ⟺ (b)). For a word of even length, `5 ∣ A w` exactly when
the image of the literal word mod 2 has order other than 5 (the Atlas's test (11.4)).
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)"
(l. 58, proof l. 60); STATEMENTS.md row G5-EVKR (l. 72), clause (2).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u14_evkr_b (w : List ℕ) (hw : IsWord w) (hk : Even w.length) :
    (5 : ℤ) ∣ A w ↔ orderOf (red2M (W w)) ≠ 5 := by sorry
```

## 6 · What the row does not claim

- **Nothing at odd k:** there the image is an involution and (11.4) is vacuous (l. 61; the print l. 56) — U2's territory (G5-L1 and the word-to-D₅ bridge, STATEMENTS.md §2 item 7).
- **Not the Atlas's (11.4) as an Atlas statement** (if tr W ∈ ℤ, order 1, 2 or 3, print l. 56), nor PSL(2, 𝔽₄) ≅ A₅; not the print's "order 1 or 2" (§3).
- **Not the trace clauses** (c), (d) — U12's G5-EVKa/b, frozen; this row links (a) to (b) only.
- Words, not classes.

## 7 · Status

SPEC-DRAFT 2026-10-30T21:39:23Z

V1: V1-GREEN 2026-10-30T21:50:38Z — the three theorems are the record's clause (b) and its proof, no stronger, no weaker: `g5_u14_evkr_one` = "W̄ = 1 iff 5 ∣ A" (SH-P4-LW-A l. 60), `g5_u14_evkr_ord` = "otherwise W̄ has order 5" (l. 60), `g5_u14_evkr_b` = "(a) ⟺ (b)" with (b) "the image of W in PSL(2, 𝔽₄) has order ≠ 5" (l. 58), the row's clause (2) (STATEMENTS l. 72); "A ≡ 0 (mod 5)" as `(5 : ℤ) ∣ A w`, U12's frozen form; mathlib's `orderOf` in U2's `F4M` (`abbrev F4M := Matrix (Fin 2) (Fin 2) F4`, a monoid under the matrix product, the type U2's frozen `Rbar ^ 5 = 1` and `Submonoid.closure` already use) is the record's order: powers in the monoid are the group's powers, `red2M (W w)` is a unit (`D5bar`), so `orderOf` is positive and equals its order in SL(2, 𝔽₄) = PSL(2, 𝔽₄) (characteristic 2, as in G5-EVKRa); `g5_u14_evkr_b` KEPT — the record states (b) as a clause of the remark's equivalence (l. 58) and the row says "so (a) … is equivalent to the record's (b)", so without it the record's (b) is on no theorem in its own words; the print's "order 1 or 2" (S4 l. 56) rightly unstated (not the record's l. 58–60 wording; at even k order 2 does not occur); §2 quotes byte-equal (REC l. 58, l. 60; STATEMENTS l. 72 substring; print l. 56, l. 63, l. 77 whole lines); §5 a byte substring of the probe; own exact check, 69,904 words of even length ≤ 8: one 0, ord 0, b 0 violations, orders met exactly {1, 5}.
V1-parse: 0 Lean line(s) over 100 code points
V1-split: V1-SPLIT-OK 2026-10-30T21:50:38Z — G5-EVKR → G5-EVKRb carries the row's clause (2) whole: its two legs and its consequence (a) ⟺ (b), all three kept.
