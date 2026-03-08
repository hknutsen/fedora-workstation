# Backups

I use [restic](https://restic.net/) for backups, with [Déjà Dup](https://apps.gnome.org/DejaDup/) as my preferred graphical user interface.

## Prerequisites

Set the value of environment variable `BACKUP_DISK_UUID` to the UUID of your external backup drive.

Recommended external backup drive configuration:

- **Formatting**: Ext4
- **Encryption**: LUKS

## Configure backups

1. Change to the playbooks directory:

    ```console
    cd playbooks
    ```

1. Configure backups:

    ```console
    ansible-playbook -K configure-backups.yml
    ```

Déjà Dup will be scheduled to create backups at a weekly interval. When notified, connect your external backup drive in order for Déjà Dup to create a backup. It's recommended to set an encryption password to protect your backups.

