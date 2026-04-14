const express = require('express');
const app = express();

app.get('/healthcheck', (req, res) => {
  res.status(200).send('OK');
});

app.listen(8080, () => {
  console.log('Healthcheck server running on port 8080');
});