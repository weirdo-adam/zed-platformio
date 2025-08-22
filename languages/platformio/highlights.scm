; Environment sections
(section_name
  (text) @constructor
  (#match? @constructor "^env:"))

; Other sections
(section_name
  (text) @type)

(comment) @comment

[
  "["
  "]"
] @punctuation.bracket

"=" @operator

; === SETTING NAMES ===

; Platform and hardware
(setting
  (setting_name) @keyword
  (#match? @keyword "^(platform|platform_packages|framework)$"))

; Board configuration
(setting
  (setting_name) @keyword
  (#match? @keyword "^(board|board_build\\.[a-zA-Z_]+|board_upload\\.[a-zA-Z_]+)$"))

; Build system
(setting
  (setting_name) @function
  (#match? @function "^(build_type|build_flags|build_src_flags|build_unflags|build_src_filter|targets)$"))

; Library management
(setting
  (setting_name) @constant
  (#match? @constant "^(lib_deps.*|lib_ignore|lib_extra_dirs|lib_ldf_mode|lib_compat_mode|lib_archive)$"))

; Upload and monitor
(setting
  (setting_name) @primary
  (#match? @primary "^(upload_|monitor_)"))

; Debug and test
(setting
  (setting_name) @operator
  (#match? @operator "^(debug_|test_)"))

; === SETTING VALUES ===

; Boolean values (highest priority)
(setting_value) @boolean
(#match? @boolean "^(true|false|yes|no|on|off)$")

; Numbers (must be complete numbers)
(setting_value) @number
(#match? @number "^[0-9]+[LlUu]*$")

; URLs
(setting_value) @link_uri
(#match? @link_uri "^https?://")

; Variables
(setting_value) @variable.special
(#match? @variable.special "\\$\\{[^}]+\\}")

; Default strings (lowest priority)
(setting_value) @string
