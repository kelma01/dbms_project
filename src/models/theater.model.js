const sql = require('../config/db_config');

const Theater = function(theater) {
    this.num_of_seats = theater.num_of_seats;
    this.cinema_id = theater.cinema_id;
};

Theater.create = (newTheater, result) => {
    sql.query("INSERT INTO theater SET ?", newTheater, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
        }
        result(null, { id: res.insertId, ...newTheater });
    });
};

Theater.getAll = (result) => {
    sql.query("SELECT * FROM theater", (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        result(null, res);
    });
};

Theater.findById = (id, result) => {
    sql.query("SELECT * FROM theater WHERE theater_id = ?", [id], (err, res) => {
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

Theater.updateById = (id, theater, result) => {
    sql.query(
        "UPDATE theater SET num_of_seats = ?, cinema_id = ? WHERE theater_id = ?",
        [theater.num_of_seats, theater.cinema_id, id],
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
            result(null, { id: id, ...theater });
        }
    );
};

Theater.remove = (id, result) => {
    sql.query("DELETE FROM theater WHERE theater_id = ?", [id], (err, res) => {
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
    });
};

module.exports = Theater;