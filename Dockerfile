# docker build -t imqs/htmlrender:master .

FROM node:lts

WORKDIR /usr/src/htmlrender

# We install in two phases, so that the npm install is generally cached, even if you change server.js

# This is the slow phase, where we download and install Puppeteer
COPY package*.json ./
RUN npm install

# This is the second phase, which is always very fast
COPY server.js ./

CMD ["npm", "start"]
