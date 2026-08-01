#!/bin/sh

set -eu

if [ "$#" -gt 1 ]; then
  echo "Usage: $0 [output-directory]" >&2
  exit 2
fi

if [ "$#" -eq 1 ]; then
  validation_output=$1
else
  validation_output=$(mktemp -d)
  trap 'rm -rf "$validation_output"' EXIT HUP INT TERM
fi

hugo \
  --environment "${HUGO_ENV:-production}" \
  --destination "$validation_output" \
  --cleanDestinationDir \
  --panicOnWarning \
  --printPathWarnings

python3 scripts/check_internal_links.py "$validation_output"
