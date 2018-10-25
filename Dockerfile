FROM node:6.14.4-alpine

LABEL Mainttainer "ReneV@20181025"

RUN apk add --update tini && \
    mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install && \
    npm cache clean --force 

COPY . /usr/src/app

# CMD [/sbin/tini -- node ./bin/www] FOUT !!!

CMD ["/sbin/tini", "--","node","./bin/www"] # GOED!!!

EXPOSE 3000 80