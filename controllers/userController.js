const mongoose = require('mongoose');
const {User, getUser} = require('../models/userModel.js')
const { validateInput, validationRules } = require('../validation/userValidation')

/**
 * @type {import("express").RequestHandler}
 */

const signUp = async (req, res) => {
    const user = await getUser(req.body.email, req.body.password);
    if(user){
        res.status(400).json({
            success: false,
            msg: "User already registered"
        });
        return;
    }
    
    //Add user document to mongoDB
    try{
        await User.create({
              full_name: details.lName,
              password: details.password,
              gender: details.gender,
              email: details.email
        });
        
    }
    //Check for errors
    catch(err){
        return res.status(400).json(err);
    }
    //
    // Add email confirmation logic here
    //      
    
    return res.status(201).json({
        success: true,
        msg: "User Registered Successfully! We have sent a confirmation email to your email address"
    });
    console.log('working!!');
}  

/**
 * @type {import("express").RequestHandler}
 */

const Login = async (req, res) => {
    dbConnect();
    const user = await getUser(req.body.email, req.body.password);
    if(user){
        res.status(200).json({
            success: true,
            msg: `Welcome Back ${user}`
        });
    }else{
        res.status(404).json({
            success: false,
            msg: "User not found"
        });
    }
    
}

module.exports = {
    signUp, Login
}