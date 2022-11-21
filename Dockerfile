FROM node:current-alpine3.15

ENV MONGO_DB_USERNAME=admin \
MONGO_DB_PWD=password  

RUN mkdir -p home/app

COPY ./app home/app

# Set default dir so that next commands executes in /home/app dir 
WORKDIR /home/app

# npm install in /home/app 
RUN npm install

# Start your nodejs application in /home/app
CMD ["node", "server.js"]