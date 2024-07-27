module.exports = app => {
    const movies = require('../controllers/movie.controller');

    app.post('/movies', movies.create);

    app.get('/movies', movies.findAll);
    app.get('/movies/:movie_id', movies.findById);

    app.put('/movies/:movie_id', movies.update);
    
    app.delete('/movies/:movie_id', movies.delete);
};

