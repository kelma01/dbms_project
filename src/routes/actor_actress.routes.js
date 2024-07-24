module.exports = app => {
    const actorActresses = require('../controllers/actor_actress.controller');

    app.post('/actor_actresses', actorActresses.create);

    app.get('/actor_actresses', actorActresses.findAll);
    app.get('/actor_actresses/:movie_id', actorActresses.findByMovieId);
    
    app.put('/actor_actresses/:movie_id', actorActresses.update);

    app.delete('/actor_actresses/:movie_id', actorActresses.delete);
};