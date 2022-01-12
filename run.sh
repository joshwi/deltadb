sudo docker create deltadb
sudo docker run -d --net deltadb --env-file .env  --name neo4j -p 7474:7474 -p 7687:7687 -v /Users/josh/Desktop/repos/nfldb-backup:/var/lib/neo4j/import jshwilliams/neo4j
sudo docker run -d --net deltadb --env-file .env  --name redis -p 6379:6379 jshwilliams/redis
sudo docker run -d --net deltadb --env-file .env  --name deltadb-api -p 5000:5000 jshwilliams/deltadb-api
sudo docker run -d --net deltadb --env-file .env  --name deltadb-ui -p 80:80 -p 443:443 jshwilliams/deltadb-ui
sudo docker run -d --net deltadb --env-file .env  --name deltadb-collector -v /Users/josh/Desktop/repos/nfldb-backup:/app/repos jshwilliams/deltadb-collector
