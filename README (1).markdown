# OpenWrt Neofetch

A lightweight Neofetch-like shell script packaged for OpenWrt, displaying system information with an OpenWrt ASCII art logo. It shows details like hostname, OS, kernel, uptime, CPU, memory, storage, and shell.

## Features

- Colorful OpenWrt ASCII art logo.
- System information display: hostname, OS, kernel, uptime, CPU, memory, storage, shell.
- Architecture-independent package.
- Depends on `busybox` for core utilities.

## Package Details

- **Name**: openwrt-neofetch
- **Version**: 1.0
- **Release**: 1
- **Category**: Utilities
- **Section**: utils
- **Architecture**: All
- **Dependencies**: busybox
- **Maintainer**: Amal Ganesh <amalnanduwork@gmail.com>
- **License**: GPL-2.0-only
- **Repository**: https://github.com/amalnandu/openwrt-neofetch

## Prerequisites

- **OpenWrt SDK**: Configured for your target architecture (e.g., x86_64).
- **Development Environment**: Linux system with `make`, `git`, and `scp`.
- **OpenWrt Device**: For installing and testing the package.

## Directory Structure

```
openwrt-sdk-x86-64_gcc-14.3.0_musl.Linux-x86_64/
├── package/
│   ├── my-packages/
│   │   ├── openwrt-neofetch/
│   │   │   ├── Makefile
│   │   │   └── src/
│   │   │       └── neo
└── feeds.conf
```

- `my-packages/`: Custom feed directory.
- `openwrt-neofetch/`: Package directory.
- `Makefile`: Defines package build and installation.
- `src/neo`: Shell script with Neofetch-like functionality.

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/amalnandu/openwrt-neofetch
cd openwrt-neofetch
```

### 2. Set Up the OpenWrt SDK

1. Download and extract the SDK (e.g., `openwrt-sdk-x86-64_gcc-14.3.0_musl.Linux-x86_64`).
2. Update feeds:
   ```bash
   ./scripts/feeds update -a
   ```

### 3. Integrate the Package

1. Copy the package to the SDK:
   ```bash
   mkdir -p package/my-packages
   cp -r openwrt-neofetch package/my-packages/
   ```
2. Update `feeds.conf`:
   ```bash
   echo "src-link mypackages $(pwd)/package/my-packages" >> feeds.conf
   ```
3. Update and install feeds:
   ```bash
   ./scripts/feeds update -a
   ./scripts/feeds install -a -p mypackages
   ```

### 4. Build the Package

1. Configure:
   ```bash
   make menuconfig
   ```
   - Select `Utilities` -> `openwrt-neofetch` (mark with `*`).
   - Save and exit.
2. Build:
   ```bash
   make package/openwrt-neofetch/{clean,compile} V=s
   ```
   - The `.ipk` file will be in `bin/packages/x86_64/mypackages/`.

### 5. Install the Package

1. Transfer to your OpenWrt device:
   ```bash
   scp bin/packages/x86_64/mypackages/openwrt-neofetch_1.0-1_all.ipk root@<device-ip>:/tmp/
   ```
2. Install:
   ```bash
   ssh root@<device-ip>
   opkg install /tmp/openwrt-neofetch_1.0-1_all.ipk
   ```

### 6. Run the Script

```bash
neo
```

## Example Output

```
       _____
      /     \
     /_______\
     |  ***  | 
     |  ***  | 
     |_______|

Host: openwrt-router
OS: OpenWrt 23.05.0
Kernel: 5.15.134
Uptime: 2:34:12
CPU: ARMv7 Processor rev 5 (v7l)
Memory: 120.5 MB / 512.0 MB
Storage: 1.2G / 4.0G
Shell: /bin/ash
```

## Troubleshooting

- **Package not in menuconfig**: Check `feeds.conf` path and run `./scripts/feeds update -a` and `./scripts/feeds install -a -p mypackages`.
- **Build errors**: Verify `Makefile` syntax and ensure `neo` is executable (`chmod +x src/neo`).
- **Script errors**: Confirm `busybox` is installed and system files (`/proc/cpuinfo`, `/etc/os-release`) exist.

## Customization

- Edit ASCII art in `src/neo` (`cat << 'EOF'` section).
- Add more system details (e.g., network interfaces).
- Update the repository URL in `Makefile` and this README.

## License

GPL-2.0-only

## Maintainer

- **Name**: Amal Ganesh
- **Email**: [amalnanduwork@gmail.com](mailto:amalnanduwork@gmail.com)

For issues or contributions, open an issue or pull request on GitHub.