const sql = require('../config/db_config');

const Wallet = function(wallet) {
    this.wallet_id = wallet.wallet_id;
    this.balance = wallet.balance;
    this.tickets = wallet.tickets;
    this.credit_cards = wallet.credit_cards;
    this.coupons = wallet.coupons;
};

Wallet.create = (newWallet, result) => {
  sql.query("INSERT INTO wallet SET ?", newWallet, (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(err, null);
      return;
    }
    result(null, { id: res.insertId, ...newWallet });
  });
};

module.exports = Wallet;