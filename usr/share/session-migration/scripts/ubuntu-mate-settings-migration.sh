#!/bin/sh

# Migrate Firefox from deb to snap
# https://bazaar.launchpad.net/~mozillateam/firefox/firefox.jammy/view/head:/firefox
if [ -x /snap/bin/firefox ]; then
    # Update default browser
    if [ "$(xdg-settings get default-web-browser)" = "firefox.desktop" ]; then
        xdg-settings set default-web-browser firefox_firefox.desktop
    fi

    # Migrate mate-panel launchers
    OLD="/usr/share/applications/firefox.desktop"
    NEW="/var/lib/snapd/desktop/applications/firefox_firefox.desktop"
    OBJECTS=$(gsettings get org.mate.panel object-id-list 2> /dev/null)
    for object in $OBJECTS; do
        object=$(echo $object | cut -d\' -f2)
        launcher=$(gsettings get org.mate.panel.object:/org/mate/panel/objects/$object/ launcher-location)
        if [ "$launcher" = "'$OLD'" ]; then
            gsettings set org.mate.panel.object:/org/mate/panel/objects/$object/ launcher-location "'$NEW'"
        fi
    done

    # Migrate plank dockitems
    if [ -e ~/.config/plank/dock1/launchers/firefox.dockitem ]; then
        rm ~/.config/plank/dock1/launchers/firefox.dockitem
        cp /usr/share/ubuntu-mate/settings-overlay/config/plank/dock1/launchers/firefox_firefox.dockitem ~/.config/plank/dock1/launchers/
    fi
fi
