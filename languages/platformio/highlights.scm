; Environment sections specifically (must come first for precedence)
(section_name
  (text) @type.builtin
  (#match? @type.builtin "^env:")
)

; Section names with enhanced PlatformIO support
(section_name
  (text) @type)

; Comments
(comment) @comment

; Brackets
[
  "["
  "]"
] @punctuation.bracket

; Assignment operator
"=" @operator

; Property names with PlatformIO-specific highlighting
(setting
  (setting_name) @property)

; [platformio] section options
(setting
  (setting_name) @keyword
  (#match? @keyword "^(name|description|default_envs|extra_configs|core_dir|globallib_dir|platforms_dir|packages_dir|cache_dir|build_cache_dir|workspace_dir|build_dir|libdeps_dir|include_dir|src_dir|lib_dir|data_dir|test_dir|boards_dir|monitor_dir|shared_dir)$")
)

; Platform and framework options
(setting
  (setting_name) @keyword.directive
  (#match? @keyword.directive "^(platform|platform_packages|framework|board|board_build\\.mcu|board_build\\.f_cpu|board_build\\.ldscript)$")
)

; Build options
(setting
  (setting_name) @keyword.control
  (#match? @keyword.control "^(build_type|build_flags|build_src_flags|build_unflags|build_src_filter|targets|extends|extra_scripts)$")
)

; Library options
(setting
  (setting_name) @keyword.import
  (#match? @keyword.import "^(lib_deps|lib_ignore|lib_extra_dirs|lib_ldf_mode|lib_compat_mode|lib_archive)$")
)

; Upload options
(setting
  (setting_name) @keyword.function
  (#match? @keyword.function "^(upload_port|upload_protocol|upload_speed|upload_flags|upload_resetmethod|upload_command)$")
)

; Monitor options
(setting
  (setting_name) @keyword.function
  (#match? @keyword.function "^(monitor_port|monitor_speed|monitor_parity|monitor_filters|monitor_rts|monitor_dtr|monitor_eol|monitor_raw|monitor_echo|monitor_encoding)$")
)

; Debug options
(setting
  (setting_name) @keyword.operator
  (#match? @keyword.operator "^(debug_tool|debug_build_flags|debug_init_break|debug_init_cmds|debug_extra_cmds|debug_load_cmds|debug_load_mode|debug_server|debug_port|debug_speed|debug_svd_path|debug_server_ready_pattern|debug_test)$")
)

; Test options
(setting
  (setting_name) @keyword.operator
  (#match? @keyword.operator "^(test_framework|test_filter|test_ignore|test_port|test_speed|test_build_src|test_testing_command)$")
)

; Check options
(setting
  (setting_name) @keyword.operator
  (#match? @keyword.operator "^(check_tool|check_flags|check_severity|check_skip_packages|check_src_filters)$")
)

; Boolean values
((setting_value) @boolean
  (#match? @boolean "^(true|false|yes|no|on|off)$"))

; Variable interpolation - built-in variables (must come before general string highlighting)
((setting_value) @variable.builtin
  (#match? @variable.builtin "\\$\\{(PROJECT_DIR|PROJECT_HASH|UNIX_TIME)\\}")) ; built-in variables

; Variable interpolation - section references
((setting_value) @variable
  (#match? @variable "\\$\\{[a-zA-Z][a-zA-Z0-9_]*\\.[a-zA-Z][a-zA-Z0-9_]*\\}")) ; section.option

; Variable interpolation - this references
((setting_value) @variable.parameter
  (#match? @variable.parameter "\\$\\{this\\.[a-zA-Z][a-zA-Z0-9_]*\\}")) ; this.option

; Setting values with enhanced highlighting (distinct from property names)
(setting_value) @string.quoted

; Library dependencies with owner/name format
((setting_value) @constant
  (#match? @constant "^[a-zA-Z0-9_\\-]+/[a-zA-Z0-9_\\-\\.\\s]+")) ; owner/library format

; Git URLs
((setting_value) @string.special.url
  (#match? @string.special.url "https?://[^\\s]+\\.git")) ; Git URLs

; Regular URLs
((setting_value) @string.special.url
  (#match? @string.special.url "https?://[^\\s]+")) ; URLs

; Version constraints
((setting_value) @number
  (#match? @number "@[~^>=<!=]*[0-9\\.]+")) ; version constraints

; Semantic version numbers
((setting_value) @number
  (#match? @number "^[0-9]+\\.[0-9]+\\.[0-9]+")) ; semantic versions


; File paths (Unix and Windows)
((setting_value) @string.special.path
  (#match? @string.special.path "^[\\./~][^\\s]*")) ; Unix-style paths

((setting_value) @string.special.path
  (#match? @string.special.path "^[A-Za-z]:[\\\\][^\\s]*")) ; Windows-style paths

; Build flags
((setting_value) @attribute
  (#match? @attribute "-[DIULWF]")) ; compile flags

; Text nodes for multiline values support
; Text nodes that contain owner/library format (for multiline lib_deps)
((text) @constant
  (#match? @constant "^\\s*[a-zA-Z0-9_\\-]+/[a-zA-Z0-9_\\-\\s\\.]+")) ; indented owner/library format (before comment)

; Text nodes with variable interpolation - built-in variables (with optional whitespace)
((text) @variable.builtin
  (#match? @variable.builtin "^\\s*\\$\\{(PROJECT_DIR|PROJECT_HASH|UNIX_TIME)\\}\\s*$")) ; built-in variables in text

; Text nodes with variable interpolation - section references (with optional whitespace)
((text) @variable
  (#match? @variable "^\\s*\\$\\{[a-zA-Z][a-zA-Z0-9_]*\\.[a-zA-Z][a-zA-Z0-9_]*\\}\\s*$")) ; section.option in text

; Text nodes with variable interpolation - this references (with optional whitespace)
((text) @variable.parameter
  (#match? @variable.parameter "^\\s*\\$\\{this\\.[a-zA-Z][a-zA-Z0-9_]*\\}\\s*$")) ; this.option in text

; Text nodes with build flags (for multiline build_flags)
((text) @attribute
  (#match? @attribute "^\\s*-[DIULWF][^\\s]*")) ; indented compile flags

; Text nodes with version constraints
((text) @number
  (#match? @number "@[~^>=<!=]*[0-9\\.]+")) ; version constraints in text

; Text nodes with Git URLs
((text) @string.special.url
  (#match? @string.special.url "^\\s*https?://[^\\s]+\\.git")) ; Git URLs in multiline (before comment)

; Text nodes with library names (simple names without owner)
((text) @string.special
  (#match? @string.special "^\\s*[a-zA-Z][a-zA-Z0-9_\\-]*\\s*$")) ; simple library names

; Text nodes with any library dependency pattern (catch-all for multiline lib_deps)
((text) @string
  (#match? @string "^\\s+[^;\\s]")) ; any indented non-comment text