{ lib, pkgs, ... }: {
  programs.tmux = {
    enable = true;
    # use the stock tmux from nixpkgs
    package = pkgs.tmux;

    # plugins that live in nixpkgs
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      cpu
      tmux-fzf
      catppuccin
      tmux-sessionx
      sensible
      online-status
    ];

    extraConfig = ''
        ## **************************************** ##
        # Techbase colors from  https://github.com/akmalsoliev/techbase-tmux-theme/blob/ca95f196252d31fe3d25d44ea7f1aed688264e39/techbase.tmux
        # 42 lines 
        ## **************************************** ##
        # techbase-tmux-theme plugin
        # Color palette (from https://github.com/mcauley-penney/techbase.nvim theme)
        set -g @color_fg "#CCD5E5"
        set -g @color_bg "#191d23"
        set -g @color_bg_alt "#20252E"
        set -g @color_comment "#474B65"
        set -g @color_accent "#6A8BE3"
        set -g @color_number "#B85B53"
        set -g @color_operator "#b09884"

        # Use True Color if possible
        set-option -ga terminal-overrides ",xterm-256color:Tc"

        # Status bar
        set-option -g status-style "fg=#{@color_fg},bg=#{@color_bg}"

        # Active window title
        set-window-option -g window-status-current-style "fg=#{@color_accent},bg=#{@color_bg_alt},bold"
        set-window-option -g window-status-current-format " #I:#W#F "

        # Inactive window title
        set-window-option -g window-status-style "fg=#{@color_comment},bg=#{@color_bg}"
        set-window-option -g window-status-format " #I:#W#F "

        # Pane border
        set-option -g pane-border-style "fg=#{@color_operator},bg=#{@color_bg}"
        set-option -g pane-active-border-style "fg=#{@color_accent},bg=#{@color_bg}"

        # Message styling (for copy mode, prompts, etc)
        set-option -g message-style "fg=#{@color_fg},bg=#{@color_bg_alt}"
        set-option -g message-command-style "fg=#{@color_accent},bg=#{@color_bg_alt}"

        # Mode-style (copy mode indicator)
        set-option -g mode-style "fg=#{@color_bg},bg=#{@color_accent},bold"

        # Clock mode colors
        set-window-option -g clock-mode-colour "#B85B53"
        set-window-option -g clock-mode-style 24

        # Bell color
        set-option -g bell-action any
        set-option -g window-status-bell-style "fg=#F71735,bg=#{@color_bg_alt}"

        ## **************************************** ##
        # Techbase colors OLD
        # 40 lines
        ## **************************************** ##
        # === Base Colors ===
        # set -ogq @thm_bg "#191d23"
        # set -ogq @thm_fg "#CCD5E5"
        # set -ogq @thm_cursor "#5DCD9A"
        # set -ogq @thm_cursor_text "#191d23"

        # === Overlay/Surface Colors ===
        # set -ogq @thm_overlay_0 "#1B1F25"      # panel_bg / inactive tab bg
        # set -ogq @thm_overlay_1 "#1C2127"      # float_bg
        # set -ogq @thm_overlay_2 "#20252E"      # normal_bg_alt
        # set -ogq @thm_overlay_3 "#242932"      # normal_bg_accent
        # set -ogq @thm_overlay_4 "#2A2F39"      # float_bg_border
        # set -ogq @thm_overlay_5 "#1F242D"      # selection bg / float select bg

        # === Subtext / UI Muted Colors ===
        # set -ogq @thm_subtext_0 "#363848"      # nontext_fg
        # set -ogq @thm_subtext_1 "#474B65"      # comment_fg / black +8
        # set -ogq @thm_subtext_2 "#7E8193"      # quote_fg

        # === Semantic Colors ===
        # set -ogq @thm_green "#74BAA8"          # string
        # set -ogq @thm_green_bright "#0EC256"   # raw_string
        # set -ogq @thm_teal "#5DCD9A"           # cursor (also cyan+8)
        # set -ogq @thm_magenta "#BCB6EC"        # constant
        # set -ogq @thm_magenta_bright "#D6DDEA" # white+8 (float_fg)
        # set -ogq @thm_blue "#A9B9EF"           # keyword
        # set -ogq @thm_blue_bright "#6A8BE3"    # important
        # set -ogq @thm_yellow "#E9B872"         # search
        # set -ogq @thm_yellow_bright "#FFA630"  # warn / yellow+8
        # set -ogq @thm_orange "#b09884"         # operator
        # set -ogq @thm_red "#F71735"            # error
        # set -ogq @thm_red_bright "#FFC0C5"     # red+8 / git delete fg
        # set -ogq @thm_number "#B85B53"         # number
        # set -ogq @thm_info "#1A8C9B"           # info / cyan

        # === Visual Selection ===
        # set -ogq @thm_visual_bg "#121E42"      # v_select
        # set -ogq @thm_visual_nontext "#4833A4" # v_select_nontext

        ## **************************************** ##
        # General Settings
        ## **************************************** ##

        # Passthrough for image.nvim
        set -gq allow-passthrough on
        set -g visual-activity off

        # Enable mouse control (clickable windows, panes, resizable panes)
        set -g mouse on
         
        # ricing from: https://github.com/catppuccin/tmux/discussions/317?sort=top#discussioncomment-11064512
        # START
        set -g status-position top
        set -g status-style "bg=default"
        set -g status-justify "absolute-centre"

        # pane border look and feel
        setw -g pane-border-status off

        # window look and feel
        set -wg automatic-rename on
        set -g automatic-rename-format "Window"

        # Add these for popup style (adjust colors if needed)
        set -g popup-style "bg=#{@thm_bg}"

        # END

        ##############################################################################
        # Ricing
        ##############################################################################
        set -g default-terminal "tmux-256color"

        set -g window-status-format "#I#{?#{!=:#{window_name},Window},: #W,}"
        set -g window-status-style "fg=#{@thm_blue_bright}, bg=default"
        set -g window-status-last-style "fg=#{@thm_blue_bright}, bg=default"

        set -g window-status-current-format "#I#{?#{!=:#{window_name},Window},: #W,}"
        set -g window-status-current-style "bg=#{@thm_cursor},fg=#{@thm_bg}"
        set -g window-status-separator "  "
        # status left look and feel
        set -g status-left-length 100
        set -g status-left ""
        set -ga status-left "#{?client_prefix,#[fg=#{@thm_green} bold]PREFIX ,#{?#{==:#{pane_mode},copy-mode},#[fg=#{@thm_yellow} bold]COPY ,#[fg=#{@thm_blue_bright} bold]NORMAL }}"
        set -ga status-left "#{?client_prefix,#{#[fg=#{@thm_green},bold]  #S },#{#[fg=#{@thm_blue}]  #S }}"
        set -ga status-left "#[fg=#{@thm_overlay_0},none]│"
        set -ga status-left "#[fg=#{@thm_blue}]  #{pane_current_command} "
        set -ga status-left "#[fg=#{@thm_overlay_0},none]│"
        set -ga status-left "#[fg=#{@thm_blue}]  #{=/-32/...:#{s|$USER|~|:#{b:pane_current_path}}} "
        set -ga status-left "#[fg=#{@thm_overlay_0},none]#{?window_zoomed_flag,│,}"
        set -ga status-left "#[fg=#{@thm_yellow}]#{?window_zoomed_flag,  zoom ,}"

        # status right look and feel
        set -g status-right-length 100
        set -g status-right ""
        set -g status-right '#[fg=#{@thm_blue}]CPU #{cpu_percentage} '
        set -ga status-right "#[fg=#{@thm_overlay_0}, none]│"
        set -ag status-right '#[fg=#{@thm_blue}] MEM #{ram_percentage} '
        set -ga status-right "#[fg=#{@thm_overlay_0}, none]│"
        set -ga status-right "#[fg=#{@thm_blue}] 󰭦 %Y-%m-%d 󰅐 %H:%M "



      ##############################################################################
      # KEYBINDINGS & REMAPS
      ##############################################################################
      # Prefix → C-a
      unbind C-b
      set-option -g prefix C-a
      bind-key C-a send-prefix

      # Pane splitting
      bind | split-window -h
      bind - split-window -v
      unbind '"'
      unbind %

              # Reload config
              bind r source-file ~/.config/tmux/tmux.conf

              # Vim navigation
              bind -n C-Left  select-pane -L
              bind -n C-Right select-pane -R
              bind -n C-Up    select-pane -U
              bind -n C-Down  select-pane -D

              # Move windows
              bind-key -n C-S-h swap-window -t -1\; select-window -t -1
              bind-key -n C-S-l swap-window -t +1\; select-window -t +1

              # Rename window
              bind-key j command-prompt -I "#W" "rename-window '%%'"

              # tmux-zap defaults
              unbind d
              bind-key h run-shell "tmux popup -E -w 50% -h 40% zap"
              # unbind d
              # set -g @zap_key    d
              # set -g @zap_width  '50%'
              # set -g @zap_height '40%'

              # tmux-sessionx default bind
              set -g @sessionx-bind o
    '';
  };
}
