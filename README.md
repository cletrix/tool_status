
# 🔋 Magic Trackpad Status Checker (macOS)

Este script em bash permite identificar:

- Se o **Magic Trackpad** está conectado via **USB (cabo)** ou **Bluetooth**.
- O nível atual de **bateria (%)**, mesmo quando o Trackpad estiver conectado por **cabo**.

---

## 📦 Requisitos

- macOS com Terminal (zsh ou bash)
- Comandos padrão: `ioreg`, `system_profiler`

---

## 📄 Como usar

### 1. Instale o script

Salve o conteúdo do script principal em um arquivo, por exemplo:

    trackpad_status.sh

Torne executável:

    chmod +x trackpad_status.sh

Execute com:

    ./trackpad_status.sh

---

### 2. Torne global (comando de sistema)

Mova o script para um diretório acessível pelo sistema:

    sudo mv trackpad_status.sh /usr/local/bin/trackpad_status

Agora você pode executá-lo diretamente com:

    trackpad_status

---

### 3. Alias no `.zshrc` (atalho personalizado)

Para facilitar ainda mais, adicione um atalho no seu terminal:

    echo 'alias trackpad="trackpad_status"' >> ~/.zshrc
    source ~/.zshrc

Depois disso, use:

    trackpad

---

## 🔍 O que o script faz

1. Verifica se o Trackpad está conectado via USB.
2. Verifica se está conectado via Bluetooth.
3. Busca o nível da bateria com `ioreg`, mesmo via cabo.
4. Exibe as informações de forma amigável.

---

## 💡 Exemplo de saída

    ✅ Magic Trackpad conectado via CABO (USB).
    🔋 Bateria do Trackpad: 100%

Ou:

    📡 Magic Trackpad conectado via BLUETOOTH.
    🔋 Bateria do Trackpad: 75%

---

## 📃 Licença

MIT License – livre para usar, modificar e distribuir.

---

## By 

    Cleyton Pedroza 
    ChatGPT

