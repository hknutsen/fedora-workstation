#! /bin/bash

# Mounts filesystem with read-only permissions to target directory
# /run/media/<USER_NAME>/<LABEL>.
#
# Options:
#   -l  specifies the label of the filesystem to mount
#   -u  unmount filesystem
#
# Usage:
#   ./mount-readonly-filesystem.sh -l Media
#   ./mount-readonly-filesystem.sh -l Media -u

set -eu

label=""
unmount=false

while getopts l:u opt; do
  case $opt in
    l)
      label="$OPTARG"
      ;;
    u)
      unmount=true
      ;;
    *)
      exit 1
      ;;
  esac
done

if [[ -z "$label" ]]; then
  echo "-l <LABEL> must be specified."
  exit 1
fi

file_system=$(findfs LABEL="$label")
user_name=$(whoami)
mount_point="/run/media/$user_name/$label"

if [[ "$unmount" == true ]]; then
  echo "Unmounting $file_system from $mount_point"
  sudo umount "$mount_point"
  exit 0
fi

if [[ ! -d "$mount_point" ]]; then
  echo "Creating directory $mount_point"
  sudo mkdir -p "$mount_point"
fi

echo "Mounting $file_system to $mount_point"
sudo mount -r "$file_system" "$mount_point"
