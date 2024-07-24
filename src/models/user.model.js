const sql = require('../config/db_config');
const crypto = require('crypto');

const User = function(user) { 
  this.email = user.email;
  this.name = user.name;
  this.surname = user.surname;
  this.password = user.password;
  this.movies_watched = user.movies_watched,
  this.birth_date = user.birth_date,
  this.tickets = user.tickets;
};


User.create = (newUser, result) => {
  sql.query("INSERT INTO user SET ?", newUser, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }
    result(null, { id: res.insertId, ...newUser });
  });
};

User.findByEmail = (email, result) => {
  sql.query(`SELECT * FROM user WHERE email = '${email}'`, (err ,res) => {
    if(err){
      console.log("error: ", err);
      result(err, null);
      return;
    }
    if(res.length){
      result(null, res[0]);
      return;
    }
    result({ kind: "not_found" }, null);
  })
}

User.getAll = (result) => {
  sql.query("SELECT * FROM user", (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }
    result(null, res);
  });
};

module.exports = User;