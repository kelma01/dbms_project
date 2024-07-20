module.exports = app => {
    const creditCards = require('../controllers/credit_card.controller');
  
    app.post('/credit_cards', creditCards.create);
    app.get('/credit_cards/:walletId', creditCards.findByWalletId); // aynı zamanda walletid ile kartları getirmek demek userid ile kartları getirmek de demek sonuçta userid=walletid
  };