module.exports = app => {
    const users = require('../controllers/user.controller');

    app.post('/users', users.create); 
    app.post("/register", users.register);
    app.post("/login", users.login);

    app.get("/users", users.findAll);
    app.post('/logout', (req, res) => {
        // Burada oturumun sonlandırılması gerektiğini belirten işlemleri yapmalısınız.
        // Örneğin, kullanıcının oturum bilgilerini silme.
        
        res.json({ success: true });
    });
    app.put('/profile', users.updateProfile);

}