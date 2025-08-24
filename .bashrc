#
# ~/.bashrc
#

# Base16-Shell
BASE16_SHELL="$HOME/.config/base16-shell"
[ -s "$BASE16_SHELL/profile_helper.sh" ] && source "$BASE16_SHELL/profile_helper.sh"


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias edit='micro'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias neofetch='neofetch --source ~/.config/neofetch/ascii/uwu.txt'
alias fetch_fire='~/.config-prometheus/updater.sh'
neofetch
