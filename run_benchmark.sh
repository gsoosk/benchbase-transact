#!/usr/bin/env bash
# Run a single TransAct benchmark through the FMitF_rs verifier.
# Usage: ./run_benchmark.sh <benchmark_name_or_path> [--timeout N]
#
# Examples:
#   ./run_benchmark.sh tpcc
#   ./run_benchmark.sh tpcc --timeout 120
#   ./run_benchmark.sh /path/to/my.transact

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FMITF_DIR="$SCRIPT_DIR/FMitF_rs"
FMITF_BIN="$FMITF_DIR/target/release/FMitF_rs"
RESULTS_DIR="$SCRIPT_DIR/results"

export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$HOME/.dotnet:$HOME/.dotnet/tools:$PATH"

TIMEOUT=60

# Parse args
INPUT_ARG="$1"
shift || true
while [[ $# -gt 0 ]]; do
    case "$1" in
        --timeout) TIMEOUT="$2"; shift 2 ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
done

if [ -z "$INPUT_ARG" ]; then
    echo "Usage: $0 <benchmark_name_or_path> [--timeout N]"
    exit 1
fi

# Resolve input file
if [ -f "$INPUT_ARG" ]; then
    INPUT="$INPUT_ARG"
    BENCH=$(basename "$INPUT_ARG" .transact)
elif [ -f "$SCRIPT_DIR/${INPUT_ARG}.transact" ]; then
    INPUT="$SCRIPT_DIR/${INPUT_ARG}.transact"
    BENCH="$INPUT_ARG"
else
    echo "Error: cannot find transact file for '$INPUT_ARG'"
    exit 1
fi

OUT_DIR="$RESULTS_DIR/$BENCH"
mkdir -p "$OUT_DIR"

echo "======================================================================"
echo "  Benchmark : $BENCH"
echo "  Input     : $INPUT"
echo "  Output    : $OUT_DIR"
echo "  Timeout   : ${TIMEOUT}s per Boogie call"
echo "  Date      : $(date)"
echo "======================================================================"

cd "$FMITF_DIR"

START_TS=$(python3 -c "import time; print(int(time.time()*1000))")
"$FMITF_BIN" "$INPUT" "$OUT_DIR" \
    --timeout "$TIMEOUT" \
    --no-color \
    2>&1 | tee "$OUT_DIR/run.log"
EXIT_CODE=${PIPESTATUS[0]}
END_TS=$(python3 -c "import time; print(int(time.time()*1000))")
ELAPSED_MS=$(( END_TS - START_TS ))
ELAPSED_S=$(echo "scale=2; $ELAPSED_MS / 1000" | bc)

echo ""
echo "======================================================================"
if [ $EXIT_CODE -ne 0 ]; then
    echo "  [FAILED] Exit code: $EXIT_CODE"
else
    LOG="$OUT_DIR/run.log"
    FUNCTIONS=$(grep -oE 'Functions: [0-9]+' "$LOG" | tail -1 | awk '{print $NF}')
    HOPS=$(grep -oE 'Hops: [0-9]+' "$LOG" | tail -1 | awk '{print $NF}')
    C_ORIG=$(grep -oE 'C-edges \(original\): [0-9]+' "$LOG" | tail -1 | awk '{print $NF}')
    C_SIMP=$(grep -oE 'C-edges \(simplified\): [0-9]+' "$LOG" | tail -1 | awk '{print $NF}')
    VERIF=$(grep -oE 'Verifications: [0-9]+' "$LOG" | tail -1 | awk '{print $NF}')
    PASS=$(grep -oE 'Pass: [0-9]+' "$LOG" | tail -1 | awk '{print $NF}')
    ERRORS=$(grep -oE 'Errors: [0-9]+' "$LOG" | tail -1 | awk '{print $NF}')
    TIMEOUTS=$(grep -oE 'Timeouts: [0-9]+' "$LOG" | tail -1 | awk '{print $NF}')
    BF=$(grep -oE 'Boogie failures: [0-9]+' "$LOG" | tail -1 | awk '{print $NF}')

    echo "  Wall time     : ${ELAPSED_S}s"
    echo "  Functions     : ${FUNCTIONS:-0}   Hops: ${HOPS:-0}"
    echo "  C-edges       : original=${C_ORIG:-0}  simplified=${C_SIMP:-0}"
    echo "  Verifications : ${VERIF:-0}  Pass: ${PASS:-0}  Errors: ${ERRORS:-0}  Timeouts: ${TIMEOUTS:-0}  Boogie failures: ${BF:-0}"
fi
echo "  Log           : $OUT_DIR/run.log"
echo "======================================================================"
