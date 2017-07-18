# MATE Desktop theme integrations and tweaks
if [ "x$DESKTOP_SESSION" == "xmate" ] || [ "x$XDG_SESSION_DESKTOP" == "xmate" ]; then
    # Disable GTK3 overlay scrollbars
    export GTK_OVERLAY_SCROLLING=0

    # QT apps to use GTK styling
    export QT_QPA_PLATFORMTHEME=gtk2

    # Change to GDK_SCALE=2 for experimental HiDPI support.
    # Requires reboot.
    export GDK_SCALE=1
fi