# START

VAIOAPK=$MODPATH/aioapp.apk
VTSTAPK=$MODPATH/toast.apk
VAIOPKG=com.vdbay.aioapp
VTSTPKG=bellavita.toast
set_perm_recursive $MODPATH 0 0 0755 0644

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

# Check compatibility on service.sh
VIS_COMPATIBLE=$(wc -c <"$MODPATH/service.sh")
if [ "$VIS_COMPATIBLE" = "1012"]; then
    abort "Not compatible, can't install. Please ask your maintainer."
fi

if pm list packages | grep -q $VAIOPKG; then
    ui_print "Uninstalling old VDBay AIO app..."
    pm uninstall $VAIOPKG
fi

ui_print "Installing new VDBAy AIO app..."
pm install $VAIOAPK
if ! pm list packages | grep -q $VAIOPKG; then
    abort "Unable to install the VDBay AIO app. Please install aioapp.apk, then flash the modules again."
fi

if pm list packages | grep -q $VTSTPKG; then
    ui_print "Uninstalling old toast app..."
    pm uninstall $VTSTPKG
fi

ui_print "Installing new toast app..."
pm install $VTSTAPK
if ! pm list packages | grep -q $VTSTPKG; then
    abort "Unable to install the toast app. Please install toast.apk, then flash the modules again."
fi

ui_print "Thanks to:"
ui_print "- Tester"
ui_print "- Follower/Subscriber"
ui_print "- Topjohnwu"
ui_print "- MiAzami"
ui_print "- Zackptg5"

nohup am start -a android.intent.action.VIEW -d https://t.me/vdbaymodule >/dev/null 2>&1 &

# END
