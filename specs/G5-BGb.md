# G5-BGb

## 1 · Header

row: G5-BGb
unit: U9 `G5/SectorGroup`
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-30T13:02:59Z; equal to the brief's edition — nothing appended since)
source_bytes: 21568 (`wc -c` at 2026-10-30T13:02:59Z; the edition pair `sha256:a84cecdd… · 21568 B`, UPGRADE-697)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U7 `G5.Group.Challenge` 689c36e6c026a1ce151dd2ab84243a5f8f76bb20a11304c9065cdb358ed410ae · U4 `G5.Sector.Challenge` df5fdf79df09a7dd097a8d3102c96b644458d2fcde98856b16de002cf910996f (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-30T13:02:59Z matches)
locus: `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` §1 Corollaries, "The true cone" (l. 47); STATEMENTS.md row G5-BG (l. 24, the θ clause); the exact constant at `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1 (l. 103, l. 105 — the word-level row G5-B's locus, U4's G5-Bc); STATEMENTS.md §2 item 7 (l. 39)
spec_clock: 2026-10-30T13:02:59Z

## 2 · Printed statement, verbatim

> - **The true cone.** θ := t^σ/t = (x − y/φ)/(x + yφ) is increasing in x/y. On the sector, −φ^{−2} ≤ θ ≤ (y/φ² + 2)/(yφ² + 2), the upper bound decreasing in y to φ^{−4}. So **|t^σ| ≤ 0.5158…·|t| for every hyperbolic t**, the maximum attained exactly at t = 3 + φ (the class (1,4), the unique sector point with y = 1, x = 3 — realized), and the negative side attains θ = −φ^{−2} exactly on the pure multiples nφ. The pair's cone |t^σ| ≤ |t| (aperture slopes ±1) is far from tight: the realized set lives in the wedge of slopes [−φ^{−2}, φ^{−4}] asymptotically. In Minkowski coordinates: x ≥ 0 ⟺ t^σ ≥ −t/φ²; y ≥ 1 ⟺ t − t^σ ≥ √5; x ≤ y + 2 ⟺ t^σ ≤ t/φ⁴ + 2√5/φ².
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` §1, l. 47 (the whole line)

> Every hyperbolic element g of G(5) (|tr g| > 2) has, after sign normalization t = ±tr g > 0, t = x + yφ with y ≥ 1 and 0 ≤ x ≤ y + 2, and 11·|t^σ| ≤ (17 − 7φ)·t in the real order.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` row G5-BG, l. 24, the statement cell (a verbatim substring; this spec reads its θ clause "11·|t^σ| ≤ (17 − 7φ)·t in the real order")

> g(1) = (4 − φ)/(3 + φ) = (17 − 7φ)/11 = 0.5157965…
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1, l. 103 (the exact constant behind TA's 0.5158…)

> The equality uses N(3 + φ) = 11 and (4 − φ)² = 17 − 7φ. The float is for printing only.
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §1, l. 105

## 3 · Formal reading

- **The element, hyperbolicity, the sign normalization:** as G5-BGa §3, word for word — `g : M2ˣ`, `hg : g ∈ HeckeGrp`, `hh : 2 < rabs (g : M2).trace`, t := `rabs (g : M2).trace` (U4's `ZPhi.rabs`, U1's real order). V₁ signs the hyperbolicity predicate once for both rows.
- **The bound.** TA l. 47 prints it as a decimal, "|t^σ| ≤ 0.5158…·|t| for every hyperbolic t"; the exact constant is (4 − φ)/(3 + φ) = (17 − 7φ)/11 (SH-P2-1 l. 103, 105, the identity carried frozen by U4's `g5_u4_bc_id`), and the row states it cross-multiplied: `11 * rabs (conj t) ≤ (17 - 7 * phi) * t` — U4's `g5_u4_bc` first conjunct with `ntr w` replaced by `t`. `conj` is U1's σ (`(x + y φ)^σ = (x + y) − y φ`), `|t^σ|` is `rabs (conj t)`, `≤` is U1's real order, `11` and `17` are numerals of `ZPhi`, `phi = ⟨0, 1⟩`. Since t > 0 here, |t| = t, so TA's "·|t|" is "· t".
- **SL, the literal lift:** both sides depend on tr g only through `rabs`, so the statement is invariant under g ↦ −g (−I = S² ∈ ⟨S, T⟩); the SL reading is the PSL statement.
- **The proof route on the record (for the L seat):** G5-BGa's route to ±W w with w non-constant and `rabs (tr g) = ntr w`, then U4's `g5_u4_bc` (first conjunct).

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin):

```
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
Matrix.trace_mul_comm	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:158
Matrix.trace_mul_cycle	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:161
Matrix.trace_neg	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:136
Units.val_mul	FOUND Units Mathlib/Algebra/Group/Units/Defs.lean:178
Units.mul_inv	FOUND Units Mathlib/Algebra/Group/Units/Defs.lean:201
Units.val_inv_eq_inv_val	FOUND Units Mathlib/Algebra/Group/Units/Defs.lean:280
```

- Targeted by the statement: `Matrix.trace` (with U4's `ZPhi.rabs`, U1's `conj`, `phi`, the order). The rest are proof aids.
- No name is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for every unit g of `M2` in ⟨S, T⟩ whose trace exceeds 2 in absolute value in the real order, with t = |tr g|, eleven times the real absolute value of t's conjugate is at most (17 − 7φ)·t in the real order.

Probe: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD/probe-U9.lean` — **NOT RUN by this seat** (the brief: no `lake` command of any kind); the orchestrator elaborates it serially and returns exit and first error. The block below sits inside `namespace G5` after `open G5 ZPhi` and is the probe's text byte for byte (one of the probe's two theorems).

```lean
/-- G5-BGb (Theorem B at element level, the θ bound). Every hyperbolic element `g` of
`⟨S, T⟩` (`|tr g| > 2` in the real order) has, after sign normalization `t = |tr g|`,
`11 |t^σ| ≤ (17 − 7φ) t` in the real order.
Locus: TA transcript §1 "The true cone" (l. 47); STATEMENTS.md row G5-BG (l. 24).
STATEMENTS.md sha256 prefix `a84cecdd`. -/
theorem g5_u9_bg_b (g : M2ˣ) (hg : g ∈ HeckeGrp) (hh : 2 < rabs (g : M2).trace) :
    11 * rabs (conj (rabs (g : M2).trace)) ≤ (17 - 7 * phi) * rabs (g : M2).trace := by sorry
```

## 6 · What the row does not claim

- No equality clause: "the maximum attained exactly at t = 3 + φ" (TA l. 47; U4's `g5_u4_bc` second conjunct, at word level) is not in the row G5-BG and is not stated at element level.
- No lower-side statement (θ ≥ −φ^{−2}, equality on the φ-line), no asymptotic wedge [−φ^{−2}, φ^{−4}], no Minkowski-coordinate restatement, no "closest realized points" ranking — TA l. 47–48's further corollaries are not in the row.
- The decimal 0.5158… is printing only (SH-P2-1 l. 105); the statement is exact in ℤ[φ].

## 7 · Status

SPEC-DRAFT 2026-10-30T13:02:59Z

V1: V1-GREEN 2026-10-30T13:11:33Z — faithful to STATEMENTS.md row G5-BG (l. 24, sha256 a84cecdd… · 21568 B), whose θ clause reads "11·|t^σ| ≤ (17 − 7φ)·t in the real order", and to TA §1 l. 47 at the exact constant. All four §2 cites match verbatim (script: TA l. 47, SH-P2-1 l. 103 and l. 105 whole lines; STATEMENTS l. 24 a substring). Conventions confirmed: (i) the hypothesis and t are word for word G5-BGa's, signed there. (ii) TA's decimal "0.5158…" is the exact (4 − φ)/(3 + φ) = (17 − 7φ)/11 = 0.5157965… (SH-P2-1 l. 103). It cannot be smaller, because TA and SH-P2-1 attain it at t = 3 + φ. Own check: (17 − 7φ)(3 + φ) = 44 − 11φ = 11(4 − φ), and conj(3 + φ) = 4 − φ. Multiplying by 11 > 0 changes nothing, so `11 * rabs (conj t) ≤ (17 - 7 * phi) * t` is the row's inequality. Since t > 0, TA's "·|t|" is "· t". (iii) `conj` is U1's σ, (x + y) − yφ; `|t^σ|` is `rabs (conj t)`, the real absolute value of t^σ at φ = 1.618…; the numerals are ⟨11, 0⟩ and ⟨17, −7⟩ through U1's ring, and `≤` is U1's real order. It is U4's `g5_u4_bc` first conjunct with `ntr w` replaced by t. (iv) The equality clause ("maximum attained only at 3 + φ"), the lower edge, the asymptotic wedge and the Minkowski forms are dropped. The row G5-BG states the inequality only, and U4's `g5_u4_bc` carries the iff at word level. Not weaker than the RECORDED row. Own exact check: 0 violations over every signed hyperbolic trace from words of length ≤ 8. §5 is a byte substring of probe-U9.lean (a1a55062…960c). Elaboration is as the brief reports (exit 0, 2 sorry warnings, 13:07:04Z), not run here. Split: SPLIT-OK. Parse: 0 Lean line(s) over 100 code points

V2: V2-GREEN 2026-10-30T13:25:12Z — the Lean statement says what STATEMENTS.md row G5-BG (l. 24, edition a84cecdd… · 21568 B) says in its θ clause, "11·|t^σ| ≤ (17 − 7φ)·t in the real order", no stronger, no weaker: same element, hypothesis and t as G5-BGa; `conj` is U1's σ (x, y) ↦ (x + y, −y) = §0's σ, `rabs` U4's real absolute value, ≤ U1's real order, numerals ⟨11, 0⟩, ⟨17, −7⟩ through U1's pair product; the constant is TA l. 47's 0.5158… exactly ((17 − 7φ)/11 = (4 − φ)/(3 + φ), SH-P2-1 l. 103, l. 105; own check: equality at t = 3 + φ, both sides ⟨44, −11⟩), so the cross-multiplied form is neither weaker nor stronger than the printed bound; the equality clause is absent as in the row (the iff lives at word level in U4's `g5_u4_bc`); no violation over 96 675 hyperbolic samples; §5 byte-identical in Challenge.lean; Challenge sha256 c6a43405c82a8b43218854dc605d0b9952332b82681dfb03a9008e6e3195d6a8 = statement_sha256_draft — frozen.
