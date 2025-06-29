# Henrik's Fedora Workstation

My scripts and playbooks for automating tasks on Fedora Linux.

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

   For setup of Fedora Linux, see [this document](docs/setup.md).

## System specifications

My system specifications at the time of writing:

- **Operating System**: Fedora Linux 42 (Workstation Edition)
- **Hardware Model**: MSI MS-7916
- **Processor**: Intel® Core™ i5-4690K × 4
- **Memory**: 16GB
- **Storage**:
  - **OS disk**: Samsung 850 EVO SSD 250GB
  - **Data disk**: Seagate BarraCuda HDD 2TB
  - **Backup disk**: Seagate BarraCuda HDD 4TB
- **Graphics**: NVIDIA GeForce GTX 970
- **Display**: Dell UltraSharp U2724DE
