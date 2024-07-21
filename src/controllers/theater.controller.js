const Theater = require('../models/theater.model');

exports.create = (req, res) => {
    if (!req.body) {
        res.status(400).send({
            message: "Content can not be empty!"
        });
    }

    const theater = new Theater({
        num_of_seats: req.body.num_of_seats,
        cinema_id: req.body.cinema_id,
        theater_id: req.body.theater_id
    });

    Theater.create(theater, (err, data) => {
        if (err)
            res.status(500).send({
                message: err.message || "Some error occurred while creating the Theater."
            });
        else res.send(data);
    });
};

exports.findAll = (req, res) => {
    Theater.getAll((err, data) => {
        if (err)
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving theaters."
            });
        else res.send(data);
    });
};

exports.findOne = (req, res) => {
    Theater.findById(req.params.id, (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                res.status(404).send({
                    message: `Not found Theater with id ${req.params.id}.`
                });
            } else {
                res.status(500).send({
                    message: "Error retrieving Theater with id " + req.params.id
                });
            }
        } else res.send(data);
    });
};

exports.update = (req, res) => {
    if (!req.body) {
        res.status(400).send({
            message: "Content can not be empty!"
        });
    }

    Theater.updateById(
        req.params.id,
        new Theater(req.body),
        (err, data) => {
            if (err) {
                if (err.kind === "not_found") {
                    res.status(404).send({
                        message: `Not found Theater with id ${req.params.id}.`
                    });
                } else {
                    res.status(500).send({
                        message: "Error updating Theater with id " + req.params.id
                    });
                }
            } else res.send(data);
        }
    );
};

exports.delete = (req, res) => {
    Theater.remove(req.params.id, (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                res.status(404).send({
                    message: `Not found Theater with id ${req.params.id}.`
                });
            } else {
                res.status(500).send({
                    message: "Could not delete Theater with id " + req.params.id
                });
            }
        } else res.send({ message: `Theater was deleted successfully!` });
    });
};