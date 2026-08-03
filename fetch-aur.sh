#!/bin/bash

set -e

AUR_PKGS=(
    "arrpc"
    "betterdiscordctl"
    "dwarfs-bin"
    "gearlever"
    "antigravity"
    "bb_launcher-bin"
    "equicord-installer-bin"
    "furmark"
    "fx_cast-bin"
    "hydra-launcher-bin"
    "jdk21-graalvm-bin"
    "moonlight-qt-bin"
    "obs-pipewire-audio-capture"
    "obs-plugin-input-overlay"
    "qt5-styleplugins"
    "sentinel"
    "sidra-bin"
    "stremio"
    "typora"
)

for pkg in "${AUR_PKGS[@]}"; do
    echo "Fetching $pkg from AUR..."
    if [ ! -d "$pkg" ]; then
        git clone "https://aur.archlinux.org/${pkg}.git" "$pkg" || {
            echo "Failed to clone $pkg"
            continue
        }
        rm -rf "${pkg}/.git"
    else
        echo "Directory $pkg already exists, skipping."
    fi
done

echo "Fetch process completed."
