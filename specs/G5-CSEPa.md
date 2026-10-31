# G5-CSEPa

## 1 · Header

row: G5-CSEPa
unit: U16 `G5/ClassSep`
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 9ebf30048d9d246295226f9f8aa7ac86da0d72956e1c1d6e0c45d4eda57c79b3 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-31T11:03:56Z and again at 2026-10-31T11:21:54Z; equal to the brief's edition `9ebf3004…`; this edition EXTENDS the three before it — `head -c 30598` reproduces `4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f`, `head -c 25981` reproduces `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47`, `head -c 21568` reproduces `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731`; `tail -c +30599` is §6's errata paragraph of 2026-10-30T21:53:55Z, which touches G5-EVKR and G5-SRCH only — none touch U16, U17, U18)
source_bytes: 31612 (`wc -c` at 2026-10-31T11:03:56Z and 2026-10-31T11:21:54Z; the edition pair `sha256:9ebf3004… · 31612 B`)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U7 `G5.Group.Challenge` 689c36e6c026a1ce151dd2ab84243a5f8f76bb20a11304c9065cdb358ed410ae · U4 `G5.Sector.Challenge` df5fdf79df09a7dd097a8d3102c96b644458d2fcde98856b16de002cf910996f · U3 `G5.WordLevel.Challenge` 69533d2d17c4ed2dc569c1de6ddb5e92e42b85099901370bb946ea0ed7a13735 · U9 `G5.SectorGroup.Challenge` c6a43405c82a8b43218854dc605d0b9952332b82681dfb03a9008e6e3195d6a8 (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-31T11:21:54Z matches)
locus: `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` §1 "E2, sharpened" (l. 49), with "Theorem B" (l. 43) for the normalization; `…/transcript/depth-operations.md` §1.3 "E2 sharpened" (l. 47); `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` §4 (l. 197–200, the second head); `candidates/LEDGER.md` row D-E2 (l. 26); STATEMENTS.md row G5-SEP (l. 22) and §0 (l. 7); `phase-4/CLAIM-INVENTORY.md` row 14 (l. 57, the Lean cell "pieces", I-32) and `phase-4/SKELETON.md` row Cor. 3.7 (l. 123); `specs/_V3-U9.md` l. 35 (V3-UNCARRIED "E2, sharpened" at element level); the print `phase-4/draft/S3-theorem-a.md` Cor. 3.7 (l. 384–388, proof l. 392–395; draft id Cor. 3.7, read-copy 3.8, final 3.9), quoted beside the record, never instead of it; the wall's final-read word §5 ("U16 — the composition unit"); this spec carries the linear clause
print_read: the print quoted beside the record is read at `phase-4/draft/S2-preliminaries.md` sha256 0145195c324f510ce1dca3f161dda91fd23385427fcb538aba279a2228ee206e and `phase-4/draft/S3-theorem-a.md` sha256 5ccae24101d7e71bbe79c697e56b19290274a1958947c4d27d1284b519baa2a2 (`shasum -a 256` at 2026-10-31T11:21:54Z); the wall's final-read fix pass is landing in the drafts (both files modified 2026-10-31T11:11Z, Remark 3.6″ and the Cor. 3.6′ credit sentence now printed in S3 §3.4), so every print line number in this spec is at these digests; the record's own files carry the authority
spec_clock: 2026-10-31T11:21:54Z

## 2 · Printed statement, verbatim

> - **E2, sharpened (WORKED OUT HERE).** Proposition 11.1 says the non-integer traces approach ℤ on the real line. In the Minkowski plane they do not: every hyperbolic trace has t − t^σ = y√5 ≥ √5, a uniform distance ≥ √(5/2) from the rational diagonal t^σ = t on which ℤ sits. The near misses of Prop. 11.1 approach integers in t while their conjugates run off (t^σ = t − y√5 → −∞). The separation that no argument on the line can see is present in the plane; it is the archimedean shadow of Lemma 1's positivity.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` l. 49 (the first hand, "WORKED OUT HERE")

> Every hyperbolic trace, normalized t > 0, satisfies y ≥ 1 and 0 ≤ x ≤ y + 2.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/topological-analysis.md` a verbatim substring of l. 43 (the record's normalization of a hyperbolic trace)

> - **E2 sharpened.** Proposition 11.1's "no separation" is a statement about the real embedding alone. In the Minkowski plane the integers lie on the diagonal t^σ = t, and Θ lies strictly inside the cone. The distance to the diagonal is |t − t^σ|/√2 = √(5/2)·|y| ≥ √(5/2) for every hyperbolic class: **the separation Proposition 11.1 forbids in ℝ holds uniformly in ℝ².** Example: the record near miss 75023 + 121393φ sits at Minkowski distance ≈ 1.92 × 10⁵ from the diagonal while being 3.7 × 10⁻⁶ from an integer in ℝ. The obstruction to "a closed form by separation" is the choice of embedding, not the arithmetic.
>
> — `Research-Team/sessions/2026-10-29-g5-phase-1-structure-dig/transcript/depth-operations.md` l. 47 (the second first-hand statement, "for every hyperbolic class")

> **The claim, by hand.**
> - t − t^σ = (x + yφ) − ((x + y) − yφ) = y(2φ − 1) = y√5.
> - y ≥ 1 by Theorem A, so t − t^σ ≥ √5.
> - The distance of (t, t^σ) from the line t^σ = t is |t − t^σ|/√2 = y√(5/2) ≥ √(5/2).
>
> — `Claude-Papers/No1-G5/candidates/checks/SH-P2-1-sector-ladder-pruning.md` l. 197–200 (§4 "The claim, by hand" — the second head, HOLDS)

> E2 sharpened: Prop. 11.1's "no separation" holds only in the real embedding; in the Minkowski plane every hyperbolic trace sits at distance ≥ √(5/2) from the diagonal where the integers live.
>
> — `Claude-Papers/No1-G5/candidates/LEDGER.md` a verbatim substring of l. 26 (row D-E2, the statement cell; the row's head reads PROVED, two heads)

> For every hyperbolic class, t − t^σ = y√5 ≥ √5; the distance of (t, t^σ) from the diagonal {t = t^σ} in ℝ² is ≥ √(5/2). (The content is y ≥ 1, i.e. Theorem A; the separation restates non-integrality in the plane.)
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` a verbatim substring of l. 22 (row G5-SEP, the statement cell — the row's pointer, not the authority)

> a corollary leg of G5-A; state in the ring (y ≥ 1 ⟹ (t − t^σ)² = 5y² ≥ 5) to avoid √
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` a verbatim substring of l. 22 (row G5-SEP, the Lean-notes cell)

> Normalized trace t := tr(P_{a₁} ⋯ P_{a_k}) = (−1)^k tr W.
>
> — `Claude-Papers/No1-G5/phase-3/STATEMENTS.md` a verbatim substring of l. 7 (§0, the normalization on words)

> > **Corollary 3.7 (the Minkowski separation).** *For every hyperbolic class of $G(5)$, with normalized
> > trace $t = x + y\varphi$,*
> > $$t - t^{\sigma} \;=\; y\sqrt5 \;\ge\; \sqrt5, \tag{3.13}$$
> > *and the point $(t, t^\sigma)$ lies at distance at least $\sqrt{5/2}$ from the diagonal of
> > $\mathbb R^2$.*
>
> — `Claude-Papers/No1-G5/phase-4/draft/S3-theorem-a.md` l. 384–388 (Corollary 3.7, the PRINT, quoted beside the record)

> *Proof.* A hyperbolic element is conjugate to $\pm W$ with $W$ a syllable word that is not constant in
> $1$ or $4$ (the constant words are parabolic), so $y \ge 1$ by Theorem 3.1. By (2.5),
> $t - t^\sigma = (x + y\varphi) - ((x + y) - y\varphi) = y(2\varphi - 1) = y\sqrt5 \ge \sqrt5$. The distance
> of $(t, t^\sigma)$ from the line $t^\sigma = t$ is $|t - t^\sigma|/\sqrt2 = y\sqrt{5/2} \ge \sqrt{5/2}$. $\square$
>
> — `Claude-Papers/No1-G5/phase-4/draft/S3-theorem-a.md` l. 392–395 (its proof, the PRINT)

## 3 · Formal reading

- **The group and the element.** `g : M2ˣ` with `g ∈ HeckeGrp` — U7's frozen ⟨S, T⟩, the closure of the units whose matrices are `S` and `T`; the trace is the literal `(g : M2).trace` (SL, not PSL). The record's "for every hyperbolic class" is read on elements: the trace is a class function (`Matrix.trace_mul_comm`), so a statement on every hyperbolic element is the statement on every hyperbolic class, and nothing in it needs the classes counted (uniqueness of the normal form is not used — S2 l. 186–192).
- **Hyperbolic** is U9's frozen predicate on the trace, `2 < rabs (g : M2).trace` in U1's real order (signed at V₁-U9; V₃-U9: "the hyperbolicity predicate `2 < rabs (g : M2).trace` admits exactly the hyperbolic elements"). Not a predicate on the element.
- **The normalized trace of the class** is `t = rabs (g : M2).trace` (U4's frozen `ZPhi.rabs`: `t` if `RealNonneg t`, else `−t`) — the record's sign normalization of a hyperbolic trace ("normalized t > 0", TA l. 43; U9's "after sign normalization `t = |tr g|`"). It agrees with the word normalization of §0: for `g` conjugate to `±W w`, `tr g = ±(−1)^k ntr w` (U1's `g5_u1_trace`) with `ntr w ∈ ℕ[φ]` (U3's `g5_u3_a_nonneg`), so `rabs (tr g) = ntr w`. Own arithmetic: `rabs (tr (±W)) = ntr w` on all 2,796,200 signed words of length ≤ 10 — 0 exceptions.
- **`t^σ` is U1's `conj t`** (`(x + yφ)^σ = (x + y) − yφ`, STATEMENTS §0); **`y` is `t.y`**, the φ-coefficient of the normalized trace; **`√5` is the ring element `2 * phi - 1`** — U3's frozen convention (G5-SEPa's docstring "with `√5` the ring element `2φ − 1`"; (2φ − 1)² = 5 and 2φ − 1 > 0, record SH-P2-1 l. 198, RUNG l. 40).
- **No hypothesis `1 ≤ y`.** The word-level rows (U3's `g5_u3_sep_lin`, `g5_u3_sep_sq`) assume `1 ≤ (ntr w).y`; at element level `y ≥ 1` is the CONTENT ("The content is y ≥ 1, i.e. Theorem A", STATEMENTS l. 22; "y ≥ 1 by Theorem 3.1", print l. 393), and the record states the separation "for every hyperbolic class". It is derived, not assumed — U9's frozen `g5_u9_bg_a` carries `1 ≤ (rabs (g : M2).trace).y` under exactly this hypothesis. The statement is U3's two clauses with `ntr w` replaced by `rabs (g : M2).trace` and the word hypotheses replaced by membership and hyperbolicity — the composition the wall's §5 names ("over U3 + U9 on the prelude rule").
- **The hyperbolicity hypothesis carries content.** Without it the inequality fails on ±I, on ±S (t = 2, t = 0; y = 0) and on every constant word (t = 2) — own arithmetic: fails on all 40 signed constant words of length ≤ 10. The non-word forms ±R^a are not hyperbolic (rabs (tr) ∈ {φ, φ − 1}).
- **Own exact arithmetic** (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/check.py` (output `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/check.out`)): every word of length ≤ 10 (1,398,100 words) with both signs — 2,796,160 hyperbolic signed words (all but the 40 signed constant words): the clause of this spec, 0 violations; the 12 non-word forms ±I, ±S, ±R^a: none hyperbolic, so by U7's normal form every hyperbolic element is conjugate to ±W with W non-constant.
- **This spec's clause — the linear one:** `t − t^σ = y • (2φ − 1)` (the record's "t − t^σ = y√5", an identity in the ring, ℤ acting by `•` as U3 writes it) **and** `2φ − 1 ≤ t − t^σ` in the real order (the record's "≥ √5"). The equality alone is a ring identity for every `t` (`(x + yφ) − ((x + y) − yφ) = (−y, 2y) = y(2φ − 1)`); the inequality is where `y ≥ 1` enters.

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
Units	FOUND _root_ Mathlib/Algebra/Group/Units/Defs.lean:49
Subgroup.closure	FOUND Subgroup Mathlib/Algebra/Group/Subgroup/Lattice.lean:329
SubNegMonoid	FOUND _root_ Mathlib/Algebra/Group/Defs.lean:1037
SubNegMonoid.SMulInt	NOT FOUND
zsmul_eq_mul	FOUND _root_ Mathlib/Data/Int/Cast/Lemmas.lean:104
Matrix.trace_mul_comm	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:158
```

- `SubNegMonoid.SMulInt` NOT FOUND: the `•` here is the `zsmul` field of mathlib's `SubNegMonoid` (FOUND), reached through U1's `CommRing` instance (`zsmul := zsmulRec`); the name is not a declaration at the pin, and the statement does not name it — it writes `•` exactly as U3's frozen `g5_u3_sep_lin` does, which elaborated and froze.
- Targeted by the statement: `Matrix.trace` (through U1's `M2`), `Units` (`M2ˣ`), U7's `HeckeGrp` (`Subgroup.closure`), U4's `ZPhi.rabs`, U1's `conj`, `phi`, the real order `instLE`/`instLT`, `ZPhi.y`, and `•`. Proof aids, for the L seat's route: `Matrix.trace_mul_comm` (trace under conjugation), `zsmul_eq_mul`; U9's `g5_u9_bg_a` (y ≥ 1), U3's `g5_u3_sep_lin` as the pattern.
- No name is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for every element `g` of ⟨S, T⟩ whose trace has absolute value greater than 2 in the real order, the normalized trace `t = |tr g|` satisfies `t − t^σ = y·(2φ − 1)` and `2φ − 1 ≤ t − t^σ`.

Probe: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/probe-U16.lean` — **NOT RUN by this seat** (the brief: no `lake` command at all; no Lean compiled); the orchestrator elaborates it serially and returns exit and first error. The block below sits inside `namespace G5` after `open G5 ZPhi` and is the probe's text byte for byte (the first of the probe's two theorems).

```lean
/-- G5-CSEPa (Cor. 3.7 at element level, the linear clause). Every hyperbolic element `g` of
`⟨S, T⟩` (`|tr g| > 2` in the real order) has, with its normalized trace `t = |tr g|`,
`t − t^σ = y √5 ≥ √5`, `y` the φ-coefficient of `t` and `√5` the ring element `2φ − 1`.
Locus: TA transcript §1 "E2, sharpened" (l. 49); DO transcript §1.3 (l. 47);
`candidates/checks/SH-P2-1-sector-ladder-pruning.md` §4 (l. 197–200);
STATEMENTS.md row G5-SEP (l. 22). STATEMENTS.md sha256 prefix `9ebf3004`. -/
theorem g5_u16_csep_lin (g : M2ˣ) (hg : g ∈ HeckeGrp) (hh : 2 < rabs (g : M2).trace) :
    rabs (g : M2).trace - conj (rabs (g : M2).trace) =
        (rabs (g : M2).trace).y • (2 * phi - 1) ∧
      2 * phi - 1 ≤ rabs (g : M2).trace - conj (rabs (g : M2).trace) := by sorry
```

## 6 · What the row does not claim

- **Not the word-level form** (U3's frozen `g5_u3_sep_lin`, row G5-SEPa) and **not `y ≥ 1` itself** (U9's frozen `g5_u9_bg_a`, row G5-BGa) — both are inputs; this row is their composition at element level.
- **Not the distance clause** — the companion spec G5-CSEPb carries it, squared.
- **Not the interpretive sentences:** "the separation restates non-integrality in the plane" (STATEMENTS l. 22), "it is the archimedean shadow of Lemma 1's positivity" (TA l. 49), "the separation that no argument on the real line can see" (print l. 400–401) — readings, not statements; **not the scoping of the Atlas's Prop. 11.1** (Rem. 8.4's territory) and **not the examples** (75023 + 121393φ, DO l. 47, SH-P2-1 l. 201).
- **Not a statement about classes as counted objects:** nothing here uses or claims the uniqueness of the normal form (cited in the print, S2 l. 186–189).
- Standing as the record carries it: PROVED from Theorem A, two heads (SH-P2-1 item 4 HOLDS; LEDGER D-E2 head PROVED); the element-level composition on no row before U16 (CLAIM-INVENTORY row 14: "pieces").

## 7 · Sheet line and status

Sheet line (id · statement in one line · locus · unit): G5-CSEPa · for every g ∈ HeckeGrp with 2 < |tr g| (real order), t := |tr g| has t − t^σ = y·(2φ − 1) and 2φ − 1 ≤ t − t^σ · TA §1 "E2, sharpened" l. 49; DO §1.3 l. 47; SH-P2-1 §4 l. 197–200; LEDGER D-E2 l. 26; print S3 Cor. 3.7 l. 384–388 · U16 `G5/ClassSep`

SPEC-DRAFT 2026-10-31T11:21:54Z
