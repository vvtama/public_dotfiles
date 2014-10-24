-- Description: Hotkey to launch or focus the Signal messnaging app
hs.hotkey.bind({"cmd", "shift"}, "s", function()
  local app = hs.application.get("signal")
  if app then
    if not app:mainWindow() then
      -- If Signal is running but has no visible window, open a new one
      app:selectMenuItem({"signal", "New OS Window"})
    elseif app:isFrontmost() then
      -- If Signal is frontmost, hide it
      app:hide()
    else
      -- If Signal is running but not frontmost, activate it
      app:activate()
    end
  else
    -- If Signal is not running, launch it
    hs.application.launchOrFocus("signal")
  end
end)
