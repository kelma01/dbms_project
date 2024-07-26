const crypto = require('crypto');
const User = require('../models/user.model');
const Wallet = require('../models/wallet.model');
const CreditCard = require('../models/credit_card.model');

// Şifreyi hash'leme fonksiyonu
function hashPassword(password) {
  return crypto.createHash('sha256').update(password).digest('hex');
}

// Kullanıcı oluşturma
exports.create = (req, res) => {
  const newUser = new User({
    user_id: req.body.user_id,
    email: req.body.email,
    name: req.body.name,
    surname: req.body.surname,
    password: req.body.password,
    birth_date: req.body.birth_date,
    tickets: req.body.tickets
  });

  User.create(newUser, (err, data) => {
    if (err)
      res.status(500).send({
        message: err.message || "Some error occurred while creating the User."
      });
    else res.send(data);
  });
};

// Tüm kullanıcıları listeleme
exports.findAll = (req, res) => {
  User.getAll((err, data) => {
    if (err)
      res.status(500).send({
        message: err.message || "Some error occurred while retrieving users."
      });
    else res.send(data);
  });
};

// Kullanıcı kayıt işlemi
exports.register = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "Content cannot be empty!"
    });
    return;
  }

  User.findByEmail(req.body.email, (err, user) => {
    if (user) {
      res.status(400).send({
        message: "Email already in use"
      });
      return;
    }

    const hashedPassword = hashPassword(req.body.password);

    const newUser = new User({
      email: req.body.email,
      name: req.body.name,
      surname: req.body.surname,
      birth_date: req.body.birth_date,
      tickets: req.body.tickets,
      password: hashedPassword
    });

    User.create(newUser, (err, userData) => {
      if (err) {
        res.status(500).send({
          message: err.message || "Some error occurred while creating the User."
        });
      } else {
        const newWallet = new Wallet({
          wallet_id: userData.id, // user_id ile aynı olacak
          balance: 0.00,
          tickets: null,
          credit_cards: null,
          coupons: null,
          user_id: userData.id
        });

        Wallet.create(newWallet, (err, walletData) => {
          if (err)
            res.status(500).send({
              message: err.message || "Some error occurred while creating the Wallet."
            });
          else res.send({ user: userData, wallet: walletData });
        });
      }
    });
  });
};

// Kullanıcı giriş işlemi
exports.login = (req, res) => {
  if (!req.body) {
    res.status(400).send({
      message: "Content cannot be empty!"
    });
    return;
  }

  const email = req.body.email;
  const password = hashPassword(req.body.password);

  User.findByEmail(email, (err, user) => {
    if (err) {
      res.status(500).send({
        message: err.message || "Some error occurred while retrieving the user."
      });
      return;
    }

    if (user && user.password === password) {
      res.send({
        message: "Login successful",
        user_id: user.user_id,
        name: user.name
      });
    } else {
      res.status(401).send({
        message: "Invalid email or password"
      });
    }
  });
};

// Kullanıcı profili güncelleme
exports.updateProfile = (req, res) => {
  const { id, name, surname, email, birth_date } = req.body;

  if (!id) {
    return res.status(400).json({ success: false, message: 'User ID is required.' });
  }

  User.update(id, { name, surname, email, birth_date }, (err, result) => {
    if (err) {
      console.error('Error occurred:', err);
      return res.status(500).json({ success: false, message: 'Failed to update profile.' });
    }

    if (result.kind === 'not_found') {
      return res.status(404).json({ success: false, message: 'User not found.' });
    }

    res.json({ success: true, message: 'Profile updated successfully.' });
  });
};
