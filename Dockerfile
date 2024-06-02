FROM node:lts-alpine as builder

USER node

RUN mkdir /home/node/src

WORKDIR /home/node/src

COPY --chown=node:node package-lock.json package.json ./

RUN npm ci

COPY --chown=node:node . .

RUN npm run generate


FROM nginx:alpine 

RUN mkdir /app

COPY --from=builder /home/node/src/.output/public /app

COPY nginx.conf /etc/nginx/nginx.conf