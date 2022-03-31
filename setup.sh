# Change to /app directory
mkdir repos
cd app
# Make sure all downloads and repositories are removed
rm -rf deltadb-ui
rm -rf deltadb-api
rm -rf go-scripts
# Reclone repositories to get latest version
git clone https://github.com/joshwi/deltadb-ui.git
git clone https://github.com/joshwi/deltadb-api.git
git clone https://github.com/joshwi/go-scripts.git
cd ../repos
rm -rf deltadb-backup
rm -rf deltadb-artifacts
git clone https://github.com/joshwi/deltadb-backup.git
git clone https://github.com/joshwi/deltadb-artifacts.git
cd ..
# Copy .env to all subdirectories
cp .env app/deltadb-api/app/.env
cp .env app/deltadb-ui/.env
cp .env app/deltadb-ui/app/.env
cp .env app/neo4j/.env
cp .env app/go-scripts/.env
