#!/usr/bin/env bash
set -e

cd "${0%/*}/.."


echo "Src"
black --quiet ./src

echo "Tests"
black --quiet ./tests

echo "Pre-commit"
pre-commit run --all-files
