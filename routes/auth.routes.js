import { Router } from 'express';
import userController from "../controllers/userController.js";
import verifyJWT from "../middleware/verifyJWT.js";

const router = Router();


router.post("/signUp", userController.signUp);
router.post("/login", userController.login);
router.get("/refresh", verifyJWT, userController.refresh);
router.post("/logout", userController.logout);


export default router;