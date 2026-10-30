
## K-U1 · G5/Ring · 2026-10-30T10:51:37Z → 2026-10-30T10:53:22Z · exit 0

Command: `cd ~/Claude/projects/claude-papers-lean && export PATH="$HOME/.elan/bin:$PATH" && source tools/env.sh && bash tools/check.sh --unit G5/Ring`

```
check.sh @ 2026-10-30T10:51:37Z · commit 553d0cf · leanprover/lean4:v4.33.0 · mathlib db584cd6d46c92f209a44c0f1c829460d327499d · units 1 · --unit G5/Ring
lake build: not run under --unit (the axioms arm reads the unit's modules as last built)
[PASS] no_sorry_no_axiom — 2 .lean files scanned
[PASS] axioms — 1 Solution module(s), 54 theorem(s), all within {propext Classical.choice Quot.sound}
[PASS] comparator — 1 unit(s) okay (landrun: /Users/qriemannian/Claude/projects/comparator/scripts/fake-landrun.sh)
[PASS] challenge_digest — 1 Challenge.lean digest(s) equal the signed statement_sha256
[PASS] retired_names — 0 hits for the four retired names
manifest: manifests/unit-G5.Ring-553d0cf.json · verdict PASS
```

## K-U6 · G5/Congruence · per-unit arm · run 2026-10-30T11:08:49Z → 11:11:12Z · exit 0

Command: `cd ~/Claude/projects/claude-papers-lean && export PATH="$HOME/.elan/bin:$PATH" && source tools/env.sh && bash tools/check.sh --unit G5/Congruence`

Form note: `--help` read at 11:05:10Z described the per-unit form as "NO lake build"; the run itself reported `lake_build` on the unit's modules by name.

```
check.sh @ 2026-10-30T11:08:49Z · commit d4e80d0 · leanprover/lean4:v4.33.0 · mathlib db584cd6d46c92f209a44c0f1c829460d327499d · units 1 · --unit G5/Congruence
warning: G5/Congruence/Challenge.lean:78:8: declaration uses `sorry`
Build completed successfully (8707 jobs).
Build completed successfully (8707 jobs).
[PASS] lake_build — exit 0 on 2 target(s) (the unit's modules by name) in 7.12s
[PASS] no_sorry_no_axiom — 2 .lean files scanned
[PASS] axioms — 1 Solution module(s), 88 theorem(s), all within {propext Classical.choice Quot.sound}
[PASS] comparator — 1 unit(s) okay (landrun: /Users/qriemannian/Claude/projects/comparator/scripts/fake-landrun.sh)
[PASS] challenge_digest — 1 Challenge.lean digest(s) equal the signed statement_sha256
[PASS] retired_names — 0 hits for the four retired names
manifest: manifests/unit-G5.Congruence-d4e80d0.json · verdict PASS
```

## K-U3 — G5/WordLevel — 2026-10-30T11:24:09Z (end 2026-10-30T11:26:40Z, exit 0)

Command: `bash tools/check.sh --unit G5/WordLevel` (after `source tools/env.sh`)

```
check.sh @ 2026-10-30T11:24:09Z · commit cc293e8 · leanprover/lean4:v4.33.0 · mathlib db584cd6d46c92f209a44c0f1c829460d327499d · units 1 · --unit G5/WordLevel

Note: This linter can be disabled with `set_option linter.unusedVariables false`
Build completed successfully (8707 jobs).
[PASS] lake_build — exit 0 on 2 target(s) (the unit's modules by name) in 7.79s
[PASS] no_sorry_no_axiom — 2 .lean files scanned
[PASS] axioms — 1 Solution module(s), 57 theorem(s), all within {propext Classical.choice Quot.sound}
[PASS] comparator — 1 unit(s) okay (landrun: /Users/qriemannian/Claude/projects/comparator/scripts/fake-landrun.sh)
[PASS] challenge_digest — 1 Challenge.lean digest(s) equal the signed statement_sha256
[PASS] retired_names — 0 hits for the four retired names
manifest: manifests/unit-G5.WordLevel-cc293e8.json · verdict PASS
```

## K-U2 · G5/ModTwo · 2026-10-30T11:24:09Z (start) → 2026-10-30T11:26:43Z (end) · exit 0

```
$ bash tools/check.sh --unit G5/ModTwo
check.sh @ 2026-10-30T11:24:09Z · commit cc293e8 · leanprover/lean4:v4.33.0 · mathlib db584cd6d46c92f209a44c0f1c829460d327499d · units 1 · --unit G5/ModTwo
warning: G5/ModTwo/Challenge.lean:172:8: declaration uses `sorry`
Build completed successfully (8707 jobs).
Build completed successfully (8707 jobs).
[PASS] lake_build — exit 0 on 2 target(s) (the unit's modules by name) in 7.75s
[PASS] no_sorry_no_axiom — 2 .lean files scanned
[PASS] axioms — 1 Solution module(s), 99 theorem(s), all within {propext Classical.choice Quot.sound}
[PASS] comparator — 1 unit(s) okay (landrun: /Users/qriemannian/Claude/projects/comparator/scripts/fake-landrun.sh)
[PASS] challenge_digest — 1 Challenge.lean digest(s) equal the signed statement_sha256
[PASS] retired_names — 0 hits for the four retired names
manifest: manifests/unit-G5.ModTwo-cc293e8.json · verdict PASS
```

## K-U4 · G5/Sector · START=2026-10-30T11:43:15Z END=2026-10-30T11:44:57Z · exit 0

Command: `cd ~/Claude/projects/claude-papers-lean && export PATH="$HOME/.elan/bin:$PATH" && source tools/env.sh && bash tools/check.sh --unit G5/Sector`

```
check.sh @ 2026-10-30T11:43:15Z · commit 74216e3 · leanprover/lean4:v4.33.0 · mathlib db584cd6d46c92f209a44c0f1c829460d327499d · units 1 · --unit G5/Sector

Note: This linter can be disabled with `set_option linter.unusedVariables false`
Build completed successfully (8707 jobs).
[PASS] lake_build — exit 0 on 2 target(s) (the unit's modules by name) in 5.69s
[PASS] no_sorry_no_axiom — 2 .lean files scanned
[PASS] axioms — 1 Solution module(s), 129 theorem(s), all within {propext Classical.choice Quot.sound}
[PASS] comparator — 1 unit(s) okay (landrun: /Users/qriemannian/Claude/projects/comparator/scripts/fake-landrun.sh)
[PASS] challenge_digest — 1 Challenge.lean digest(s) equal the signed statement_sha256
[PASS] retired_names — 0 hits for the four retired names
manifest: manifests/unit-G5.Sector-74216e3.json · verdict PASS
```

## K-U5 · G5/Ladder · 2026-10-30T11:45:12Z → 2026-10-30T11:47:04Z · exit 0

`bash tools/check.sh --unit G5/Ladder`

```
check.sh @ 2026-10-30T11:45:12Z · commit 5858377 · leanprover/lean4:v4.33.0 · mathlib db584cd6d46c92f209a44c0f1c829460d327499d · units 1 · --unit G5/Ladder
warning: G5/Ladder/Challenge.lean:111:8: declaration uses `sorry`
Build completed successfully (8707 jobs).
Build completed successfully (8707 jobs).
[PASS] lake_build — exit 0 on 2 target(s) (the unit's modules by name) in 6.1s
[PASS] no_sorry_no_axiom — 2 .lean files scanned
[PASS] axioms — 1 Solution module(s), 78 theorem(s), all within {propext Classical.choice Quot.sound}
[PASS] comparator — 1 unit(s) okay (landrun: /Users/qriemannian/Claude/projects/comparator/scripts/fake-landrun.sh)
[PASS] challenge_digest — 1 Challenge.lean digest(s) equal the signed statement_sha256
[PASS] retired_names — 0 hits for the four retired names
manifest: manifests/unit-G5.Ladder-5858377.json · verdict PASS
```
