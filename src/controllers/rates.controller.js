const Rate = require('../models/rates.model');

exports.create = (req, res) => {
    if (!req.body) {
        res.status(400).send({
            message: "Content can not be empty!"
        });
    }

    const rate = new Rate({
        r_star: req.body.r_star,
        r_comment: req.body.r_comment,
        r_date: req.body.r_date,
        user_id: req.body.user_id,
        movie_id: req.body.movie_id
    });

    Rate.create(rate, (err, data) => {
        if (err)
            res.status(500).send({
                message: err.message || "Some error occurred while creating the Rate."
            });
        else res.send(data);
    });
};

exports.findAll = (req, res) => {
    Rate.getAll((err, data) => {
        if (err)
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving rates."
            });
        else res.send(data);
    });
};

exports.findByUserId = (req, res) => {
    Rate.findByUserId(req.params.user_id, (err, data) => {
        if (err) {
            res.status(500).send({
                message: "Error retrieving rates for user with id " + req.params.user_id
            });
        } else res.send(data);
    });
};

exports.findByMovieId = (req, res) => {
    Rate.findByMovieId(req.params.movie_id, (err, data) => {
        if (err) {
            res.status(500).send({
                message: "Error retrieving rates for movie with id " + req.params.movie_id
            });
        } else res.send(data);
    });
};


exports.delete = (req, res) => {
    Rate.remove(req.params.rate_id, (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                res.status(404).send({
                    message: `Not found Rate with id ${req.params.rate_id}.`
                });
            } else {
                res.status(500).send({
                    message: "Could not delete Rate with id " + req.params.rate_id
                });
            }
        } else res.send({ message: `Rate was deleted successfully!` });
    });
};