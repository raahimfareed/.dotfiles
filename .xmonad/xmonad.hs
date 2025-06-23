import XMonad
--import XMonad.Core (io)
import XMonad.Hooks.DynamicLog

-- Layouts
import XMonad.Layout.Renamed;
import XMonad.Layout.Tabbed;
import XMonad.Layout.Fullscreen;
import XMonad.Layout.ResizableTile;
import XMonad.Layout.Spacing;
import XMonad.Layout.NoBorders (noBorders, smartBorders);

-- Prompts
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.ConfirmPrompt

import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.SpawnOnce

import XMonad.Actions.WithAll (killAll)
import XMonad.Actions.SpawnOn

import Graphics.X11.ExtraTypes.XF86

import Control.Concurrent;
import Control.Monad;

main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- My stuff
myBrowser = "zen-browser"
myFileManager = "nautilus"
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
  [ 
    ("<XF86AudioMute>", spawn "amixer -D pulse sset Master toggle")
  , ("<XF86AudioRaiseVolume>",  spawn "pamixer --increase 5 --allow-boost")
  , ("<XF86AudioLowerVolume>",  spawn "pamixer --decrease 5 --allow-boost")
  , ("<XF86MonBrightnessUp>",  spawn "brightnessctl set +10%")
  , ("<XF86MonBrightnessDown>",  spawn "brightnessctl set 10%-")
  , ("<XF86Bluetooth>", spawn (myBrowser))
  , ("S-<XF86Bluetooth>", spawn (myBrowser ++ " --private-window"))
  , ("<XF86Tools>", spawn (myCodeEditor))
  , ("M-<XF86Tools>", spawn "redshift -P -O 5000")
  , ("M-S-<XF86Tools>", spawn "redshift -P -O 8000")
  , ("<XF86Favorites>", spawn (myFileManager))
  , ("M-<XF86Favorites>", spawn (myTerminal ++ " -e " ++ myTerminalCodeEditor))
  , ("<Print>", spawn "flameshot gui")
  -- , ("<Print>", spawn "~/scripts/scrot.sh")
  , ("M-<Print>", spawn "~/scripts/scrot-select.sh")
  , ("M-S-b", spawn (myBrowser))
  , ("M-S-m", spawn (myFileManager))
  , ("M-S-a", killAll)
  -- , ("M-S-x", shellPrompt def)
  ]

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "flameshot"
  spawnOnce "feh --bg-fill ~/Downloads/robinwall02-notext.png"
  spawnOnce "dunst"
  spawnOnce "picom"

-- Layouts
full = noBorders
        $ Full
tall = renamed [Replace "tall"]
        $ spacingWithEdge 10
        $ smartBorders
        $ Tall 1 (10/100) (60/100)

myLayoutHook = tall
            ||| full
    -- ||| Mirror (Tall 1 (10/100) (60/100))

-- Main configuration
myConfig = def
  { terminal = myTerminal
  , modMask = myModMask
  , borderWidth = 3
  , normalBorderColor = "#d8d6c3"
  , focusedBorderColor = "#51a6e2"
  , workspaces = ["web", "dev", "3", "4", "5", "6", "7", "file", "term"]
  , startupHook = myStartupHook
  , handleEventHook = fullscreenEventHook
  , manageHook = fullscreenManageHook
  , layoutHook = myLayoutHook
  } `additionalKeysP` myKeys
