module.exports = app => {
    const cinemas = require('../controllers/cinema.controller');

    app.post('/cinemas', cinemas.create);

    app.put('/cinemas/:id', cinemas.update);
    
    app.delete('/cinemas/:id', cinemas.delete);

    app.get('/cinemas', cinemas.findAll);
    app.get('/cinemas/:id', cinemas.findOne);
    app.get('/cinemas/:cinemaId/theaters', cinemas.findTheatersByCinemaId);
};