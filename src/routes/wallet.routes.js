module.exports = app => {
    const wallets = require('../controllers/wallet.controller');

    app.post('/wallets', wallets.create);
}