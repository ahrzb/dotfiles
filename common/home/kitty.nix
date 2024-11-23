{
  programs.kitty = {
    themeFile = "Dracula";
    darwinLaunchOptions = [ "--start-as=fullscreen" ];
    settings = {
      "enabled_layouts" = "fat:bias=50;full_size=1;mirrored=false, tall:bias=50;full_size=1;mirrored=false, grid, horizontal, vertical";
    };
    keybindings = {
      "alt+left" = "send_text all \\x1b\\x62";
      "alt+right" = "send_text all \\x1b\\x66";
      "ctrl+l" = "clear_terminal to_cursor_scroll active";

      # Switch layout
      "ctrl+k>l>l" = "next_layout";
      "ctrl+k>l>f" = "toggle_layout fat";
      "ctrl+k>l>t" = "toggle_layout tall";
      "ctrl+k>l>g" = "toggle_layout grid";
      "ctrl+k>l>h" = "toggle_layout horizontal";
      "ctrl+k>l>v" = "toggle_layout vertical";

      # Tall/Fat layout hotkeys
      "ctrl+k>l>[" = "layout_action decrease_num_full_size_windows";
      "ctrl+k>l>]" = "layout_action increase_num_full_size_windows";
      "ctrl+k>l>/" = "layout_action mirror toggle";
      "ctrl+k>l>y" = "layout_action mirror true";
      "ctrl+k>l>n" = "layout_action mirror false";
      "ctrl+k>l>." = "layout_action bias 50 62 70";
      "ctrl+k>k>," = "layout_action bias 62";

      # Split
      "ctrl+k>s>s" = "launch --location=split";
      "ctrl+k>s>h" = "launch --location=hsplit";
      "ctrl+k>s>v" = "launch --location=vsplit";

      # Move
      "ctrl+k>m>k" = "move_window up";
      "ctrl+k>m>h" = "move_window left";
      "ctrl+k>m>l" = "move_window right";
      "ctrl+k>m>j" = "move_window down";

      # Switch
      "alt+k" = "neighboring_window up";
      "alt+h" = "neighboring_window left";
      "alt+l" = "neighboring_window right";
      "alt+j" = "neighboring_window down";

      # Resize
      "ctrl+shift+h" = "resize_window narrower";
      "ctrl+shift+l" = "resize_window wider";
      "ctrl+shift+k" = "resize_window taller";
      "ctrl+shift+j" = "resize_window shorter";
      "ctrl+shift+home" = "resize_window reset";
    };

    font = {
      name = "Iosevka Nerd Font Mono";
      size = 14;
    };
  };
}
