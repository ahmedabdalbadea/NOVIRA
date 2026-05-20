import { logger } from "./logger.util.js";

export const errorHandler = (error, request, response, next) => {
    logger.error("Error:", error.message);

    const statusCode = response.statusCode !== 200 ? response.statusCode : 500;

    response.status(statusCode).json({
        message: error.message || 'An unexpected error occurred.',
        ...(process.env.NODE_ENV === 'development' && { stack: error.stack }),
        
    });
}
