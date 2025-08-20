; Section names
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

; Property names
(setting
  (setting_name) @property)

; Setting values with enhanced highlighting
(setting_value) @string

; Special highlighting for PlatformIO-specific patterns in setting values
(setting_value
  (#match? @string "^[a-zA-Z0-9_\\-]+/[a-zA-Z0-9_\\-]+") ; owner/library format
) @constant

(setting_value
  (#match? @string "https?://[^\\s]+") ; URLs
) @string.special.url

(setting_value
  (#match? @string "@[~^>=<!=]*[0-9\\.]+") ; version constraints
) @number

(setting_value
  (#match? @string "\\$\\{[^}]+\\}") ; variable interpolation
) @variable
