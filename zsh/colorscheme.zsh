DEFAULT_THEME=rose-pine

[[ -f /tmp/theme ]] || echo $DEFAULT_THEME > /tmp/theme

colorscheme() {
    THEME=${1-$DEFAULT_THEME}
    echo $THEME > /tmp/theme

    perl -i -pe 's/(?<=^  - ~\/.config\/alacritty\/themes\/).*(?=.yml)/'$THEME/ $DOTS/alacritty/alacritty.yml
    perl -i -pe 's/(?<=^source-file \$HOME\/\.config\/tmux\/themes\/).*(?=\.conf)/'$THEME/ $DOTS/tmux/tmux.conf

    if [[ "$TMUX" = "" ]]; then; return; fi

    tmux ls -F '#{session_name}' | while read session; do
        tmux list-windows -t $session -F '#{session_name}:#{window_index}' | while read window; do
            tmux list-panes -t $window -F '#{session_name}:#{window_index}.#{pane_index}' | while read pane; do
                is_vim="ps -o state= -o comm= -t '#{pane_tty}' | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?\$'"
                tmux if-shell -t $pane $is_vim "send-keys -t $pane Escape \":lua colorscheme('$THEME')\" Enter"
            done
        done
    done

    tmux source-file $DOTS/tmux/tmux.conf
}
