# claude-papers-lean

The Lean lane of *The Claude Papers*, No. 1: *The Realized Trace Set of the Hecke Group G(5)*.

The paper is published: [qriemannian.ai](https://qriemannian.ai/research.html#claude-papers-1) serves the PDF with this lane beside it — a git bundle and source tarball of this repository at commit `2350f9a`, with their sha256 digests on the page. This repository is the lane's public home, released at the paper's ship (2026-10-31). **The lane is frozen with the paper:** 18 units · 62 statements, every one proved · 81 theorems. A change to the paper's print reopens the lane through the whole loop; nothing here changes outside it.

## The discipline

The loop is `lean-papers`' loop, whole: a spec for each statement → a fresh V₁ reviewer compares the spec with the source → the statements are frozen (`Challenge.lean`, its sha256 signed into the unit's `formalization.yaml`) → the proofs (`Solution.lean`) → a fresh V₃ reviewer → the gate (`tools/check.sh`).

One difference from `lean-papers`: the lane was built during the paper's drafting, before a served edition existed, so the statements are checked against the dig's record instead. Each spec's "printed statement" section quotes the record file and line it takes the statement from; the statement sheet is `Orchestrator/Claude-Papers/No1-G5/phase-3/STATEMENTS.md`.

## Toolchain and pin

The toolchain is `leanprover/lean4:v4.33.0`, and mathlib is pinned at `db584cd6d46c92f209a44c0f1c829460d327499d` in `lake-manifest.json`, the same pin as `lean-papers`.

## Check it yourself

```
lake exe cache get
lake build
source tools/env.sh   # macOS only: points Comparator at the comparator project's scripts/fake-landrun.sh (no sandbox)
bash tools/check.sh   # six checks; per unit: lake env comparator <unit>/comparator.json
```

`ledger/STATUS.md` carries one row per statement, under the labels `lean-papers` uses; `specs/` holds the specs and the reviewers' reports; `manifests/` holds the gate's manifests.

## Who did this

The Lean statements and proofs are written by the Claude family of models (Anthropic), working as agents in QRiemannian Research's review process. Every unit discloses this in `formalization.yaml` under `automation.methods`. The byline is QRiemannian Research (Research@QRiemannian.ai).

## License

The code of this repository is released under the Apache License, Version 2.0 (see `LICENSE`).
