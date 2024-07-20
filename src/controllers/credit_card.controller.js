const CreditCard = require('../models/credit_card.model');

exports.create = (req, res) => {
  const newCard = new CreditCard({
    wallet_id: req.body.wallet_id,
    card_number: req.body.card_number,
    expiration_month: req.body.expiration_month,
    expiration_year: req.body.expiration_year,
    cvv: req.body.cvv
  });

  CreditCard.create(newCard, (err, data) => {
    if (err)
      res.status(500).send({
        message: err.message || "Some error occurred while adding the credit card."
      });
    else res.send(data);
  });
};

exports.findByWalletId = (req, res) => {
  CreditCard.findByWalletId(req.params.walletId, (err, data) => {
    if (err)
      res.status(500).send({
        message: err.message || "Some error occurred while retrieving credit cards."
      });
    else res.send(data);
  });
};