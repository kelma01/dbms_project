module.exports = app => {
    const users = require('../controllers/user.controller');

    app.post('/users', users.create); 
    app.get("/users", users.findAll);
    app.post("/register", users.register);
    app.post("/login", users.login);

}