module.exports = app => {
    const shows = require("../controllers/show.controller.js");
  
    // Yeni gösteri oluşturma
    app.post("/shows", shows.create);
  
    // Tüm gösterileri getirme
    app.get("/shows", shows.findAll);
  
    // Belirli ID'ye sahip gösteriyi bulma
    app.get("/shows/:showId", shows.findOne);
  
    // Belirli ID'ye sahip gösteriyi güncelleme
    app.put("/shows/:showId", shows.update);
  
    // Belirli ID'ye sahip gösteriyi silme
    app.delete("/shows/:showId", shows.delete);
  };