const { Router } = require('express');
const router = Router();


const cinemaList = [
    {
        cinemaname: "Armada Paribu",
        city: "Ankara"
    },
    {
        cinemaname: "Optiumum AVM",
        city: "Adana"
    },
    {
        cinemaname: "testcinema",
        city: null
    }
]

router.get('/', (req, res) => {
    res.send(cinemaList);
})
 router.get('/:item', (req, res) => {
    const { item } = req.params;
    const cinemaItem = cinemaList.find((g) => g.cinemaname === item);
    res.send(cinemaItem);
}) 
router.post('/', (req, res) => {
    console.log(req.body);
    cinemaList.push(req.body);
    res.send(200);
})

module.exports = router;