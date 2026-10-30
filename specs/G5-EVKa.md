# G5-EVKa

## 1 · Header

row: G5-EVKa
unit: U12 `G5/EvenK`
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T18:17:12Z and again at 2026-10-30T18:24:51Z; equal to the brief's edition; this edition EXTENDS the frozen units' edition — `head -c 21568` reproduces `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731`)
source_bytes: 25981 (`wc -c` at 2026-10-30T18:17:12Z and 2026-10-30T18:24:51Z; the edition pair `sha256:1fb5b03e… · 25981 B`)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U2 `G5.ModTwo.Challenge` c342ab92ba8ef07e5a9fba82422968b9de4410974583210dc1dcded53354c78c (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-30T18:21:21Z matches)
locus: `Claude-Papers/No1-G5/candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)" (l. 58) and its proof (l. 60) — the row's l. 58–64 (l. 61–64 carry the odd-k aside, the rotation remark and the counting corollary, none a clause of the row); `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/analytical-methods.md` §3.1 (l. 123–124); STATEMENTS.md row G5-EVK (l. 63) and §5 (l. 57–59); the print `Claude-Papers/No1-G5/phase-4/draft/S4-congruence.md` Rem. 4.4 (l. 56–67), quoted beside the record, never instead of it; this spec carries (a) ⟺ (c) and the unit's one definition `A`
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

- **Words and k.** `w : List ℕ` with U1's `IsWord w` (non-empty, every syllable in {1, 2, 3, 4}); the syllable count k is `w.length`; "k even" is `Even w.length` (mathlib's root `Even`: `∃ r, n = r + r`). U1's `IsWord` excludes the empty list, so k ≥ 2 here (see §6).
- **The one definition, for V₁'s signature: `A : List ℕ → ℤ`, by recursion** — `A [] = 0`, `A (a :: l) = (a : ℤ) − A l` (ℕ → ℤ by the cast). Unfolded: `A [a₁, …, a_k] = a₁ − (a₂ − (a₃ − ⋯)) = a₁ − a₂ + a₃ − ⋯`, the last sign `−` at even k, which is the record's "A(w) = a₁ − a₂ + a₃ − ⋯ − a_k" (SH-P4-LW-A l. 58) and AM's "a₁ − a₂ + a₃ − ⋯ − a_k" (l. 124) term for term; integer-valued, as the row says. It is defined on every list; the theorem reads it only at even k. Sample, own hand: `A [4, 1, 3, 2] = 4 − 1 + 3 − 2 = 4`. A recursion rather than a fold: one equation per constructor, so `simp [A]` unfolds it on a cons. No other definition enters the unit.
- **(a) "A(w) ≡ 0 (mod 5)"** is `(5 : ℤ) ∣ A w` (divisibility in ℤ; ≡ 0 mod 5 ⟺ 5 ∣); the row's Lean notes name this form.
- **(c) "y is even, where tr W = x + yφ"** is `Even (W w).trace.y`: the trace of the LITERAL word W = R^{a₁}S ⋯ R^{a_k}S (U1's `W`, R = T S), an element `⟨x, y⟩` of U1's `ZPhi`, its φ-coefficient the field `.y` — the form U2's frozen `g5_u2_l1`, `g5_u2_l2` use. At even k the literal and the normalized trace agree (U1's `g5_u1_trace`: `ntr w = (−1)^k · tr W`), so the record's tr W and the paper's t give the same y; the statement takes the literal, as the record writes it.
- **The record's (b)** (the order of the image in PSL(2, 𝔽₄)) is not a row (STATEMENTS.md l. 63: "the D₅ reading of (a) and is not restated as a row"); nothing in the statement names PSL or an order.
- **The route on the record (for the L seat; not part of the statement):** U2's frozen names — `red2`, `Rbar`, `Sbar`, `D5bar`, `g5_u2_red_hom` (reduction a ring map, so `red2M (W w)` is the product of the reduced syllables), `g5_u2_d5_gens` (S̄² = 1, R̄⁵ = 1, S̄R̄S̄ = R̄⁴, whence r^a s r^b s = r^{a−b}), `g5_u2_d5_image`, `g5_u2_d5_trace`; the record's pairing W̄ = r^{A(w)} at even k (l. 60), tr r^m = 0 iff 5 ∣ m, else ω or ω² — φ-coefficient 1, i.e. y odd (l. 56); `g5_u2_red_eq_zero` (`red2 t = 0 ↔ 2 ∣ t.x ∧ 2 ∣ t.y`, the record's "tr W̄ = 0, which is (d)"). The statement file imports U1 and U2 (the row's Lean notes), and the Solution may import more.
- **Own exact arithmetic** (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD2/check.py`): over every word of even length 2, 4, 6, 8 (69,904 words), (a) ⟺ (c) ⟺ (d) with 0 violations, and tr W = ntr w on each; over odd lengths 1, 3, 5, (a) ⟺ (c) FAILS on 876 words — the hypothesis `Even w.length` carries content and is not decoration.

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
Even	AMBIGUOUS 2 sites
IsSquare	FOUND _root_ Mathlib/Algebra/Group/Even.lean:57
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
Dvd.dvd	NOT FOUND
List.length	NOT FOUND
Nat.cast	NOT FOUND
Matrix.trace_fin_two	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:220
Int.even_or_odd	FOUND Int Mathlib/Algebra/Ring/Int/Parity.lean:40
Int.not_even_iff_odd	FOUND Int Mathlib/Algebra/Ring/Int/Parity.lean:38
even_iff_two_dvd	FOUND _root_ Mathlib/Algebra/Ring/Parity.lean:80
Int.emod_two_eq_zero_or_one	FOUND Int Mathlib/Data/Int/Init.lean:279
```

- `Even` reads AMBIGUOUS because the root `Even` is not declared by a keyword: it is generated by `@[to_additive]` on `IsSquare` (`Mathlib/Algebra/Group/Even.lean:55–57`; `IsSquare` FOUND above); the two keyword sites are `Function.Even` and `DirichletCharacter.Even`, neither meant (U2's G5-L1 spec reads the same). The root `Even` is used verbatim by U2's frozen Challenge.
- `Dvd.dvd`, `List.length`, `Nat.cast` read NOT FOUND because they are Lean core, not mathlib: `class Dvd` at the toolchain's `src/lean/Init/Prelude.lean:1561`, `class NatCast` at `src/lean/Init/Data/Cast.lean:63` (`leanprover/lean4:v4.33.0`), `List.length` core; `∣` on ℤ is used by U2's frozen `g5_u2_red_eq_zero`.
- Targeted by the statement: `Even`, `Matrix.trace`, `∣` (core `Dvd`), the cast ℕ → ℤ (core `NatCast`), U1's `IsWord`, `W`, `ZPhi.y`, the new `A`. Proof aids: `Matrix.trace_fin_two`, `Int.even_or_odd`, `Int.not_even_iff_odd`, `even_iff_two_dvd`, `Int.emod_two_eq_zero_or_one`.
- No name is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: the alternating sum A of a syllable list is a₁ − a₂ + a₃ − ⋯; for a word of even length, 5 divides A exactly when the φ-coefficient of the trace of the literal word is even.

Probe: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD2/probe-U12.lean` — **NOT RUN by this seat** (the brief: no `lake` command of any kind); the orchestrator elaborates it serially and returns exit and first error. The block below sits inside `namespace G5` after `open G5 ZPhi` and is the probe's text byte for byte (the probe's definition and the first of its two theorems).

```lean
/-- G5-EVK, the one definition: the alternating sum of the syllables,
`A [a₁, a₂, …, a_k] = a₁ − a₂ + a₃ − ⋯` in ℤ, by recursion: `A [] = 0` and
`A (a :: l) = a − A l`.
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 (l. 58); STATEMENTS.md row
G5-EVK (l. 63). STATEMENTS.md sha256 prefix `1fb5b03e`. -/
def A : List ℕ → ℤ
  | [] => 0
  | a :: l => (a : ℤ) - A l

/-- G5-EVKa (the even-k law, (a) ⟺ (c)). For a word of even length, `5 ∣ A w` exactly
when the φ-coefficient `y` of `tr W = x + y φ` is even.
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)"
(l. 58, l. 60); AM transcript §3.1 (l. 124); STATEMENTS.md row G5-EVK (l. 63).
STATEMENTS.md sha256 prefix `1fb5b03e`. -/
theorem g5_u12_evk_a (w : List ℕ) (hw : IsWord w) (hk : Even w.length) :
    (5 : ℤ) ∣ A w ↔ Even (W w).trace.y := by sorry
```

## 6 · What the row does not claim

- **k = 0 is not in the statement:** U1's `IsWord` requires `w ≠ []`, so the empty word (A = 0, tr = 2, both sides true) is excluded by the hypothesis and the record's "words W = R^{a₁}S ⋯ R^{a_k}S" are the non-empty ones; the even case begins at k = 2. Not vacuous: at k = 2, (1, 1) has A = 0 and (1, 2) has A = −1, and both sides of the iff take both values (own arithmetic).
- **Nothing at odd k.** The record's odd-k paragraph (l. 61) is "for completeness", G5-L1's territory (U2); the theorem's hypothesis is `Even w.length`, and the law is false at odd k (§3).
- **Not the record's (b)** (order ≠ 5 in PSL(2, 𝔽₄), the Atlas's test (11.4)); **not the rotation remark** (A(w′) = −A(w) at even k, l. 63); **not the counting corollary** ((4^k + 4)/5, l. 64); **not the mechanism W̄ = r^{A(w)}** as a theorem (the record's proof device, l. 58/60 — the route, not a clause of the row). Words, not classes.

## 7 · Status

SPEC-DRAFT 2026-10-30T18:24:51Z
