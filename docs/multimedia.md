# Multimedia

## Hardware video acceleration

Hardware-accelerated video decoding for free video coding formats (VP9, AV1) is supported out of the box on AMD using the free Mesa-based Video Acceleration API (VA-API) drivers.

You can add support for patended video coding formats (H.264, H.265/HEVC) by running the third-party software installation playbook:

```bash
ansible-playbook -K playbooks/install-third-party-software.yaml
```

Use `vainfo` (included in the `libva-utils` package) to verify that VA-API works:

```bash
$ vainfo
Trying display: wayland
libva info: VA-API version 1.23.0
libva info: Trying to open /usr/lib64/dri-nonfree/radeonsi_drv_video.so
libva info: Trying to open /usr/lib64/dri-freeworld/radeonsi_drv_video.so
libva info: Found init function __vaDriverInit_1_23
libva info: va_openDriver() returns 0
vainfo: VA-API version: 1.23 (libva 2.23.0)
vainfo: Driver version: Mesa Gallium driver 26.1.5 for AMD Radeon 780M Graphics (radeonsi, phoenix, ACO, DRM 3.64, 7.1.5-201.fc44.x86_64)
vainfo: Supported profile and entrypoints
      VAProfileH264ConstrainedBaseline: VAEntrypointVLD
      VAProfileH264ConstrainedBaseline: VAEntrypointEncSlice
      VAProfileH264Main               : VAEntrypointVLD
      VAProfileH264Main               : VAEntrypointEncSlice
      VAProfileH264High               : VAEntrypointVLD
      VAProfileH264High               : VAEntrypointEncSlice
      VAProfileHEVCMain               : VAEntrypointVLD
      VAProfileHEVCMain               : VAEntrypointEncSlice
      VAProfileHEVCMain10             : VAEntrypointVLD
      VAProfileHEVCMain10             : VAEntrypointEncSlice
      VAProfileVP9Profile0            : VAEntrypointVLD
      VAProfileVP9Profile2            : VAEntrypointVLD
      VAProfileAV1Profile0            : VAEntrypointVLD
      VAProfileAV1Profile0            : VAEntrypointEncSlice
      VAProfileNone                   : VAEntrypointVideoProc
```
