require('dotenv').config();
const express = require('express');
const cors = require('cors');
const dns = require('dns');
const bodyParser = require('body-parser');
const app = express();

// Basic Configuration
const port = process.env.PORT || 3000;

let urls = {};

app.use(bodyParser.urlencoded({ encoded: false }));

app.use(cors());

app.use('/public', express.static(`${process.cwd()}/public`));

app.get('/', function (req, res) {
  res.sendFile(process.cwd() + '/views/index.html');
});

// Your first API endpoint
app.get('/api/hello', function (req, res) {
  res.json({ greeting: 'hello API' });
});

//return json when correct url entered
app.post("/api/shorturl", (req, res) => {
  isUrlReal(req.body.url)
    .then(isReal => {
      if (isReal) {
        urls["1"] = req.body.url
        res.json({ "original_url": req.body.url, "short url": 1 })
      } else {
        res.json({ error: "invalid url" });
      }
    })
    .catch(err => {
      console.error('Error', err);
    });
})

//redirect to long url
app.get("/api/shorturl/:shortUrl", (req, res) => {
  res.redirect(urls[req.params.shortUrl]);
})

//check if url is real
function isUrlReal(url) {
  const hostname = new URL(url).hostname;
  return new Promise((resolve, reject) => {
    dns.lookup(hostname, (err, address, family) => {
      if (err) {
        resolve(false);
      } else {
        resolve(true);
      }
    })
  })
}

app.listen(port, function () {
  console.log(`Listening on port ${port}`);
});
