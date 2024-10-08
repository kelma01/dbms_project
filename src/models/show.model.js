const sql = require('../config/db_config');

const Show = function(show) {
  this.movie_id = show.movie_id;
  this.theater_id = show.theater_id;
  this.show_day = show.show_day;
  this.show_hour = show.show_hour;
};

// Show oluşturma
Show.create = (newShow, result) => {
  sql.query("INSERT INTO shows SET ?", newShow, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }
    result(null, { id: res.insertId, ...newShow });
  });
};

// movie_id ile show bulma
Show.findByMovieId = (movie_id, result) => {
    sql.query("SELECT * FROM shows WHERE movie_id = ?", [movie_id], (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
        return;
      }
      if (res.length) {
        result(null, res);
        return;
      }
      result({ kind: "not_found" }, null);
    });
  };
  
  // theater_id ile show bulma
  Show.findByTheaterId = (theater_id, result) => {
    sql.query("SELECT * FROM shows WHERE theater_id = ?", [theater_id], (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
        return;
      }
      if (res.length) {
        result(null, res);
        return;
      }
      result({ kind: "not_found" }, null);
    });
  };
  Show.findbyTheaterMovieId = (theater_id, movie_id, result) => {
    sql.query("SELECT * FROM shows WHERE theater_id = ? AND movie_id = ?", [theater_id, movie_id], (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
        return;
      }
      if (res.length) {
        result(null, res);
        return;
      }
      result({ kind: "not_found" }, null);
    });
  };

// Tüm gösterileri getirme
Show.getAll = (result) => {
  sql.query("SELECT * FROM shows", (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }
    result(null, res);
  });
};

// Gösteriyi güncelleme
Show.update = (id, show, result) => {
  sql.query(
    "UPDATE shows SET movie_id = ?, theater_id = ?, show_time = ? WHERE show_id = ?",
    [show.movie_id, show.theater_id, show.show_time, id],
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

// Gösteriyi silme
Show.remove = (id, result) => {
  sql.query("DELETE FROM shows WHERE show_id = ?", id, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }
    if (res.affectedRows == 0) {
      result({ kind: "not_found" }, null);
      return;
    }
    result(null, res);
  });
};

module.exports = Show;