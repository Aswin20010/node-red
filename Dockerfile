FROM node:20.10.0 AS runner

ENV NODE_ENV=production
ENV NODE_RED_USER_DIR=/data

WORKDIR /app

# If this fails in your network too, comment it temporarily.
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

COPY runner/package.json runner/package-lock.json ./
RUN npm install --omit=dev
RUN npm install express

COPY settings.js /app/settings.js
COPY health.js /app/health.js

COPY docker-ui-public /app/node_modules/@node-red/editor-client/public

EXPOSE 1880
EXPOSE 80

CMD ["sh", "-c", "node health.js & npm run start:docker"]