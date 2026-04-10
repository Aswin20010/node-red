#It uses enterprise approved Node
FROM node:20.10.0-alpine AS runner

ENV NODE_ENV=production

WORKDIR /app

COPY runner/package.json runner/package-lock.json ./
RUN npm ci --omit=dev

COPY settings.js /app/settings.js

EXPOSE 1880

CMD ["npm", "start"]