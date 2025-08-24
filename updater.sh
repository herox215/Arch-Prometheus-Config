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

# First: Lets force link the bash file
rm -f ~/.bashrc
ln -s "$HOME/.config-prometheus/.bashrc" "$HOME/.bashrc"
source ~/.bashrc


echo "The fire has been renewed."

echo -e "\e[0m"
