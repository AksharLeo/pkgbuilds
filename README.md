# PKGBUILDS

This repository contains PKGBUILDs for some Arch Linux packages I use, and I will be adding more of my own custom PKGBUILDs over time.

> [!NOTE]
> This repository setup and its automated workflows were generated with the help of AI.

## How it works

The initial `PKGBUILD` files were pulled directly from the [Arch User Repository (AUR)](https://aur.archlinux.org/). However, **this repository no longer depends on the AUR**. 

Instead of waiting for AUR maintainers to update their packages, this repository uses a **GitHub Actions workflow** (powered by `nvchecker`) to automatically monitor the original upstream sources (like GitHub releases or official websites) for new versions. 

When an upstream update is detected, the workflow automatically:
1. Bumps the `pkgver`
2. Resets `pkgrel` to 1
3. Recalculates all checksums via `updpkgsums`
4. Regenerates `.SRCINFO`
5. Opens a Pull Request for review
