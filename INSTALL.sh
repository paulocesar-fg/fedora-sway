#!/usr/bin/env bash

set -e

echo "===================================="
echo "  Installing Sway Rice Setup"
echo "===================================="

# Update system packages
sudo dnf update -y

echo "== Installing base packages =="

# Install core system packages and apps
sudo dnf install -y \
  sway \
  waybar \
  wofi \
  rofi-wayland \
  kitty \
  starship \
  zsh \
  firefox \
  neovim \
  brightnessctl \
  grim \
  slurp \
  wl-clipboard \
  libnotify \
  pipewire \
  wireplumber \
  pipewire-pulseaudio \
  pulseaudio-utils \
  pavucontrol \
  playerctl \
  NetworkManager \
  network-manager-applet \
  bluez \
  blueman \
  lm_sensors \
  power-profiles-daemon \
  upower \
  google-noto-fonts \
  google-noto-emoji-fonts

echo "== Enabling system services =="

# Enable required system services
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth
sudo systemctl enable --now power-profiles-daemon

echo "== Setting default shell (Zsh) =="

# Set Zsh as the default user shell
ZSH_PATH="$(which zsh)"

if [ -n "$ZSH_PATH" ]; then
  echo "Setting Zsh as default shell..."
  chsh -s "$ZSH_PATH" || true
else
  echo "Zsh not found!"
fi


echo "== Creating default directories =="

# Create standard user folders
mkdir -p ~/Pictures/Screenshots

echo "== Coping configuration files =="
cp -r ./config/ ~/.config/
cp ./.zshrc ~/.zshrc

EOF

echo "== Finalizing... =="
echo "
echo "✔ Installation complete!"
echo "✔ Please log out and log in again to apply Zsh"
echo "✔ Start Sway session again"
echo ""
