var express = require('express');
var app = express();
var osc = require('node-osc');

var port = 8080;
app.listen(port, function() {
  console.log("Start / port:", port)
});

app.get('/', function(req, res) {
  var name = req.query.name;
  res.send("Hello, " + name);

  var sendCount = 0;
  var oscClient = new osc.Client('127.0.0.1', 6000);
  var sendMsg = new osc.Message(name);
  oscClient.send(sendMsg);
});
