const sql = require('../config/db_config');

const Seat = function(seat) {
    this.is_empty = seat.is_empty;
    this.seat_loc = seat.seat_loc;
    this.cinema_id = seat.cinema_id;
    this.theater_id = seat.theater_id;
};

Seat.create = (newSeat, result) => {
    sql.query("INSERT INTO seat SET ?", newSeat, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
        }
        result(null, { id: res.insertId, ...newSeat });
    });
};

Seat.getAll = (result) => {
    sql.query("SELECT * FROM seat", (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        result(null, res);
    });
};

Seat.findByCinemaAndTheaterId = (cinema_id, theater_id, result) => {
    sql.query(
        "SELECT * FROM seat WHERE cinema_id = ? AND theater_id = ?",
        [cinema_id, theater_id],
        (err, res) => {
            if (err) {
                console.log("error: ", err);
                result(null, err);
                return;
            }
            result(null, res);
        }
    );
};
Seat.findbyTheaterId = (theater_id, result) => {
    sql.query(
        "SELECT * FROM seat WHERE theater_id = ?",
        [theater_id],
        (err, res) => {
            if (err) {
                console.log("error: ", err);
                result(null, err);
                return;
            }
            result(null, res);
        }
    );
};
Seat.findById = (seat_id, result) => {
    sql.query(
        "SELECT * FROM seat WHERE seat_id = ?",
        [seat_id],
        (err, res) => {
            if (err) {
                console.log("error: ", err);
                result(null, err);
                return;
            }
            result(null, res);
        }
    );
};

Seat.updateById = (id, seat, result) => {
    sql.query(
        "UPDATE seat SET is_empty = ?, seat_loc = ?, cinema_id = ?, theater_id = ? WHERE seat_id = ?",
        [seat.is_empty, seat.seat_loc, seat.cinema_id, seat.theater_id, id],
        (err, res) => {
            if (err) {
                console.log("error: ", err);
                result(null, err);
                return;
            }

            if (res.affectedRows == 0) {
                result({ kind: "not_found" }, null);
                return;
            }

            result(null, { id: id, ...seat });
        }
    );
};

Seat.updateById = (id, seat, result) => {
    sql.query(
        "UPDATE seat SET is_empty = ? WHERE seat_id = ?",
        [seat.is_empty, id],
        (err, res) => {
            if (err) {
                console.log("error: ", err);
                result(null, err);
                return;
            }

            if (res.affectedRows == 0) {
                result({ kind: "not_found" }, null);
                return;
            }

            result(null, { id: id, ...seat });
        }
    );
};

Seat.remove = (id, result) => {
    sql.query("DELETE FROM seat WHERE seat_id = ?", id, (err, res) => {
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

module.exports = Seat;