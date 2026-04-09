FROM node:20.10.0-alpine

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .

ENV NODE_ENV=production

EXPOSE 1880

CMD ["npm", "start", "--", "--settings", "packages/node_modules/node-red/settings.js"]