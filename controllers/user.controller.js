import { assignRefreshToken, create, verifyUser, findAndGetUserScore, updateUser } from "../services/user.service.js";
import { AssessmentQuestionsAR, AssessmentQuestionsEN } from "../models/Assessment.js";

export async function signUp(request, response) {
    const { name, email, password, confirmPassword } = request.body;

    const user = await create(name, email, password, confirmPassword);

    response.cookie("jwt", user.tokens.refresh,{
        httpOnly:true,
        secure:false,
        sameSite:"lax",
        maxAge:7*24*60*60*1000
    });

    return response.status(201).json({ message: "User created successfully", user: user.user, accessToken: user.tokens.access });
}

export async function login(request, response) {
    const { password, email } = request.body;

    const user = await verifyUser(email, password);
        
    response.cookie("jwt", user.tokens.refresh, {
        httpOnly:true,//accessible only by web server
        secure:false,// https
        sameSite:"lax",//Min,sub domain
        maxAge:7*24*60*60*1000//7day

    });
    response.json({
        message: "Login successful",
        user: user.user,
        accessToken: user.tokens.access,
    });
    
}

export async function refresh(request, response) {
    const cookies = request.cookies;
    if (!cookies?.jwt) return response.status(401).json({ message: "Unauthorized" });
    const newAccessToken = await assignRefreshToken(cookies.jwt);
    response.json({ accessToken: newAccessToken });
}

export function logout(request, response) {
    const cookies = request.cookies;
    if (!cookies?.jwt) return response.sendStatus(204);
    response.clearCookie("jwt",{
        httpOnly:true,
        secure:false,
        sameSite:"lax"
    });
    response.json({message:"Logged out successfully"});
}

export async function handleAssessment(request, response) {
    response.status(200).send(request.lang === 'ar' ? AssessmentQuestionsAR : AssessmentQuestionsEN );
}

export async function updateUserScore(request, response) {
    const user = await updateUser(request.body, request.user);
    if (!user) return response.status(404).json({ message: "User not found" });

    return response.status(200).json({ message: "Successfully Updated User Score Data!" });
}

export async function getUserScore(request, response) {
    const user = await findAndGetUserScore(request.user);
    if (!user) return response.status(404).json({ message: "User not found" });
    response.status(200).json({ user, message: "Successfully Retrieved User Score Data!" });
}