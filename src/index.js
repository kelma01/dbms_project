const express = require('express');
const mysql = require('mysql');
const app = express();
const PORT = 3001;
const movieRoute = require('./routes/movies')
const cinemaRoute = require('./routes/cinemas')

//post req için kullanılan bir middleware
app.use(express.json());

app.use((req, res, next) => {
    console.log(`${req.method}:${req.url}`);
    next();
});

//gorcery route kullanılırken artik basina api path'i alacak get ve post requestlerde mesela postmandan atılırken
app.use('/api/movies', movieRoute);
app.use('/api/cinemas', cinemaRoute);

//localhost initialization
app.listen(PORT, () => console.log(`Running Server on Port ${PORT}`));

//db initialization
//eger authentication saglanamazsaMySQL workbench'e yandaki command'i gir -> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'user_şifreniz';
const connection = mysql.createConnection(
    {
        host: 'localhost',
        user: 'root',
        password: 'kerem',
        database: 'dbms_project',
    }
);

connection.connect();


connection.end();
