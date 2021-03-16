FROM node:alpine As development

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/app

COPY package*.json ./

RUN apk add --update python make g++\
   && rm -rf /var/cache/apk/*

RUN npm install

COPY . .

# Сбилдим бек
RUN npm run build

EXPOSE $PORT

CMD ["node", "dist/main"]
