const express = require('express');
const app = express();
const PORT = 3001;
const bodyParser = require('body-parser');
const db = require('./config/db_config');
const cors = require('cors');

app.use(cors());

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.use((req, res, next) => {
    console.log(`${req.method}:${req.url}`);
    next();
});


require('./routes/user.routes')(app);
require('./routes/wallet.routes')(app);
require('./routes/credit_card.routes')(app);
require('./routes/cinema.routes')(app);
require('./routes/theater.routes')(app);
require('./routes/seat.routes')(app);
require('./routes/movie.routes')(app);
require('./routes/actor_actress.routes')(app);
require('./routes/ticket.routes')(app);
require('./routes/rates.routes')(app);

app.listen(PORT, () => console.log(`Running Server on Port ${PORT}`));

