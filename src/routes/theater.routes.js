module.exports = app => {
    const theaters = require('../controllers/theater.controller');

    app.post('/theaters', theaters.create);

    app.get('/theaters', theaters.findAll);
    app.get('/theaters/:id', theaters.findOne);
    app.put('/theaters/:id', theaters.update);
    
    app.delete('/theaters/:id', theaters.delete);
};