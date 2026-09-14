#!/usr/bin/env bash

set -euo pipefail

# Only ask APT to install tools that are actually missing. Besides being
# faster on an already-configured machine, this avoids turning setup into an
# implicit distribution upgrade when the host has additional APT suites.
packages=()
command -v ffmpeg >/dev/null 2>&1 || packages+=(ffmpeg)
command -v yt-dlp >/dev/null 2>&1 || packages+=(yt-dlp)
command -v python3 >/dev/null 2>&1 || packages+=(python3 python3-pip)
command -v cmake >/dev/null 2>&1 || packages+=(cmake)
command -v make >/dev/null 2>&1 || packages+=(build-essential)
command -v c++ >/dev/null 2>&1 || packages+=(build-essential)

if ((${#packages[@]})); then
  if ! command -v apt-get >/dev/null 2>&1; then
    echo "Missing dependencies: ${packages[*]}" >&2
    echo "Install them with your platform's package manager, then rerun setup." >&2
    exit 1
  fi

  echo "Installing missing system dependencies: ${packages[*]}"
  sudo apt-get update
  sudo apt-get install -y "${packages[@]}"
else
  echo "System dependencies are already installed."
fi

if ! python3 -m pip --version >/dev/null 2>&1; then
  echo "Python's pip module is missing; installing python3-pip..."
  sudo apt-get update
  sudo apt-get install -y python3-pip
fi

if python3 -c 'import syncedlyrics' >/dev/null 2>&1; then
  echo "Python dependencies are already installed."
else
  echo "Installing Python dependencies..."
  python3 -m pip install syncedlyrics
fi

echo "Installing Mousiki configuration..."
mkdir -p "$HOME/.config/mousiki"
if [[ ! -e "$HOME/.config/mousiki/config.txt" ]]; then
  cp config.txt "$HOME/.config/mousiki/config.txt"
else
  echo "Keeping existing config at $HOME/.config/mousiki/config.txt"
fi

echo "Building Mousiki..."
cmake -S . -B build
cmake --build build --parallel "$(nproc)"

echo "Setup complete! Run ./build/mousiki"
