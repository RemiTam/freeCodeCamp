require('dotenv').config();
const express = require('express');
const cors = require('cors');
const app = express();
const bodyParser = require("body-parser");
const { MongoClient } = require('mongodb');
const dns = require("dns");

// Basic Configuration
const port = process.env.PORT || 3000;

app.use(bodyParser.urlencoded({
  extended: false,
}));

app.use(cors());

app.use('/public', express.static(`${process.cwd()}/public`));

app.get('/', function(req, res) {
  res.sendFile(process.cwd() + '/views/index.html');
});

// Your first API endpoint
app.get('/api/hello', function(req, res) {
  res.json({ greeting: 'hello API' });
});

app.listen(port, function() {
  console.log(`Listening on port ${port}`);
});



const uri = process.env.MONGO_URI;
const client = new MongoClient(uri);

async function createShortUrl(url, id) {
    //  client.connect();
    const database = client.db("freeCodeCamp");
    const urls = database.collection("urls");
    const doc = {_id: `${id}`, url: url};
    const result = await urls.insertOne(doc)
    console.log("An url was inserted.")
    return result.insertedId;
}

async function getShortUrl(id) {
  const database = client.db("freeCodeCamp");
  const urls = database.collection("urls");
  const query = { _id: id };
  const options = { projection: {_id: 0, url: 1}}
  const result = await urls.findOne(query, options);
  return result.url;
}

app.post("/api/shorturl", async function(req, res, next) {
  const url = new URL(req.body.url).hostname;
  const id = Math.floor(Math.random() * 10000) + 1;

  dns.lookup(url, (error, ip, address) => {
    if (error) {
      res.json({
        error: "invalid url"
      })
    } else {
      createShortUrl(req.body.url, id);
      req.shortUrl = `${id}`;
      next();
    }
  });
}, function(req, res) {
  console.log(req.shortUrl);
   res.json({
    "original_url": req.body.url,
    "short_url": req.shortUrl,
   })
})

app.get("/api/shorturl/:shorturl", async function(req, res) {
  const id = req.params.shorturl;
  console.log(id);
  const url = await getShortUrl(id);
  res.redirect(301, url)
})