# BenchBase TransAct Chopped Transactions

This repository contains the chopped transaction logic for various BenchBase benchmarks (e.g., YCSB, SmallBank, TATP) translated into the `TransAct` Domain-Specific Language from the `FMitF_rs` framework. 

This repository was created by Panje Tala to demonstrate rational partitioning and chopping for these workloads.

## Rational Chopping Methodology

Each transaction is chopped based on data dependencies across partitions:
- **SmallBank:** Accounts are partitioned by `custid`. `Amalgamate` and `SendPayment` affect two different `custid`s, so they are chopped into two independent hops (one per `custid` partition), enabling higher throughput and independent execution across nodes.
- **YCSB:** Operations target a single key, so they naturally form a single hop.
- **TATP:** Most data revolves around `s_id` (Subscriber ID) as the partition key. Thus, transactions accessing a single subscriber's profile are optimally structured as a single localized hop without the need for cross-partition 2PL locking.

These `.transact` models can be fed directly into the [FMitF_rs compiler](https://github.com/yanjunc6/FMitF_rs) to generate Boogie verification conditions, construct serialization-conflict (SC) graphs, and automatically prove commutativity for the `IC3` protocol.