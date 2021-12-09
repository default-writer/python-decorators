#!/usr/bin/env bash
set -e

cd "${0%/*}/.."

BUILD="$PWD/venv"

[[ ! -d "$BUILD" ]] && "$PWD/bin/env.sh"

pip3 install -r "$PWD/bin/build_requirements.txt"
