# Fedora Workstation

Scripts and playbooks for automating setup and tasks on Fedora Workstation.

## Features

- Configure GNOME (disable automatic updates, disable mouse acceleration by default, etc.).
- Install multimedia libraries (FFmpeg, proprietary codecs, VA-API drivers, VLC, etc.).
- Install development tools (language package managers, Docker, Kubernetes, Terraform, etc.).
- Install third-party software (Google Chrome, Visual Studio Code, etc.).
- Configure Déjà Dup Backups (weekly backups to external drive).

## Prerequisites

1. Upgrade system packages:

   ```console
   sudo dnf upgrade
   ```

1. Install Ansible:

   ```console
   sudo dnf install ansible
   ```

## Usage

1. Clone this repository:

   ```console
   git clone https://github.com/hknutsen/fedora-workstation.git && cd fedora-workstation
   ```

1. Run a script or playbook from this repository, for example:

   ```console
   ansible-playbook -K playbooks/install-development-tools.yaml
   ```

## Development

1. Install uv:

   ```console
   sudo dnf install uv
   ```

1. Sync development dependencies:

   ```console
   uv sync
   ```

1. Install Git hook scripts:

   ```console
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

## References

- <https://docs.fedoraproject.org/en-US/quick-docs/>
