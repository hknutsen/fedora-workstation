#! /bin/bash

# Reads audio from lossless FLAC files in the source directory,
# and encodes to lossy Opus files in the output directory.
#
# Prereqs:
#   opusenc
#
# Arguments:
#   Source directory
#   Output directory (relative to source directory)
#
# Usage:
#   ./encode_opus.sh /mnt/Data/Music/ ~/Music/

set -eu

source_dir=$1
output_dir=$2

cd "$source_dir" || exit

readarray -t flac_files < <(find . -name "*.flac")

for flac_file in "${flac_files[@]}"; do
  opus_file="$output_dir/${flac_file/"%.flac"/".opus"}"
  if [[ -f "$opus_file" ]]; then
    echo "$opus_file already exists"
    continue
  fi

  parent_dir=$(dirname "$opus_file")
  if [[ ! -d "$parent_dir" ]]; then
    mkdir -p "$parent_dir"
  fi

  # According to the Xiph.Org Foundation (developers of Opus), "Opus at 128 KB/s (VBR) is pretty much transparent".
  # Ref: https://wiki.xiph.org/Opus_Recommended_Settings#Recommended_Bitrates (2024/04/03)
  opusenc --bitrate 128 --vbr "$flac_file" "$opus_file"
done