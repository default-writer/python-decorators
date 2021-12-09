#!/usr/bin/env bash
set -e

cd "${0%/*}/.."

pre-commit run --all-files
