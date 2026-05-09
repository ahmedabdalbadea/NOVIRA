const express = require('express');
const { signUp, login, handleAssessment, updateUserScore, getUserScore } = require('../controllers/userController');
const { validateInput, validationRules, validationRulesLogin } = require('../validation/userValidation');
const verifyJWT = require('../middleware/verifyJWT.js');
const router = express.Router();


//User assessment
router.get('/assessment', handleAssessment)
//User Score
router.post('/assessment/updateScore', verifyJWT, updateUserScore);
router.get('/assessment/getScore', verifyJWT, getUserScore);


module.exports = router;






