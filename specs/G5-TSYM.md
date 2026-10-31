# G5-TSYM

## 1 · Header

row: G5-TSYM
unit: U17 `G5/TraceSet`
paper: No. 1 — *The Realized Trace Set of the Hecke Group G(5)*
source_sha256: 9ebf30048d9d246295226f9f8aa7ac86da0d72956e1c1d6e0c45d4eda57c79b3 (`Claude-Papers/No1-G5/phase-3/STATEMENTS.md`, `shasum -a 256` at 2026-10-31T11:03:56Z and again at 2026-10-31T11:21:54Z; equal to the brief's edition `9ebf3004…`; this edition EXTENDS the three before it — `head -c 30598` reproduces `4a53d9bab6c8ce4f09d27fa55804287f280dcc19deed5c5e2ff1e60058c64e1f`, `head -c 25981` reproduces `1fb5b03ec18e49f0fa5060dc0068145d59521f1e1062bb5a00989e9936055c47`, `head -c 21568` reproduces `a84cecdd3bfa79014173183ffcaea66d2d0f469033501ffae983072344000731`; `tail -c +30599` is §6's errata paragraph of 2026-10-30T21:53:55Z, which touches G5-EVKR and G5-SRCH only — none touch U16, U17, U18)
source_bytes: 31612 (`wc -c` at 2026-10-31T11:03:56Z and 2026-10-31T11:21:54Z; the edition pair `sha256:9ebf3004… · 31612 B`)
depends_on: U1 `G5.Ring.Challenge` 863127f81663d1ff5cebf9b44762a1341559e5b5a26660fbf751f0f69445948c · U7 `G5.Group.Challenge` 689c36e6c026a1ce151dd2ab84243a5f8f76bb20a11304c9065cdb358ed410ae · U8 `G5.GroupLevel.Challenge` bf7316f7eae415f48781199ebd28706dfc940633d484ca5ef2aae997dcb08ccd (each the `statement_sha256` of the unit's `formalization.yaml`; `shasum -a 256` of each `Challenge.lean` at 2026-10-31T11:21:54Z matches)
locus: `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` §4 "Every element, not only every class" (l. 72); `specs/_V3-U10.md` l. 35 (V3-UNCARRIED: the sign-symmetry of the trace set); the sweep `phase-4/close/L4b-record-9-5-sweep.md` item 1 (l. 25: printed, S2 l. 67–68); the print `phase-4/draft/S2-preliminaries.md` §2.1 "The trace set" (l. 66–69), quoted beside the record, never instead of it; the wall's final-read word §5 ("U17 — the trace-set family (the sign-symmetry of Θ; ±φ⁻¹ realized)")
print_read: the print quoted beside the record is read at `phase-4/draft/S2-preliminaries.md` sha256 0145195c324f510ce1dca3f161dda91fd23385427fcb538aba279a2228ee206e and `phase-4/draft/S3-theorem-a.md` sha256 5ccae24101d7e71bbe79c697e56b19290274a1958947c4d27d1284b519baa2a2 (`shasum -a 256` at 2026-10-31T11:21:54Z); the wall's final-read fix pass is landing in the drafts (both files modified 2026-10-31T11:11Z, Remark 3.6″ and the Cor. 3.6′ credit sentence now printed in S3 §3.4), so every print line number in this spec is at these digests; the record's own files carry the authority
spec_clock: 2026-10-31T11:21:54Z

## 2 · Printed statement, verbatim

> - **Every element, not only every class.** The trace is a class function, so the statement covers every element of G(5) in SL and in PSL. The group ⟨S, T⟩ ⊂ SL contains −I = S², so its trace set is sign-symmetric.
>
> — `Claude-Papers/No1-G5/candidates/checks/AM-1-second-head.md` l. 72 (§4 "Scope — CONFIRMED, and covering every element", the second head on Theorem A)

> **The trace set.** Following the Atlas [Atlas, §1.5, §5.1], $\Theta(G(5))$ denotes the set of
> traces of elements of $G(5)$, taken up to sign. Since $-I \in G(5)$, the set of literal traces is
> symmetric under $t \mapsto -t$, and nothing is lost by the passage to signs. The convention under
> which this paper counts the elements of $\Theta(G(5))$ — powers included — is fixed in §2.5.
>
> — `Claude-Papers/No1-G5/phase-4/draft/S2-preliminaries.md` l. 66–69 (§2.1 "The trace set", the PRINT, quoted beside the record)

## 3 · Formal reading

- **"The set of literal traces is symmetric under t ↦ −t"** (print l. 67–68; record "its trace set is sign-symmetric", l. 72) is read as closure of `{(g : M2).trace : g ∈ HeckeGrp}` under negation: for every `g ∈ HeckeGrp` there is `h ∈ HeckeGrp` with `(h : M2).trace = −(g : M2).trace`. The other inclusion is the same statement applied to `h`, so this one clause is the whole symmetry. Literal traces (SL), not traces up to sign — the record's sentence is what makes the passage to signs harmless.
- **"Since −I ∈ G(5)" / "contains −I = S²" is the reason, not a clause.** The witness is `h = S · S · g` (U1: `S * S = −1` by ring arithmetic; `S ∈ HeckeGrp` by `Subgroup.subset_closure`; `tr (−g) = −tr g` by `Matrix.trace_neg`) — the L seat's route. `S² = −I` itself is on STATEMENTS §2 item 7's not-on-the-lane list (l. 39, "proof-internal"); the membership `−1 ∈ HeckeGrp` is not stated here.
- **Own exact arithmetic** (`/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/check.py` (output `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/check.out`)): `S · S = −I` exactly; on every word of length ≤ 10 the traces of `±W` are negatives of each other (2,796,200 signed words; 0 exceptions) — a control of the arithmetic, not of the theorem, which is one line.

## 4 · Target mathlib declarations

Classifier of record (`tools/ledger_names.py`, plain form, at the pin `db584cd6d46c92f209a44c0f1c829460d327499d`):

```
Matrix.trace	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:45
Units	FOUND _root_ Mathlib/Algebra/Group/Units/Defs.lean:49
Subgroup.closure	FOUND Subgroup Mathlib/Algebra/Group/Subgroup/Lattice.lean:329
Subgroup.subset_closure	FOUND Subgroup Mathlib/Algebra/Group/Subgroup/Lattice.lean:341
Subgroup.mul_mem	FOUND Subgroup Mathlib/Algebra/Group/Subgroup/Defs.lean:438
Matrix.trace_neg	FOUND Matrix Mathlib/LinearAlgebra/Matrix/Trace.lean:136
Units.val_mul	FOUND Units Mathlib/Algebra/Group/Units/Defs.lean:178
Units.val_neg	FOUND Units Mathlib/Algebra/Ring/Units.lean:39
```

- Targeted by the statement: `Matrix.trace`, `Units` (`M2ˣ`, the coercion `(h : M2)`), U7's `HeckeGrp` (`Subgroup.closure`), the bounded existential `∃ h ∈ HeckeGrp, …` exactly as U7's frozen `g5_u7_int_b` writes it. Proof aids: `Subgroup.subset_closure`, `Subgroup.mul_mem`, `Units.val_mul`, `Units.val_neg`, `Matrix.trace_neg`.
- No name is NEEDS-DEVELOPMENT.

## 5 · Intended Lean statement

In prose: for every element `g` of ⟨S, T⟩ there is an element `h` of ⟨S, T⟩ whose trace is the negative of the trace of `g`.

Probe: `/private/tmp/claude-501/-Users-qriemannian-Claude-projects-Orchestrator/1cbfdf96-4d96-4fe9-8752-12649b31135b/scratchpad/M-ADD4/probe-U17.lean` — **NOT RUN by this seat** (the brief: no `lake` command at all; no Lean compiled); the orchestrator elaborates it serially and returns exit and first error. The block below sits inside `namespace G5` after `open G5 ZPhi` and is the probe's text byte for byte (the first of the probe's two theorems).

```lean
/-- G5-TSYM (the sign-symmetry of the trace set). For every element `g` of `⟨S, T⟩` there is
an element `h` of `⟨S, T⟩` with `tr h = −tr g`: the set of literal traces is symmetric under
`t ↦ −t`.
Locus: `candidates/checks/AM-1-second-head.md` §4 "Every element, not only every class"
(l. 72); the print `phase-4/draft/S2-preliminaries.md` §2.1 (l. 66–68).
STATEMENTS.md sha256 prefix `9ebf3004`. -/
theorem g5_u17_tsym (g : M2ˣ) (hg : g ∈ HeckeGrp) :
    ∃ h ∈ HeckeGrp, (h : M2).trace = -(g : M2).trace := by sorry
```

## 6 · What the row does not claim

- **Not `−I ∈ G(5)` and not `S² = −I`** as statements (the reason, proof-internal; STATEMENTS §2 item 7 lists `S² = −I` as such).
- **Not the convention** "taken up to sign … nothing is lost by the passage to signs" (print l. 67–68) and **not the counting convention** of §2.5 (powers included) — conventions of the paper, not claims; **not the uses** of the symmetry (S4 l. 8, S6 l. 293–294, S8 l. 157 — the sweep's item 1).
- Standing as the record carries it: stated by the second head on Theorem A (AM-1-second-head §4, CONFIRMED; Theorem A CHECKED AT THE WALL); on no row before U17 (V₃-U10 UNCARRIED, l. 35).

## 7 · Sheet line and status

Sheet line (id · statement in one line · locus · unit): G5-TSYM · for every g ∈ HeckeGrp there is h ∈ HeckeGrp with tr h = −tr g (the literal trace set is symmetric under t ↦ −t) · AM-1-second-head §4 l. 72; print S2 §2.1 l. 66–68 · U17 `G5/TraceSet`

SPEC-DRAFT 2026-10-31T11:21:54Z
