module.exports = app => {
    const shows = require("../controllers/show.controller.js");
  
    // Yeni gösteri oluşturma
    app.post("/shows", shows.create);
  
    // Tüm gösterileri getirme
    app.get("/shows", shows.findAll);
  
    // Belirli movie_id'ye sahip gösterileri bulma
    app.get("/shows/movie/:movieId", shows.findByMovieId);
  
    // Belirli theater_id'ye sahip gösterileri bulma
    app.get("/shows/theater/:theaterId", shows.findByTheaterId);
  
    // Belirli ID'ye sahip gösteriyi güncelleme
    app.put("/shows/:showId", shows.update);
  
    // Belirli ID'ye sahip gösteriyi silme
    app.delete("/shows/:showId", shows.delete);
  };
  