# Chrome is the default browser (http, https, HTML files).
# macOS asks to confirm every change, so only switch when it isn't already.
{ lib, pkgs, ... }:
let
  defaultbrowser = lib.getExe pkgs.defaultbrowser;
in
{
  home.activation.defaultBrowser = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if ! ${defaultbrowser} | grep -qx '\* chrome'; then
      run ${defaultbrowser} chrome
    fi
  '';
}
