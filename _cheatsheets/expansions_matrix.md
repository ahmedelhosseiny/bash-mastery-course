# Advanced Parameter Expansions Cheatsheet

| Syntax | Description | Example |
| :--- | :--- | :--- |
| `${var:-default}` | Return default if `var` is empty/unset | `${DB_PORT:-3306}` |
| `${var:=default}` | Set `var` to default if empty/unset | `${VERSION:=1.0}` |
| `${var:?message}` | Exit script with `message` if empty/unset | `${REQUIRED_VAR:?Variable is empty!}` |
| `${var:+value}` | Return `value` if `var` is set, otherwise empty | `${DEBUG:+--verbose}` |
| `${#var}` | Length of string `var` | `${#sequence}` |
| `${var#pattern}` | Strip shortest matching prefix | `${file#*.}` |
| `${var##pattern}` | Strip longest matching prefix | `${file##*.}` |
| `${var%pattern}` | Strip shortest matching suffix | `${file%.*}` |
| `${var%%pattern}` | Strip longest matching suffix | `${file%%.*}` |
| `${var/pattern/repl}` | Replace first match | `${name/ /_}` |
| `${var//pattern/repl}` | Replace all matches | `${name// /_}` |
| `${var,,}` | Lowercase string | `${sequence,,}` |
| `${var^^}` | Uppercase string | `${sequence^^}` |
