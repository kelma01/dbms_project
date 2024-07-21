const sql = require('../config/db_config');

const Ticket = function(ticket) {
    this.day = ticket.day;
    this.showtime = ticket.showtime;
    this.user_id = ticket.user_id;
    this.movie_id = ticket.movie_id;
    this.cinema_id = ticket.cinema_id;
    this.seat_id = ticket.seat_id;
    this.theater_id = ticket.theater_id;
};

Ticket.create = (newTicket, result) => {
    sql.query("INSERT INTO ticket SET ?", newTicket, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
        }
        result(null, { id: res.insertId, ...newTicket });
    });
};

Ticket.getAll = (result) => {
    sql.query("SELECT * FROM ticket", (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        result(null, res);
    });
};

Ticket.findByUserId = (userId, result) => {
    sql.query("SELECT * FROM ticket WHERE user_id = ?", userId, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        result(null, res);
    });
};

Ticket.findByMovieId = (movieId, result) => {
    sql.query("SELECT * FROM ticket WHERE movie_id = ?", movieId, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        result(null, res);
    });
};

Ticket.findByCinemaId = (cinemaId, result) => {
    sql.query("SELECT * FROM ticket WHERE cinema_id = ?", cinemaId, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        result(null, res);
    });
};

Ticket.findBySeatId = (seatId, result) => {
    sql.query("SELECT * FROM ticket WHERE seat_id = ?", seatId, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        result(null, res);
    });
};

Ticket.findByTheaterId = (theaterId, result) => {
    sql.query("SELECT * FROM ticket WHERE theater_id = ?", theaterId, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        result(null, res);
    });
};

Ticket.updateById = (id, ticket, result) => {
    sql.query(
        "UPDATE ticket SET day = ?, showtime = ?, user_id = ?, movie_id = ?, cinema_id = ?, seat_id = ?, theater_id = ? WHERE ticket_id = ?",
        [ticket.day, ticket.showtime, ticket.user_id, ticket.movie_id, ticket.cinema_id, ticket.seat_id, ticket.theater_id, id],
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

            result(null, { id: id, ...ticket });
        }
    );
};

Ticket.remove = (id, result) => {
    sql.query("DELETE FROM ticket WHERE ticket_id = ?", id, (err, res) => {
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

module.exports = Ticket;