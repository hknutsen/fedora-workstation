# Henrik's Fedora Workstation

My scripts and playbooks for automating tasks on Fedora Linux.

## Prerequisites

1. Update system software:

   ```bash
   sudo dnf upgrade --refresh
   ```

1. Install Ansible:

   ```bash
   sudo dnf install ansible
   ```

## Usage

1. Create a directory for storing Git repositories:

   ```bash
   mkdir gitrepos && cd gitrepos
   ```

1. Clone this repository:

   ```bash
   git clone https://github.com/hknutsen/fedora-workstation.git && cd fedora-workstation
   ```

1. Run a script or playbook from this repository.

   For configuration of Fedora Linux, see the [sysadmin README](sysadmin/README.md).

## System specifications

My system specifications at the time of writing:

- **Operating System**: Fedora Linux 40 (Workstation Edition)
- **Hardware Model**: MSI MS-7916
- **Processor:** Intel® Core™ i5-4690K × 4
- **Memory:** 16.0 GiB
- **Graphics:** NVIDIA GeForce GTX 970

## License

This project is licensed under the terms of the [MIT license](LICENSE).
