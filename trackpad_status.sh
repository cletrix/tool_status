#!/bin/bash

# Busca todas as entradas Transport associadas ao Trackpad
transports=$(ioreg -r -n "AppleDeviceManagementHIDEventService" | grep -i '"Transport"' | awk -F'= ' '{print $2}' | tr -d '"' | sort | uniq)

# Busca bateria
battery=$(ioreg -r -n "AppleDeviceManagementHIDEventService" | grep '"BatteryPercent"' | head -n1 | awk -F'= ' '{print $2}' | tr -d ' ')

# Determina tipo de conexão
connection=""
if echo "$transports" | grep -q "USB"; then
    connection="✅ Magic Trackpad conectado via CABO (USB)."
elif echo "$transports" | grep -q "Bluetooth"; then
    connection="📡 Magic Trackpad conectado via BLUETOOTH."
else
    connection="❌ Magic Trackpad não detectado."
fi

# Exibe resultado
echo "$connection"

if [[ -n "$battery" ]]; then
    echo "🔋 Bateria do Trackpad: $battery%"
else
    echo "⚠️ Nível de bateria não detectado."
fi
