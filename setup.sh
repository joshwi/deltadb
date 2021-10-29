# Change to /app directory
cd app
# Make sure all downloads and repositories are removed
rm neo4j/*.zip
rm neo4j/*.csv
rm -rf neo4j/deltadb
rm -rf neo4j/__MACOSX
rm -rf deltadb-ui
rm -rf deltadb-api
rm -rf deltadb-backup
rm -rf go-scripts
# Reclone repositories to get latest version
git clone https://github.com/joshwi/deltadb-ui.git
git clone https://github.com/joshwi/deltadb-api.git
git clone https://github.com/joshwi/deltadb-backup.git
git clone https://github.com/joshwi/go-scripts.git
cd ..
# Copy .env to all subdirectories
cp .env app/deltadb-api/app/.env
cp .env app/deltadb-ui/.env
cp .env app/neo4j/.env
cp .env app/go-scripts/.env
# Load DB Backups to /neo4j directory
cp app/deltadb-backup/nfl.zip app/neo4j/nfl.zip
cd app/neo4j
unzip nfl.zip -d deltadb/
rm -rf __MACOSX