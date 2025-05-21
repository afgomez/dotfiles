hs.window.animationDuration = 0.15

window_prefix = {"cmd", "alt", "ctrl"}

-- Occupy half screen
hs.hotkey.bind(window_prefix, "Left", function()
  hs.window.focusedWindow():move({ x = 0.00, y = 0.00, w = 0.50, h = 1.00 }, nil, true)
end)

hs.hotkey.bind(window_prefix, "Right", function()
  hs.window.focusedWindow():move({ x = 0.50, y = 0.00, w = 0.50, h = 1.00 }, nil, true)
end)

hs.hotkey.bind(window_prefix, "Up", function()
  hs.window.focusedWindow():move({ x = 0.00, y = 0.00, w = 1.00, h = 0.50 }, nil, true)
end)

hs.hotkey.bind(window_prefix, "Down", function()
  hs.window.focusedWindow():move({ x = 0.00, y = 0.50, w = 1.00, h = 0.50 }, nil, true)
end)

-- Occupy one corner
hs.hotkey.bind(window_prefix, "1", function()
  hs.window.focusedWindow():move({ x = 0.00, y = 0.00, w = 0.50, h = 0.50 }, nil, true)
end)

hs.hotkey.bind(window_prefix, "2", function()
  hs.window.focusedWindow():move({ x = 0.50, y = 0.00, w = 0.50, h = 0.50 }, nil, true)
end)

hs.hotkey.bind(window_prefix, "3", function()
  hs.window.focusedWindow():move({ x = 0.00, y = 0.50, w = 0.50, h = 0.50 }, nil, true)
end)

hs.hotkey.bind(window_prefix, "4", function()
  hs.window.focusedWindow():move({ x = 0.50, y = 0.50, w = 0.50, h = 0.50 }, nil, true)
end)

-- Occupy the whole screen
hs.hotkey.bind(window_prefix, "M", function()
  hs.window.focusedWindow():move({ x = 0.00, y = 0.00, w = 1.00, h = 1.00 }, nil, true)
end)

-- Center in the screen
hs.hotkey.bind(window_prefix, "C", function()
  local focusedWindow = hs.window.focusedWindow()
  local focusedScreenFrame = focusedWindow:screen():frame()
  local windowFrame = focusedWindow:frame()
  
  windowFrame.x = (focusedScreenFrame.w - windowFrame.w) / 2
  windowFrame.y = (focusedScreenFrame.h - windowFrame.h) / 2
  
  focusedWindow:setFrame(windowFrame)
end)

-- Move to next screen
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "N", function()
  -- Get the focused window, its window frame dimensions, its screen frame dimensions,
  -- and the next screen's frame dimensions.
  local focusedWindow = hs.window.focusedWindow()
  local focusedScreenFrame = focusedWindow:screen():frame()
  local nextScreenFrame = focusedWindow:screen():next():frame()
  local windowFrame = focusedWindow:frame()

  -- Calculate the coordinates of the window frame in the next screen and retain aspect ratio
  windowFrame.x = ((((windowFrame.x - focusedScreenFrame.x) / focusedScreenFrame.w) * nextScreenFrame.w) + nextScreenFrame.x)
  windowFrame.y = ((((windowFrame.y - focusedScreenFrame.y) / focusedScreenFrame.h) * nextScreenFrame.h) + nextScreenFrame.y)
  windowFrame.h = ((windowFrame.h / focusedScreenFrame.h) * nextScreenFrame.h)
  windowFrame.w = ((windowFrame.w / focusedScreenFrame.w) * nextScreenFrame.w)

  -- Set the focused window's new frame dimensions
  focusedWindow:setFrame(windowFrame)
end)
