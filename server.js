const express = require('express');
const dotenv = require('dotenv');
const app = express();
const logger = require('./middleware/logger');
const routes = require('./routes/userRoutes');
const AiController = require('./controllers/aiController.js');
const dbConnect = require('./controllers/dbConnect.js');


app.use(express.json());
app.use((req, res, next) => {
    const supportedLangs = ['en', 'ar'];
    const requested = req.query.lang;

    // @ts-ignore
    req.lang = supportedLangs.includes(requested) ? requested : 'en';
    next();
});


app.use(logger);
dotenv.config();



//Connect to MongoDB
dbConnect();

const PORT = process.env.PORT;

app.use('/users', routes);

app.listen(PORT, ()=>{
    console.log(`Server running on http://localhost:${PORT}`);
});

