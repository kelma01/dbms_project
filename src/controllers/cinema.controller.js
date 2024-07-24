const Cinema = require('../models/cinema.model');

exports.create = (req, res) => {
    if (!req.body) {
        res.status(400).send({
            message: "Content can not be empty!"
        });
    }

    const cinema = new Cinema({
        cinema_id: req.body.cinema_id,
        name: req.body.name,
        city: req.body.city,
        address: req.body.address,
    });

    Cinema.create(cinema, (err, data) => {
        if (err)
            res.status(500).send({
                message: err.message || "Some error occurred while creating the Cinema."
            });
        else res.send(data);
    });
};

exports.findAll = (req, res) => {
    Cinema.getAll((err, data) => {
        if (err)
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving cinemas."
            });
        else res.send(data);
    });
};

exports.findOne = (req, res) => {
    Cinema.findById(req.params.id, (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                res.status(404).send({
                    message: `Not found Cinema with id ${req.params.id}.`
                });
            } else {
                res.status(500).send({
                    message: "Error retrieving Cinema with id " + req.params.id
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

    Cinema.updateById(
        req.params.id,
        new Cinema(req.body),
        (err, data) => {
            if (err) {
                if (err.kind === "not_found") {
                    res.status(404).send({
                        message: `Not found Cinema with id ${req.params.id}.`
                    });
                } else {
                    res.status(500).send({
                        message: "Error updating Cinema with id " + req.params.id
                    });
                }
            } else res.send(data);
        }
    );
};

exports.delete = (req, res) => {
    Cinema.remove(req.params.id, (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                res.status(404).send({
                    message: `Not found Cinema with id ${req.params.id}.`
                });
            } else {
                res.status(500).send({
                    message: "Could not delete Cinema with id " + req.params.id
                });
            }
        } else res.send({ message: `Cinema was deleted successfully!` });
    });
};

exports.findTheatersByCinemaId = (req, res) => {
    Cinema.getTheatersByCinemaId(req.params.cinemaId, (err, data) => {
        if (err) {
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving theaters."
            });
        } else res.send(data);
    });
};