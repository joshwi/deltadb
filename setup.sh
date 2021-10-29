# Change to /app directory
cd app
# Make sure all downloads and repositories are removed
rm neo4j/*.zip
rm -rf neo4j/deltadb
rm -rf neo4j/__MACOSX
rm -rf deltadb-ui
rm -rf deltadb-api
rm -rf deltadb-backup
rm -rf go-utils
# Reclone repositories to get latest version
git clone https://github.com/joshwi/deltadb-ui.git
git clone https://github.com/joshwi/deltadb-api.git
git clone https://github.com/joshwi/deltadb-backup.git
git clone https://github.com/joshwi/go-utils.git
cd ..
# Copy .env to all subdirectories
# cp .env app/deltadb-api/app/.env
# cp .env app/deltadb-ui/.env
# cp .env app/neo4j/.env
# cp .env app/go-utils/.env
# Load DB Backups to /neo4j directory
cp app/deltadb-backup/deltadb.zip app/neo4j/deltadb.zip
cd app/neo4j
unzip deltadb.zip
rm -rf __MACOSX