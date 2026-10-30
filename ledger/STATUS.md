# STATUS — every row of Claude Paper No. 1

*Skeleton seeded 2026-10-30 (`date -u`) by the orchestrator-aide at Orchestrator A's brief, in the table form of `lean-papers/ledger/STATUS.md`. Rows are added by the M seat. CO writes a row's build disposition from a build manifest only.*

## No. 1 — *The Realized Trace Set of the Hecke Group G(5)* (statements from the dig's record; no served edition yet)

| row | unit | theorem(s) | disposition | evidence |
|---|---|---|---|---|
| G5-U1-R5 | U1 `G5/Ring` | `G5.g5_u1_r5` | **PROVED** (K PASS · V₃ CLEAN) | Challenge FROZEN `863127f8…` (V₂ 10:23:30Z); Solution `0a11790b…` built 10:28:59Z, axioms propext/Classical.choice/Quot.sound, comparator okay 10:31:25Z (`c10c4ac`) |
| G5-U1-RAS | U1 `G5/Ring` | `G5.g5_u1_ras` | **PROVED** (K PASS · V₃ CLEAN) | as above; K `manifests/unit-G5.Ring-553d0cf.json` PASS 10:53:22Z (seat) and `unit-G5.Ring-59b7100.json` PASS 10:57:17Z (the orchestrator's re-run, five arms PASS, comparator via the macOS shim — unsandboxed); V₃ `specs/_V3-U1.md` CLEAN 10:42Z |
| G5-U1-DET | U1 `G5/Ring` | `G5.g5_u1_det` | **PROVED** (K PASS · V₃ CLEAN) | as above |
| G5-U1-GEa | U1 `G5/Ring` | `G5.g5_u1_ge_a` | **PROVED** (K PASS · V₃ CLEAN) | as above (K twice, V₃ CLEAN); GEb is V1-CC (real-order reading; STATEMENTS.md §4 erratum 10:02Z) and carries no theorem |
| G5-U1-TRACE | U1 `G5/Ring` | `G5.g5_u1_trace` | **PROVED** (K PASS · V₃ CLEAN) | as above |
| G5-M4a | U6 `G5/Congruence` | `G5.g5_u6_m4a` | **PROVED** (K PASS · V₃ CLEAN) | Challenge FROZEN `d576229b…` (V₂ 10:40:29Z); Solution `5165d2c1…` built 11:00:08Z, axioms propext/Classical.choice/Quot.sound, comparator okay 11:02:08Z; the prelude rule (Solution imports G5.Ring.Solution) accepted by the comparator; K `manifests/unit-G5.Congruence-d4e80d0.json` PASS 11:11:12Z (seat; six arms, the --unit build-by-name form) and `unit-G5.Congruence-dcc6af3.json` PASS 11:16:05Z (the orchestrator's re-run); V₃ `specs/_V3-U6.md` CLEAN 11:09Z |
| G5-M4b | U6 `G5/Congruence` | `G5.g5_u6_m4b` | **PROVED** (K PASS · V₃ CLEAN) | as above |
| G5-M4c | U6 `G5/Congruence` | `G5.g5_u6_m4c` | **PROVED** (K PASS · V₃ CLEAN) | as above |
| G5-M4d | U6 `G5/Congruence` | `G5.g5_u6_m4d` | **PROVED** (K PASS · V₃ CLEAN) | as above |
| G5-M3a | U6 `G5/Congruence` | `G5.g5_u6_m3a` | **PROVED** (K PASS · V₃ CLEAN) | as above |
| G5-M3b | U6 `G5/Congruence` | `G5.g5_u6_m3b` | **PROVED** (K PASS · V₃ CLEAN) | as above; G5-U6-DEFS is the definitions block (no theorem) |
| G5-Aa | U3 `G5/WordLevel` | `G5.g5_u3_a_nonneg` | L-PROVED, K pending | Challenge FROZEN `69533d2d…` (V₂ 10:39:11Z); Solution `1666d0f4…` built 11:13:56Z (B4 full compile), axioms propext/Classical.choice/Quot.sound, comparator okay 11:08:39Z; the prelude rule accepted |
| G5-Ab | U3 `G5/WordLevel` | `G5.g5_u3_a_y_eq_zero` | L-PROVED, K pending | as above; the direct closed-path weight route (AM-1-SH §3), 25 private helpers |
| G5-SEPa | U3 `G5/WordLevel` | `G5.g5_u3_sep_lin` | L-PROVED, K pending | as above; `hw` unused (the frozen statement carries it; the separation needs `hy` only) |
| G5-SEPb | U3 `G5/WordLevel` | `G5.g5_u3_sep_sq` | L-PROVED, K pending | as above |
