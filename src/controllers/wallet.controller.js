const Wallet = require('../models/wallet.model');

exports.create = (req, res) => {
  const newWallet = new Wallet({
    wallet_id: req.body.wallet_id,
    balance: req.body.balance,
    tickets: req.body.tickets,
    credit_cards: req.body.credit_cards,
    coupons: req.body.coupons
  });

  Wallet.create(newWallet, (err, data) => {
    console.log("wallet adı: " + newWallet.name);
    console.log(err);
    if (err)
      res.status(500).send({
        message: err.message || "Some error occurred while creating the Wallet."
      });
    else res.send(data);
  });
};