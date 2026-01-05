{pkgs, ...}: {
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$shiftMod" = "SUPER_SHIFT";

    bind =
      [
        "$mod,RETURN, exec, uwsm app -- ${pkgs.ghostty}/bin/ghostty" # Ghostty (terminal)
        "$mod,E, exec,  uwsm app -- ${pkgs.xfce.thunar}/bin/thunar" # Thunar
        "$mod,B, exec,  uwsm app -- ${pkgs.vivaldi}/bin/vivaldi" # Browser (Vivaldi)
        "$mod,K, exec,  uwsm app -- ${pkgs.proton-pass}/bin/proton-pass" # Proton Pass
        "$mod,V, exec,  uwsm app -- ${pkgs.protonvpn-gui}/bin/protonvpn-app" # Proton VPN
        "$mod,A, exec,  uwsm app -- env WEBKIT_DISABLE_COMPOSITING_MODE=1 ${pkgs.proton-authenticator}/bin/proton-authenticator" # Proton Auth
        "$mod,M, exec,  uwsm app -- ${pkgs.vivaldi}/bin/vivaldi --profile-directory=Default --app-id=jnpecgipniidlgicjocehkhajgdnjekh" # Proton Mail (PWA)
        "$mod,C, exec,  uwsm app -- ${pkgs.vivaldi}/bin/vivaldi --profile-directory=Default --app-id=ojibjkjikcpjonjjngfkegflhmffeemk" # Proton Calendar (PWA)
        "$mod,I, exec,  uwsm app -- ${pkgs.vivaldi}/bin/vivaldi --profile-directory=Default --app-id=lcfjlhjhpmdjimnbkdfjnkojodddgfmd" # Proton Lumo (PWA)

        "$mod,Q, killactive," # Close window
        "$mod,T, togglefloating," # Toggle Floating
        "$mod,F, fullscreen" # Toggle Fullscreen
        "$mod,left, movefocus, l" # Move focus left
        "$mod,right, movefocus, r" # Move focus Right
        "$mod,up, movefocus, u" # Move focus Up
        "$mod,down, movefocus, d" # Move focus Down
        "$shiftMod,up, focusmonitor, -1" # Focus previous monitor
        "$shiftMod,down, focusmonitor, 1" # Focus next monitor
        "$shiftMod,left, layoutmsg, addmaster" # Add to master
        "$shiftMod,right, layoutmsg, removemaster" # Remove from master

          # media controls
          "$mod,I, exec, ${pkgs.playerctl}/bin/playerctl previous" # play previous
          "$mod,O, exec, ${pkgs.playerctl}/bin/playerctl play-pause" # toggle play/pause
          "$mod,P, exec, ${pkgs.playerctl}/bin/playerctl next" # play next

          # Exec with rules https://wiki.hypr.land/Configuring/Dispatchers/#executing-with-rules
          # Tav
          "$shiftMod, T, exec, [workspace special silent; float; size 585 1050; move 400 437] zen-beta --private-window http://192.168.4.28:8000/"
          "$shiftMod, M, exec, [workspace special silent; float; size 1200 1550;] ${pkgs.ghostty}/bin/ghostty -e btop"
          # "$shiftMod, n, exec, [workspace 2 silent;] ${pkgs.ghostty}/bin/ghostty -e zsh -lc 'source ~/.zshrc && cd ~/norgotes/ && nvim --cmd 'call feedkeys(',jj,im')''"
          "$shiftMod, n, exec, [workspace 2] ${pkgs.ghostty}/bin/ghostty -e sh -lc 'cd ~/norgotes && nvim --cmd \"call feedkeys(\\\",jj,im\\\")\"'"

          # webUI
          # "$mod, A, exec, [float; size 1152 1587; move 84 149] qutebrowser https://webui.jssp.io/"

          # Youtube
          "$shiftMod, Y, exec, [workspace 1 silent; fullscreen] zen-beta https://youtube.com"

          # screen on and off
          # src: https://wiki.hypr.land/Configuring/Dispatchers/
          "$shiftMod, O, exec, sleep 1 && hyprctl dispatch dpms toggle"

          "$mod,Q, killactive," # Close window
          "$mod,T, togglefloating," # Toggle Floating
          "$mod,F, fullscreen" # Toggle Fullscreen
          "$mod,h, movefocus, l" # Move focus left
          "$mod,l, movefocus, r" # Move focus Right
          "$mod,k, movefocus, u" # Move focus Up
          "$mod,j, movefocus, d" # Move focus Down

          "$shiftMod,k, movewindow, u" # move window up
          "$shiftMod,j, movewindow, d" # move window down
          "$shiftMod,h, movewindow, l" # move window left
          "$shiftMod,l, movewindow, r" # move window right

          "$shiftMod,s, movetoworkspace, special" # move to a specialworkspace
          "$mod,s, togglespecialworkspace" # go to the special workspace

          # "$shiftMod,Left, focusmonitor, -1" # Focus previous monitor
          # "$shiftMod,Right, focusmonitor, 1" # Focus next monitor
          # "$shiftMod,h, layoutmsg, addmaster" # Add to master
          # "$shiftMod,l, layoutmsg, removemaster" # Remove from master

          "$mod,PRINT, exec, screenshot region" # Screenshot region
          ",PRINT, exec, screenshot monitor" # Screenshot monitor
          "$shiftMod,PRINT, exec, screenshot window" # Screenshot window
          "ALT,PRINT, exec, screenshot region swappy" # Screenshot region then edit
      ]
      ++ (builtins.concatLists (builtins.genList (i: let
          ws = i + 1;
        in [
          "$mod,code:1${toString i}, workspace, ${toString ws}"
          "$mod SHIFT,code:1${toString i}, movetoworkspace, ${toString ws}"
        ])
        9));

    bindm = [
      "$mod,mouse:272, movewindow" # Move Window (mouse)
      "$mod,R, resizewindow" # Resize Window (mouse)
    ];
  };
}
