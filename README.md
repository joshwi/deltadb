# deltaDB Statistical Analysis App

## Table of contents
* [Technologies](#technologies)
* [Setup](#setup)

## Technologies

### deltaDB UI

- deltaDB UI is a react web application that uses the deltaDB REST Server to display football statistics.

### deltaDB Server

- deltaDB Server is an REST API server that communicates with the React.js frontend, Redis Cache, and Neo4j Graph DB.

### Neo4j DB

- Graph DB Backend for storing key value nodes and relationships between nodes.

### Redis Cache

- Redis Cache keeps track of background tasks for the API and caches common queries from the React frontend.

## Setup

1. Clone the deltaDB Repository 
```
git clone https://github.com/joshwi/deltadb.git
```
2. Create .env file: 
```
touch .env
```
3. Open .env in editor: 
```
nano .env
```
4. Paste variables and input proper values
```
PROXY_URL=http://localhost:5000
NEO4J_USERNAME=neo4j
NEO4J_PASSWORD=password123
NEO4J_SERVICE_HOST=neo4j
NEO4J_SERVICE_PORT=7687
REDIS_SERVICE_HOST=redis
REDIS_SERVICE_PORT=6379
DELTADB_SERVICE_HOST=localhost
DELTADB_SERVICE_PORT=5000
```
5. Run setup shell script: 
```
bash setup.sh
```
6. Run docker-compose file to build app: 
```
sudo docker-compose up -d
```
7. Load data into Neo4j DB with this REST request:
```
curl --location --request POST 'http://localhost:5000/api/v2/admin/db/transactions/import' \
--header 'Content-Type: application/json
```
The POST request will respond in this format:
```
{
    "message": "Neo4j Transaction Running",
    "correlationID": "6c08f6eb-dd04-4b79-b80b-90675e5fc1fa"
}
```
8. Verify all the import transactions have completed with this REST request:
```
curl --location --request GET 'http://localhost:5000/api/v2/admin/correlationID/6c08f6eb-dd04-4b79-b80b-90675e5fc1fa' \
--header 'Content-Type: application/json'
```
The GET request will respond in this format:
```
[
    {
        "message": "Neo4j Transaction Status",
        "file": "colors.json",
        "correlationID": "6c08f6eb-dd04-4b79-b80b-90675e5fc1fa",
        "status": "Completed"
    },
    {
        "message": "Neo4j Transaction Status",
        "file": "games.json",
        "correlationID": "6c08f6eb-dd04-4b79-b80b-90675e5fc1fa",
        "status": "Completed"
    },
    {
        "message": "Neo4j Transaction Status",
        "file": "keys.json",
        "correlationID": "6c08f6eb-dd04-4b79-b80b-90675e5fc1fa",
        "status": "Completed"
    },
    {
        "message": "Neo4j Transaction Status",
        "file": "pfr_team_season_games.json",
        "correlationID": "6c08f6eb-dd04-4b79-b80b-90675e5fc1fa",
        "status": "Completed"
    }
]
```
9. Navigate to URL:
```
http://localhost
```