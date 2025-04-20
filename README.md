
# 🔋 Status Checker (macOS)

Este script em bash permite identificar:

- Se o **Magic Trackpad e o Magic Keyboard** está conectado via **USB (cabo)** ou **Bluetooth**.
- O nível atual de **bateria (%)**, mesmo quando estiver conectado por **cabo**.

---

## 📦 Requisitos

- macOS com Terminal (zsh ou bash)
- Comandos padrão: `ioreg`, `system_profiler`

---

## 📄 Como usar

### 1. Instale o script

Salve o conteúdo do script principal em um arquivo, por exemplo:

    status.sh

Torne executável:

    chmod +x status.sh

Execute com:

    ./status.sh

---

### 2. Torne global (comando de sistema)

Mova o script para um diretório acessível pelo sistema:

    sudo cp status.sh /usr/local/bin/status

Agora você pode executá-lo diretamente com:

    status

---

### 3. Alias no `.zshrc` (atalho personalizado)

Para facilitar ainda mais, adicione um atalho no seu terminal:

    echo 'alias status="status"' >> ~/.zshrc
    source ~/.zshrc

Depois disso, use:

    status

---

## 🔍 O que o script faz

1. Verifica se o Trackpad e o Keyboard estão conectados via USB.
2. Verifica se está conectado via Bluetooth.
3. Busca o nível da bateria com `ioreg`, mesmo via cabo.
4. Exibe as informações de forma amigável.

---

## 💡 Exemplo de saída

    🔍 Magic Trackpad
    📡 Magic Trackpad conectado via BLUETOOTH.
    🔋 Bateria do Magic Trackpad: 100%
    -------------------------------
    🔍 Magic Keyboard
    ✅ Magic Keyboard conectado via CABO (USB).
    🔋 Bateria do Magic Keyboard: 100%
    -------------------------------
    💻 Bateria do MacBook
    🔋 Bateria do MacBook: 92% (AC Power)

---

## 📃 Licença

MIT License – livre para usar, modificar e distribuir.

---

## By 

    Cleyton Pedroza 
    ChatGPT

