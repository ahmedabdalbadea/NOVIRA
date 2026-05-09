const mongoose = require('mongoose');
const dotenv = require('dotenv');
dotenv.config();
const URI = process.env.URI;

/**
 * 
 * establish connection to MongoDB 
 */
const dbConnect = async ()=>{
    try{
        const connection = mongoose.connect(URI, {
            autoIndex: true
        });    
    }
    catch(err){
        console.error(err);
        return;
    }

    console.log(`successfully connected to MongoDB Database: ${URI}`);
}
module.exports = dbConnect;


