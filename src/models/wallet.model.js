const sql = require('../config/db_config');

const Wallet = function(wallet) {
    this.wallet_id = wallet.wallet_id; //user_id ile aynı
    this.balance = wallet.balance;
    this.tickets = wallet.tickets;
    this.credit_cards = wallet.credit_cards;
    this.coupons = wallet.coupons;
    this.user_id = wallet.user_id;
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

Wallet.getAll = (result) => {
  sql.query("SELECT * FROM wallet", (err, res) => {
    if (err) {
      console.log("error: ", err);
      result(null, err);
      return;
    }
    result(null, res);
  });
};

module.exports = Wallet;