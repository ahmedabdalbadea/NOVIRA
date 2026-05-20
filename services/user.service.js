import { env } from "../configurations/env.js";
import { User } from "../models/User.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

export async function create(name, email, password, confirmPassword) {
    if (!name || !email || !password) throw new Error("All fields are required");
    if (confirmPassword && confirmPassword !== password)  throw new Error("Passwords do not match");

    const normalizedEmail = String(email).trim().toLowerCase();
    const normalizedName = String(name).trim();

    const user = await User.findOne({ email: normalizedEmail }).exec();
    if (user) throw new Error("User already exists");
    
    const hashedPassword = await bcrypt.hash(password, 10);
    const newUser = await User.create({
        name: normalizedName,
        password: hashedPassword,
        email: normalizedEmail
    });

    const accessToken= jwt.sign({ UserInfo:{ id:newUser._id } }, env.ACCESS_TOKEN_SECRET ,{expiresIn:"15m"});
    const refreshToken= jwt.sign({ UserInfo:{ id:newUser._id } }, env.REFRESH_TOKEN_SECRET,{expiresIn:"7d"})
    
    return { user: newUser, tokens: { access: accessToken, refresh: refreshToken } };
}

export async function verifyUser(email, password) {
    if(!password || !email) return new Error("All fields are required");

    const normalizedEmail = String(email).trim().toLowerCase();
    const user = await User.findOne({ email: normalizedEmail }).exec();
    if (!user) throw new Error("User does not exist");

    const match = await bcrypt.compare(password, user.password);
    if(!match) throw new Error("Wrong Password");

    const accessToken = jwt.sign({ UserInfo:{ id:user._id } }, env.ACCESS_TOKEN_SECRET,{expiresIn:"15m"});
    const refreshToken = jwt.sign({ UserInfo:{ id:user._id } }, env.REFRESH_TOKEN_SECRET,{expiresIn:"7d"});

    return { user, tokens: { access: accessToken, refresh: refreshToken } };
}

export async function assignRefreshToken(refreshToken) {
    jwt.verify(refreshToken, env.REFRESH_TOKEN_SECRET, async(err, decoded) => {
        if(err) return new Error("Forbidden");

        const user = await User.findById(decoded.UserInfo.id).exec();
        if(!user) return new Error("Unauthorized");

        const accessToken= jwt.sign({ UserInfo:{ id:user._id, } }, env.ACCESS_TOKEN_SECRET,{expiresIn:"15m"});
        return { accessToken };
    })
}

export async function updateUser(data, userId) {
    const updatedUser = await User.findByIdAndUpdate(
        userId, 
        { 
            $set: {
                phone: data.phone,
                date_of_birth: data.date_of_birth,
                short_bio: data.short_bio,
                current_mood: data.current_mood, 
                weekly_scores: data.weekly_scores,
                monthly_scores: data.monthly_scores
            },
        }, 
        { new: true, runValidators: true }
    );
    console.log("data: " + updatedUser)
    return updatedUser;
}

export async function findAndGetUserScore(userId) {
    const userScores = await User.findById(userId).select("current_mood weekly_scores monthly_scores");
    return userScores;
}