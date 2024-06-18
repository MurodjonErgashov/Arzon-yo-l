const express = require("express");
const app = express();
const isDriver = require("../middleware/isDriver");
const isClient = require("../middleware/isClient")


app.use(express.static(__dirname + '/public'));
app.use("/", require("./user"));
 app.use("/driver/"/*,[isDriver.authSession],*/, require("./driver"));
 app.use("/client/"/*,[isClient.authSession],*/, require("./client"));

module.exports = app;