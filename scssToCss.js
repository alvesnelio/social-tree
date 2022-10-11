const sass = require('sass');
const fs = require('fs');
const path = require('path');

const styleCompressed = sass.compile('public/scss/style.scss', {style: "compressed"});

fs.writeFileSync(
  path.join(
      __dirname,
      'public/css/style.css'
    ),
    styleCompressed.css.toString()
  )
;