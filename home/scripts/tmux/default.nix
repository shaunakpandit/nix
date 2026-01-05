# - ## Tmux scripts
#-
#- Simple scripts to create and attach to tmux sessions. Then zap between them
#-
#- - `zap` - Enable hyprfocus.
#- - `tgen` - Disable hyprfocus.
#- - `hyprfocus-toggle` - Toggle hyprfocus.
{pkgs, ...}: let
   tgen =
    pkgs.writeShellScriptBin "tgen"
    # bash
    ''
        # Set Session Name
        SESSION="work"
        SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

        # Only create tmux session if it doesn't already exist
        if [ "$SESSIONEXISTS" = "" ]; then
                # Start New Session with our name
                tmux new-session -d -s $SESSION

                # Name first Pane and start zsh
                tmux rename-window -t 0 'code'
                tmux send-keys -t 'code' C-m 

                
                tmux new-window -t $SESSION:1 -n 'runtime'
                tmux send-keys -t 'runtime' 'cd dev/' C-m
        fi

        # Set Session Name
        SESSION2="gen"
        SESSIONEXISTS2=$(tmux list-sessions | grep $SESSION2)

        # Only create tmux session if it doesn't already exist
        if [ "$SESSIONEXISTS2" = "" ]; then
                # Start New Session with our name
                tmux new-session -d -s $SESSION2

                tmux rename-window -t 0 'dotfiles'
                tmux send-keys -t 'nebulaOS' 'cd ~/.config/nixos/' C-m # Switch to bind script?

                tmux new-window -t $SESSION2:1 -n 'notes'
                tmux send-keys -t 'notes' 'norg' C-m # Switch to bind script?

                tmux new-window -t $SESSION2:2 -n 'term'
        fi

        # Attach Session, on the Main window
        tmux attach-session -t $SESSION:0
    '';

   zap =
    pkgs.writeShellScriptBin "zap"
    # bash
    ''
        tmux list-windows -a -F '#{session_name}:#{window_index}:#{window_name}' |
                fzf --prompt='Zap to window: ' \
                        --reverse \
                        --color=fg:-1,bg:-1 |
                cut -d':' -f1,2 |
                while IFS=':' read -r session window; do
                        tmux switch-client -t "$session"
                        tmux select-window -t "$session:$window"
                done
    '';

in {home.packages = [zap tgen];}
