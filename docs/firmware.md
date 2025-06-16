# Firmware

This document contains useful commands for managing firmware (UEFI or legacy BIOS) settings.

## Show firmware setup menu

Tell the firmware to show the setup menu on next boot, then shut down and reboot the system:

```console
systemctl reboot --firmware-setup
```

## Check firmware security status

```console
fwupdmgr security
```

## Update firmware

1. Get firmware updates:

    ```console
    sudo fwupdmgr get-updates
    ```

1. Update firmware:

    ```console
    sudo fwupdmgr update
    ```
