# PlatformIO IDE for Zed

A comprehensive PlatformIO IDE extension for Zed editor that provides complete embedded development support, inspired by the popular VSCode PlatformIO IDE.

## ✨ Features

### 🔧 Project Management
- **Auto-detection** of PlatformIO projects (`platformio.ini`)
- **Multi-environment** support with environment-specific commands
- **Project configuration** parsing and validation

### 🛠️ Development Tools
- **Integrated build system** with one-click build/upload/clean
- **Serial monitor** for real-time device communication
- **Task runner** with pre-configured PlatformIO commands
- **Keyboard shortcuts** for common operations

### 💡 Intelligent Code Support
- **C/C++/Arduino IntelliSense** via clangd integration
- **Auto-generated** `compile_commands.json` for better code completion
- **Syntax highlighting** for embedded-specific file types (`.ino`)
- **Problem matcher** for build error detection and navigation

### 📦 Library Management
- **Library search** and installation commands
- **Dependency tracking** with enhanced `platformio.ini` syntax highlighting
- **Library format recognition**:
  - Registry libraries (`bblanchon/ArduinoJson@^6.19.4`)
  - Git repositories (`https://github.com/...`)
  - Local libraries and built-ins

### 🎨 Enhanced Syntax Highlighting
- **PlatformIO configuration** files (`platformio.ini`)
- **Section headers** (`[platformio]`, `[env:board_name]`)
- **Property names** and values with smart highlighting
- **Comments** support (`;` and `#`)
- **Variable interpolation** (`${common.lib_deps}`)
- **Version constraints** and **URLs**

## 📦 Installation

### Prerequisites
- [PlatformIO Core CLI](https://docs.platformio.org/en/latest/core/installation.html) installed and in PATH
- [clangd](https://clangd.llvm.org/installation.html) for C/C++ language support (optional but recommended)

### Install Extension
1. Clone this repository:
   ```bash
   git clone https://github.com/weirdo-adam/zed-platformio.git
   cd zed-platformio
   ```

2. Build the extension:
   ```bash
   cargo build --release
   ```

3. Install in Zed:
   - Open Zed
   - Open Command Palette (`Cmd+Shift+P` on macOS, `Ctrl+Shift+P` on Linux/Windows)
   - Run "zed: install dev extension" and select this directory

### Verify Installation
1. Open a PlatformIO project (containing `platformio.ini`)
2. The extension should automatically detect the project
3. Use `Ctrl+Shift+P` to see available PlatformIO commands

## 🎯 Usage

### Available Commands
Access these commands via Command Palette (`Ctrl+Shift+P`):

#### Build Commands
- **PlatformIO: Build** - Build the project (`pio run`)
- **PlatformIO: Upload** - Upload firmware to device (`pio run --target upload`)
- **PlatformIO: Clean** - Clean build files (`pio run --target clean`)
- **PlatformIO: Test** - Run unit tests (`pio test`)

#### Device Commands
- **PlatformIO: Monitor** - Open serial monitor (`pio device monitor`)
- **PlatformIO: Upload and Monitor** - Upload then start monitoring
- **PlatformIO: Device List** - List connected devices (`pio device list`)

#### Library Commands
- **PlatformIO: Library Search** - Search for libraries (`pio lib search`)
- **PlatformIO: Library Install** - Install libraries (`pio lib install`)
- **PlatformIO: Update** - Update platforms and libraries (`pio update`)

#### Information Commands
- **PlatformIO: Board List** - List supported boards (`pio boards`)

### Keyboard Shortcuts
- `F5` - Build project
- `Ctrl+Shift+B` - Build (alternative)
- `Ctrl+Shift+U` - Upload firmware
- `Ctrl+Shift+M` - Serial monitor
- `Ctrl+Shift+T` - Run tests
- `Ctrl+Shift+C` - Clean build
- `Ctrl+F5` - Upload and monitor

### Multi-Environment Support
For projects with multiple environments defined in `platformio.ini`, the extension automatically generates environment-specific commands:

- **PlatformIO: Build (esp32dev)** - Build specific environment
- **PlatformIO: Upload (nodemcuv2)** - Upload to specific environment
- **PlatformIO: Clean (bluepill)** - Clean specific environment

## 📁 Supported Files

- **`platformio.ini`** - Project configuration with enhanced syntax highlighting
- **`*.cpp`, `*.c`, `*.h`** - C/C++ source files with IntelliSense
- **`*.ino`** - Arduino sketch files
- **`*.hpp`, `*.hxx`** - C++ header files

## Language Features

### Syntax Highlighting

The extension provides comprehensive syntax highlighting for:

- **Section headers**: `[platformio]`, `[env:board_name]`, `[common]`
- **Property names**: `platform`, `framework`, `board`, `build_flags`, etc.
- **Comments**: Lines starting with `;`
- **Special values**: Boolean values, version numbers, file paths, URLs
- **Variable interpolation**: `${section.property}` syntax

### Example Project Configuration

```ini
; PlatformIO Project Configuration File
[platformio]
default_envs = esp32dev

[common]
build_flags = 
    -D VERSION=1.0.0
    -D DEBUG=1
lib_deps = 
    bblanchon/ArduinoJson@^6.19.4           ; ✨ Registry library with version
    https://github.com/tzapu/WiFiManager.git ; ✨ Git repository
    ArduinoJson                             ; ✨ Built-in library

[env:esp32dev]
platform = espressif32
framework = arduino
board = esp32dev
build_flags = ${common.build_flags}         ; ✨ Variable interpolation
lib_deps = ${common.lib_deps}
upload_port = /dev/ttyUSB0
monitor_speed = 115200

[env:nodemcuv2]
platform = espressif8266
framework = arduino
board = nodemcuv2
build_flags = ${common.build_flags}
lib_deps = ${common.lib_deps}
```

## 🚀 Quick Start

1. **Create a new PlatformIO project** or open an existing one
2. **Open the project** in Zed
3. **Start coding** - IntelliSense will work automatically for C/C++/Arduino
4. **Build your project** with `F5` or `PlatformIO: Build` command
5. **Upload to device** with `Ctrl+Shift+U` or `PlatformIO: Upload`
6. **Monitor serial output** with `Ctrl+Shift+M`

## 🎨 Screenshots

*Coming soon - screenshots showing the extension in action*

## 🔧 Configuration

The extension works out of the box, but you can customize some behaviors:

### clangd Configuration and Arduino.h Support

The extension automatically configures clangd for PlatformIO projects by:
- **Auto-generating** `compile_commands.json` with correct include paths
- **Scanning** `.pio/libdeps` and `.pio/packages` for library dependencies
- **Including** Arduino framework headers automatically
- **Setting** appropriate defines (`ARDUINO=200`, `PLATFORMIO=60000`)

#### Troubleshooting "Arduino.h file not found"

If you encounter `'Arduino.h' file not found` errors, try these solutions:

1. **Build the project first** to generate `.pio` dependencies:
   ```bash
   pio run
   ```

2. **Manually generate compile_commands.json**:
   ```bash
   # Use PlatformIO's built-in command (if available)
   pio run --target compiledb
   
   # Or use our helper script
   python3 scripts/generate_compile_commands.py
   ```

3. **Copy the provided .clangd config** to your project root:
   ```bash
   cp templates/.clangd /path/to/your/project/
   ```

4. **Restart the language server** in Zed:
   - Open Command Palette (`Ctrl+Shift+P`)
   - Run "zed: restart language server"

#### Manual Library Path Configuration

If automatic detection fails, you can manually add include paths by creating a `.clangd` file in your project root:

```yaml
CompileFlags:
  Add:
    - -I.pio/libdeps/your_env_name
    - -I.pio/packages/framework-arduinoespressif32/cores/esp32
    - -DARDUINO=200
    - -DPLATFORMIO=60000
```

### Custom Task Configuration
You can extend the built-in tasks by modifying `tasks.json` in your project.

## 🛠️ Troubleshooting

### Common Issues

#### 1. "Arduino.h file not found" Error
This happens when clangd cannot find the Arduino framework headers. Solutions:
- Ensure you've built the project at least once: `pio run`
- The extension will automatically generate `compile_commands.json`
- Check that `.pio/packages` directory exists and contains framework files
- Copy the provided `.clangd` config template to your project

#### 2. IntelliSense not working for libraries
- Build the project to download dependencies: `pio run`
- Check that libraries are installed in `.pio/libdeps/your_env_name/`
- Restart the language server: `Ctrl+Shift+P` → "zed: restart language server"

#### 3. PlatformIO commands not found
- Ensure PlatformIO CLI is installed: `pip install platformio`
- Verify it's in PATH: `pio --version`
- Restart Zed after installing PlatformIO

#### 4. Extension not detecting PlatformIO project
- Ensure `platformio.ini` file exists in project root
- Check that the file has proper section headers like `[env:name]`
- Reload the workspace in Zed

### Debug Information

To get debug information about include paths and compilation:

1. Check the generated `compile_commands.json`:
   ```bash
   cat compile_commands.json | jq '.[0]'
   ```

2. Test clangd manually:
   ```bash
   clangd --check=src/main.cpp
   ```

3. View PlatformIO build information:
   ```bash
   pio run --target envdump
   ```

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Report bugs** or suggest features in [Issues](https://github.com/weirdo-adam/zed-platformio/issues)
2. **Submit pull requests** with improvements
3. **Test the extension** with different PlatformIO projects
4. **Improve documentation** and examples

### Development Setup
```bash
git clone https://github.com/weirdo-adam/zed-platformio.git
cd zed-platformio
cargo build
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by [PlatformIO IDE for VSCode](https://marketplace.visualstudio.com/items?itemName=platformio.platformio-ide)
- Built on [Zed Extension API](https://zed.dev/docs/extensions)
- Uses [Tree-sitter](https://tree-sitter.github.io/) for syntax highlighting

## 📞 Support

- 📖 [PlatformIO Documentation](https://docs.platformio.org/)
- 💬 [Zed Community](https://github.com/zed-industries/zed/discussions)
- 🐛 [Report Issues](https://github.com/weirdo-adam/zed-platformio/issues)

---

**Happy Embedded Programming with Zed! 🚀**