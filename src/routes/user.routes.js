module.exports = app => {
    const users = require('../controllers/user.controller');

    app.post('/users', users.create);
    app.get("/users", users.findAll);
}