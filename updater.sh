#!/usr/bin/env bash
echo "Lets enlight the flame!"

echo "Collecting logs..."
git pull
echo "Got em."

set -e

# First: Lets force link the bash file
rm -f ~/.bashrc
ln -s "$HOME/.config-prometheus/.bashrc" "$HOME/.bashrc"
source ~/.bashrc


echo "The fire has been renewed."
