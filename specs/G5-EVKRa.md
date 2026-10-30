# G5-EVKRa

## 1 · Header

row: G5-EVKRa
unit: U14 `G5/EvenKRemark`
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T21:19:01Z and again at 2026-10-30T21:39:23Z; equal to the brief's edition; this edition EXTENDS the two before it — `head -c 25981` reproduces `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47` (U12/U13's pin) and `head -c 21568` reproduces `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731` (the frozen eleven's pin))
source_bytes: 30598 (`wc -c` at 2026-10-30T21:19:01Z and 2026-10-30T21:39:23Z; the edition pair `sha256:4a53d9ba… · 30598 B`)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U2 `G5.ModTwo.Challenge` c342ab92ba8ef07e5a9fba82422968b9de4410974583210dc1dcded53354c78c · U12 `G5.EvenK.Challenge` 321dfbf5abdc78157328a8f7d1c53d40ae09a60b6a5cf027824d09da8f967565 (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-30T21:19:01Z matches)
locus: `Claude-Papers/No1-G5/candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)" (l. 58, the mechanism and clause (b) in the remark's statement), its proof (l. 60), "Rotation (the brief's question)" (l. 63); STATEMENTS.md row G5-EVKR (l. 72) and §6 (l. 66–68); the sweep `Claude-Papers/No1-G5/phase-4/close/L1-printed-uncarried-sweep.md` items 1–3 (l. 23–25); the print `Claude-Papers/No1-G5/phase-4/draft/S4-congruence.md` Rem. 4.4 (l. 56–67, display (4.5) l. 75, proof l. 77), quoted beside the record, never instead of it; this spec carries clause (1), the mechanism
spec_clock: 2026-10-30T21:39:23Z

## 2 · Printed statement, verbatim

> **Remark 4.4 (even k).** Let k be even and A(w) = a₁ − a₂ + a₃ − ⋯ − a_k. Then W̄ = r^{A(w)}, and the following are equivalent: (a) A(w) ≡ 0 (mod 5); (b) the image of W in PSL(2, 𝔽₄) has order ≠ 5 (the test (11.4)); (c) y is even; (d) x ≡ y ≡ 0 (mod 2).
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3, l. 58 (the whole line — the remark's statement: "Then W̄ = r^{A(w)}")

> *Proof.* Grouping W̄ = (r^{a₁}s r^{a₂}s)(r^{a₃}s r^{a₄}s)⋯ gives W̄ = r^{(a₁−a₂)+(a₃−a₄)+⋯} = r^{A(w)}. Since r has order 5, W̄ = 1 iff 5 ∣ A and otherwise W̄ has order 5: (a) ⟺ (b). If 5 ∣ A, tr W̄ = 0, which is (d), which implies (c). **(⟸)** If 5 ∤ A, tr W̄ ∈ {ω, ω²}, whose ω-coefficient is 1: y is odd. By contraposition y even ⟹ 5 ∣ A, closing (c) ⟹ (a). ∎
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3, l. 60 (the whole line — the proof: "gives W̄ = r^{(a₁−a₂)+(a₃−a₄)+⋯} = r^{A(w)}")

> For every word W = R^{a₁}S ⋯ R^{a_k}S with k even and A(W) the alternating sum of U12: (1) the image W̄ of W in PSL(2, 𝔽₄) ≅ D₅ is r^{A(W)} — the mechanism; (2) 5 ∣ A(W) exactly when W̄ = 1, and otherwise W̄ has order exactly 5 — so (a) of the even-k law is equivalent to the record's (b), "the image of W has order other than 5" (the Atlas's test (11.4)); (3) a one-step rotation W′ of W has A(W′) = −A(W) exactly, as integers.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` row G5-EVKR, l. 72, the statement cell (a verbatim substring; the row's pointer, not the authority)

> Then W̄ = r^{A(W)}, and the following are equivalent:
>   W̄ = (r^{a₁}s r^{a₂}s)(r^{a₃}s r^{a₄}s) ⋯ = r^{(a₁ − a₂) + (a₃ − a₄) + ⋯} = r^{A(W)}.  (4.5)
>
> — `Claude-Papers/No1-G5/phase-4/draft/S4-congruence.md` Rem. 4.4, l. 60 and display (4.5) l. 75 (the PRINT, quoted beside the record)

## 3 · Formal reading

- **Words and k.** `w : List ℕ` with U1's `IsWord w` (non-empty, every syllable in {1, 2, 3, 4}); the syllable count k is `w.length`; "k even" is `Even w.length` (mathlib's root `Even`), as U12's frozen rows write it. `IsWord` excludes the empty list, so the even case begins at k = 2.
- **A is U12's, frozen.** `A : List ℕ → ℤ` from `G5.EvenK.Challenge` (`A [] = 0`, `A (a :: l) = (a : ℤ) − A l`, so `A [a₁, …, a_k] = a₁ − a₂ + a₃ − ⋯`, the record's A(w), l. 58), imported, not restated. **U14 defines nothing.**
- **W̄, the image in PSL(2, 𝔽₄), is `red2M (W w)`:** U2's entrywise reduction mod 2 of U1's LITERAL word `W w` = R^{a₁}S ⋯ R^{a_k}S, a matrix in U2's `F4M` (2 × 2 over U2's 𝔽₄ = pairs mod 2 with the ℤ[φ] product). The record's s, t, r are U2's `Sbar`, `Tbar`, `Rbar` ("s = S̄ … r = R̄ = ts", l. 54; U2's `Rbar = red2M R`, `g5_u2_d5_gens` gives `Rbar = Tbar * Sbar`). **SL = PSL here (my reasoning, the record's own relations):** in characteristic 2, −1 = 1 in 𝔽₄, so the centre {±I} of SL(2, 𝔽₄) is trivial and the reduced matrix IS the image in PSL(2, 𝔽₄) — the record writes "S² = −I ≡ I", "R⁵ = −I ≡ I" (l. 54). No PSL quotient is formed.
- **r^{A(W)}, the exponent convention, for V₁'s signature: `Rbar ^ (A w : ZMod 5).val`.** A(W) is an integer and may be negative (own arithmetic: A(1, 2) = −1); r has order 5 (U2's `g5_u2_d5_gens`: `Rbar ^ 5 = 1`, the record's "r⁵ = 1", l. 54), so r^{A} is r^{A mod 5}. The statement casts `A w : ℤ` to `ZMod 5` and takes `ZMod.val`, the least non-negative residue in {0, …, 4}; the power is the monoid power with a natural exponent in `F4M` (no group structure on `F4M` is needed, so no `zpow`). Sample, own arithmetic: A(1, 2) = −1, `(−1 : ZMod 5).val` = 4, and `red2M (W [1, 2]) = Rbar ^ 4`. This is the row's own shape ("the rotation is `r^{A}` with the exponent read in ZMod 5 — M's shape, V₁ signs it", l. 72) and exactly the private helper of U12's Solution (`g5_u12_aux_f j = Rbar ^ j.val`, `j : ZMod 5`, at `G5/EvenK/Solution.lean` l. 61, composed with `g5_u12_aux_red2M_W` and `g5_u12_aux_pair`) — that is the route (§6), not the statement. An alternative shape, `Rbar ^ (A w % 5).toNat`, says the same and is not used.
- **`hk : Even w.length` carries content:** at odd k the record's mechanism is "W̄ = r^{A′} s" (l. 61), a reflection, never a power of r; own arithmetic: at k = 1, 3, no word satisfies `red2M (W w) = Rbar ^ (A w : ZMod 5).val` (0 of 68).
- **`hw : IsWord w` is the record's domain** ("words W = R^{a₁}S ⋯", the row); the pairing identity r^a s r^b s = r^{a−b} holds for any naturals, so the L seat may not need the syllable bounds; the statement keeps the record's hypothesis.
- **Own exact arithmetic** (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/check.py` (output `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/check.out`)): every word of even length 2, 4, 6, 8 (69,904 words), `red2M (W w)` against `Rbar ^ (A w mod 5)` matrix by matrix over 𝔽₄: 0 violations (the record's control, l. 69, ran the same to k = 10).

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
ZMod	FOUND _root_ Mathlib/Data/ZMod/Defs.lean:142
ZMod.val	FOUND ZMod Mathlib/Data/ZMod/Basic.lean:57
ZMod.val_intCast	FOUND ZMod Mathlib/Data/ZMod/Basic.lean:501
Matrix.map	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Defs.lean:134
Even	AMBIGUOUS 2 sites
IsSquare	FOUND _root_ Mathlib/Algebra/Group/Even.lean:57
Int.cast	NOT FOUND
RingHom.mapMatrix	FOUND RingHom Mathlib/Data/Matrix/Basic.lean:593
map_list_prod	FOUND _root_ Mathlib/Algebra/BigOperators/Group/List/Basic.lean:474
List.length	NOT FOUND
```

- `Even` reads AMBIGUOUS: the root `Even` is generated by `@[to_additive]` on `IsSquare` (`Mathlib/Algebra/Group/Even.lean:55–57`; `IsSquare` FOUND above); the two keyword sites `Function.Even`, `DirichletCharacter.Even` are not meant (U2's and U12's specs read the same). The root `Even` is used verbatim by U12's frozen Challenge.
- `Int.cast`, `List.length` read NOT FOUND because they are Lean core, not mathlib: `class IntCast` at the toolchain's `src/lean/Init/Data/Int/Basic.lean:451` (`leanprover/lean4:v4.33.0`) — the cast `ℤ → ZMod 5` is through it — and `List.length` core.
- Targeted by the statement: `ZMod`, `ZMod.val` (FOUND, namespace `ZMod`), the cast ℤ → `ZMod 5` (core `IntCast`, mathlib's instance on `ZMod`), `Even`, U1's `IsWord`, `W`, U2's `red2M` (whose body is mathlib's `Matrix.map`), `Rbar`, U12's `A`. Proof aids: `ZMod.val_intCast`, `RingHom.mapMatrix`, `map_list_prod` (the route U12's Solution used).
- No name is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for a word of even length, the reduction mod 2 of the literal word equals R̄ raised to the residue of the alternating sum A(w) modulo 5.

Probe: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD3/probe-U14.lean` — **NOT RUN by this seat** (the brief: no `lake` command of any kind; no Lean compiled); the orchestrator elaborates it serially and returns exit and first error. The block below sits inside `namespace G5` after `open G5 ZPhi` and is the probe's text byte for byte (the first of the probe's five theorems).

```lean
/-- G5-EVKRa (Rem. 4.4, the mechanism). For a word of even length, the reduction mod 2 of
the literal word is `R̄` raised to the alternating sum `A w` read mod 5 (`R̄⁵ = 1`).
Locus: `candidates/checks/SH-P4-LW-A-klein-and-even-k.md` §3 "Remark 4.4 (even k)"
(l. 58, proof l. 60); STATEMENTS.md row G5-EVKR (l. 72), clause (1).
STATEMENTS.md sha256 prefix `4a53d9ba`. -/
theorem g5_u14_evkr_mech (w : List ℕ) (hw : IsWord w) (hk : Even w.length) :
    red2M (W w) = Rbar ^ (A w : ZMod 5).val := by sorry
```

## 6 · What the row does not claim

- **Nothing at odd k** (there W̄ = r^{A′}s, l. 61 — G5-L1's territory, U2); the hypothesis `Even w.length` is part of the statement (§3).
- **Not the group-theoretic setting as a theorem:** that ⟨s, t⟩ is D₅ of order 10 is U2's frozen `g5_u2_d5_image`; the relation srs = r⁻¹ and r^a s r^b s = r^{a−b} (l. 54–55) are the proof's devices, not clauses of the row. The traces of r^m (l. 56) are U12's route, not this row.
- **The route, not the statement:** the U14 Solution imports `G5.EvenK.Solution` on the prelude rule (the row's Lean notes), where the mechanism is already a private helper (`g5_u12_aux_red2M_W` + `g5_u12_aux_pair`) — "a cheap exposure, not a new proof" (l. 72).
- Words, not classes; nothing about PSL(2, 𝔽₄) ≅ A₅ (the print's l. 56 aside).

## 7 · Status

SPEC-DRAFT 2026-10-30T21:39:23Z

V1: V1-GREEN 2026-10-30T21:50:38Z — faithful to SH-P4-LW-A §3 l. 58 ("Then W̄ = r^{A(w)}") and its proof l. 60 ("gives W̄ = r^{(a₁−a₂)+(a₃−a₄)+⋯} = r^{A(w)}"), row G5-EVKR clause (1) (STATEMENTS l. 72); W̄ is the record's reduction of the literal word ("the reduction W̄ of W lies in SL(2, 𝔽₄)", l. 52), U2's `red2M (W w)` in U2's frozen sense; SL = PSL here confirmed (the centre of SL(2, 𝔽₄) is trivial in characteristic 2, the record's "S² = −I ≡ I", "R⁵ = −I ≡ I", l. 54; U2's `g5_u2_d5_image` puts the image in `D5bar`, ten elements), and both sides are sign-invariant under W ↦ −W (§2 note 2); the exponent convention `Rbar ^ (A w : ZMod 5).val` confirmed as the record's r^{A} for every integer A, negative included, since `Rbar ^ 5 = 1` (U2's `g5_u2_d5_gens`, the record's "r⁵ = 1"): by hand and by own arithmetic, A(1, 2) = −1, (−1 : ZMod 5).val = 4, `red2M (W [1, 2]) = Rbar ^ 4` and `Rbar ^ 4 * Rbar = 1`, so R̄⁴ = r⁻¹ = r^{A}; `IsWord` and `Even w.length` the record's domain (k = 0 excluded by `IsWord`, where the identity is 1 = 1 and nothing is lost); `A` U12's frozen `G5.A`, U1's `IsWord`/`W` and U2's `red2M`/`Rbar` in their units' senses; §2 quotes byte-equal to their loci (REC l. 58, l. 60 whole lines; STATEMENTS l. 72 substring; print l. 60, l. 75 whole lines); §5 a byte substring of the probe (aa833b71…); own exact check, all 69,904 words of even length ≤ 8, matrix by matrix over 𝔽₄: 0 violations; odd k ≤ 3: holds on 0 of 68 (the hypothesis carries content).
V1-parse: 0 Lean line(s) over 100 code points
V1-split: V1-SPLIT-OK 2026-10-30T21:50:38Z — G5-EVKR → G5-EVKRa carries the row's clause (1), the mechanism, whole.
