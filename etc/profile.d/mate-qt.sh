# MATE Desktop Qt integrations
if [ "x$DESKTOP_SESSION" == "xmate" ] || [ "x$XDG_SESSION_DESKTOP" == "xmate" ]; then
    # QT apps to use GTK styling
    export QT_QPA_PLATFORMTHEME=gtk2

    # Qt automatic scaling, based on the pixel density of the monitor.
    # Not enabled by default because it scales Qt applications on
    # 13" 1080p displays
    # export QT_AUTO_SCREEN_SCALE_FACTOR=1
fi
