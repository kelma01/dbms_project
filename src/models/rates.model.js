const sql = require('../config/db_config');

const Rate = function(rate) {
    this.r_star = rate.r_star;
    this.r_comment = rate.r_comment;
    this.r_date = rate.r_date;
    this.user_id = rate.user_id;
    this.movie_id = rate.movie_id;
};

Rate.create = (newRate, result) => {
    sql.query("INSERT INTO rates SET ?", newRate, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
        }
        result(null, { id: res.insertId, ...newRate });
    });
};

Rate.getAll = (result) => {
    sql.query("SELECT * FROM rates", (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        result(null, res);
    });
};

Rate.findByUserId = (userId, result) => {
    sql.query("SELECT * FROM rates WHERE user_id = ?", userId, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        result(null, res);
    });
};

Rate.findByMovieId = (movieId, result) => {
    sql.query("SELECT * FROM rates WHERE movie_id = ?", movieId, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        result(null, res);
    });
};


Rate.remove = (id, result) => {
    sql.query("DELETE FROM rates WHERE rate_id = ?", id, (err, res) => {
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

module.exports = Rate;