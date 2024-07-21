module.exports = app => {
    const creditCards = require('../controllers/credit_card.controller');
  
    app.post('/credit_cards', creditCards.create);

    app.get('/credit_cards/:walletId', creditCards.findByWalletId);
    app.get('/credit_cards/user/:userId', creditCards.findByUserId);
  };