module.exports = app => {
    const tickets = require('../controllers/ticket.controller');

    app.post('/tickets', tickets.create);

    app.get('/tickets', tickets.findAll);
    app.get('/tickets/:ticket_id', tickets.findByTicketId);
    app.get('/tickets/user/:user_id', tickets.findByUserId);
    app.get('/tickets/movie/:movie_id', tickets.findByMovieId);
    app.get('/tickets/cinema/:cinema_id', tickets.findByCinemaId);
    app.get('/tickets/seat/:seat_id', tickets.findBySeatId);
    app.get('/tickets/theater/:theater_id', tickets.findByTheaterId);

    app.put('/tickets/:ticket_id', tickets.update);
    
    app.delete('/tickets/:ticket_id', tickets.delete);
};