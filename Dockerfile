FROM node:20.10.0-alpine AS runner

ENV NODE_ENV=production

WORKDIR /app

COPY runner/package.json runner/package-lock.json ./
RUN npm install --omit=dev

# install express for health server
RUN npm install express

COPY settings.js /app/settings.js
COPY health.js /app/health.js

EXPOSE 1880
EXPOSE 80

CMD ["sh", "-c", "node health.js & npm start"]