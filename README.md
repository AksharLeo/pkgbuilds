# PKGBUILDS

This repository contains PKGBUILDs for some Arch Linux packages I use, and I will be adding more of my own custom PKGBUILDs over time.

> [!NOTE]
> This repository setup and its automated workflows were generated with the help of AI.

## How it works

The initial `PKGBUILD` files were pulled directly from the [Arch User Repository (AUR)](https://aur.archlinux.org/). However, **this repository no longer depends on the AUR for downloads**. 

Instead of waiting for AUR maintainers to update their packages, this repository uses a **GitHub Actions workflow** (powered by `nvchecker`) to automatically monitor the original upstream sources (like GitHub releases or official websites) for new versions. 

*(Note: A small handful of closed-source applications like `typora`, `furmark`, and `antigravity` do still use the AUR as a "version oracle" to detect when a new update is released, since they don't have standard GitHub releases. However, the actual app downloads still come directly from the official developers' servers!)* 

When an upstream update is detected, the workflow automatically:
1. Bumps the `pkgver`
2. Resets `pkgrel` to 1
3. Recalculates all checksums via `updpkgsums`
4. Regenerates `.SRCINFO`
5. Opens a Pull Request for review

## Installation via Paru

You can configure `paru` (the AUR helper) to pull packages directly from this repository! Paru will automatically download the `PKGBUILD`s, compile them, and manage them just like native AUR packages.

To set this up, add the following block to your `paru` configuration file (usually located at `/etc/paru.conf` or `~/.config/paru/paru.conf`):

```ini
[archleo-repo]
Url = https://github.com/AksharLeo/pkgbuilds
```

After saving the configuration file, synchronize the databases:
```bash
paru -Sy
```

You can now seamlessly install any package from this repository! For example:
```bash
paru -S archleo-repo/omen-fan-git
```
