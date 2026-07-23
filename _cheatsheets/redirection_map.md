# Redirection & File Descriptors Cheatsheet

| Redirection | Target Stream | Description |
| :--- | :--- | :--- |
| `>` | Standard Output (1) | Redirect output, overwrites file |
| `>>` | Standard Output (1) | Redirect output, appends to file |
| `2>` | Standard Error (2) | Redirect errors, overwrites file |
| `&>` | Stdout & Stderr | Redirect both streams (overwrites) |
| `<` | Standard Input (0) | Feed file contents into command |
| `2>&1` | Stderr (2) | Merge stderr into stdout stream |
| `<<EOF` | Standard Input (0) | Feed multi-line Here-document |
| `<<<` | Standard Input (0) | Feed Here-string |
| `3>&1` | Custom (3) | Duplicate stdout to descriptor 3 |
| `exec 3>&-` | Custom (3) | Close descriptor 3 |
