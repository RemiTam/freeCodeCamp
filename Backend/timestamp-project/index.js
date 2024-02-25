// index.js
// where your node app starts

// init project
var express = require('express');
var app = express();

// enable CORS (https://en.wikipedia.org/wiki/Cross-origin_resource_sharing)
// so that your API is remotely testable by FCC 
var cors = require('cors');
app.use(cors({optionsSuccessStatus: 200}));  // some legacy browsers choke on 204

// http://expressjs.com/en/starter/static-files.html
app.use(express.static('public'));

// http://expressjs.com/en/starter/basic-routing.html
app.get("/", function (req, res) {
  res.sendFile(__dirname + '/views/index.html');
});


// your first API endpoint... 
app.get("/api/hello", function (req, res) {
  res.json({greeting: 'hello API'});
});

//Timestamp API
app.get("/api/:date?", (req, res) => {
  let date = req.params.date;

  if(Number(date)) {
    const unix = date;
    date = new Date(Number(date));
    // const formattedDate = date.toLocaleString("en-US", {
    //   weekday: "short", // Short day name
    //   day: "2-digit", // 2-digit day of the month
    //   month: "short", // Short month name
    //   year: "numeric", // 4-digit year (e.g., 2015)
    //   timeZone: "UTC", // Ensure UTC time zone
    // });
    res.json({"unix": unix, "utc": date});
  } 
  else {
    const unix = Math.floor(new Date(date).getTime());
    date = new Date(date);
    res.json({"unix": unix, "utc": date});
  }
})


// Listen on port set in environment variable or default to 3000
var listener = app.listen(process.env.PORT || 3000, function () {
  console.log('Your app is listening on port ' + listener.address().port);
});
