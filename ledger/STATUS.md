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
