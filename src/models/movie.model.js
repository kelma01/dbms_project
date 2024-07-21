const sql = require('../config/db_config');

const Movie = function(movie) {
    this.name = movie.name;
    this.description = movie.description;
    this.duration = movie.duration;
    this.rate = movie.rate;
    this.genre = movie.genre;
    //şimdilik days, imdb_rate, show_times, is_released bilgileri yok
};

Movie.create = (newMovie, result) => {
    sql.query("INSERT INTO movie SET ?", newMovie, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
        }
        result(null, { id: res.insertId, ...newMovie });
    });
};

Movie.getAll = (result) => {
    sql.query("SELECT * FROM movie", (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        result(null, res);
    });
};

Movie.findById = (movieId, result) => {
    sql.query("SELECT * FROM movie WHERE movie_id = ?", movieId, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        if (res.length) {
            result(null, res[0]);
        } else {
            result({ kind: "not_found" }, null);
        }
    });
};

Movie.updateById = (id, movie, result) => {
    sql.query(
        "UPDATE movie SET name = ?, description = ?, duration = ?, rate = ?, genre = ? WHERE movie_id = ?",
        [movie.name, movie.description, movie.duration, movie.rate, movie.genre, id],
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

            result(null, { id: id, ...movie });
        }
    );
};

Movie.remove = (id, result) => {
    sql.query("DELETE FROM movie WHERE movie_id = ?", id, (err, res) => {
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

module.exports = Movie;