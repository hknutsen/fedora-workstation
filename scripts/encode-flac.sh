#! /bin/bash

# Re-encodes lossless FLAC files in the FLAC directory that do not contain
# encoding information.
#
# Prerequisites:
#   flac
#   parallel
#
# Globals:
#   FLAC_DIR
#
# Usage:
#   ./encode-flac.sh

set -eu

function encode_flac {
  ##############################################################################
  # Re-encodes the lossless FLAC file if it does not contain encoding
  # information.
  # Arguments:
  #   FLAC file, a path.
  # Outputs:
  #   Re-encoded FLAC file, an absolute path.
  ##############################################################################
  flac_file="$1"
  if [[ ! -f "$flac_file" ]]; then
    echo "Input file '$flac_file' does not exist" >&2
    exit 1
  fi
  if [[ "$flac_file" != *.flac ]]; then
    echo "Input file '$flac_file' is not a FLAC file" >&2
    exit 1
  fi

  flac_encoding=$(metaflac --show-vendor-tag "$flac_file")
  if [[ -n "${flac_encoding}" ]]; then
    # If input FLAC file already contains encoding information, skip.
    exit 0
  fi

  flac --best --silent --force "$flac_file"

  realpath "$flac_file"
}
export -f encode_flac

# Ensure the FLAC directory exists.
if [[ ! -d "$FLAC_DIR" ]]; then
  echo "Input directory '$FLAC_DIR' does not exist"
  exit 1
fi

# Re-encode FLAC files in parallel child processes.
cd "$FLAC_DIR"
find . -name '*.flac' -type f | sort | parallel --progress 'encode_flac {}'
