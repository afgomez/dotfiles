hs.window.animationDuration = 0

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
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "M", function()
  hs.window.focusedWindow():move({ x = 0.00, y = 0.00, w = 1.00, h = 1.00 }, nil, true)
end)
