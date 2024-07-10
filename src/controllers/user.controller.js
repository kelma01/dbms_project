const User = require('../models/user.model');

exports.create = (req, res) => {
  const newUser = new User({
    user_id: req.body.user_id,
    name: req.body.name,
    surname: req.body.surname,
    pw_hash: req.body.pw_hash,
    movies_watched: req.body.movies_watched,
    birth_date: req.body.birth_date,
    tickets: req.body.tickets,
    wallet_id: req.body.wallet_id
  });

  User.create(newUser, (err, data) => {
    console.log("kullanıcının adı: " + newUser.name);
    console.log(err);
    if (err)
      res.status(500).send({
        message: err.message || "Some error occurred while creating the User."
      });
    else res.send(data);
  });
};