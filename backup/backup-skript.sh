

# set the database name and backup directory
DATABASE_NAME=project
BACKUP_DIR=D:/BackUp
# create a filename with the current date
FILENAME=backup-$(date +"%Y-%m-%d").sql

# use pg_dump to create a backup of the database
pg_dump --format=custom --dbname=postgresql://Kaca:heslo@localhost:5432/$DATABASE_NAME -f "$BACKUP_DIR/$FILENAME" 





