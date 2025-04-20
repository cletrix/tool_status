#!/bin/bash

# -------------------------------------------
# ✅ Magic Trackpad
# -------------------------------------------
tp_info=$(ioreg -r -l -k "BatteryPercent" | grep -A15 "Magic Trackpad")

if [[ -n "$tp_info" ]]; then
    tp_battery=$(echo "$tp_info" | awk -F'= ' '/BatteryPercent/{print $2}' | tr -d ' ";')
    tp_transport=$(echo "$tp_info" | grep -m1 "Transport" | awk -F'= ' '{print $2}' | tr -d ' ";')

    if [[ "$tp_transport" == "Bluetooth" ]]; then
        tp_connection="📡 Magic Trackpad conectado via BLUETOOTH."
    elif [[ "$tp_transport" == "USB" ]]; then
        tp_connection="✅ Magic Trackpad conectado via CABO (USB)."
    else
        tp_connection="⚠️ Tipo de conexão do Magic Trackpad não identificado."
    fi

    echo "-------------------------------"
    echo "🔍 Magic Trackpad"
    echo "$tp_connection"
    if [[ -n "$tp_battery" ]]; then
        echo "🔋 Bateria do Magic Trackpad: $tp_battery%"
    else
        echo "⚠️ Nível de bateria não detectado."
    fi
else
    echo "-------------------------------"
    echo "🔍 Magic Trackpad"
    echo "❌ Magic Trackpad não detectado."
    echo "⚠️ Nível de bateria não detectado."
fi

# -------------------------------------------
# ✅ Magic Keyboard
# -------------------------------------------
# Magic Keyboard
kb_info=$(ioreg -r -l -k "BatteryPercent" | grep -A25 "Magic Keyboard")
sp_bluetooth=$(system_profiler SPBluetoothDataType | grep -A15 "Magic Keyboard")

if [[ -n "$kb_info" ]]; then
    # Se o ioreg identificar, seguimos com a lógica padrão:
    kb_battery=$(echo "$kb_info" | awk -F'= ' '/BatteryPercent/{print $2}' | tr -d ' ";')
    kb_transport=$(echo "$kb_info" | grep -m1 "Transport" | awk -F'= ' '{print $2}' | tr -d ' ";')
    kb_connected=$(echo "$kb_info" | awk -F'= ' '/ConnectionNotificationType/{print $2}' | tr -d ' ";')

    if [[ "$kb_transport" == "Bluetooth" || "$kb_connected" == "KBConnected" ]]; then
        kb_connection="📡 Magic Keyboard conectado via BLUETOOTH."
    elif [[ "$kb_connected" == "USBConnectedKB" ]]; then
        kb_connection="✅ Magic Keyboard conectado via CABO (USB)."
    else
        kb_connection="⚠️ Tipo de conexão do Magic Keyboard não identificado."
    fi
elif [[ -n "$sp_bluetooth" ]]; then
    # Se o system_profiler identificar, pegamos a bateria e conexão do dump Bluetooth:
    kb_battery=$(echo "$sp_bluetooth" | grep "Battery Level" | awk -F': ' '{print $2}' | tr -d '%')
    kb_connection="📡 Magic Keyboard conectado via BLUETOOTH."
else
    kb_connection="❌ Magic Keyboard não detectado."
    kb_battery=""
fi

echo "-------------------------------"
echo "🔍 Magic Keyboard"
echo "$kb_connection"
if [[ -n "$kb_battery" ]]; then
    echo "🔋 Bateria do Magic Keyboard: $kb_battery%"
else
    echo "⚠️ Nível de bateria não detectado."
fi

# -------------------------------------------
# ✅ Bateria do MacBook
# -------------------------------------------
mac_battery_info=$(pmset -g batt | grep -Eo "\d+%")
charging_status=$(pmset -g batt | grep -Eo "'.*'" | sed "s/'//g")

if [[ -z "$charging_status" ]]; then
    charging_status="sem carregador"
fi

echo "-------------------------------"
echo "💻 Bateria do MacBook"
if [[ -n "$mac_battery_info" ]]; then
    echo "🔋 Bateria do MacBook: $mac_battery_info ($charging_status)"
else
    echo "⚠️ Nível de bateria do MacBook não detectado."
fi
