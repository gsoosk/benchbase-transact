#!/usr/bin/env bash
# Run all BenchBase TransAct benchmarks through FMitF_rs verifier
# Results (JSON + summary) saved under ./results/<benchmark>/

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FMITF_DIR="$SCRIPT_DIR/FMitF_rs"
FMITF_BIN="$FMITF_DIR/target/release/FMitF_rs"
TRANSACT_DIR="$SCRIPT_DIR"
RESULTS_DIR="$SCRIPT_DIR/results"

export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$HOME/.dotnet:$HOME/.dotnet/tools:$PATH"

TIMEOUT=60
BENCHMARKS=(
    smallbank
    tatp
    ycsb
    tpcc
    voter
    twitter
    wikipedia
    auctionmark
    epinions
    hyadapt
    noop
    otmetrics
    resourcestresser
    sibench
    templated
    tpch
    tpcds
)

mkdir -p "$RESULTS_DIR"

echo "======================================================================"
echo "  BenchBase TransAct Verification Run"
echo "  Date: $(date)"
echo "  Timeout per Boogie call: ${TIMEOUT}s"
echo "======================================================================"

# Run from FMitF_rs dir so prelude.transact is reachable via relative path
cd "$FMITF_DIR"

SUMMARY_FILE="$RESULTS_DIR/summary.tsv"
echo -e "benchmark\ttotal_time_s\tfunctions\thops\tc_edges_original\tc_edges_simplified\tverifications\tpass\terrors\ttimeouts\tboogie_failures" \
    > "$SUMMARY_FILE"

for BENCH in "${BENCHMARKS[@]}"; do
    INPUT="$TRANSACT_DIR/${BENCH}.transact"
    OUT_DIR="$RESULTS_DIR/$BENCH"

    if [ ! -f "$INPUT" ]; then
        echo "  [SKIP] $BENCH — file not found"
        continue
    fi

    echo ""
    echo "----------------------------------------------------------------------"
    echo "  Running: $BENCH"
    echo "----------------------------------------------------------------------"

    mkdir -p "$OUT_DIR"

    START_TS=$(python3 -c "import time; print(int(time.time()*1000))")
    set +e
    "$FMITF_BIN" "$INPUT" "$OUT_DIR" \
        --timeout "$TIMEOUT" \
        --no-color \
        2>&1 | tee "$OUT_DIR/run.log"
    EXIT_CODE=$?
    set -e
    END_TS=$(python3 -c "import time; print(int(time.time()*1000))")
    ELAPSED_MS=$(( END_TS - START_TS ))
    ELAPSED_S=$(echo "scale=2; $ELAPSED_MS / 1000" | bc)

    if [ $EXIT_CODE -ne 0 ]; then
        echo "  [ERROR] $BENCH exited with code $EXIT_CODE"
        echo -e "${BENCH}\t${ELAPSED_S}\tERROR\t-\t-\t-\t-\t-\t-\t-\t-" >> "$SUMMARY_FILE"
        continue
    fi

    # Parse summary line from run.log
    FUNCTIONS=$(grep -oP 'Functions: \K[0-9]+' "$OUT_DIR/run.log" | tail -1 || echo "?")
    HOPS=$(grep -oP 'Hops: \K[0-9]+' "$OUT_DIR/run.log" | tail -1 || echo "?")
    C_ORIG=$(grep -oP 'C-edges \(original\): \K[0-9]+' "$OUT_DIR/run.log" | tail -1 || echo "?")
    C_SIMP=$(grep -oP 'C-edges \(simplified\): \K[0-9]+' "$OUT_DIR/run.log" | tail -1 || echo "?")
    VERIF=$(grep -oP 'Verifications: \K[0-9]+' "$OUT_DIR/run.log" | tail -1 || echo "?")
    PASS=$(grep -oP 'Pass: \K[0-9]+' "$OUT_DIR/run.log" | tail -1 || echo "?")
    ERRORS=$(grep -oP 'Errors: \K[0-9]+' "$OUT_DIR/run.log" | tail -1 || echo "?")
    TIMEOUTS=$(grep -oP 'Timeouts: \K[0-9]+' "$OUT_DIR/run.log" | tail -1 || echo "?")
    BF=$(grep -oP 'Boogie failures: \K[0-9]+' "$OUT_DIR/run.log" | tail -1 || echo "?")

    echo ""
    echo "  => Total wall time: ${ELAPSED_S}s"

    echo -e "${BENCH}\t${ELAPSED_S}\t${FUNCTIONS}\t${HOPS}\t${C_ORIG}\t${C_SIMP}\t${VERIF}\t${PASS}\t${ERRORS}\t${TIMEOUTS}\t${BF}" \
        >> "$SUMMARY_FILE"
done

echo ""
echo "======================================================================"
echo "  All benchmarks complete."
echo "  Summary TSV: $SUMMARY_FILE"
echo "======================================================================"
