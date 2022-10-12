const sass = require('sass');
const fs = require('fs');
const path = require('path');

const styleCompressed = sass.compile('public/scss/style.scss');
// const styleCompressed = sass.compile('public/scss/style.scss', {style: "compressed"});

console.log("");
console.log("Converting scss to css...");

function executeConversion(){
  const result = fs.writeFileSync(
    path.join(
      __dirname,
      'public/css/style.css'
    ),
    styleCompressed.css.toString()
  );
}

executeConversion();
//const converion = setInterval(executeConversion, 500);