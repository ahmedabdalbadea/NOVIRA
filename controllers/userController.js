const mongoose = require('mongoose');
const {User, getUser} = require('../models/userModel.js')
const { validateInput, validationRules } = require('../validation/userValidation')
const dbConnect = require('./dbConnect.js');
const assess = require('../models/userAssessment.js');
/**
 * @type {import("express").RequestHandler}
 */

const signUp = async (req, res) => {
    const user = await getUser(req.body.email);
    if(user){
        res.status(400).json({
            success: false,
            msg: "User already registered"
        });
        return;
    }
    
    //Add user document to mongoDB
    try{
        const details = req.body;

        await User.create({
              full_name: details.full_name,
              password: details.password,
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
    
}  

/**
 * @type {import("express").RequestHandler}
 */

const Login = async (req, res) => {
    dbConnect();
    const user = await getUser(req.body.email, req.body.password);
    if(user){
       return res.status(200).json({
            success: true,
            msg: `Welcome Back ${user}`
        });
    }else{
        return res.status(404).json({
            success: false,
            msg: "User not found"
        });
    }
    
}

/**
 * @type {import('express').RequestHandler}
 */
const handleAssessment = async (req, res)=>{
    try{
        res.status(200).send( req.lang === 'ar' ? assess.AssessmentQuestionsAR : assess.AssessmentQuestionsEN );
    }
    catch(err){
        res.status(400).json({
            msg: "Something went wrong!"
        });
    }
}

module.exports = {
    signUp, Login, handleAssessment
}