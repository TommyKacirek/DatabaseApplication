DATABASE_NAME=project
BACKUP_DIR=D:/BackUp

FILENAME=backup-$(date +"%Y-%m-%d").sql


pg_dump --format=custom --dbname=postgresql://Kaca:heslo@localhost:5432/$DATABASE_NAME -f "$BACKUP_DIR/$FILENAME" 





