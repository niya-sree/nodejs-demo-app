# multibuild # Buils stage

FROM node:22-alpine AS build

WORKDIR /my-app

COPY package*.json ./

RUN npm ci

COPY . .

RUN npm test

# Production Stage

FROM node:22-alpine AS production

WORKDIR /my-app

ENV NODE_ENV=production

COPY --from=build /my-app/package*.json ./

RUN npm ci

COPY --from=build /my-app/app.js ./

EXPOSE 3000

CMD [ "node", "app.js" ]
