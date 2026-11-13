# Hookshot Builder v2.0.9 (Fixed & Self-Contained Edition)

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)
[![Platform: Windows](https://img.shields.io/badge/Platform-Windows%2010%20%2F%2011%20x64-brightgreen.svg)]()
[![Status: Stable & Offline](https://img.shields.io/badge/Release-v2.0.9--offline-orange.svg)]()

A fixed, clean, and self-contained distribution of **Hookshot v2.0.9** for Windows. This version disables forced auto-update lockouts, resolves source compilation conflicts in the Vulkan/C++ toolchain, and packages all dependencies into a zero-configuration, one-click offline installer.

---

## 📌 About Hookshot

**Hookshot** is a native PC static recompiler for *The Legend of Zelda: Ocarina of Time* (specifically targeting supported Switch 2 / N64 releases). 

Rather than running through traditional emulator translation layers, Hookshot statically recompiles the original AArch64/MIPS machine code into native x86_64 binaries. This yields:
- Ultra-low CPU overhead and high frame rates (unlocked FPS support).
- Modern graphics backends (Vulkan and WebGPU).
- Native PC widescreen, ultrawide, and custom rendering features.
- Clean separation between original ROM assets and the native engine binary.

---

## ❓ Why This Fork / Alternative Release Exists

The upstream and newer releases (v2.1.0) introduced several critical friction points for users:

1. **Forced Upgrade Lockout in v2.0.9:**
   In the standard v2.0.9 builder, the application makes an automated request to GitHub Releases upon startup. If a newer release (such as v2.1.0) is detected, the **"Build the game"** button is forcibly disabled and replaced with **"Update builder"**. This effectively prevented users from using v2.0.9 once v2.1.0 was published.

2. **Regressions & Instability in v2.1.0:**
   The v2.1.0 release introduced breaking changes and experimental features (such as experimental Reflex/DLSS hooks) that caused compilation issues and compatibility regressions on many PC configurations.

3. **Toolchain Compilation Failure (`vk_reflex.cpp` error):**
   Residual or mismatched source files from newer branches caused the compilation script (`build.py`) to fail with:
   ```text
   build.py stopped (exit status 1): ...\gpu\vk\vk_reflex.cpp:62:48: error: no member named 'reflex' in 'mkwvk::Options'
   ```
   This error aborted the build process before the game could be linked or exported.

4. **Complex Manual Prerequisite Setup:**
   The original builder expects the user to manually install Python 3.11+, configure system `PATH` environment variables, manually compile or pip-install packages requiring C extensions (`capstone`, `unicorn`, `lz4`, `zstandard`), and procure LLVM-MinGW toolchains. On machines without developer environments, this caused numerous installation failures.

---

## 🛠️ Modifications & Fixes in This Release

### 1. Disabled Forced Update Check (`Updater.cs` & `MainWindow.xaml.cs`)
* **`builder/HookshotBuilder/Updater.cs`**:
  Modified `LatestTag()` to bypass remote GitHub Release queries and always return `null`.
* **`builder/HookshotBuilder/MainWindow.xaml.cs`**:
  Removed the `Mode.UpdateBuilder` lockout state. The application always stays in `Mode.Build` (or `Mode.UpToDate`), ensuring the user retains full control and the **"Build the game"** button is always functional without being held back by future remote tags.

### 2. Cleaned Toolchain & Resolved C++ / Vulkan Errors
* Removed residual, unversioned files from `tools/gpu/vk/` (including `vk_reflex.cpp`, DLSS, and AntiLag hooks) that did not exist in the v2.0.9 header definitions (`mkwvk::Options`).
* Verified clean compilation of `hookshot_vk.dll` against pure v2.0.9 headers with **0 errors**.

### 3. Fully Self-Contained Offline Installer (`HookshotBuilder-v2.0.9-Complete-Setup.exe`)
Built an automated, standalone Inno Setup installer that includes:
* **Isolated Embedded Python 3.13 Runtime**: Pre-configured with compiled wheels for `capstone`, `unicorn`, `lz4`, and `zstandard`.
* **Complete LLVM-MinGW (Clang 19) Toolchain**: Pre-configured with binary tools and sysroot headers.
* **Pre-bundled CPM & wgpu-native packages**: Ready out of the box without requiring internet access during build time.
* **Desktop & Start Menu Shortcuts**: Full Windows integration with clean uninstallation support.

---

## 🚀 How to Use

1. Download **`HookshotBuilder-v2.0.9-Complete-Setup.exe`** from the [Releases](../../releases) tab.
2. Run the installer and complete the setup wizard (no extra software, Python, or SDKs needed).
3. Launch **Hookshot Builder** from your Desktop or Start Menu.
4. Select your legally obtained base game file (e.g., supported `.nup` file or extracted `romfs`/`exefs` directories).
5. Choose your target destination directory and click **Build the game**.
6. Once the build finishes, click **Play** to start the game!

---

## ⚖️ Legal Disclaimer & Notice

- This repository contains **no copyrighted Nintendo assets, ROMs, game code, or proprietary game files**.
- To build the game, you must provide your own legally dumped copy of the game.
- Hookshot is an independent static recompilation project created for preservation and educational purposes.
- All code modifications adhere to the original project's license (**GNU General Public License v3.0**).
