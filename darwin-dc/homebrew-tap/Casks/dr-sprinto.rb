cask "dr-sprinto" do
  version "4.0.8"
  sha256 "23a86c512d845417304337e57741d89377f090d705c88c5dcdf427460c11e8be"

  url "https://static.sprinto.com/drsprinto/DrSprinto-#{version}-arm64.dmg"
  name "Dr. Sprinto"
  desc "Sprinto device compliance agent"
  homepage "https://docs.sprinto.com/data-library/staff-devices/dashboard-actions/install-dr.-sprinto-app-and-report-device-health-status"

  # Electron auto-updater replaces the app in place; `brew upgrade` leaves it alone.
  auto_updates true
  depends_on arch: :arm64

  app "DrSprinto.app"
end
