FROM node:alpine As development

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install --only=production

EXPOSE $PORT

CMD ["node", "dist/server"]
