#!/bin/sh

now=$(date +"%s_%Y-%m-%d")

archive="nextcloud-backup-${now}"

# Export the database
db_filename="./${MYSQL_DB}.sql"
/usr/bin/mysqldump --opt -h ${MYSQL_HOST} -u ${MYSQL_USER} -p${MYSQL_PASS} ${MYSQL_DB} > ${db_filename}

# Zip everything
zip "./${archive}.zip" ${db_filename} /nextcloud/config /nextcloud/data nextcloud/theme

rm ${db_filename}

# Copy
rsync -Aavx ./ ${remote}

