import { Router } from 'express';
import { handleAssessment, updateUserScore, getUserScore } from '../controllers/user.controller.js';
import { verifyJWT } from '../utils/jwt.util.js';

const router = Router();


router.get('/assessment', handleAssessment)
router.post('/assessment/updateScore', verifyJWT, updateUserScore);
router.get('/assessment/getScore', verifyJWT, getUserScore);

export default router;