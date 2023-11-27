const express = require('express')
const app = express()

app.get('/', function (req, res) {
  res.send('Hello World')
})

console.log("Hello world!");
console.log("http://localhost:3000");

app.listen(3000)
