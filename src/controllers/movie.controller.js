const Movie = require('../models/movie.model');

exports.create = (req, res) => {
    if (!req.body) {
        res.status(400).send({
            message: "Content can not be empty!"
        });
    }

    const movie = new Movie({
        movie_id: req.body.movie_id,
        name: req.body.name,
        description: req.body.description,
        duration: req.body.duration,
        rate: req.body.rate,
        genre: req.body.genre
    });

    Movie.create(movie, (err, data) => {
        if (err)
            res.status(500).send({
                message: err.message || "Some error occurred while creating the Movie."
            });
        else res.send(data);
    });
};

exports.findAll = (req, res) => {
    Movie.getAll((err, data) => {
        if (err)
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving movies."
            });
        else res.send(data);
    });
};

exports.findById = (req, res) => {
    Movie.findById(req.params.movie_id, (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                res.status(404).send({
                    message: `Not found Movie with id ${req.params.movie_id}.`
                });
            } else {
                res.status(500).send({
                    message: "Error retrieving Movie with id " + req.params.movie_id
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

    Movie.updateById(req.params.movie_id, new Movie(req.body), (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                res.status(404).send({
                    message: `Not found Movie with id ${req.params.movie_id}.`
                });
            } else {
                res.status(500).send({
                    message: "Error updating Movie with id " + req.params.movie_id
                });
            }
        } else res.send(data);
    });
};

exports.delete = (req, res) => {
    Movie.remove(req.params.movie_id, (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                res.status(404).send({
                    message: `Not found Movie with id ${req.params.movie_id}.`
                });
            } else {
                res.status(500).send({
                    message: "Could not delete Movie with id " + req.params.movie_id
                });
            }
        } else res.send({ message: `Movie was deleted successfully!` });
    });
};