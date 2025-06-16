#! /bin/bash
#
# Create symbolic links from the user home directory to the user directories on
# the data disk.
#
# Usage:
#   ./create-user-dir-symlinks.sh

user_dirs=("Desktop" "Documents" "Downloads" "Music" "Pictures" "Public"
  "Templates" "Videos")

user_name=$(whoami)

for user_dir in "${user_dirs[@]}"; do
  link_dir="$HOME/$user_dir"
  if [[ -d "$link_dir" ]]; then
    echo "Directory '$link_dir' already exists. Skipping."
    continue
  fi

  target_dir="/mnt/Data/$user_name/$user_dir"
  if [[ ! -d "$target_dir" ]]; then
    # Target user directory does not exist.
    mkdir -p "$target_dir"
  fi

  echo "Creating symbolic link: $link_dir -> $target_dir"
  ln -s "$target_dir" "$link_dir"
done
