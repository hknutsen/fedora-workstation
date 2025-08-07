# Setup Fedora Linux

This document contains instructions for setup of Fedora Linux.

## Configure system

> [!IMPORTANT]
> The following steps should be performed immediately after the installation and initial setup of Fedora Linux.

1. Change to the playbooks directory:

   ```console
   cd playbooks
   ```

1. Install software:

   ```console
   ansible-playbook -K install-software.yml
   ```

1. Restart your computer to finish installation of NVIDIA drivers.
1. Configure system:

   ```console
   ansible-playbook -K configure-system.yml
   ```

1. Mount disks:

   ```console
   ansible-playbook -K mount-disks.yml
   ```

1. Open the Backups application and restore your home directory from your backup at `/mnt/Backup`.
1. Restart your computer to apply the user settings that were restored from the backup.

## Create user

Run the user creation playbook:

```console
ansible-playbook -K create-user.yml
```

At the prompt, enter a name for the user to be created.

Alternatively, pass a user name at runtime:

```console
ansible-playbook -K create-user.yml -e "user_name=<USER_NAME>"
```
