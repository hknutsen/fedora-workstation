# System administration

This document contains instructions for configuration, operation and upkeep of Fedora Linux.

## Prerequisites

1. Update system software:

    ```bash
    sudo dnf upgrade --refresh
    ```

1. Install Ansible:

    ```bash
    sudo dnf install ansible
    ```

## Setup Fedora Linux

> [!IMPORTANT]
> The following steps should be performed immediately after the installation and initial setup of Fedora Linux.

1. Install software:

    ```bash
    ansible-playbook -K playbooks/install_software.yml
    ```

1. Restart your computer to finish installation of NVIDIA drivers.
1. Configure system:

    ```bash
    ansible-playbook -K playbooks/configure_system.yml
    ```

1. Open the Backups application and restore your home directory from your backup at `/mnt/Backup`.
1. Restart your computer to apply the user settings that were restored from the backup.