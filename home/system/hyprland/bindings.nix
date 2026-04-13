{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$shiftMod" = "SUPER_SHIFT";

    # see https://wiki.hypr.land/Configuring/Binds/
    bind = [
      "$mod,RETURN, exec, uwsm app -- ${pkgs.ghostty}/bin/ghostty" # Ghostty (terminal)
      "$mod,E, exec,  uwsm app -- ${pkgs.thunar}/bin/thunar" # Thunar
      "$mod,b, exec,  uwsm app -- ${pkgs.qutebrowser}/bin/qutebrowser" # Browser (Qute)
      "$shiftMod,B, exec,  uwsm app -- ${pkgs.brave}/bin/brave --force-color-profile=HDR10" # Browser (Brave)
      "$mod,P, exec,  uwsm app -- ${pkgs.proton-pass}/bin/proton-pass" # Proton Pass
      "$mod,V, exec,  uwsm app -- ${pkgs.protonvpn-gui}/bin/protonvpn-app" # Proton VPN
      # "$mod,A, exec,  uwsm app -- env WEBKIT_DISABLE_COMPOSITING_MODE=1 ${pkgs.proton-authenticator}/bin/proton-authenticator" # Proton Auth
      "$mod,M, exec,  uwsm app -- ${pkgs.vivaldi}/bin/vivaldi --profile-directory=Default --app-id=jnpecgipniidlgicjocehkhajgdnjekh" # Proton Mail (PWA)
      "$mod,C, exec,  uwsm app -- ${pkgs.vivaldi}/bin/vivaldi --profile-directory=Default --app-id=ojibjkjikcpjonjjngfkegflhmffeemk" # Proton Calendar (PWA)
      "$mod,I, exec,  uwsm app -- ${pkgs.vivaldi}/bin/vivaldi --profile-directory=Default --app-id=lcfjlhjhpmdjimnbkdfjnkojodddgfmd" # Proton Lumo (PWA)

      # Exec with rules https://wiki.hypr.land/Configuring/Dispatchers/#executing-with-rules
      # Tav
      "$shiftMod, T, exec, [workspace special silent; float; size 585 1050;] ${pkgs.brave}/bin/brave --incognito --new-window --force-color-profile=HDR10 http://192.168.4.28:8000/"
      "$shiftMod, M, exec, [workspace 2] ${pkgs.ghostty}/bin/ghostty -e btop"
      "$shiftMod, n, exec, [workspace 2] ${pkgs.ghostty}/bin/ghostty -e sh -lc 'cd ~/pkm && nvim'"
      "$mod,d, exec, ${pkgs.ghostty}/bin/ghostty -e nvim +DBUI"

      # webUI
      # "$mod, A, exec, [float; size 1152 1587; move 84 149] qutebrowser https://webui.jssp.io/"

      # Youtube
      # "$shiftMod, Y, exec, [workspace 1 silent; fullscreen] zen-beta https://youtube.com"

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

    ]
    ++ (builtins.concatLists (
      builtins.genList (
        i:
        let
          ws = i + 1;
        in
        [
          "$mod,code:1${toString i}, workspace, ${toString ws}"
          "$mod SHIFT,code:1${toString i}, movetoworkspace, ${toString ws}"
        ]
      ) 9
    ));

    # meant to repeat when held
    bindr = [
      "$shiftMod, right, resizeactive, 10 0"
      "$shiftMod, left, resizeactive, -10 0"
      "$shiftMod, up, resizeactive, 0 -10"
      "$shiftMod, down, resizeactive, 0 10"
    ];

    bindm = [
      "$mod,mouse:272, movewindow" # Move Window (mouse)
      "$mod,R, resizewindow" # Resize Window (mouse)
    ];
  };
}
