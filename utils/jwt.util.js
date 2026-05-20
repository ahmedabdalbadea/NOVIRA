import jwt from "jsonwebtoken";

export const verifyJWT = (req, res, next) => {
    // 1. Try to get token from cookies first
    // Use the same name you used in res.cookie("jwt", ...)
    let token = req.cookies.jwt;

    // 2. Fallback: Check Authorization header (if you want to support both)
    if (!token) {
        const authHeader = req.headers.authorization || req.headers.Authorization;
        if (authHeader?.startsWith("Bearer ")) {
            token = authHeader.split(" ")[1];
        }
    }

    // 3. If still no token, return Unauthorized
    if (!token) {
        return res.status(401).json({ message: "Unauthorized" });
    }

    jwt.verify(token, process.env.REFRESH_TOKEN_SECRET, (err, decode) => {
        if (err) return res.status(403).json({ message: "Forbidden" });
        req.user = decode.UserInfo.id;
        next();
    });
};
