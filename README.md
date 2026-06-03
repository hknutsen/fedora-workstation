# Fedora Workstation

Scripts and playbooks for automating setup and tasks on Fedora Workstation.

## Features

- Automatic updates disabled.
- Weekly backups to Google Drive.

## Prerequisites

1. Upgrade system packages:

   ```bash
   sudo dnf upgrade
   ```

1. Install Ansible:

   ```bash
   sudo dnf install ansible
   ```

## Development

1. Install development tools:

   ```bash
   ansible-playbook -K playbooks/install-dev-tools.yaml
   ```

1. Sync development dependencies:

   ```bash
   uv sync
   ```

1. Install Git hook scripts:

   ```bash
   uv run pre-commit install
   ```
