const ActorActress = require('../models/actor_actress.model');

exports.create = (req, res) => {
    if (!req.body) {
        res.status(400).send({
            message: "Content can not be empty!"
        });
    }

    const actorActress = new ActorActress({
        name: req.body.name,
        surnamename: req.body.surname,
        movie_id: req.body.movie_id
    });

    ActorActress.create(actorActress, (err, data) => {
        if (err)
            res.status(500).send({
                message: err.message || "Some error occurred while creating the Actor/Actress."
            });
        else res.send(data);
    });
};

exports.findAll = (req, res) => {
    ActorActress.getAll((err, data) => {
        if (err)
            res.status(500).send({
                message: err.message || "Some error occurred while retrieving actors/actresses."
            });
        else res.send(data);
    });
};

exports.findByMovieId = (req, res) => {
    ActorActress.findByMovieId(req.params.movie_id, (err, data) => {
        if (err) {
            res.status(500).send({
                message: "Error retrieving actors/actresses for movie with id " + req.params.movie_id
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

    ActorActress.updateByMovieId(req.params.movie_id, new ActorActress(req.body), (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                res.status(404).send({
                    message: `Not found Actor/Actress with movie_id ${req.params.movie_id}.`
                });
            } else {
                res.status(500).send({
                    message: "Error updating Actor/Actress with movie_id " + req.params.movie_id
                });
            }
        } else res.send(data);
    });
};

exports.delete = (req, res) => {
    ActorActress.remove(req.params.movie_id, (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                res.status(404).send({
                    message: `Not found Actor/Actress with movie_id ${req.params.movie_id}.`
                });
            } else {
                res.status(500).send({
                    message: "Could not delete Actor/Actress with movie_id " + req.params.movie_id
                });
            }
        } else res.send({ message: `Actor/Actress was deleted successfully!` });
    });
};