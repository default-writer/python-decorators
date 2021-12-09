#!/usr/bin/env bash
set -e

cd "${0%/*}/.."

SRC="$PWD/src"
TESTS="$PWD/tests"
PYTEST="$PWD/bin/pytest"
COVERAGE="$PWD/bin/coverage"
BUILD="$PWD/venv"

[[ ! -d "$BUILD" ]] && "$PWD/bin/build.sh"

echo "Running pytest"
pytest -s -v "$TESTS" --cov="$SRC" --junit-xml="$PYTEST/test_results.xml" --cov-report term-missing:skip-covered
coverage report -m

coverage xml
coverage html -d "$COVERAGE"
coverage report --fail-under "95" --skip-covered
