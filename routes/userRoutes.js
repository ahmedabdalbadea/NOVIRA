const express = require('express');
const { signUp, Login, handleAssessment } = require('../controllers/userController');
const { validateInput, validationRules, validationRulesLogin } = require('../validation/userValidation');

const router = express.Router();


//User Register Routes
router.post('/signup', validationRules, validateInput, signUp);

//User Login Routes
router.post('/login', validationRulesLogin, validateInput, Login);

//User assessment
router.get('/assessment', handleAssessment)


module.exports = router;
