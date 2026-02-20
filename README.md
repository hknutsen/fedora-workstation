# Henrik's Fedora Workstation

My scripts and playbooks for automating setup and tasks on Fedora Linux.

## Features

- Automatic updates disabled.
- Weekly backups to external storage.

## Prerequisites

1. Update system software:

   ```console
   sudo dnf upgrade --refresh
   ```

1. Install Ansible:

   ```console
   sudo dnf install ansible
   ```

## Usage

1. Create a directory for storing Git repositories:

   ```console
   mkdir -p source/repos && cd source/repos
   ```

1. Clone this repository:

   ```console
   git clone https://github.com/hknutsen/fedora-workstation.git && cd fedora-workstation
   ```

1. Run a script or playbook from this repository.

   For setup of Fedora Linux, see [setup instructions](docs/setup.md).

## System specifications

My system specifications at the time of writing:

- **Operating System**: Fedora Linux 43 (Workstation Edition)
- **Hardware Model**: Lenovo ThinkPad E14 Gen 7
- **Processor**: AMD Ryzen™ 7 250 × 16
- **Memory**: 32GB
- **Storage**: 1TB
- **External Storage**: Samsung Portable SSD T7 4TB
- **Graphics**: AMD Radeon™ 780M Graphics
- **Display**: Dell UltraSharp U2724DE
