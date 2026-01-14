#!/bin/bash

# ==============================
# MongoDB Remote Backup Script
# ==============================

# MongoDB connection details
MONGO_HOST="remote.mongodb.server"
MONGO_PORT="27017"
MONGO_USER="backupuser"
MONGO_PASSWORD="StrongPassword"
AUTH_DB="admin"
DATABASE_NAME="mydatabase"

# Backup directory
BACKUP_BASE_DIR="/opt/mongo-backups"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_DIR="$BACKUP_BASE_DIR/$DATABASE_NAME-$DATE"

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Run mongodump
mongodump \
  --host "$MONGO_HOST" \
  --port "$MONGO_PORT" \
  --username "$MONGO_USER" \
  --password "$MONGO_PASSWORD" \
  --authenticationDatabase "$AUTH_DB" \
  --db "$DATABASE_NAME" \
  --out "$BACKUP_DIR"

# Check status
if [ $? -eq 0 ]; then
    echo "✅ MongoDB backup successful: $BACKUP_DIR"
else
    echo "❌ MongoDB backup failed"
    exit 1
fi

# Optional: Compress backup
tar -czf "$BACKUP_DIR.tar.gz" -C "$BACKUP_BASE_DIR" "$(basename $BACKUP_DIR)"
rm -rf "$BACKUP_DIR"

echo "📦 Backup compressed: $BACKUP_DIR.tar.gz"




#############  Using MongoDB String ##############


#!/bin/bash

MONGO_URI="mongodb://backupuser:StrongPassword@remote.mongodb.server:27017/mydatabase?authSource=admin"

BACKUP_DIR="/opt/mongo-backups/backup-$(date +%F-%H%M)"
mkdir -p "$BACKUP_DIR"

mongodump --uri="$MONGO_URI" --out="$BACKUP_DIR"

if [ $? -eq 0 ]; then
  echo "✅ Backup completed"
else
  echo "❌ Backup failed"
  exit 1
fi
