# Developing with Docker

This demo app shows a simple user profile app set up using

- index.html with pure js and css styles
- nodejs backend with express module
- mongodb for data storage

All components are docker-based.

## With Docker

Step 1: Create docker network

    docker network create mongo-network 

Step 2: Start mongodb

    docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --name mongodb --net mongo-network mongo    

Step 3: Start mongo-express

    docker run -d -p 8081:8081 -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=password --net mongo-network --name mongo-express -e ME_CONFIG_MONGODB_SERVER=mongodb mongo-express   

_NOTE: Creating docker-network in optional. You can start both containers in a default network. In this case, just emit `--net` flag in `docker run` command_

Step 4: Open mongo-express from browser

    http://localhost:8081

Step 5: Create `user-account` _db_ and `users` _collection_ in mongo-express

Step 6: Start your nodejs application locally

    cd app
    npm install 
    node server.js

Step 7: Access you nodejs application UI from browser

    http://localhost:3000

## With Docker Compose

### To start the application

Step 1: Start mongodb and mongo-express

    docker-compose -f docker-compose.yml up

Step 2: Open mongo-express from browser

    http://localhost:8080

Step 3: Start your nodejs application locally

    cd app
    npm install
    node server.js

Step 4: Access you nodejs application UI from browser

    http://localhost:3000

### To build a docker image from the application

    docker build -t my-app:1.0 .       

The dot "." at the end of the command denotes location of the Dockerfile.
