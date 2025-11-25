-- Description: Hotkey to launch or focus the Kitty terminal emulator
hs.hotkey.bind({"cmd"}, ".", function()
  local app = hs.application.get("kitty")
  if app then
    if not app:mainWindow() then
      -- If Kitty is running but has no visible window, open a new one
      app:selectMenuItem({"kitty", "New OS Window"})
    elseif app:isFrontmost() then
      -- If Kitty is frontmost, hide it
      app:hide()
    else
      -- If Kitty is running but not frontmost, activate it
      app:activate()
    end
  else
    -- If Kitty is not running, launch it
    hs.application.launchOrFocus("kitty")
  end
end)
