# START

sleep 1
ui_print " "
ui_print " _    ______  ____  _____  __            "
ui_print "| |  / / __ \/ __ )/   \ \/ /            "
ui_print "| | / / / / / __  / /| |\  /             "
ui_print "| |/ / /_/ / /_/ / ___ |/ /              "
ui_print "|___/_____/_____/_/  |_/_/               "
ui_print "    ___    ________                      "
ui_print "   /   |  /  _/ __ \                     "
ui_print "  / /| |  / // / / /                     "
ui_print " / ___ |_/ // /_/ /                      "
ui_print "/_/  |_/___/\____/                       "
ui_print "    __  _______  ____  __  ____    ______"
ui_print "   /  |/  / __ \/ __ \/ / / / /   / ____/"
ui_print "  / /|_/ / / / / / / / / / / /   / __/   "
ui_print " / /  / / /_/ / /_/ / /_/ / /___/ /___   "
ui_print "/_/  /_/\____/_____/\____/_____/_____/   "
ui_print "                                         "
ui_print " "

# Check compatibility
VIS_COMPATIBLE=$(wc -c <"$MODPATH/service.sh")
if [ "$VIS_COMPATIBLE" = "1012"]; then
    abort "Not compatible, can't install. Please ask your maintainer."
fi

ui_print "Installing VDBAy AIO app..."
pm install $MODPATH/aioapp.apk
if ! pm list packages | grep -q com.vdbay.aioapp; then
    ui_print "Unable to install the VDBay AIO app. Please install it manually."
    abort "Please install aioapp.apk, and then flash modules again."
fi

ui_print "Installing toast app..."
pm install $MODPATH/toast.apk
if ! pm list packages | grep -q bellavita.toast; then
    ui_print "Unable to install the toast app. Please install it manually."
    abort "Please install toast.apk, and then flash modules again."
fi

ui_print "Thanks to:"
ui_print "- Tester"
ui_print "- Follower/Subscriber"
ui_print "- Topjohnwu"
ui_print "- MiAzami"
ui_print "- Zackptg5"

nohup am start -a android.intent.action.VIEW -d https://t.me/vdbaymodule >/dev/null 2>&1 &

# END
