const Show = require('../models/show.model');

// Yeni gösteri oluşturma
exports.create = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "Content cannot be empty!"
    });
    return;
  }

  const newShow = new Show({
    movie_id: req.body.movie_id,
    theater_id: req.body.theater_id,
    show_hour: req.body.show_hour,
    show_day: req.body.show_day
  });

  Show.create(newShow, (err, data) => {
    if (err)
      res.status(500).send({
        message: err.message || "Some error occurred while creating the Show."
      });
    else res.send(data);
  });
};

// Belirli movie_id'ye sahip gösterileri bulma
exports.findByMovieId = (req, res) => {
  Show.findByMovieId(req.params.movieId, (err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.status(404).send({
          message: `Not found Shows with movie_id ${req.params.movieId}.`
        });
      } else {
        res.status(500).send({
          message: "Error retrieving Shows with movie_id " + req.params.movieId
        });
      }
    } else res.send(data);
  });
};

// Belirli theater_id'ye sahip gösterileri bulma
exports.findByTheaterId = (req, res) => {
  Show.findByTheaterId(req.params.theaterId, (err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.status(404).send({
          message: `Not found Shows with theater_id ${req.params.theaterId}.`
        });
      } else {
        res.status(500).send({
          message: "Error retrieving Shows with theater_id " + req.params.theaterId
        });
      }
    } else res.send(data);
  });
};

// Tüm gösterileri getirme
exports.findAll = (req, res) => {
  Show.getAll((err, data) => {
    if (err)
      res.status(500).send({
        message: err.message || "Some error occurred while retrieving shows."
      });
    else res.send(data);
  });
};

// Gösteriyi güncelleme
exports.update = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "Content cannot be empty!"
    });
    return;
  }

  Show.update(req.params.showId, new Show(req.body), (err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.status(404).send({
          message: `Not found Show with id ${req.params.showId}.`
        });
      } else {
        res.status(500).send({
          message: "Error updating Show with id " + req.params.showId
        });
      }
    } else res.send(data);
  });
};

// Gösteriyi silme
exports.delete = (req, res) => {
  Show.remove(req.params.showId, (err, data) => {
    if (err) {
      if (err.kind === "not_found") {
        res.status(404).send({
          message: `Not found Show with id ${req.params.showId}.`
        });
      } else {
        res.status(500).send({
          message: "Could not delete Show with id " + req.params.showId
        });
      }
    } else res.send({ message: `Show was deleted successfully!` });
  });
};