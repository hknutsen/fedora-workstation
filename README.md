# Fedora Workstation

Ansible playbook for automating setup of my Fedora Workstation.

## Features

- Enable third-party repositories (RPM Fusion, Google Chrome, Flathub, etc.).
- Install multimedia libraries (FFmpeg, patented multimedia codecs, VLC, etc.).
- Install development tools (Visual Studio Code, language package managers, Docker, etc.).
- Enable automatic updates in GNOME Software.
- Configure weekly backups to external drive using Déjà Dup.

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

1. Set up Fedora Workstation:

   ```console
   ansible-playbook -K workstation.yaml
   ```

## Development

1. Install pre-commit:

   ```console
   sudo dnf install pre-commit
   ```

1. Install Git hook scripts:

   ```console
   pre-commit install
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
