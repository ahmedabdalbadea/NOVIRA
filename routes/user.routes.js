import { Router } from 'express';

import { 
        signUp,
        login,
        handleAssessment,
        updateUserScore,
        getUserScore
    } from "../controllers/userController.js";
import { 
        validateInput,
        validationRules,
        validationRulesLogin
    } from "../validation/userValidation.js";
import verifyJWT from "../middleware/verifyJWT.js";

const router = Router();


//User assessment
router.get('/assessment', handleAssessment)
//User Score
router.post('/assessment/updateScore', verifyJWT, updateUserScore);
router.get('/assessment/getScore', verifyJWT, getUserScore);

export default router;