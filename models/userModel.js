const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    fName: {type: String, required: true}, 
    lName: {type: String, required: true},
 password: {type: String, required: true},
   gender: {type: String, required: true},
    email: {type: String, required: true, Unique:true},
});

const User = mongoose.model('User', userSchema);


module.exports = {
    User
}
