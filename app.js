const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.status(200).send("MarketForge API running 2");
});

module.exports = app;
