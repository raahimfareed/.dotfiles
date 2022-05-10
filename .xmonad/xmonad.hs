import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Prompt.ConfirmPrompt

import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.SpawnOnce

import XMonad.Actions.WithAll (killAll)

import Graphics.X11.ExtraTypes.XF86

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- My stuff
myBrowser = "chromium"
myFileManager = "nemo"
myTerminal = "alacritty"
myCodeEditor = "code"
myTerminalCodeEditor = "nvim"
myModMask = mod4Mask

myBar = "xmobar"
myPP = xmobarPP { ppCurrent = xmobarColor "#FFF" "" . wrap "[" "]" }
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- keybindings
myKeys :: [(String, X ())]
myKeys = 
  [ ("<XF86AudioMute>", spawn "amixer -D pulse sset Master toggle")
  , ("<XF86AudioRaiseVolume>",  spawn "pamixer --increase 5 --allow-boost")
  , ("<XF86AudioLowerVolume>",  spawn "pamixer --decrease 5 --allow-boost")
  , ("<XF86MonBrightnessUp>",  spawn "brightnessctl set +10%")
  , ("<XF86MonBrightnessDown>",  spawn "brightnessctl set 10%-")
  , ("<XF86Bluetooth>", spawn (myBrowser))
  , ("<XF86Tools>", spawn (myCodeEditor))
  , ("<XF86Favorites>", spawn (myFileManager))
  , ("M-<XF86Favorites>", spawn (myTerminal ++ " -e " ++ myTerminalCodeEditor))
  , ("<Print>", spawn "flameshot gui")
  -- , ("<Print>", spawn "~/scripts/scrot.sh")
  , ("M-<Print>", spawn "~/scripts/scrot-select.sh")
  , ("M-S-b", spawn (myBrowser))
  , ("M-S-m", spawn (myFileManager))
  , ("M-S-a", killAll)
  ]

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "flameshot"
  -- spawnOnce "parcellite &"
  spawnOnce "feh --bg-fill ~/Wallpapers/arch-computer-wallpaper.png"
  spawnOnce "dunst"

-- Main configuration
myConfig = def
  { terminal = myTerminal
  , modMask = myModMask
  , borderWidth = 3
  , normalBorderColor = "#d8d6c3"
  , focusedBorderColor = "#51a6e2"
  , workspaces = ["web", "dev", "3", "4", "5", "6", "7", "file", "term"]
  , startupHook = myStartupHook
  } `additionalKeysP` myKeys
