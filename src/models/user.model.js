const sql = require('../config/db_config');

const User = function(user) {
  this.user_id = user.user_id;
  this.name = user.name;
  this.surname = user.surname;
  this.pw_hash = user.pw_hash;
  this.movies_watched = user.movies_watched,
  this.birth_date = user.birth_date,
  this.tickets = user.tickets;
  this.wallet_id = user.wallet_id;
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