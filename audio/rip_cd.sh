#! /bin/bash
#
# Rip a CD to lossless FLAC files.
#
# Prerequisites:
#   cdparanoia
#   flac
#   parallel
#
# Globals:
#   FLAC_DIR
#
# Usage:
#   ./rip_cd.sh

set -eu

if [[ ! -d "$FLAC_DIR" ]]; then
  echo "Output directory '$FLAC_DIR' does not exist"
  exit 1
fi
cd "$FLAC_DIR"

rip_dir="cdparanoia"
if [[ ! -d "$rip_dir" ]]; then
  mkdir "$rip_dir"
fi
cd "$rip_dir"

if [[ -n $(ls -A) ]]; then
  echo "Directory '$rip_dir' is not empty! Aborting..."
  exit 1
fi

cdparanoia --batch --output-wav --abort-on-skip

find . -name '*.wav' -type f | parallel --progress 'flac --best --delete-input-file {}'
