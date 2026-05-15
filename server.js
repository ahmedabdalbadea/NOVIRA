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

// Backwards-compatible direct endpoints
const userController = require('./controllers/userController');
app.post('/users/register', userController.signUp);
app.post('/users/login', userController.login);

// Debug route: list registered routes (temporary)
app.get('/debug/routes', (req, res) => {
    const routes = [];
    app._router.stack.forEach((middleware) => {
        if (middleware.route) { // routes registered directly on the app
            routes.push(middleware.route.path);
        } else if (middleware.name === 'router') { // router middleware 
            middleware.handle.stack.forEach(function(handler){
                const route = handler.route && handler.route.path;
                if(route) routes.push(route);
            });
        }
    });
    res.json({routes});
});




mongoose.connection.once("open",() =>{
    console.log("connected to MongoDB")
    app.listen(PORT, ()=>{
        console.log(`Server running on http://localhost:${PORT}`);
    });
});

mongoose.connection.on("error",(err)=>{
    console.log(err);
});

