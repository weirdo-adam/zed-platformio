# PlatformIO Syntax Highlighting for Zed

A lightweight Zed editor extension that provides comprehensive syntax highlighting for PlatformIO configuration files based on official documentation.

## ✨ Features

### 🎨 Enhanced Syntax Highlighting for `platformio.ini`

- **Section headers** with different highlighting for environment sections (`[env:board_name]`)
- **Configuration parameters** categorized by function with distinct colors:
  - **[platformio] options**: `default_envs`, `description`, `src_dir`, etc.
  - **Platform & Framework**: `platform`, `framework`, `board`
  - **Build options**: `build_flags`, `build_type`, `targets`
  - **Library options**: `lib_deps`, `lib_ignore`, `lib_extra_dirs`
  - **Upload options**: `upload_port`, `upload_speed`, `upload_protocol`
  - **Monitor options**: `monitor_speed`, `monitor_filters`, `monitor_port`
  - **Debug options**: `debug_tool`, `debug_init_break`, `debug_server`
  - **Test options**: `test_framework`, `test_ignore`, `test_port`
  - **Check options**: `check_tool`, `check_flags`, `check_severity`

- **Value highlighting**:
  - **Library dependencies**: `owner/library@^1.0.0` format
  - **Version constraints**: `@^1.0.0`, `@>=1.0.0`
  - **Git URLs**: `https://github.com/user/repo.git`
  - **Boolean values**: `true`, `false`, `yes`, `no`
  - **File paths**: Unix and Windows path formats
  - **Build flags**: `-DDEBUG`, `-IINCLUDE_DIR`

- **Variable interpolation** with different types:
  - **Built-in variables**: `${PROJECT_DIR}`, `${PROJECT_HASH}`, `${UNIX_TIME}`
  - **Section references**: `${common.lib_deps}`, `${platformio.src_dir}`
  - **Current section**: `${this.board}`, `${this.__env__}`

- **Multi-line value support** for complex configurations
- **Comments** support (`;` and `#`)

## 📦 Installation

### Prerequisites
- [Zed Editor](https://zed.dev) installed

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
1. Open a PlatformIO project containing `platformio.ini`
2. The file should display with enhanced syntax highlighting
3. Configuration parameters should appear in different colors based on their category

## 📁 Supported Files

- **`platformio.ini`** - PlatformIO project configuration files

## 🎯 Configuration Examples

### Basic Configuration
```ini
; PlatformIO Project Configuration File
[platformio]
default_envs = esp32dev
description = My IoT Project

[env:esp32dev]
platform = espressif32
framework = arduino
board = esp32dev
monitor_speed = 115200
```

### Advanced Configuration with Libraries
```ini
[platformio]
default_envs = esp32dev, nodemcuv2

[common]
build_flags = 
    -D VERSION=1.0.0
    -D DEBUG=1
lib_deps = 
    bblanchon/ArduinoJson@^6.21.3
    adafruit/Adafruit SSD1306@^2.5.7
    https://github.com/tzapu/WiFiManager.git
    WiFiManager
    Servo

[env:esp32dev]
platform = espressif32
framework = arduino
board = esp32dev
build_flags = ${common.build_flags}
lib_deps = ${common.lib_deps}
upload_port = /dev/ttyUSB0
monitor_speed = 115200
monitor_filters = esp32_exception_decoder

[env:nodemcuv2]
platform = espressif8266
framework = arduino
board = nodemcuv2
build_flags = ${common.build_flags}
lib_deps = ${common.lib_deps}
upload_speed = 921600
monitor_speed = ${common.monitor_speed}
```

### Variable Interpolation Examples
```ini
[common]
lib_deps_builtin = SPI, Wire
lib_deps_external = bblanchon/ArduinoJson@^6.21.3

[env:uno]
platform = atmelavr
framework = arduino
board = uno
lib_deps =
    ${common.lib_deps_builtin}
    ${common.lib_deps_external}
build_dir = ${PROJECT_DIR}/custom_build
debug_build_flags = ${this.build_flags} -DDEBUG
```

## 🛠️ Technical Details

### Syntax Highlighting Implementation
- Built on [Tree-sitter](https://tree-sitter.github.io/) grammar for INI files
- Uses [tree-sitter-ini](https://github.com/justinmk/tree-sitter-ini) as the base grammar
- Custom highlight queries based on [official PlatformIO documentation](https://docs.platformio.org/en/latest/projectconf/)
- Supports multiline values and complex nested configurations

### Supported Configuration Parameters
The extension recognizes all official PlatformIO configuration parameters from:
- [platformio] section options
- [env] section options  
- Platform-specific options
- Framework-specific options
- Advanced build, upload, monitor, debug, and test configurations

## 🤝 Contributing

Contributions are welcome! Here's how you can help:

1. **Report bugs** or suggest features in [Issues](https://github.com/weirdo-adam/zed-platformio/issues)
2. **Submit pull requests** with improvements to syntax highlighting patterns
3. **Test the extension** with different PlatformIO project configurations
4. **Update documentation** when new PlatformIO features are added

### Development Setup
```bash
git clone https://github.com/weirdo-adam/zed-platformio.git
cd zed-platformio
cargo build --release
```

### Adding New Highlighting Patterns
Edit `languages/platformio/highlights.scm` to add support for new configuration parameters or improve existing patterns.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built on [Zed Extension API](https://zed.dev/docs/extensions)
- Uses [Tree-sitter](https://tree-sitter.github.io/) for syntax highlighting
- INI grammar from [tree-sitter-ini](https://github.com/justinmk/tree-sitter-ini)
- Configuration based on [official PlatformIO documentation](https://docs.platformio.org/)

## 📞 Support

- 📖 [PlatformIO Documentation](https://docs.platformio.org/)
- 💬 [Zed Community](https://github.com/zed-industries/zed/discussions)
- 🐛 [Report Issues](https://github.com/weirdo-adam/zed-platformio/issues)

---

**Enhanced PlatformIO syntax highlighting for Zed! 🎨**