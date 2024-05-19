export _JAVA_AWT_WM_NONREPARENTING=1

case "$2" in
	dwm)
		feh --bg-fill ~/Wallpapers/arch-computer-wallpaper.png
		xbindkeys
		dunst &
		flameshot &
		slstatus &
		exec dwm
		;;
	kde)
		export DESKTOP_SESSION=plasma
		exec startplasma-x11		
		;;
	gnome)
		export XDG_SESSION_TYPE=x11
		export GDK_BACKEND=x11
		exec gnome-session
		;;
	xmonad)
		exec xmonad
		;;
esac
