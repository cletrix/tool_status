#!/bin/bash

# Verifica se está presente via USB
usb_info=$(system_profiler SPUSBDataType | grep -i "Magic Trackpad")

# Verifica se está presente via Bluetooth e conectado
bt_info=$(system_profiler SPBluetoothDataType | grep -A10 -i "Magic Trackpad" | grep "Connected: Yes")

# Busca o primeiro BatteryPercent disponível no sistema
battery=$(ioreg -r -n "AppleDeviceManagementHIDEventService" | grep '"BatteryPercent"' | head -n1 | awk -F'= ' '{print $2}' | tr -d ' ')

# Exibe status de conexão
if [[ -n "$usb_info" && -z "$bt_info" ]]; then
    echo "✅ Magic Trackpad conectado via CABO (USB)."
elif [[ -n "$bt_info" ]]; then
    echo "📡 Magic Trackpad conectado via BLUETOOTH."
elif [[ -z "$usb_info" && -z "$bt_info" ]]; then
    echo "❌ Magic Trackpad não detectado via Bluetooth nem USB."
else
    echo "⚠️ Detecção ambígua: pode estar carregando via cabo, mas operando via Bluetooth."
fi

# Exibe nível da bateria
if [[ -n "$battery" ]]; then
    echo "🔋 Bateria do Trackpad: $battery%"
else
    echo "⚠️ Nível de bateria não detectado."
fi