import mongoose from "mongoose";
import { env } from './env.js';
import { logger } from '../utils/logger.util.js';

export const dbConnect = async ()=>{

    if (!env.MONGODB_URI) {
        logger.error("❌ MONGODB_URI is not defined in .env");
        process.exit(1);
    }

    try{
        await mongoose.connect(env.MONGODB_URI, {
            autoIndex: true,
            serverSelectionTimeoutMS: 5000, 
        });

        logger.info("✅ MongoDB connected successfully")
    }
    catch (error) {
        logger.error("❌ MongoDB connection error: " + error)
        process.exit(1)
    }
}


