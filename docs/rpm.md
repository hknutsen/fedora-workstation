# RPM Package Manager (RPM)

This document contains instructions for working with RPM packages, repositories and keys.

## Repositories

List repositories:

```console
dnf repolist
```

Query installed packages from specified repository:

```console
dnf repoquery --installed-from-repo=<REPO_ID>
```

## RPM keys

List imported RPM keys:

```console
rpmkeys --list
```

Delete specified RPM key:

```console
sudo rpmkeys --delete <KEY_ID>
```
