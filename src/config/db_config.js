const mysql = require('mysql');

//db initialization
//eger authentication saglanamazsa MySQL workbench'e yandaki command'i gir -> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'user_şifreniz';
const connection = mysql.createConnection(
    {
        host: 'localhost',
        user: 'root',
        password: 'kerem',
        database: 'dbms_project',
    }
);

connection.connect(error => {
    if(error) throw error;
    console.log("Connected to Database!");
});

module.exports = connection;