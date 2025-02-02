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

date=$(date +"%Y%m%d%H%M%S")
rip_dir="rip_$date"
if [[ -d "$rip_dir" ]]; then
  echo "Rip directory '$rip_dir' already exists! Should rip to empty directory to avoid overriding existing rip. Aborting..."
  exit 1
fi
mkdir "$rip_dir"
cd "$rip_dir"

cdparanoia --batch --output-wav --abort-on-skip

find . -name '*.wav' -type f | parallel --progress 'flac --best --silent --delete-input-file {}'
