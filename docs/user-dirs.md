# User directories

The following user directories are created in each user's home directory by default:

- Desktop
- Documents
- Downloads
- Music
- Pictures
- Public
- Templates
- Videos

To change the paths of your user directories, edit the following file:

```console
nano ~/.config/user-dirs.dirs
```

Format is `XDG_xxx_DIR="$HOME/yyy"`, where `yyy` is a shell-escaped path relative to your home directory, or `XDG_xxx_DIR="/yyy"`, where `/yyy` is an absolute path.

The GNOME file manager indicates user directories with special icons.
