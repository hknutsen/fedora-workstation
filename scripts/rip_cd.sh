#! /bin/bash

# Rips audio from a CD to lossless FLAC files in the output directory.
#
# Prerequisites:
#   whipper
#
# Globals:
#   FLAC_DIR
#
# Usage:
#   ./rip_cd.sh

set -eu

whipper cd rip --prompt --unknown --output-directory "$FLAC_DIR/new"
