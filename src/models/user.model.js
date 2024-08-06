const sql = require('../config/db_config');
const crypto = require('crypto');

const User = function(user) {
  this.email = user.email;
  this.name = user.name;
  this.surname = user.surname;
  this.password = user.password;
  this.birth_date = user.birth_date;
  this.tickets = user.tickets;
};

User.findById = (UserId, result) => {
  sql.query("SELECT * FROM user WHERE user_id = ?", UserId, (err, res) => {
      if (err) {
          console.log("error: ", err);
          result(null, err);
          return;
      }
      if (res.length) {
          result(null, res[0]);
      } else {
          result({ kind: "not_found" }, null);
      }
  });
};

// Kullanıcı oluşturma
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

// Kullanıcıyı e-posta ile bulma
User.findByEmail = (email, result) => {
  sql.query("SELECT * FROM user WHERE email = ?", [email], (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }
    if (res.length) {
      result(null, res[0]);
      return;
    }
    result({ kind: "not_found" }, null);
  });
};

// Tüm kullanıcıları getirme
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

// Kullanıcı güncelleme
User.update = (id, user, result) => {
  sql.query(
    "UPDATE user SET name = ?, surname = ?, email = ?, birth_date = ? WHERE user_id = ?",
    [user.name, user.surname, user.email, user.birth_date, id],
    (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
        return;
      }
      if (res.affectedRows == 0) {
        result({ kind: "not_found" }, null);
        return;
      }
      result(null, res);
    }
  );
};

module.exports = User;
