const Seat = require('../models/seat.model');

exports.create = (req, res) => {
    if (!req.body) {
        res.status(400).send({
            message: "Content can not be empty!"
        });
    }

    const seat = new Seat({
        seat_id: req.body.seat_id,
        is_empty: req.body.is_empty,
        seat_row: req.body.seat_row,
        seat_col: req.body.seat_col,
        cinema_id: req.body.cinema_id,
        theater_id: req.body.theater_id
    });

    Seat.create(seat, (err, data) => {
        console.log(req.body.theater_id);
        if (err)
            res.status(500).send({
                message: err.message || "Some error occurred while creating the Seat."
            });
        else res.send(data);
    });
};

exports.findAll = (req, res) => {
    Seat.getAll((err, data) => {
        if (err)
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving seats."
            });
        else res.send(data);
    });
};

exports.findByCinemaAndTheaterId = (req, res) => {
    Seat.findByCinemaAndTheaterId(req.params.cinema_id, req.params.theater_id, (err, data) => {
        if (err) {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving seats."
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

    Seat.updateById(req.params.seat_id, new Seat(req.body), (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                res.status(404).send({
                    message: `Not found Seat with id ${req.params.seat_id}.`
                });
            } else {
                res.status(500).send({
                    message: "Error updating Seat with id " + req.params.seat_id
                });
            }
        } else res.send(data);
    });
};

exports.delete = (req, res) => {
    Seat.remove(req.params.seat_id, (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                res.status(404).send({
                    message: `Not found Seat with id ${req.params.seat_id}.`
                });
            } else {
                res.status(500).send({
                    message: "Could not delete Seat with id " + req.params.seat_id
                });
            }
        } else res.send({ message: `Seat was deleted successfully!` });
    });
};