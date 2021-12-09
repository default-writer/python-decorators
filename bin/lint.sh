#!/usr/bin/env bash
set -e

cd "${0%/*}/.."

SRC="$PWD/src"

PYLINT="$PWD/bin/pylint"
BANDIT="$PWD/bin/bandit"
FLAKE="$PWD/bin/flake"

[[ ! -d "$PYLINT" ]] && mkdir $PYLINT
[[ ! -d "$BANDIT" ]] && mkdir $BANDIT
[[ ! -d "$FLAKE" ]] && mkdir $FLAKE

function cleanup()
{
    local -r exit_code=$?
    [[ ! -f "$PYLINT/lint_results.txt" ]] && cat "$PYLINT/lint_results.txt"
    exit $exit_code
}

run_pylint () {
    pylint --rcfile=.pylintrc "$SRC" 2>&1 > "$PYLINT/lint_results.txt"
    cat "$PYLINT/lint_results.txt"
}

run_flake8 () {
  flake8 -v "$SRC" --output-file "$FLAKE/flake_results.txt"
}

trap cleanup EXIT

run_pylint

trap - EXIT

run_flake8

bandit -q -r "$SRC" -f html -o "$BANDIT/security.html"
bandit -r "$SRC" -f screen
