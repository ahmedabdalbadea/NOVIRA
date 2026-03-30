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
        connection.then(
            (val)=>{
                console.log(`successfully connected to MongoDB Database: ${URI}, Time of Connection: ${val.now()}`);
            }
        );
    }
    catch(err){
        console.error(err);
        return;
    }
}
module.exports = dbConnect;