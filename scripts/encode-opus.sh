#! /bin/bash

# Decodes audio from lossless FLAC files in the FLAC directory and encodes to
# lossy Opus files in the Opus directory.
#
# Prerequisites:
#   parallel
#   opus-tools
#
# Globals:
#   FLAC_DIR
#   OPUS_DIR
#
# Usage:
#   ./encode-opus.sh

set -eu

function encode_opus {
  ##############################################################################
  # Decodes audio from the lossless FLAC file and encodes to a lossy Opus file
	# in the Opus directory.
  # Globals:
  #   OPUS_DIR
  # Arguments:
  #   FLAC file, a path.
  # Outputs:
  #   Opus file, an absolute path.
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

  opus_file="$OPUS_DIR/${flac_file%.flac}.opus"
  if [[ -f "$opus_file" ]]; then
    # If output Opus file already exists, skip.
    exit 0
  fi

  dir=$(dirname "$opus_file")
  if [[ ! -d "$dir" ]]; then
    mkdir -p "$dir"
  fi

  # According to the Xiph.Org Foundation (developers of Opus), "Opus at 128 KB/s
  # (VBR) is pretty much transparent".
  # Ref: https://wiki.xiph.org/Opus_Recommended_Settings#Recommended_Bitrates
  opusenc --bitrate 128 --vbr --quiet "$flac_file" "$opus_file"

  # The Opus encoder provided by opus-tools will propagate tags from the input
  # FLAC file to the output Opus file, except "REPLAYGAIN_*" tags.
  #
  # Opus follows the EBU R128 specification for loudness normalization.
  # According to the Opus specification, gain must be stored in the "Output
  # Gain" field in the ID header. Media players should apply this gain by
  # default. Additional track and album gain can be stored in the
  # "R128_TRACK_GAIN" and "R128_ALBUM_GAIN" tags in the comment header.
  # Ref: https://datatracker.ietf.org/doc/html/rfc7845#section-5.2.1
  #
  # If the input FLAC file has a "REPLAYGAIN_ALBUM_GAIN" tag, its value will be
  # converted to the R128 reference level and stored in the "Output Gain" field
  # of the output Opus file. If the input FLAC file has a
  # "REPLAYGAIN_TRACK_GAIN" tag, its value relative to the album gain will be
  # converted to the R128 reference level and stored in the "R128_TRACK_GAIN"
  # tag of the output Opus file.
  # Ref: https://github.com/xiph/opus-tools/blob/v0.2/src/flac.c#L179-L193
  #
  # Some media players might require ReplayGain to be turned off in order apply
  # the default output gain (i.e. the album gain) without applying the
  # additional track gain.

  realpath "$opus_file"
}
export -f encode_opus

# Ensure the FLAC directory exists.
if [[ ! -d "$FLAC_DIR" ]]; then
  echo "FLAC directory '$FLAC_DIR' does not exist"
  exit 1
fi

# Ensure the Opus directory exists.
if [[ ! -d "$OPUS_DIR" ]]; then
  mkdir -p "$OPUS_DIR"
fi

# Convert FLAC files to Opus files in parallel child processes.
cd "$FLAC_DIR"
find . -name '*.flac' -type f | sort | parallel --progress 'encode_opus {}'
