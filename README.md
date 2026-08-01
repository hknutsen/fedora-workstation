# Fedora Workstation

Scripts and playbooks for automating setup and tasks on Fedora Workstation.

## Features

- Disable automatic updates.
- Install third-party software (Google Chrome, proprietary multimedia codecs, etc.)
- Install development tools (Visual Studio Code, uv, Docker, etc.).
- Configure weekly backups to Google Drive.

## Prerequisites

1. Upgrade system packages:

   ```bash
   sudo dnf upgrade
   ```

1. Install Ansible:

   ```bash
   sudo dnf install ansible
   ```

## Usage

1. Create a directory to store Git repositories:

   ```bash
   mkdir -p source/repos && cd source/repos
   ```

1. Clone this repository:

   ```bash
   git clone https://github.com/hknutsen/fedora-workstation.git && cd fedora-workstation
   ```

1. Run a script or playbook from this repository, for example:

   ```bash
   ansible-playbook -K playbooks/install-third-party-software.yaml
   ```

## Development

1. Install uv:

   ```bash
   sudo dnf install uv
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
- **Display**: Dell UltraSharp U2724DE
