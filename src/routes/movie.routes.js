module.exports = app => {
    const movies = require('../controllers/movie.controller');

    app.post('/movies', movies.create);

    app.get('/movies', movies.findAll);
    app.get('/movies/:movie_id', movies.findById);

    app.put('/movies/:movie_id', movies.update);
    
    app.delete('/movies/:movie_id', movies.delete);
    // server.js veya uygun dosya
app.get('/movies/:movieId/cities', async (req, res) => {
    const movieId = req.params.movieId;
    try {
        // Burada şehirleri alabileceğiniz uygun bir sorgu veya veri çekme işlemi yapmanız gerekir.
        // Örneğin, sinemaların şehirlerini çeken bir sorgu olabilir.
        const cinemas = await db.query('SELECT DISTINCT city FROM cinemas WHERE movie_id = ?', [movieId]);
        const cities = cinemas.map(cinema => cinema.city);
        res.json(cities);
    } catch (error) {
        res.status(500).json({ error: 'Internal Server Error' });
    }
});

};

