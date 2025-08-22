# Zed-PlatformIO

Syntax highlighting for PlatformIO configuration files in Zed.

## Features

- Section headers (`[platformio]`, `[env:board_name]`)
- Configuration parameters and values
- Variable interpolation (`${common.lib_deps}`)
- Multi-line values and comments

## Example

```ini
[platformio]
default_envs = nodemcuv2

[common]
build_flags = -D VERSION=1.2.3
lib_deps = bblanchon/ArduinoJson @ ~5.6

[env:nodemcuv2]
platform = espressif8266
framework = arduino
board = nodemcuv2
build_flags = ${common.build_flags}
lib_deps = ${common.lib_deps}
```

## License

[MIT License](LICENSE)
