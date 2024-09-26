#!/system/bin/sh

vnotify() {
    local vStatus="Module status: $1"
    sed -Ei "s/^description=(\[.*][[:space:]]*)?/description=[ $vStatus ] /g" "$MODPATH/module.prop"
    am start -a android.intent.action.MAIN -e toasttext "$vStatus" -n bellavita.toast/.MainActivity
    su -lp 2000 -c "cmd notification post -S bigtext -t 'Autocut Charging AI by VDBay' tag '$vStatus'" >/dev/null 2>&1
}

vset_charging() {
    echo "$1" >/sys/class/power_supply/charger/online
    vnotify "Discharging"
}

while true; do
    vIsEnabled=$(getprop vdbay.autocut.enable)                    # true or false
    vBatteryLevel=$(cat /sys/class/power_supply/battery/capacity) # "0-100"
    vChargeStatus=$(cat /sys/class/power_supply/battery/status)   # "Charging" or "Discharging"
    vLevel=$(getprop vdbay.autocut.level)                         # charging level

    if [ "$vIsEnabled" = "true" ] && [ "$vBatteryLevel" -ge "$vLevel" ] && [ "$vChargeStatus" = "Charging" ]; then
        vset_charging 0
    fi

    sleep 60
done &
