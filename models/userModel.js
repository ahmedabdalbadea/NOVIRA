const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
    name: {type: String, required: true}, 
    password: {type: String, required: true},
    email: {type: String, required: true, unique:true},
    weekly_scores: {type: Object},
    monthly_scores: {type: Object},
    current_mood: {type: String}
},{timestamps:true});

const User = mongoose.model('User', userSchema);

const getUser = async (email, password)=> {
    await User.findOne({email: email, password: password}).then( userDoc => {
        console.log(`user found with id: ${userDoc.id}`);
        return userDoc;
    }).catch(err => {
        console.error(`User not found, Error: ${err}`);
    });
}

module.exports = {
    User, getUser
}
