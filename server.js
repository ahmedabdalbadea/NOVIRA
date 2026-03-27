const express = require('express');
const dotenv = require('dotenv');
const app = express();


app.use(express.json())
dotenv.config();



const PORT = process.env.PORT;
app.get('/createAccount', (req, res)=>{
    res.send('Hello, world!');
    res.end();

    
});



app.listen(PORT, ()=>{
    console.log(`Server running on http://localhost:${PORT}`);
});

