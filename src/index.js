const express = require('express');
 
const app = express();
const PORT = 3001;

//post requ için kullanılan bir middleware, parse ediyor postlayabilmesi icin, aynı zamanda loglamaya da yardımcı?
app.use(express.json());
app.use((req, res, next) => {
    console.log(`${req.method}:${req.url}`);
    next();
});

app.listen(PORT, () => console.log(`Running Server on Port ${PORT}`));

const groceryList = [
    {
        item: 'water',
        quantity: 4
    },
    {
        item: 'food',
        quantity: 5
    }
]


//GET req
app.get('/groceries', 
        (req, res, next) => {   //buradaki next olayı yollanılan get req'in bekletilmesini sağlar. karşılığında bir aksiyon bekler
            console.log("Before handling request.")
            next();//bu bekleme olayını iptal ettiriri normal hale sokar
        }, 
        (req, res, next) => {
        res.send(groceryList);
        next();
        }
        )


//buradaki request postman'dan gelen post request body'sidir.
app.post('/groceries', (request, response) => {
    console.log(request.body);
    groceryList.push(request.body);
    response.send(201); //http status
    //postman ile POST requestler yapılabilr test edilebilir.
});

