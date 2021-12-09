#!/usr/bin/env bash
set -e

cd "${0%/*}/.."

PIP3="$PWD/bin/pip3"

[[ ! -d "$PIP3" ]] && mkdir $PIP3

[[ -z "$(pip3 list --outdated --format=freeze)" ]] && exit 0

pip3 list --format=freeze > "$PIP3/original_requirements.txt"
pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U
pip3 list --format=freeze > "$PIP3/update_requirements.txt"

colordiff ./bin/pip3/original_requirements.txt ./bin/pip3/update_requirements.txt
