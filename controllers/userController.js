const mongoose = require('mongoose');
const {User} = require('../models/userModel.js');
const dbConnect = require('./dbConnect.js')
const {body, validationResult} = require('express-validator')
/**
 * @param {Object} details JSON object containing user details
 * @param {Object} details.fName First Name
 * @param {Object} details.lName Last Name
 * @param {Object} details.password Password
 * @param {Object} details.gender Gender
 * @param {Object} details.email Email
 */
const registerUserToDB = async (details) => {
    //Connect to MongoDB
    dbConnect();
    
    await User.create({
          fName: details.fName,
          lName: details.lName,
          password: details.password,
          gender: details.gender,
          email: details.email
    });
    
};



const signUp = (req, res) => {
    const     
}