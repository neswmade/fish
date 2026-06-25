if status is-interactive
    set fish_greeting ""

    # starship
    command -v starship &> /dev/null && starship init fish | source

    # zoxide
    command -v zoxide &> /dev/null && zoxide init fish --cmd cd | source

    # eza
    command -v eza &> /dev/null && alias ls='eza --icons --group-directories-first -1'
    command -v eza &> /dev/null && alias la='eza -a --icons --group-directories-first -1'
    command -v eza &> /dev/null && alias ll='eza -l --icons --group-directories-first -1'
    command -v eza &> /dev/null && alias lla='eza -la --icons --group-directories-first -1'
    command -v eza &> /dev/null && alias lt='eza --tree --icons'

    # git
    abbr gc 'git commit -am'
    abbr ga 'git add .'
    abbr gs 'git status'
    abbr gpl 'git pull'
end
