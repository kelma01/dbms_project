const sql = require('../config/db_config');

const Cinema = function(cinema) {
    this.name = cinema.name;
    this.city = cinema.city;
    this.address = cinema.address;
};

Cinema.create = (newCinema, result) => {
    sql.query("INSERT INTO cinema SET ?", newCinema, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
        }
        result(null, { id: res.insertId, ...newCinema });
    });
};

Cinema.getAll = (result) => {
    sql.query("SELECT * FROM cinema", (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        result(null, res);
    });
};

Cinema.findById = (id, result) => {
    sql.query("SELECT * FROM cinema WHERE cinema_id = ?", [id], (err, res) => {
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

Cinema.updateById = (id, cinema, result) => {
    sql.query(
        "UPDATE cinema SET name = ?, location = ?, capacity = ? WHERE cinema_id = ?",
        [cinema.name, cinema.location, cinema.capacity, id],
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
            result(null, { id: id, ...cinema });
        }
    );
};

Cinema.remove = (id, result) => {
    sql.query("DELETE FROM cinema WHERE id = ?", [id], (err, res) => {
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

Cinema.getTheatersByCinemaId = (cinemaId, result) => {
    sql.query(
        "SELECT t.theater_id, t.num_of_seats FROM theater t WHERE t.cinema_id = ?",
        [cinemaId],
        (err, res) => {
            if (err) {
                console.log("error: ", err);
                result(err, null);
                return;
            }
            result(null, res);
        }
    );
};

module.exports = Cinema;