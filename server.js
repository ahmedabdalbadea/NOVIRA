const express = require('express');
const dotenv = require('dotenv');
const app = express();
const logger = require('./middleware/logger');
const routes = require('./routes/userRoutes');
const dbConnect = require('./controllers/dbConnect.js');


app.use(express.json());
app.use(logger);
dotenv.config();

//Connect to MongoDB
dbConnect();

const PORT = process.env.PORT;

routes(app);

app.listen(PORT, ()=>{
    console.log(`Server running on http://localhost:${PORT}`);
});

