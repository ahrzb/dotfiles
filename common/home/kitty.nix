{
  programs.kitty = {
    theme = "Dracula";
    darwinLaunchOptions = [ "--start-as=fullscreen" ];
    keybindings = {
      "alt+left" = "send_text all \\x1b\\x62";
      "alt+right" = "send_text all \\x1b\\x66";
      "f5" = "launch --location=hsplit";
      "f6" = "launch --location=vsplit";
      "f4" = "launch --location=split";
      "f7" = "layout_action rotate";
      "shift+up" = "move_window up";
      "shift+left" = "move_window left";
      "shift+right" = "move_window right";
      "shift+down" = "move_window down";
      "ctrl+shift+up" = "layout_action move_to_screen_edge up";
      "ctrl+shift+left" = "layout_action move_to_screen_edge left";
      "ctrl+shift+right" = "layout_action move_to_screen_edge right";
      "ctrl+shift+down" = "layout_action move_to_screen_edge down";
      "ctrl+up" = "neighboring_window up";
      "ctrl+left" = "neighboring_window left";
      "ctrl+right" = "neighboring_window right";
      "ctrl+down" = "neighboring_window down";
    };
    font = {
      name = "Iosevka Nerd Font Mono";
      size = 14;
    };
  };
}
