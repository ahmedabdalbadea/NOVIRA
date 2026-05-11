import application from "./configurations/application.js";
import mongoose from "mongoose";
import { env } from "./configurations/env.js";
import { dbConnect } from "./configurations/database.js";
import { logger } from "./utils/logger.util.js";

let server;

const gracefulShutdown = async (signal) => {
    logger.warn(`\nReceived ${signal}. Starting graceful shutdown...`);
    
    if (server) {
        server.close(async () => {
            logger.warn("HTTP server closed.");
            
            try {
                // Close database connection
                await mongoose.connection.close(false);
                logger.warn("MongoDB connection closed.");
                
                logger.warn("Shutdown complete. Goodbye!");
                process.exit(0);
            } catch (err) {
                logger.error("Error during DB closure:", err);
                process.exit(1);
            }
        });
    } else {
        process.exit(0);
    }
};

// --- Process Listeners ---

// Handle standard termination signals
process.on("SIGTERM", () => gracefulShutdown("SIGTERM")); // Sent by tools like Heroku/Docker
process.on("SIGINT", () => gracefulShutdown("SIGINT"));   // Sent on Ctrl+C

// Handle unexpected crashes
process.on("uncaughtException", (error) => {
    logger.error("FATAL: Uncaught Exception!", error);
    process.exit(1); 
});

process.on("unhandledRejection", (reason) => {
    logger.error("UNHANDLED REJECTION:", reason);
    gracefulShutdown("unhandledRejection");
});

// --- Boot Sequence ---

const startServer = async () => {
    try {
        await dbConnect();
        server = application.listen(env.PORT, () => {
            logger.info(`🚀 Server pulsing on port ${env.PORT}`);
        });
    } catch (error) {
        logger.error("Failed to start server:", error);
        process.exit(1);
    }
};

startServer();