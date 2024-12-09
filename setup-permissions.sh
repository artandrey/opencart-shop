#!/bin/bash

# Directories that need 777 permissions
DIRS_777=(
    "/var/www/html/system/storage/cache"
    "/var/www/html/system/storage/logs"
    "/var/www/html/system/storage/download"
    "/var/www/html/system/storage/upload"
    "/var/www/html/image"
    "/var/www/html/image/cache"
    "/var/www/html/image/catalog"
)

# Files that need 777 permissions
FILES_777=(
    "/var/www/html/config.php"
    "/var/www/html/admin/config.php"
)

# Set directory permissions
for dir in "${DIRS_777[@]}"; do
    if [ -d "$dir" ]; then
        chmod -R 777 "$dir"
        echo "Set 777 permissions for: $dir"
    fi
done

# Set file permissions
for file in "${FILES_777[@]}"; do
    if [ -f "$file" ]; then
        chmod 777 "$file"
        echo "Set 777 permissions for: $file"
    fi
done

# Set ownership
chown -R www-data:www-data /var/www/html 