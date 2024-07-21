const sql = require('../config/db_config');

const CreditCard = function(card){
    this.wallet_id = card.wallet_id;
    this.card_number = card.card_number;
    this.expiration_month = card.expiration_month;
    this.expiration_year = card.expiration_year;
    this.cvv = card.cvv;
};

CreditCard.create = (newCreditCard, result) => {
    sql.query("SELECT * FROM credit_card WHERE card_number = ?", [newCreditCard.card_number], (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
        return;
      }
  
      if (res.length > 0) {
        result({ message: "Card number already exists." }, null);
        return;
      }
  
      sql.query("INSERT INTO credit_card SET ?", newCreditCard, (err, res) => {
        if (err) {
          console.log("error: ", err);
          result(err, null);
          return;
        }
        result(null, { id: res.insertId, ...newCreditCard });
      });
    });
  };

CreditCard.findByWalletId = (walletId, result) => {
    sql.query("SELECT * FROM credit_card WHERE wallet_id = ?", [walletId], (err, res) => {
      if (err) {
        console.log("error: ", err);
        result(err, null);
        return;
      }
      result(null, res);
    });
  };
  
CreditCard.getByUserId = (userId, result) => {
  sql.query(
      `SELECT cc.* FROM credit_card cc
        JOIN wallet w ON cc.wallet_id = w.wallet_id
        WHERE w.user_id = ?`,
      [userId],
      (err, res) => {
          if (err) {
              console.log("error: ", err);
              result(err, null);
              return;
          }
          result(null, res);
      }
  );
};

module.exports = CreditCard;