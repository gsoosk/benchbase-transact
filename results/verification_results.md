# BenchBase TransAct Verification Results

**Tool:** FMitF_rs (Formal Methods in Transaction Framework)
**Verification backend:** Boogie 3.5.6 / .NET 8.0
**Date:** 2026-04-09
**Settings:** `--instances 2  --loop-unroll 12  --timeout 60`
**Machine:** Apple Silicon (macOS 25.2)

---

## Summary Table

| Benchmark       | Functions | Hops | C-edges | Verified | Pass | Errors | Timeouts | Bgl Fail | Total Time (ms) | Commutativity |
|-----------------|----------:|-----:|--------:|---------:|-----:|-------:|---------:|---------:|----------------:|:-------------:|
| smallbank       |        25 |    9 |      71 |       71 |   71 |      0 |        0 |        0 |             717 | **100%**      |
| tatp            |        31 |    8 |      11 |       11 |   11 |      0 |        0 |        0 |           3,583 | **100%**      |
| ycsb            |        23 |   16 |      28 |       28 |   28 |      0 |        0 |        0 |           2,264 | **100%**      |
| tpcc            |        56 |   44 |     284 |      284 |  284 |      0 |        0 |        0 |          25,323 | **100%**      |
| voter           |        23 |    6 |       1 |        1 |    1 |      0 |        0 |        0 |           1,199 | **100%**      |
| twitter         |        30 |    8 |       1 |        1 |    1 |      0 |        0 |        0 |           2,376 | **100%**      |
| wikipedia       |        38 |   11 |      25 |       25 |   25 |      0 |        0 |        0 |           2,064 | **100%**      |
| auctionmark     |        50 |   16 |     140 |      140 |  140 |      0 |        0 |        0 |          12,407 | **100%**      |
| epinions        |        32 |   14 |       4 |        4 |    4 |      0 |        0 |        0 |           1,035 | **100%**      |
| hyadapt         |        37 |  201 |       0 |        0 |    0 |      0 |        0 |        0 |          53,103 | N/A (no C-edges) |
| noop            |        16 |    1 |       0 |        0 |    0 |      0 |        0 |        0 |             964 | N/A (no C-edges) |
| otmetrics       |        20 |    2 |       0 |        0 |    0 |      0 |        0 |        0 |           1,610 | N/A (no C-edges) |
| resourcestresser|        26 |  208 |      29 |       29 |   29 |      0 |        0 |        0 |           3,446 | **100%**      |
| sibench         |        19 |    3 |       1 |        1 |    1 |      0 |        0 |        0 |             882 | **100%**      |
| templated       |        21 |    6 |      26 |       26 |   26 |      0 |        0 |        0 |           2,815 | **100%**      |
| tpch            |        45 |   43 |       0 |        0 |    0 |      0 |        0 |        0 |           1,665 | N/A (no C-edges) |
| tpcds           |        47 |   29 |       0 |        0 |    0 |      0 |        0 |        0 |             703 | N/A (no C-edges) |
| **TOTAL**       |   **529** |**624**|  **621**|    **621**| **621**|  **0** |     **0** |      **0** | **116,156**  | **100% of verified** |

**C-edges:** Serialization-conflict graph edges requiring commutativity verification
**Bgl Fail:** Boogie compilation failures (type errors in generated code)
**Commutativity:** Fraction of C-edges where all Boogie checks passed (UNSAT = commutative)

---

## Per-Benchmark Notes

### smallbank (71 C-edges — 100% commutative, 717ms)
Single partition function `f(x)=x`. Six OLTP transactions covering balance reads,
deposits, savings, wire transfers (2-hop: custId0 → custId1). All 71 C-edge pairs
verified commutative. Fast execution due to small hop count.

### tatp (11 C-edges — 100% commutative, 3,583ms)
Telecom subscriber data, all tables co-located by `s_id`. Seven transactions, all
single-hop. An internal variable named `active` in `GetNewDestination` caused a
Boogie type collision (the verifier uses `active` as a bool guard); renamed to
`sf_active` to resolve. All 11 C-edges pass after fix.

### ycsb (28 C-edges — 100% commutative, 2,264ms)
Wide-column key-value store. `ScanRecord` originally used variable `hops for`
bounds (not supported); replaced with `const YCSB_SCAN_SIZE = 10`. Five transactions
plus a 10-hop scan loop; all 28 C-edges verified commutative.

### tpcc (284 C-edges — 100% commutative, 25,323ms)
Most complex OLTP benchmark. Five transactions: `newOrder` (warehouse → N item/stock
hops → district), `Delivery` (10 district hops), `Payment` (3 hops), `OrderStatus`
(1 hop), `StockLevel` (2 hops). 284 C-edges verified; longest single run at ~25s
due to the high hop count (44 hops) and large SC graph.

### voter (1 C-edge — 100% commutative, 1,199ms)
3-hop transaction (contestant → location → vote partition). Only 1 C-edge in the
simplified SC graph; verified commutative quickly.

### twitter (1 C-edge — 100% commutative, 2,376ms)
UID-partitioned tweets with composite PK `(uid, id)`. Multi-hop for fan-out reads.
Only 1 C-edge; verified commutative.

### wikipedia (25 C-edges — 100% commutative, 2,064ms)
Read-heavy benchmark with fan-out page updates. `UpdatePage` is 3-hop
(page/text/revision → watcher → editor-user). All 25 C-edges pass.

### auctionmark (140 C-edges — 100% commutative, 12,407ms)
Seller/buyer partition split. 11 transactions including 2-hop `CloseAuctions`,
`GetUserInfo`, `NewPurchase`. Second largest C-edge count at 140; all verified
commutative in ~12.4s.

### epinions (4 C-edges — 100% commutative, 1,035ms)
Social trust/review network. 9 transactions. Only 4 C-edges; fast verification.

### hyadapt (0 C-edges — N/A, 53,103ms)
20 range-scan transactions (`MaxRecord1–10`, `ReadRecord1–10`) each with
`hops for i = 0 to SCAN_SIZE` (reduced from 100 to 10 to keep CFG tractable).
No SC-graph C-edges: all scanned records are on independent partitions, so
no serialization conflicts arise. CFG + optimization took ~51s due to 201 hops.

### noop (0 C-edges — N/A, 964ms)
Trivial benchmark; single empty hop; no conflicting table accesses.

### otmetrics (0 C-edges — N/A, 1,610ms)
Metrics collection; 2 hops with no shared state between transactions.

### resourcestresser (29 C-edges — 100% commutative, 3,446ms)
Contention + IO stress benchmark. Notable for 208 hops (CPU1/CPU2 use
`hops for i = 0 to CPU_RANGE`). 29 C-edges from the Contention1/2 and IO1/2
transactions; all verified commutative.

### sibench (1 C-edge — 100% commutative, 882ms)
SI isolation benchmark; 1 C-edge; fast.

### templated (26 C-edges — 100% commutative, 2,815ms)
Generic template benchmark. 26 C-edges; all commutative.

### tpch (0 C-edges — N/A, 1,665ms)
18 analytical read-only queries across Lineitem, Orders, Customer, Supplier, etc.
No C-edges because all transactions are read-only (no writes → no conflicts).

### tpcds (0 C-edges — N/A, 703ms)
7 representative TPC-DS analytical queries. Same as TPC-H: all read-only,
no SC-graph conflicts.

---

## Aggregate Statistics

| Metric | Value |
|---|---|
| Total benchmarks | 17 |
| Benchmarks with C-edges | 11 |
| Benchmarks with no C-edges (read-only or no conflict) | 6 |
| Total C-edges across all benchmarks | 621 |
| Total C-edges verified | 621 |
| Total C-edges passed (commutative) | 621 |
| Total C-edges failed (non-commutative) | 0 |
| Total C-edges timed out | 0 |
| Boogie compilation errors | 0 (after TATP fix) |
| Overall commutativity rate | **100%** |
| Total verification wall time | ~116s |
| Largest benchmark (by C-edges) | tpcc (284) |
| Fastest benchmark | sibench (882ms) |
| Slowest benchmark | hyadapt (53,103ms — large hop count) |

---

## Fixes Applied During Verification

| Benchmark | Issue | Fix |
|---|---|---|
| ycsb | `hops for` with variable bounds (`startKey to endKey`) — not supported | Replaced with `const YCSB_SCAN_SIZE = 10`; changed signature to `ScanRecord(startKey: int)` |
| hyadapt | `SCAN_SIZE = 100` caused 2000-hop CFG (174s+ CFG generation, OOM) | Reduced `SCAN_SIZE` from 100 to 10 |
| tatp | Variable `active: int` clashed with verifier's internal `active: bool` guard | Renamed to `sf_active: int` |
