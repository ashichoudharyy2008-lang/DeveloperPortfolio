#!/bin/bash

# Author: Ashi Choudhary
# Roll Number: 2601730018
# Purpose: Create timestamped compressed folder backups

if [ $# -eq 0 ]; then
    echo "Usage: ./backup.sh <folder>"
    exit 1
fi

SOURCE="$1"

if [ ! -d "$SOURCE" ]; then
    echo "Error: Folder does not exist: $SOURCE"
    exit 1
fi

BACKUP_DIR="$HOME/DeveloperPortfolio_Backups"
mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
FOLDER_NAME=$(basename "$SOURCE")
ARCHIVE="$BACKUP_DIR/backup_${TIMESTAMP}.tar.gz"

if tar -czf "$ARCHIVE" -C "$(dirname "$SOURCE")" "$FOLDER_NAME"; then
    SIZE=$(du -h "$ARCHIVE" | awk '{print $1}')

    echo "Backup created successfully!"
    echo "Filename: $(basename "$ARCHIVE")"
    echo "Size: $SIZE"

    echo "$TIMESTAMP | SUCCESS | $(basename "$ARCHIVE") | $SIZE" >> "$BACKUP_DIR/backup.log"
else
    echo "Error: Backup creation failed."

    echo "$TIMESTAMP | FAILED | $SOURCE" >> "$BACKUP_DIR/backup.log"
    exit 1
fi
