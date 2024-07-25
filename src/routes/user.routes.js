module.exports = app => {
    const users = require('../controllers/user.controller');
  
    app.post('/users', users.create);
    app.post('/register', users.register);
    app.post('/login', users.login);
    app.get('/users', users.findAll);
    app.put('/profile', users.updateProfile);
    
    app.post('/logout', (req, res) => {
      // Oturum kapama işlemi
      res.json({ success: true });
    });
  };
  