// index.js
// where your node app starts

// init project
var express = require('express');
var app = express();

// enable CORS (https://en.wikipedia.org/wiki/Cross-origin_resource_sharing)
// so that your API is remotely testable by FCC 
var cors = require('cors');
app.use(cors({ optionsSuccessStatus: 200 }));  // some legacy browsers choke on 204

// http://expressjs.com/en/starter/static-files.html
app.use(express.static('public'));

// http://expressjs.com/en/starter/basic-routing.html
app.get("/", function (req, res) {
  res.sendFile(__dirname + '/views/index.html');
});


// your first API endpoint... 
app.get("/api/hello", function (req, res) {
  res.json({ greeting: 'hello API' });
});

//Timestamp API
app.get("/api/:date?", (req, res) => {
  let date = req.params.date;
  let unix;

  //If no date was entered
  if(date === undefined) {
    date = new Date();
  }

  //check if unix or date was entered
  if (Number(date)) {
    unix = Number(date);
    date = new Date(Number(date));
  } else {
    unix = Math.floor(new Date(date).getTime());
    date = new Date(date);
  }

  //if invalid date is entered
  if (isNaN(date.getTime())) {
    return res.json({ error: "Invalid Date" })
  }

  date = date.toUTCString();
  res.json({"unix": unix, "utc": date})
})


// Listen on port set in environment variable or default to 3000
var listener = app.listen(process.env.PORT || 3000, function () {
  console.log('Your app is listening on port ' + listener.address().port);
});
