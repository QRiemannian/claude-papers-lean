# G5-EVKb

## 1 · Header

row: G5-EVKb
unit: U12 `G5/EvenK`
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T18:17:12Z and again at 2026-10-30T18:24:51Z; equal to the brief's edition; this edition EXTENDS the frozen units' edition — `head -c 21568` reproduces `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731`)
source_bytes: 25981 (`wc -c` at 2026-10-30T18:17:12Z and 2026-10-30T18:24:51Z; the edition pair `sha256:1fb5b03e… · 25981 B`)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U2 `G5.ModTwo.Challenge` c342ab92ba8ef07e5a9fba82422968b9de4410974583210dc1dcded53354c78c (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-30T18:21:21Z matches)
locus: `Claude-Papers/No1-G5/candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)" (l. 58) and its proof (l. 60) — the row's l. 58–64 (l. 61–64 carry the odd-k aside, the rotation remark and the counting corollary, none a clause of the row); `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` §3.1 (l. 123–124); STATEMENTS.md row G5-EVK (l. 63) and §5 (l. 57–59); the print `Claude-Papers/No1-G5/phase-4/draft/S4-congruence.md` Rem. 4.4 (l. 56–67), quoted beside the record, never instead of it; this spec carries (c) ⟺ (d)
spec_clock: 2026-10-30T18:24:51Z

## 2 · Printed statement, verbatim

> **Remark 4.4 (even k).** Let k be even and A(w) = a₁ − a₂ + a₃ − ⋯ − a_k. Then W̄ = r^{A(w)}, and the following are equivalent: (a) A(w) ≡ 0 (mod 5); (b) the image of W in PSL(2, 𝔽₄) has order ≠ 5 (the test (11.4)); (c) y is even; (d) x ≡ y ≡ 0 (mod 2).
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3, l. 58 (the whole line — the source of record's statement)

> *Proof.* Grouping W̄ = (r^{a₁}s r^{a₂}s)(r^{a₃}s r^{a₄}s)⋯ gives W̄ = r^{(a₁−a₂)+(a₃−a₄)+⋯} = r^{A(w)}. Since r has order 5, W̄ = 1 iff 5 ∣ A and otherwise W̄ has order 5: (a) ⟺ (b). If 5 ∣ A, tr W̄ = 0, which is (d), which implies (c). **(⟸)** If 5 ∤ A, tr W̄ ∈ {ω, ω²}, whose ω-coefficient is 1: y is odd. By contraposition y even ⟹ 5 ∣ A, closing (c) ⟹ (a). ∎
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3, l. 60 (the whole line — the proof, both directions)

> ### 3.1 (a) The even-k alternating sum — WORKED OUT HERE
> In D₅ = ⟨r, s | r⁵, s², srs = r⁻¹⟩ with r = R̄, s = S̄: r^{a}s r^{b}s = r^{a−b}, so for even k the image is r^{a₁ − a₂ + a₃ − ⋯ − a_k}. Char 2: trivial image ↔ trace 0 (= 2), order 5 ↔ trace ω, ω² ↔ y odd. Hence y even ⟺ a₁ − a₂ + ⋯ − a_k ≡ 0 mod 5 (k even). For odd k the image is a reflection, y even always (L-1).
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` §3.1, l. 123–124 (the whole lines)

> For every word W = R^{a₁}S ⋯ R^{a_k}S with k even, let A(W) = a₁ − a₂ + a₃ − ⋯ − a_k (the alternating sum of the exponents, an integer). Then the following are equivalent: (a) A(W) ≡ 0 (mod 5); (c) y is even, where tr W = x + yφ; (d) x ≡ y ≡ 0 (mod 2). (The record's (b) — "the image of W in PSL(2, 𝔽₄) has order other than 5, the Atlas's test (11.4)" — is the D₅ reading of (a) and is not restated as a row; the rotation remark A(W′) = −A(W) for a one-step rotation is a remark, not a clause.)
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` row G5-EVK, l. 63, the statement cell (a verbatim substring; the row's pointer, not the authority)

>   A(W) = a₁ − a₂ + a₃ − ⋯ − a_k.  (4.4)
>
> Then W̄ = r^{A(W)}, and the following are equivalent:
>
>  (a) A(W) ≡ 0 (mod 5);
>  (b) the image of W has order other than 5 — the test (11.4);
>  (c) y is even;
>  (d) x ≡ y ≡ 0 (mod 2).
>
> — `Claude-Papers/No1-G5/phase-4/draft/S4-congruence.md` Rem. 4.4, l. 58–65 (the PRINT, quoted beside the record)

## 3 · Formal reading

- **Words and k:** as G5-EVKa — `IsWord w`, `Even w.length`.
- **(c) "y is even"** is `Even (W w).trace.y`, as in G5-EVKa (the literal word's trace, U1's `W`, the field `.y`).
- **(d) "x ≡ y ≡ 0 (mod 2)"** is `Even (W w).trace.x ∧ Even (W w).trace.y` — both coordinates of tr W even, the form of U2's frozen `g5_u2_l1` (and, through `even_iff_two_dvd`, of `g5_u2_red_eq_zero`'s `2 ∣ t.x ∧ 2 ∣ t.y`).
- **A one-line corollary of a frozen row, kept as a row anyway (the brief's rule).** (d) ⟹ (c) is the right conjunct; (c) ⟹ (d) is U2's frozen `g5_u2_l2` (`¬ (Odd (W w).trace.x ∧ Even (W w).trace.y)`, every word) with `Int.not_even_iff_odd`: y even forces x even. The brief places EVKb in `g5_u2_red_eq_zero`'s territory; the immediate frozen source is `g5_u2_l2`. It is a row of U12 because the record's (d) is part of the printed statement (SH-P4-LW-A l. 58, the print l. 65).
- **`hk : Even w.length` is carried though this leg's proof does not need it:** the record states the four-way equivalence under "Let k be even" (l. 58), and the statement says what the record says; through `g5_u2_l2` the equivalence holds at every k (own arithmetic, and the frozen theorem). The precedent: U3's G5-SEPa carries an unused `hw` (ledger STATUS row G5-SEPa). `hw : IsWord w` is used (by `g5_u2_l2`).
- EVKb does not name `A`.

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
Even	AMBIGUOUS 2 sites
IsSquare	FOUND _root_ Mathlib/Algebra/Group/Even.lean:57
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
Int.not_even_iff_odd	FOUND Int Mathlib/Algebra/Ring/Int/Parity.lean:38
even_iff_two_dvd	FOUND _root_ Mathlib/Algebra/Ring/Parity.lean:80
List.length	NOT FOUND
```

- `Even` AMBIGUOUS: the root `Even` is generated by `@[to_additive]` on `IsSquare` (`Mathlib/Algebra/Group/Even.lean:55–57`; `IsSquare` FOUND); the keyword sites `Function.Even`, `DirichletCharacter.Even` are not meant. `List.length` NOT FOUND: Lean core.
- Targeted: `Even`, `Matrix.trace`, U1's `IsWord`, `W`, `ZPhi.x`, `ZPhi.y`. Proof aids: `Int.not_even_iff_odd`, `even_iff_two_dvd`, U2's `g5_u2_l2`.
- No name is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for a word of even length, the φ-coefficient of the trace of the literal word is even exactly when both coordinates are even.

Probe: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD2/probe-U12.lean` — **NOT RUN by this seat** (the brief: no `lake` command of any kind); the orchestrator elaborates it serially and returns exit and first error. The block below sits inside `namespace G5` after `open G5 ZPhi` and is the probe's text byte for byte (the second of the probe's two theorems).

```lean
/-- G5-EVKb (the even-k law, (c) ⟺ (d)). For a word of even length, the φ-coefficient
`y` of `tr W = x + y φ` is even exactly when `x` and `y` are both even.
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)"
(l. 58, l. 60); STATEMENTS.md row G5-EVK (l. 63).
STATEMENTS.md sha256 prefix `1fb5b03e`. -/
theorem g5_u12_evk_b (w : List ℕ) (hw : IsWord w) (hk : Even w.length) :
    Even (W w).trace.y ↔ (Even (W w).trace.x ∧ Even (W w).trace.y) := by sorry
```

## 6 · What the row does not claim

- Nothing about A (that is G5-EVKa); nothing at odd k beyond what U2's G5-L1 already states; not the record's (b), the rotation remark, the counting corollary or the mechanism (as G5-EVKa §6).
- k = 0 excluded by `IsWord` (as G5-EVKa §6).

## 7 · Status

SPEC-DRAFT 2026-10-30T18:24:51Z
