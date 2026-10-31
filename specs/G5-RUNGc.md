# G5-RUNGc

## 1 · Header

row: G5-RUNGc
unit: U18 `G5/EveryRung`
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 9ebf30048d9d246295226f9f8aa7ac86da0d72956e1c1d6e0c45d4eda57c79b3 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-31T11:03:56Z and again at 2026-10-31T11:21:54Z; equal to the brief's edition `9ebf3004…`; this edition EXTENDS the three before it — `head -c 30598` reproduces `4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f`, `head -c 25981` reproduces `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47`, `head -c 21568` reproduces `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731`; `tail -c +30599` is §6's errata paragraph of 2026-10-30T21:53:55Z, which touches G5-EVKR and G5-SRCH only — none touch U16, U17, U18)
source_bytes: 31612 (`wc -c` at 2026-10-31T11:03:56Z and 2026-10-31T11:21:54Z; the edition pair `sha256:9ebf3004… · 31612 B`)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U7 `G5.Group.Challenge` 689c36e6c026a1ce151dd2ab84243a5f8f76bb20a11304c9065cdb358ed410ae · U10 `G5.Containment.Challenge` 34608245fb7cc62c538d6e5cab0592061649df8857ae133221b289e37e56b288 (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-31T11:21:54Z matches)
locus: `Claude-Papers/No1-G5/phase-4/proofs/RUNG/COROLLARY-RUNG.md` §1 "Corollary R" (l. 13, l. 15), §2 (C-5) (l. 25), §3 Lemma R.1 (l. 29–33), §5 Steps 2–3 (l. 77, l. 79); the second head `candidates/checks/SH-P4-RUNG-every-rung.md` (l. 15, l. 37: HOLDS); `phase-4/SKELETON.md` row "Cor. 3.6′ (every rung of the golden ladder)" (l. 121); the print `phase-4/draft/S3-theorem-a.md` (3.10) l. 260, Cor. 3.6′ l. 265–267 (draft id Cor. 3.6′, read-copy 3.7, final 3.7), l. 271, (3.12) l. 281, the Fibonacci numbers l. 96, quoted beside the record, never instead of it; the wall's final-read word §5 ("U18 — the every-rung corollary … in the pair form of (3.12)"); this spec carries the corollary as printed, in φⁿ + φ⁻ⁿ
print_read: the print quoted beside the record is read at `phase-4/draft/S2-preliminaries.md` sha256 0145195c324f510ce1dca3f161dda91fd23385427fcb538aba279a2228ee206e and `phase-4/draft/S3-theorem-a.md` sha256 5ccae24101d7e71bbe79c697e56b19290274a1958947c4d27d1284b519baa2a2 (`shasum -a 256` at 2026-10-31T11:21:54Z); the wall's final-read fix pass is landing in the drafts (both files modified 2026-10-31T11:11Z, Remark 3.6″ and the Cor. 3.6′ credit sentence now printed in S3 §3.4), so every print line number in this spec is at these digests; the record's own files carry the authority
spec_clock: 2026-10-31T11:21:54Z

## 2 · Printed statement, verbatim

> > **Corollary R (no rung of the golden ladder).** *For every integer k ≥ 1, no element of G(5) has trace ±(φᵏ + φ⁻ᵏ). Equivalently, no closed geodesic of G(5) — primitive or a multiple traversal — has length 2k ln φ.*
>
> — `Claude-Papers/No1-G5/phase-4/proofs/RUNG/COROLLARY-RUNG.md` l. 13 (§1, the statement — the record's k is the rung index, the print's n)

> > *Explicitly, t_k := φᵏ + φ⁻ᵏ is the Lucas number L_k (a rational integer ≥ 3) for even k, and F_k√5 = −F_k + 2F_kφ for odd k; the first values are t₁, …, t₈ = √5, 3, 2√5, 7, 5√5, 18, 13√5, 47 (the Atlas's (5.33)).*
>
> — `Claude-Papers/No1-G5/phase-4/proofs/RUNG/COROLLARY-RUNG.md` l. 15 (§1, the explicit pairs)

> - **(C-5) Fibonacci and Lucas numbers.** F₀ = 0, F₁ = 1, F_{n+1} = F_n + F_{n−1}, extended by F₋₁ = 1 (so that F₁ = F₀ + F₋₁; the indexing of `AM-1-second-head.md` §3). L_n := F_{n−1} + F_{n+1} (so L₀ = 2, L₁ = 1, L₂ = 3, L_{n+1} = L_n + L_{n−1}).
>
> — `Claude-Papers/No1-G5/phase-4/proofs/RUNG/COROLLARY-RUNG.md` l. 25 (§2 (C-5), the Fibonacci and Lucas numbers)

> > **Lemma R.1.** *For every integer n ≥ 0, in ℤ[φ]:*
> > *(a) φⁿ = F_{n−1} + F_nφ;*
> > *(b) φ·φ^σ = −1, hence φ⁻¹ = −φ^σ = φ − 1 ∈ ℤ[φ] and φ⁻ⁿ = (−1)ⁿ (φ^σ)ⁿ = (−1)ⁿ (F_{n+1} − F_nφ);*
> > *(c) t_n := φⁿ + φ⁻ⁿ = L_n (the pair (L_n, 0)) for n even, and t_n = −F_n + 2F_nφ = F_n(2φ − 1) = F_n√5 (the pair (−F_n, 2F_n)) for n odd;*
> > *(d) F_n ≥ 1 for n ≥ 1, and L_n ≥ 3 for n ≥ 2; in particular t_n ≠ ±2 for n ≥ 1, and t_n > 2 in the real order;*
>
> — `Claude-Papers/No1-G5/phase-4/proofs/RUNG/COROLLARY-RUNG.md` l. 29–33 (§3, Lemma R.1 (a)–(d))

> **Corollary R: HOLDS.** No gap, no fix required for the mathematics.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P4-RUNG-every-rung.md` l. 37 (the second head on Corollary R)

> for every integer k ≥ 1, no element of G(5) has trace ±(φᵏ + φ⁻ᵏ) — equivalently no closed geodesic of G(5), primitive or multiply traversed, has length 2k ln φ (even k: φᵏ + φ⁻ᵏ = L_k, a rational integer ≥ 3, killed by Thm 3.1's clauses x ≥ 0 and y = 0 ⟹ x = 2; odd k: = F_k√5 = (−F_k, 2F_k), killed by x ≥ 0 in either sign); Cor. 3.6's six values are the instance k ≤ 8
>
> — `Claude-Papers/No1-G5/phase-4/SKELETON.md` a verbatim substring of l. 121 (the inventory row Cor. 3.6′, the statement cell — a pointer)

> $$t_n \;:=\; \varphi^{n} + \varphi^{-n} \qquad (n \ge 1), \tag{3.10}$$
>
> — `Claude-Papers/No1-G5/phase-4/draft/S3-theorem-a.md` l. 260 ((3.10), the PRINT)

> > **Corollary 3.6′ (every rung of the golden ladder).** *For every integer $n \ge 1$, no element of
> > $G(5)$ has trace $\pm t_n = \pm(\varphi^n + \varphi^{-n})$. Equivalently, no closed geodesic of
> > $G(5)$ — primitive or multiply traversed — has length $2n\ln\varphi$.*
>
> — `Claude-Papers/No1-G5/phase-4/draft/S3-theorem-a.md` l. 265–267 (Corollary 3.6′, the PRINT)

> $$t_n \;=\; \begin{cases} (L_n,\ 0) & n \text{ even}, \\[2pt] (-F_n,\ 2F_n) \;=\; F_n(2\varphi - 1) \;=\; F_n\sqrt5 & n \text{ odd}, \end{cases} \tag{3.12}$$
>
> — `Claude-Papers/No1-G5/phase-4/draft/S3-theorem-a.md` l. 281 ((3.12), the PRINT)

> Fibonacci numbers $F_0 = 0$, $F_1 = 1$, $F_{j+1} = F_j + F_{j-1}$, extended by $F_{-1} = 1$
>
> — `Claude-Papers/No1-G5/phase-4/draft/S3-theorem-a.md` a verbatim substring of l. 96 (the PRINT's Fibonacci numbers)

> *Proof.* Write $L_n := F_{n-1} + F_{n+1}$ for the Lucas numbers.
>
> — `Claude-Papers/No1-G5/phase-4/draft/S3-theorem-a.md` l. 271 (the PRINT's Lucas numbers)

## 3 · Formal reading

- **The two definitions** (U18 defines exactly these two; Fibonacci and Lucas are on no frozen unit — `/usr/bin/grep -rn -i 'fib\|lucas' ~/Claude/projects/claude-papers-lean/G5/` hits only `G5/Sector/Solution.lean` l. 95, 100, 115, a private helper of U4's proof using mathlib's `Nat.fib`, no statement): `fibZ : ℕ → ℤ` with `fibZ 0 = 0`, `fibZ 1 = 1`, `fibZ (n + 2) = fibZ (n + 1) + fibZ n` — the record's (C-5) "F₀ = 0, F₁ = 1, F_{n+1} = F_n + F_{n−1}" on ℕ (the extension F₋₁ = 1 is an index the statement never uses); `lucasZ : ℕ → ℤ` with `lucasZ 0 = 2`, `lucasZ 1 = 1`, `lucasZ (n + 2) = lucasZ (n + 1) + lucasZ n` — the record defines `L_n := F_{n−1} + F_{n+1}` and states in the same parenthesis "(so L₀ = 2, L₁ = 1, L₂ = 3, L_{n+1} = L_n + L_{n−1})" (C-5, l. 25); the recursion is the brief's form and equals the record's sum for every n ≥ 0 once F₋₁ = 1 (own arithmetic, n ≤ 500, 0 exceptions). The sum form is not stated as a lemma — no statement needs it.
- **Names.** `fibZ`, `lucasZ` — multi-letter on purpose: under the lake file's `relaxedAutoImplicit = false` an unbound single letter such as `F` or `L` would be auto-bound as an implicit variable if the name ever fell out of scope, while a multi-letter name fails loudly. Classifier: `fibZ`, `lucasZ`, `G5.fibZ` NOT FOUND at the pin (no collision); mathlib has `Nat.fib` (FOUND) and no Lucas sequence (`Nat.lucas` NOT FOUND). V₁ may prefer `(Nat.fib n : ℤ)` for F (a mathlib name, one definition fewer); the brief asks for the two definitions, and they are restated byte for byte in the Solution under the prelude rule.
- **The rungs.** The record's t_n := φⁿ + φ⁻ⁿ (print (3.10); record l. 15) is, by (3.12) (record Lemma R.1 (c), l. 32), the pair `(L_n, 0)` for n even and `(−F_n, 2F_n)` for n odd; "±t_n" is both signs; the trace is the literal `(g : M2).trace` of `g ∈ HeckeGrp` (U7), every element, powers included (record l. 89: nothing assumes γ primitive).
- **The parity keying.** Each pair is stated at the parity (3.12) gives it: `(L_n, 0)` at even n (G5-RUNGa) and `(−F_n, 2F_n)` at odd n (G5-RUNGb) — (3.12)'s own case split and the proof's (Step 2 "k even: killed by (A1) and (A2)", Step 3 "k odd: killed by (A1) alone"). The wall's §5 phrase "for every n, neither (L_n, 0) nor ±(−F_n, 2F_n) is a trace", read without the parity keying, would also exclude `(L_n, 0)` at odd n (L₁ = 1, L₃ = 4, …) and `±(−F_n, 2F_n)` at even n — pairs that are not rungs; that wider reading is true (own arithmetic below: 0 hits; and the same two steps prove it), but the record's statement is the exclusion of ±t_n, and the brief's gloss reads the pairs as "the (x, y) pairs of (3.12), i.e. the traces ±(φⁿ + φ⁻ⁿ)". The spec states the record; V₁ weighs the keying.
- **Own exact arithmetic** (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/check.py` (output `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/check.out`)): every word of length ≤ 10 (1,398,100 words, both signs of the literal trace) and the 12 non-word forms ±I, ±S, ±R^a against the 80 pairs ±t_n, n ≤ 40: 0 hits; against the 160 further pairs of the unkeyed reading, n ≤ 40: 0 hits; the known positives (2, 0), (−2, 0), (0, 2), (3, 1), (−3, −1), (8, 7) found among the word traces. (3.12) with φ⁻¹ = φ − 1, F_n ≥ 1 (n ≥ 1), L_n ≥ 3 (n ≥ 2), t_n > 2 in the real order (n ≥ 1), L_n = F_{n−1} + F_{n+1}: n ≤ 500, 0 exceptions. The first rungs n = 1, …, 8: (−1, 2), (3, 0), (−2, 4), (7, 0), (−5, 10), (18, 0), (−13, 26), (47, 0) — the record's list (l. 46) and the Atlas's (5.33).
- **This spec — the printed sentence:** for every n ≥ 1, `(g : M2).trace` is neither `phi ^ n + Ring.inverse phi ^ n` nor its negative. **φ⁻¹ is `Ring.inverse phi`** — mathlib's inverse on a monoid with zero (`x⁻¹` when `x` is a unit, `0` otherwise); φ is a unit of ℤ[φ] (φ·(φ − 1) = 1, record Lemma R.1 (b), l. 31: "φ⁻¹ = −φ^σ = φ − 1 ∈ ℤ[φ]"; own arithmetic: `phi * (phi - 1) = 1`), so `Ring.inverse phi = φ − 1` and `Ring.inverse phi ^ n` is the record's φ⁻ⁿ with no notation reading. Alternative for V₁: `(phi - 1) ^ n`, the lane's φ⁻¹-as-notation reading (STATEMENTS §2 item 7; U10, U17) — the same element; `Ring.inverse` keeps the printed symbol's meaning in the statement and leaves `φ⁻¹ = φ − 1` to the proof. **The hypothesis `1 ≤ n` carries content:** at n = 0 the value is 1 + 1 = 2 = tr I.
- **Why this third theorem beside the two legs.** The wall's §5 names the pair form; the print states the corollary in φⁿ + φ⁻ⁿ. Without this theorem the unit would carry the printed sentence only through (3.12), which is on no theorem — the "in pieces" shape this wave closes for Cor. 3.7. With it, the printed sentence is carried whole; the two legs stay as the wall's form and the proof's split. The identity (3.12) is the route (record Lemma R.1 (a)–(c); U4's private `phi ^ (n + 1) = ⟨Nat.fib n, Nat.fib (n + 1)⟩` is a model), not a row. V₁ may strike this theorem as beyond §5's form; it adds no content the record does not prove.

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
Units	FOUND _root_ Mathlib/Algebra/Group/Units/Defs.lean:49
Subgroup.closure	FOUND Subgroup Mathlib/Algebra/Group/Subgroup/Lattice.lean:329
Even	AMBIGUOUS 2 sites
IsSquare	FOUND _root_ Mathlib/Algebra/Group/Even.lean:57
Odd	FOUND _root_ Mathlib/Algebra/Ring/Parity.lean:101
Nat.even_or_odd	FOUND Nat Mathlib/Algebra/Ring/Parity.lean:275
Nat.fib	FOUND Nat Mathlib/Data/Nat/Fib/Basic.lean:59
Nat.fib_add_two	FOUND Nat Mathlib/Data/Nat/Fib/Basic.lean:75
Nat.le_induction	FOUND Nat Mathlib/Data/Nat/Init.lean:235
Ring.inverse	FOUND Ring Mathlib/Algebra/GroupWithZero/Units/Basic.lean:84
Ring.inverse_unit	FOUND Ring Mathlib/Algebra/GroupWithZero/Units/Basic.lean:90
Ring.inverse_of_isUnit	FOUND Ring Mathlib/Algebra/GroupWithZero/Units/Basic.lean:93
IsUnit	FOUND _root_ Mathlib/Algebra/Group/Units/Defs.lean:364
```

- `Even` AMBIGUOUS: the two keyword sites are `Function.Even` and `DirichletCharacter.Even`, not meant; the root `Even` is the `@[to_additive]` image of `IsSquare` (FOUND, `Mathlib/Algebra/Group/Even.lean:55–57`), which the classifier does not see as a keyword site — the frozen U12/U14 statements use the same `Even`. `fibZ`, `lucasZ` and `G5.fibZ` NOT FOUND (no collision; see §3); `Nat.lucas` NOT FOUND (mathlib carries no Lucas sequence at the pin).
- Proof aids, for the L seat's route (not the statement): U10's frozen `g5_u10_cor` (every trace in {±2, 0, ±φ, ±φ⁻¹} ∪ {±(x + yφ) : x ≥ 0, y ≥ 1}) reaches both legs in one case split each — the record's own route through "the containment's form, Cor. 3.5" (l. 79); `F_n ≥ 1` and `L_n ≥ 3` by `Nat.le_induction` on the recursions; `Nat.even_or_odd`; `Nat.fib`/`Nat.fib_add_two` only if F is re-cut to mathlib's.
- No name is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for every natural number n ≥ 1 and every element g of ⟨S, T⟩, the trace of g is neither φⁿ + φ⁻ⁿ nor its negative, φ⁻¹ the inverse of the unit φ in ℤ[φ].

Probe: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/probe-U18.lean` — **NOT RUN by this seat** (the brief: no `lake` command at all; no Lean compiled); the orchestrator elaborates it serially and returns exit and first error. The block below sits inside `namespace G5` after `open G5 ZPhi` and is the probe's text byte for byte (the third of the probe's three theorems).

The two definitions (the first block of the probe, byte for byte; the unit's two definitions, carried in each of U18's three specs):

```lean
/-- U18's first definition (row G5-RUNG): the Fibonacci numbers as integers, `F₀ = 0`,
`F₁ = 1`, `F_{n+2} = F_{n+1} + F_n`.
Locus: `phase-4/proofs/RUNG/COROLLARY-RUNG.md` §2 (C-5) (l. 25); the print
`phase-4/draft/S3-theorem-a.md` l. 96. STATEMENTS.md sha256 prefix `9ebf3004`. -/
def fibZ : ℕ → ℤ
  | 0 => 0
  | 1 => 1
  | n + 2 => fibZ (n + 1) + fibZ n

/-- U18's second definition (row G5-RUNG): the Lucas numbers as integers, `L₀ = 2`,
`L₁ = 1`, `L_{n+2} = L_{n+1} + L_n` — the record's `L_n := F_{n−1} + F_{n+1}`, `F₋₁ = 1`.
Locus: `phase-4/proofs/RUNG/COROLLARY-RUNG.md` §2 (C-5) (l. 25); the print
`phase-4/draft/S3-theorem-a.md` l. 271. STATEMENTS.md sha256 prefix `9ebf3004`. -/
def lucasZ : ℕ → ℤ
  | 0 => 2
  | 1 => 1
  | n + 2 => lucasZ (n + 1) + lucasZ n
```

The theorem:

```lean
/-- G5-RUNGc (Cor. 3.6′, every rung, as printed). For every `n ≥ 1`, no element of `⟨S, T⟩`
has trace `±(φⁿ + φ⁻ⁿ)`, with `φ⁻¹` the inverse of the unit `φ` of ℤ[φ] (`Ring.inverse`).
Locus: `phase-4/proofs/RUNG/COROLLARY-RUNG.md` §1 (l. 13) and Lemma R.1 (b) (l. 31);
SKELETON.md row Cor. 3.6′ (l. 121). STATEMENTS.md sha256 prefix `9ebf3004`. -/
theorem g5_u18_rung_c (n : ℕ) (hn : 1 ≤ n) (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    (g : M2).trace ≠ phi ^ n + Ring.inverse phi ^ n ∧
      (g : M2).trace ≠ -(phi ^ n + Ring.inverse phi ^ n) := by sorry
```

## 6 · What the row does not claim

- **Not the pair legs** (G5-RUNGa, G5-RUNGb) and **not the identity (3.12)** (the route).
- **Not `IsUnit phi` or `Ring.inverse phi = phi − 1`** as statements (the L seat's lemmas; the latter is the identity V₁-U8 struck as a row).
- **Not the geodesic clause** "Equivalently, no closed geodesic of G(5) — primitive or multiply traversed — has length 2n ln φ" (print l. 266–267; record l. 13): it rests on the trace–length relation, the Atlas's (5.1) citing Beardon (record (C-4), l. 24), and the lane carries no hyperbolic-geometry layer; the trace statement is the whole of the corollary's mathematics (record Step 0, l. 69).
- **Not Remark 3.6″** (R-ii, R-iii; record §7 l. 114–115 — ruled to print by the wall, a separate statement, not in §5's scope), **not the mod-2 reach** ("L-2 reaches exactly 3 ∤ k", l. 124), **not Lemma R.1 or (3.12) as rows** (the route), **not the credit routes** (SSW00 + CW90, Leutbecher; record §8 l. 125–126 — literature, used nowhere).
- Standing as the record carries it: PROVED two heads (P4-RUNG; SH-P4-RUNG HOLDS, "No gap, no fix required for the mathematics", l. 37); the wall re-derived (3.11)–(3.12); on no Lean row before U18 (record l. 63; print l. 314).

## 7 · Sheet line and status

Sheet line (id · statement in one line · locus · unit): G5-RUNGc · for every n ≥ 1 and g ∈ HeckeGrp, tr g ≠ φⁿ + φ⁻ⁿ and tr g ≠ −(φⁿ + φ⁻ⁿ), φ⁻¹ = Ring.inverse φ (Cor. 3.6′ as printed) · COROLLARY-RUNG §1 l. 13, Lemma R.1 (b) l. 31; SKELETON l. 121; print S3 (3.10) l. 260, Cor. 3.6′ l. 265–267 · U18 `G5/EveryRung`

SPEC-DRAFT 2026-10-31T11:21:54Z
