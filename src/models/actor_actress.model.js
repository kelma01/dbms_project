const sql = require('../config/db_config');

const ActorActress = function(actorActress) {
    this.name = actorActress.name;
    this.surname = actorActress.surnamename;
    this.movie_id = actorActress.movie_id;
};

ActorActress.create = (newActorActress, result) => {
    sql.query("INSERT INTO actor_actress SET ?", newActorActress, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(err, null);
            return;
        }
        result(null, { id: res.insertId, ...newActorActress });
    });
};

ActorActress.getAll = (result) => {
    sql.query("SELECT * FROM actor_actress", (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        result(null, res);
    });
};

ActorActress.findByMovieId = (movieId, result) => {
    sql.query("SELECT * FROM actor_actress WHERE movie_id = ?", movieId, (err, res) => {
        if (err) {
            console.log("error: ", err);
            result(null, err);
            return;
        }
        result(null, res);
    });
};

ActorActress.updateByMovieId = (id, actorActress, result) => {
    sql.query(
        "UPDATE actor_actress SET first_name = ?, last_name = ? WHERE movie_id = ?",
        [actorActress.first_name, actorActress.last_name, id],
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

            result(null, { id: id, ...actorActress });
        }
    );
};

ActorActress.remove = (id, result) => {
    sql.query("DELETE FROM actor_actress WHERE movie_id = ?", id, (err, res) => {
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

module.exports = ActorActress;