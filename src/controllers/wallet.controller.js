const Wallet = require('../models/wallet.model');

exports.create = (req, res) => {
  const newWallet = new Wallet({
    wallet_id: req.body.wallet_id, //user_id ile aynı 
    balance: req.body.balance || 0.00,
    tickets: req.body.tickets || "",
    credit_cards: req.body.credit_cards || "",
    coupons: req.body.coupons || ""
  });

  Wallet.create(newWallet, (err, data) => {
    if (err)
      res.status(500).send({
        message: err.message || "Some error occurred while creating the Wallet."
      });
    else res.send(data);
  });
};

exports.findAll = (req, res) => {
  Wallet.getAll((err, data) => {
    if (err)
      res.status(500).send({
        message: err.message || "Some error occurred while retrieving wallets."
      });
    else res.send(data);
  });
};