const express = require('express');
const { signUp, Login } = require('../controllers/userController');
const { validateInput, validationRules, validationRulesLogin } = require('../validation/userValidation');

/**
 * Initialize routes
 */

function initRoutes(app){
    //User Register Routes
    app.post('/signup', validationRules, validateInput, signUp);
    
    //User Login Routes
    app.post('/login', validationRulesLogin, validateInput, Login);
}



module.exports = initRoutes;
