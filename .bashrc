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

# Auto-check for config-prometheus updates
check_config_updates() {
    local config_dir="$HOME/.config-prometheus"
    local temp_dir="$config_dir/temp"
    local last_check_file="$temp_dir/.last_update_check"
    
    # Create temp directory if it doesn't exist
    mkdir -p "$temp_dir"
    local current_time=$(date +%s)
    local check_interval=3600  # Check every hour (3600 seconds)
    
    # Only check if we're in an interactive shell
    if [[ $- != *i* ]]; then
        return
    fi
    
    # Check if we should perform the update check (throttling)
    if [[ -f "$last_check_file" ]]; then
        local last_check=$(cat "$last_check_file" 2>/dev/null || echo 0)
        local time_diff=$((current_time - last_check))
        
        if [[ $time_diff -lt $check_interval ]]; then
            return  # Too soon since last check
        fi
    fi
    
    # Perform the check in background to not slow down shell startup
    (
        cd "$config_dir" || return
        
        # Fetch latest changes quietly
        git fetch origin main 2>/dev/null || return
        
        # Check if local is behind remote
        local local_commit=$(git rev-parse HEAD 2>/dev/null)
        local remote_commit=$(git rev-parse origin/main 2>/dev/null)
        
        if [[ "$local_commit" != "$remote_commit" ]]; then
            echo -e "\e[33m🔥 Config-Prometheus update available! 🔥\e[0m"
            echo -e "\e[32mRun 'fetch_fire' to update.\e[0m"
        fi
        
        # Update last check timestamp
        echo "$current_time" > "$last_check_file"
    ) &>/dev/null &
    disown
}

# Run the update check
check_config_updates

neofetch
