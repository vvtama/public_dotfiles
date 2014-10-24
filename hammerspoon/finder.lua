-- Cmd + Alt + N → Always open a *new* Finder window
hs.hotkey.bind({"cmd", "alt"}, "n", function()
  -- Step 1: Create the new Finder window
    hs.osascript.applescript([[
      tell application "Finder"
      make new Finder window to (path to downloads folder)
      activate
    end tell
    ]])

  -- Step 2: Wait briefly for Finder to finish creating window
  hs.timer.doAfter(0.05, function()
    local app = hs.appfinder.appFromName("Finder")
    if not app then return end

    local win = app:focusedWindow()
    if not win then return end

    local screen = win:screen():frame()
    local w = 1100
    local h = 900

    -- Horizontal center
    local x = screen.x + (screen.w - w) / 2

    -- Vertical: near the bottom (e.g., 15% from bottom)
    local bottom_offset = 0.15
    local y = screen.y + screen.h * (1 - bottom_offset) - h

    win:setFrame({x = x, y = y, w = w, h = h})
  end)
end)


-- Cmd + Alt + N → Always open an existing Finder window
-- hs.hotkey.bind({"cmd", "shift", "alt"}, "n", function()
hs.hotkey.bind({"cmd", "alt"}, "b", function()
  hs.application.launchOrFocus("Finder")
end)
