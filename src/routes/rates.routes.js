module.exports = app => {
    const rates = require('../controllers/rates.controller');

    app.post('/rates', rates.create);

    app.get('/rates', rates.findAll);
    app.get('/rates/user/:user_id', rates.findByUserId);
    app.get('/rates/movie/:movie_id', rates.findByMovieId);
    
    app.delete('/rates/:rate_id', rates.delete);
};