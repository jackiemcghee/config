import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

main :: IO ()
main = xmonad .  ewmhFullscreen . ewmh . xmobarProp $ myConfig

myConfig = def
	{ modMask    = mod4Mask -- Rebind Mod to the Super key
	, layoutHook = myLayout
	}
	`additionalKeysP`
	[ ("M-S-z", spawn "xscreensaver-command -lock")
	, ("M-C-s", unGrab *> spawn "scrot -s"        )
	, ("M-f"  , spawn"firefox"                    )
	]

myLayout = tiled ||| Mirror tiled ||| Full ||| ThreeColMid
	where
		threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
		tiled    = Tall nmaster delta ratio
		nmaster  = 1     -- Default number of windows in the master pane
		ratio    = 1/2   -- Default proportion of screen occupied by master pane
		delta    = 3/100 -- Percent of the screen to increment by when resizing panes
