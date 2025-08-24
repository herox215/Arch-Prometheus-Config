#!/usr/bin/env bash
echo -e "\e[33mLets enlight the flame!"

echo -e "Collecting logs..."
echo -e "\e[32m"

# Change to the config-prometheus directory first
cd "$HOME/.config-prometheus" || {
    echo -e "\e[31mError: Could not change to config-prometheus directory!\e[0m"
    exit 1
}

git pull
echo -e "\e[33m"
echo "Got em."

set -e

# Create the .bashrc-prometheus in home directory
echo "Creating .bashrc-prometheus in home directory..."
cp "$HOME/.config-prometheus/.bashrc" "$HOME/.bashrc-prometheus"

# Check if .bashrc exists and add source line if not already present
if [ -f "$HOME/.bashrc" ]; then
    echo "Checking existing .bashrc..."
    if ! grep -q "source ~/.bashrc-prometheus" "$HOME/.bashrc"; then
        echo "Adding source line to existing .bashrc..."
        echo "" >> "$HOME/.bashrc"
        echo "# Source Prometheus config" >> "$HOME/.bashrc"
        echo "source ~/.bashrc-prometheus" >> "$HOME/.bashrc"
        echo "✅ Added Prometheus config to existing .bashrc"
    else
        echo "✅ Prometheus config already sourced in .bashrc"
    fi
else
    echo "No .bashrc found, creating new one with Prometheus config..."
    echo "# Source Prometheus config" > "$HOME/.bashrc"
    echo "source ~/.bashrc-prometheus" >> "$HOME/.bashrc"
    echo "✅ Created new .bashrc with Prometheus config"
fi

# Update Hyprland configuration
echo "Updating Hyprland configuration..."
if [ -f "$HOME/.config-prometheus/hyprland/scripts/update_hypr.sh" ]; then
    bash "$HOME/.config-prometheus/hyprland/scripts/update_hypr.sh"
else
    echo "Warning: update_hypr.sh not found"
fi

# Source the updated config
echo "Sourcing updated configuration..."
source ~/.bashrc

echo "The fire has been renewed."
echo -e "\e[0m"
