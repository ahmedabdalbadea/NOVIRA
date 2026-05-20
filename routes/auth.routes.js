import { Router } from 'express';
import { signUp, login, refresh, logout } from '../controllers/user.controller.js';
import { verifyJWT } from '../utils/jwt.util.js';
const router = Router();

router.post("/signUp", signUp);
router.post("/login", login);
router.get("/refresh", verifyJWT, refresh);
router.post("/logout", verifyJWT, logout);


export default router;