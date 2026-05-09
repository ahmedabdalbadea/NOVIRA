const mongoose = require('mongoose');
const {User} = require('../models/userModel.js');
const {body, validationResult} = require('express-validator');
const { validateInput, validationRules } = require('../validation/userValidation')
const dbConnect = require('./dbConnect.js');
const assess = require('../models/userAssessment.js');

const bcrypt=require("bcrypt");
const jwt=require("jsonwebtoken");


/**
 * @type {import("express").RequestHandler}
 */
  
const signUp = async(req, res) => {
    
    const {name, password, email} = req.body;
    if(!name || !password || !email){
        return res.status(400).json({message:"All fields are required"});

    }
    const foundUser= await User.findOne({email}).exec();
    if(foundUser){
        return res.status(401).json({message:"User already exists"});
    }
    const hashedPassword= await bcrypt.hash(password,10);
    const newUser = await User.create({
          name,
          password: hashedPassword,
          email
    });
    const accessToken=jwt.sign({
        UserInfo:{
            id:newUser._id
        }
    },
    process.env.ACCESS_TOKEN_SECRET,{expiresIn:"15m"});

    const refreshToken=jwt.sign({
        UserInfo:{
            id:newUser._id
        }
    },
    process.env.REFRESH_TOKEN_SECRET,{expiresIn:"7d"})

    res.cookie("jwt",refreshToken,{
        httpOnly:true,//accessible only by web server
        secure:false,// https
        sameSite:"lax",//Min,sub domain
        maxAge:7*24*60*60*1000//7day

    });
    res.json({
        accessToken,
        email:newUser.email,
        fName:newUser.fName,
        lName:newUser.lName,

    });
    
};





/**
 * @type {import("express").RequestHandler}
 */

const login = async(req, res) => {
    
    const {password, email} = req.body;
    if(!password || !email){
        return res.status(400).json({message:"All fields are required"});

    }
    const foundUser= await User.findOne({email}).exec();
    if(!foundUser){
        return res.status(401).json({message:"User does not exist"});
    }
    const match= await bcrypt.compare(password,foundUser.password);
    if(!match){
        return res.status(401).json({message:"Wrong Password"});
    };

    const accessToken=jwt.sign({
        UserInfo:{
            id:foundUser._id
        }
    },
    process.env.ACCESS_TOKEN_SECRET,{expiresIn:"15m"});

    const refreshToken=jwt.sign({
        UserInfo:{
            id:foundUser._id
        }
    },
    process.env.REFRESH_TOKEN_SECRET,{expiresIn:"7d"});

    res.cookie("jwt",refreshToken,{
        httpOnly:true,//accessible only by web server
        secure:false,// https
        sameSite:"lax",//Min,sub domain
        maxAge:7*24*60*60*1000//7day

    });
    res.json({
        accessToken,
        email:foundUser.email,
        name:foundUser.name,
    });
    
};
const refresh=(req,res)=>{
    const cookies=req.cookies;
    if(!cookies?.jwt) return res.status(401).json({message:"Unauthorized"});
    const refreshToken=cookies.jwt
    jwt.verify(refreshToken,process.env.REFRESH_TOKEN_SECRET,async(err,decoded)=>{
        if(err) return res.status(403).json({message:"Forbidden"});
        const foundUser = await User.findById(decoded.UserInfo.id).exec();
        if(!foundUser) return res.status(401).json({message:"Unauthorized"});
        const accessToken=jwt.sign({
        UserInfo:{
            id:foundUser._id,
        }
    },
    process.env.ACCESS_TOKEN_SECRET,{expiresIn:"15m"});
    res.json({accessToken})
    })
};

const logout=(req,res)=>{
    const cookies=req.cookies;
    if(!cookies?.jwt) return res.sendStatus(204);//No content
    res.clearCookie("jwt",{
        httpOnly:true,
        secure:false,
        sameSite:"lax"
    });
    res.json({message:"Logged out successfully"});

};


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

/**
 * Structure of the Request Object
 * {
  "profile_image": null,
  "name": "",
  "email": "",
  "password": "",
  "phone": "",
  "date_of_birth": "",
  "short_bio": "",
  "current_mode": "",
  "weekly_scores": [
    {
      "date": "",
      "score": null
    }
  ],
  "monthly_scores": [],
  "moods": [
    "happy"
  ]
}
 * 
 */


/**
 * @type {import('express').RequestHandler}
 */
const updateUserScore = async(req, res) => {
    //{name, email, password, current_mood, weekly_scores, monthly_scores, ...userData}
    const userUpdatedData = req.body;
    try {

        console.log('decoded cookie: ', jwt.decode(req.cookies.jwt).UserInfo.id);
        const updatedUser = await User.findByIdAndUpdate(
            req.user, 
            { 
                // name: userUpdatedData.name, 
                // email: userUpdatedData.email, 
                // password: userUpdatedData.password, 
                $push: {
                    phone: userUpdatedData.phone,
                    date_of_birth: userUpdatedData.date_of_birth,
                    short_bio: userUpdatedData.short_bio,
                    current_mood: userUpdatedData.current_mood, 
                    weekly_scores: userUpdatedData.weekly_scores,
                    monthly_scores: userUpdatedData.monthly_scores
                } 
            }, 
            { new: true, runValidators: false }
        );

        if (!updatedUser) return res.status(404).json({ message: "User not found" });
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
    res.status(200).json({message: "Successfully Updated User Score Data!"});
}

/**
 * @type {import('express').RequestHandler}
 */
const getUserScore = async(req, res) => {
    const userScores = await User.findById(req.user).select("current_mood weekly_scores monthly_scores");
    res.status(200).json(userScores);
}

module.exports = {
    signUp, login, refresh, logout, handleAssessment, updateUserScore, getUserScore
}