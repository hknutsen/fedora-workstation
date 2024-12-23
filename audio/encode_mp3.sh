#! /bin/bash

# Decodes audio from lossless FLAC files in the input directory and encodes to
# lossy MP3 files in the output directory.
#
# Prerequisites:
#   parallel
#   ffmpeg
#
# Globals:
#   FLAC_DIR
#   MP3_DIR
#
# Usage:
#   ./encode_mp3.sh

set -eu

NC='\033[0;37m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'

function doit {
  flac_file="$FLAC_DIR/$1"
  mp3_file="$MP3_DIR/$2"

  if [[ -f "$mp3_file" ]]; then
    # If output MP3 file already exists, skip.
    exit 0
  fi

  dir=$(dirname "$mp3_file")
  if [[ ! -d "$dir" ]]; then
    mkdir -p "$dir"
  fi

  echo -e "${YELLOW}Converting '$flac_file' to '$mp3_file'${NC}"
  ffmpeg -i "$flac_file" -codec:v copy -codec:a libmp3lame -qscale:a 0 "$mp3_file"
  # Refs:
  # - https://trac.ffmpeg.org/wiki/Encode/MP3
  # - https://wiki.hydrogenaud.io/index.php?title=LAME#Recommended_encoder_settings
}

# Ensure the input directory exists.
if [[ ! -d "$FLAC_DIR" ]]; then
  echo "Input directory '$FLAC_DIR' does not exist"
  exit 1
fi

# Ensure the output directory exists.
if [[ ! -d "$MP3_DIR" ]]; then
  mkdir -p "$MP3_DIR"
fi

# Export variables and function, allowing child processes to inherit them.
export NC
export YELLOW
export -f doit

# Convert FLAC files to MP3 files in parallel child processes.
cd "$FLAC_DIR"
find . -name '*.flac' -type f | sort | parallel --progress 'doit {} {.}.mp3'
echo -e "${GREEN}Done!${NC}"
