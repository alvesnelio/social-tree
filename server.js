const express = require('express');
const app = express();

app.set('view engine', 'ejs');
app.use('/public', express.static('public'));
app.use('/node_modules', express.static('node_modules'));

app.get('/', (req, res) => {
  res.render('./pages/index');
});

app.listen(8080);

console.log("Server running on port 8080");