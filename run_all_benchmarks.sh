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

# Helper: extract a number after a label like "Functions: 25" from a file
# Usage: extract_stat "Functions" file.log
extract_stat() {
    local label="$1"
    local file="$2"
    # Use grep -oE (extended regex, macOS-compatible) then awk to get the number
    grep -oE "${label}: [0-9]+" "$file" | tail -1 | awk '{print $NF}'
}

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
    "$FMITF_BIN" "$INPUT" "$OUT_DIR" \
        --timeout "$TIMEOUT" \
        --no-color \
        2>&1 | tee "$OUT_DIR/run.log"
    EXIT_CODE=${PIPESTATUS[0]}
    END_TS=$(python3 -c "import time; print(int(time.time()*1000))")
    ELAPSED_MS=$(( END_TS - START_TS ))
    ELAPSED_S=$(echo "scale=2; $ELAPSED_MS / 1000" | bc)

    if [ $EXIT_CODE -ne 0 ]; then
        echo "  [ERROR] $BENCH exited with code $EXIT_CODE"
        echo -e "${BENCH}\t${ELAPSED_S}\tERROR\t-\t-\t-\t-\t-\t-\t-\t-" >> "$SUMMARY_FILE"
        continue
    fi

    # Parse summary stats from run.log using macOS-compatible grep -oE + awk
    LOG="$OUT_DIR/run.log"
    FUNCTIONS=$(extract_stat "Functions" "$LOG")
    HOPS=$(extract_stat "Hops" "$LOG")
    # C-edges lines: "C-edges (original): 71  C-edges (simplified): 0"
    C_ORIG=$(grep -oE 'C-edges \(original\): [0-9]+' "$LOG" | tail -1 | awk '{print $NF}')
    C_SIMP=$(grep -oE 'C-edges \(simplified\): [0-9]+' "$LOG" | tail -1 | awk '{print $NF}')
    VERIF=$(extract_stat "Verifications" "$LOG")
    PASS=$(extract_stat "Pass" "$LOG")
    ERRORS=$(extract_stat "Errors" "$LOG")
    TIMEOUTS=$(extract_stat "Timeouts" "$LOG")
    BF=$(grep -oE 'Boogie failures: [0-9]+' "$LOG" | tail -1 | awk '{print $NF}')

    # Default to 0 if not found
    FUNCTIONS=${FUNCTIONS:-0}
    HOPS=${HOPS:-0}
    C_ORIG=${C_ORIG:-0}
    C_SIMP=${C_SIMP:-0}
    VERIF=${VERIF:-0}
    PASS=${PASS:-0}
    ERRORS=${ERRORS:-0}
    TIMEOUTS=${TIMEOUTS:-0}
    BF=${BF:-0}

    echo ""
    echo "  => Wall time: ${ELAPSED_S}s | C-edges: ${C_ORIG} | Pass: ${PASS} | Errors: ${ERRORS} | Timeouts: ${TIMEOUTS}"

    echo -e "${BENCH}\t${ELAPSED_S}\t${FUNCTIONS}\t${HOPS}\t${C_ORIG}\t${C_SIMP}\t${VERIF}\t${PASS}\t${ERRORS}\t${TIMEOUTS}\t${BF}" \
        >> "$SUMMARY_FILE"
done

echo ""
echo "======================================================================"
echo "  All benchmarks complete."
echo "  Summary TSV: $SUMMARY_FILE"
echo "======================================================================"

# Print the summary table
echo ""
cat "$SUMMARY_FILE" | column -t -s $'\t'
