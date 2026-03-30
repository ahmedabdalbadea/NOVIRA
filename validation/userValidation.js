const { body, matchedData, validationResult} = require('express-validator');

const validationRules = [
    body('email').isEmail().trim().withMessage('Email Must Be Valid!'),
    body('password').isStrongPassword({minSymbols: 1, minUppercase: 1, minLowercase: 1, minNumbers: 1}).withMessage('Password not Strong enough, try again').isLength({min: 8}).withMessage('Password Must Be At Least 8 Characters Long!'),
    body('confirmPassword').not().equals('password').withMessage('Passwords are not equal!')
];
const validationRulesLogin = [
    validationRules[0], validationRules[1]
];
/** 
* @type {import('express').RequestHandler}
*/
const validateInput = (req, res, next) => {
    const result = validationResult(req);
        if(!result.isEmpty()){
            return res.status(400).json({
                success: false,
                errors: result.array()
            });
        }
        if(req.path == 'signup'){
            const data = matchedData(req);
            req.validData = data;
        }
    next();
}

module.exports = {
    validateInput, validationRules, validationRulesLogin
}