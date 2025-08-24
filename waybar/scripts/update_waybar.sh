#!/usr/bin/env bash

# update_waybar.sh - Updates Waybar configuration with symbolic links
# This script moves existing non-link files to temp and creates symlinks to project files

set -e

echo -e "\e[33m🔄 Updating Waybar configuration...\e[0m"

# Get the absolute path to the project directory
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WAYBAR_CONFIG_DIR="$HOME/.config/waybar"

echo "Project directory: $PROJECT_DIR"
echo "Waybar config directory: $WAYBAR_CONFIG_DIR"

# Create waybar config directory if it doesn't exist
if [ ! -d "$WAYBAR_CONFIG_DIR" ]; then
    echo "Creating Waybar config directory..."
    mkdir -p "$WAYBAR_CONFIG_DIR"
fi

echo "Cleaning existing configuration..."

# Remove all existing files and directories in .config/waybar
if [ -d "$WAYBAR_CONFIG_DIR" ]; then
    for item in "$WAYBAR_CONFIG_DIR"/*; do
        if [ -e "$item" ]; then
            echo "Removing: $(basename "$item")"
            rm -rf "$item"
        fi
    done
fi

echo "Creating symbolic links to project files..."

# Function to create symlinks recursively
create_symlinks() {
    local source_dir="$1"
    local target_dir="$2"
    
    for item in "$source_dir"/*; do
        if [ -e "$item" ]; then
            local basename_item=$(basename "$item")
            local target_path="$target_dir/$basename_item"
            
            if [ -d "$item" ]; then
                # Create directory and recurse
                mkdir -p "$target_path"
                create_symlinks "$item" "$target_path"
            else
                # Create symlink for file
                echo "Creating symlink: $basename_item"
                ln -sf "$item" "$target_path"
            fi
        fi
    done
}

# Create symlinks for all files in the waybar project directory
create_symlinks "$PROJECT_DIR" "$WAYBAR_CONFIG_DIR"

echo -e "\e[32m✅ Waybar configuration updated successfully!\e[0m"
echo "All project files are now linked to $WAYBAR_CONFIG_DIR"

# Optional: Show what was linked
echo -e "\e[33m📋 Current symlinks in $WAYBAR_CONFIG_DIR:\e[0m"
if [ -d "$WAYBAR_CONFIG_DIR" ]; then
    for item in "$WAYBAR_CONFIG_DIR"/*; do
        if [ -e "$item" ] && [ "$(basename "$item")" != "temp" ]; then
            if [ -L "$item" ]; then
                echo "🔗 $(basename "$item") -> $(readlink "$item")"
            fi
        fi
    done
fi 