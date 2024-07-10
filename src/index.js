const express = require('express');
const app = express();
const PORT = 3001;
const bodyParser = require('body-parser');
const db = require('./config/db_config');


//post req için kullanılan bir middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.use((req, res, next) => {
    console.log(`${req.method}:${req.url}`);
    next();
});

//routers
require('./routes/user.routes')(app);
require('./routes/wallet.routes')(app);


//localhost initialization
app.listen(PORT, () => console.log(`Running Server on Port ${PORT}`));
