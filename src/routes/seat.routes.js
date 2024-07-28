module.exports = app => {
    const seats = require('../controllers/seat.controller');

    app.post('/seats', seats.create);

    app.get('/seats', seats.findAll);
    app.get('/seats/:seat_id', seats.findBySeatId);
    app.get('/seats/cinema/:cinema_id/theater/:theater_id', seats.findByCinemaAndTheaterId);
    app.get('/seats/theater/:theater_id', seats.findByTheaterId);

    app.put('/seats/:seat_id', seats.update);

    app.delete('/seats/:seat_id', seats.delete);
};