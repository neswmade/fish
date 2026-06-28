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

    # pacman
    abbr up 'sudo pacman -Syu'
    abbr pi 'sudo pacman -S'
    abbr pr 'sudo pacman -Rns'
    abbr ps 'pacman -Ss'
    abbr pl 'pacman -Qs'

    # aur
    abbr yup 'paru -Syu'
    abbr yi 'paru -S'
    abbr yr 'paru -Rns'
    abbr ys 'paru -Ss'
    abbr pl 'paru -Qs'

    # fzf
    set -gx FZF_DEFAULT_OPTS "
      --layout=reverse
      --info=inline-right
      --prompt='  '
      --pointer=' '
      --marker=' '
      --color=hl:#009fff
      --color=hl+:#009fff
      --color=fg+:#fafafa,bg+:bright-black
      --color=border:bright-black
      --color=label:#bcbcbc
      --color=prompt:#009fff
      --color=pointer:#009fff
      --color=marker:#0dbe4e
      --color=spinner:#009fff
      --color=header:#08c0ef
      --color=info:bright-black
      --color=preview-border:#009fff
      --color=preview-label:#bcbcbc
    "

    # fzf file search
    function gf
        git ls-files | fzf \
            --style full \
            --border --padding 1,2 \
            --border-label '  Files  ' \
            --input-label '  Search  ' \
            --header-label '  Type  ' \
            --preview 'bat --style=numbers {} 2>/dev/null || cat {}' \
            --bind 'result:transform-list-label:
                if test -z "$FZF_QUERY"
                    echo "  $FZF_MATCH_COUNT items "
                else
                    echo "  $FZF_MATCH_COUNT matches for [$FZF_QUERY] "
                end' \
            --bind 'focus:transform-preview-label:test -n {} && printf "  Previewing [%s]  " {}' \
            --bind 'focus:+transform-header:file --brief {} 2>/dev/null || echo "No file selected"' \
            --bind 'ctrl-r:change-list-label(  Reloading...  )+reload(sleep 1; git ls-files)' \
            --color 'border:#bcbcbc,label:#bcbcbc' \
            --color 'list-border:#0dbe4e,list-label:#0dbe4e' \
            --color 'preview-border:#009fff,preview-label:#009fff' \
            --color 'input-border:#ff2e3f,input-label:#ff2e3f' \
            --color 'header-border:#08c0ef,header-label:#08c0ef'
    end
end
