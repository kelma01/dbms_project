const Ticket = require('../models/ticket.model');

exports.create = (req, res) => {
    if (!req.body) {
        res.status(400).send({
            message: "Content can not be empty!"
        });
    }

    const ticket = new Ticket({
        ticket_id: req.body.ticket_id,
        day: req.body.day,
        showtime: req.body.showtime,
        user_id: req.body.user_id,
        movie_id: req.body.movie_id,
        cinema_id: req.body.cinema_id,
        seat_id: req.body.seat_id,
        theater_id: req.body.theater_id
    });

    Ticket.create(ticket, (err, data) => {
        if (err)
            res.status(500).send({
                message: err.message || "Some error occurred while creating the Ticket."
            });
        else res.send(data);
    });
};

exports.findAll = (req, res) => {
    Ticket.getAll((err, data) => {
        if (err)
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving tickets."
            });
        else res.send(data);
    });
};

exports.findByTicketId = (req, res) => {
    Ticket.findByTicketId(req.params.ticket_id, (err, data) => {
        if (err) {
            res.status(500).send({
                message: "Error retrieving ticket for id: " + req.params.user_id
            });
        } else res.send(data);
    });
};

exports.findByUserId = (req, res) => {
    Ticket.findByUserId(req.params.user_id, (err, data) => {
        if (err) {
            res.status(500).send({
                message: "Error retrieving tickets for user with id " + req.params.user_id
            });
        } else res.send(data);
    });
};

exports.findByMovieId = (req, res) => {
    Ticket.findByMovieId(req.params.movie_id, (err, data) => {
        if (err) {
            res.status(500).send({
                message: "Error retrieving tickets for movie with id " + req.params.movie_id
            });
        } else res.send(data);
    });
};

exports.findByCinemaId = (req, res) => {
    Ticket.findByCinemaId(req.params.cinema_id, (err, data) => {
        if (err) {
            res.status(500).send({
                message: "Error retrieving tickets for cinema with id " + req.params.cinema_id
            });
        } else res.send(data);
    });
};

exports.findBySeatId = (req, res) => {
    Ticket.findBySeatId(req.params.seat_id, (err, data) => {
        if (err) {
            res.status(500).send({
                message: "Error retrieving tickets for seat with id " + req.params.seat_id
            });
        } else res.send(data);
    });
};

exports.findByTheaterId = (req, res) => {
    Ticket.findByTheaterId(req.params.theater_id, (err, data) => {
        if (err) {
            res.status(500).send({
                message: "Error retrieving tickets for theater with id " + req.params.theater_id
            });
        } else res.send(data);
    });
};

exports.update = (req, res) => {
    if (!req.body) {
        res.status(400).send({
            message: "Content can not be empty!"
        });
    }

    Ticket.updateById(req.params.ticket_id, new Ticket(req.body), (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                res.status(404).send({
                    message: `Not found Ticket with id ${req.params.ticket_id}.`
                });
            } else {
                res.status(500).send({
                    message: "Error updating Ticket with id " + req.params.ticket_id
                });
            }
        } else res.send(data);
    });
};

exports.delete = (req, res) => {
    Ticket.remove(req.params.ticket_id, (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                res.status(404).send({
                    message: `Not found Ticket with id ${req.params.ticket_id}.`
                });
            } else {
                res.status(500).send({
                    message: "Could not delete Ticket with id " + req.params.ticket_id
                });
            }
        } else res.send({ message: `Ticket was deleted successfully!` });
    });
};