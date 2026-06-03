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

## System Specifications

My system specifications at the time of writing:

- **Operating System**: Fedora Linux 44 (Workstation Edition)
- **Hardware Model**: Lenovo ThinkPad E14 Gen 7
- **Processor**: AMD Ryzen™ 7 250 w/ Radeon™ 780M Graphics × 16
- **Memory**: 32.0 GiB
- **Disk Capacity**: 1.0 TB
