const express = require('express');
const dotenv = require('dotenv');
const app = express();
const corsOptions=require('./controllers/CORS_Options');
const cors=require("cors");
const logger = require('./middleware/logger');
const routes = require('./routes/userRoutes');
const AiController = require('./controllers/aiController.js');
const dbConnect = require('./controllers/dbConnect.js');




const mongoose= require("mongoose");
const cookieParser = require("cookie-parser");
dotenv.config();
const PORT = process.env.PORT;





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


app.use(cors(corsOptions));
app.use(cookieParser());
app.use(express.json());

app.use("/users",require("./routes/userRoutes"));

app.use("/auth",require("./routes/authRoutes"));




mongoose.connection.once("open",() =>{
    console.log("connected to MongoDB")
    app.listen(PORT, ()=>{
        console.log(`Server running on http://localhost:${PORT}`);
    });
});

mongoose.connection.on("error",(err)=>{
    console.log(err);
});

