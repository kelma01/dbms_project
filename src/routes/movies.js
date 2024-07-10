const { Router } = require('express');
const router = Router();


//GET ve POST request ornekleri
const movieList = [
    {
        moviename: 'recepivedik1',
        rate: 10,
        id: 1
    },
    {
        moviename: 'Star_Wars_6:_Return_of_the_Jedi',
        rate: 11,
        id: 2
    },
    {
        moviename: 'testmovie',
        rate: 1,
        id: 3
    }
]

//query parameter kullanımına örnektir. sadece id icin calisan bir ornek!!!!!!!!!!!!!
router.get('/', (req, res) => {
    if (Object.keys(req.query).length === 0) {
        console.log(req.query);
        res.send(movieList);
    } 
    else {
        const { id } = req.query;
        const filteredMovies = movieList.filter((s) => s.id == id);
        res.send(filteredMovies);
    }
})

//route paramtere kullanımı hedef directorynin devamında bir şeyler seçmek için kıullanılıyor
router.get('/:item', (request, response) => {
    const { item } = request.params;
    const movieItem = movieList.find((g) => g.moviename === item);
    response.send(movieItem);
})

//buradaki request postman'dan gelen post request body'sidir.
router.post('/', (request, response) => {
    console.log(request.body);
    movieList.push(request.body);
    response.send(201); //http status
    //postman ile POST requestler yapılabilr test edilebilir.
});


module.exports = router;