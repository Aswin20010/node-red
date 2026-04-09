FROM nodered/node-red:latest

# Copy your custom settings
COPY settings.js /data/settings.js

# Optional: install extra dependencies
RUN npm install passport-google-oauth20 passport

EXPOSE 1880

CMD ["node-red", "--settings", "/data/settings.js"]