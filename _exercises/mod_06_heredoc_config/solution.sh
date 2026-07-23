#!/bin/bash
DB_HOST="db.local"
DB_PORT="3306"
OUT_FILE="db_config.ini"

cat <<EOF > "$OUT_FILE"
[database]
host = ${DB_HOST}
port = ${DB_PORT}
driver = mysql
EOF
echo "Configuration written to $OUT_FILE"
