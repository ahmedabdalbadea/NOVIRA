import express from 'express';
import cors from 'cors';
import cookieParser from 'cookie-parser';
import helmet from 'helmet';
import compression from 'compression';

import { logger } from '../middleware/logger.middleware.js';
import { env } from './env.js'
import { limiter } from "../utils/limiter.util.js"
import { languageSupport } from "../middleware/languageSupport.middleware.js"
import { compressionOptions, corsOptions } from './options.js';
import { errorHandler } from "../utils/errorHandler.util.js";
import { morganMiddleware } from '../utils/logger.util.js';

import userRoutes from '../routes/user.routes.js';
import authRoutes from '../routes/auth.routes.js';

const application = express();

// Middlewares
// 1. Security & Traffic Control
application.use(helmet());
application.use(compression(compressionOptions)); // Performance optimization (better invoking early)
application.use(cors(corsOptions));
application.use(morganMiddleware);
application.use(limiter);

// 2. Performance & Parsing
application.use(express.json({ limit: "10kb" })); 
application.use(express.urlencoded({ extended: true, limit: "10kb" }));
application.use(cookieParser());

// 3. Domain Logic Middleware
application.use(languageSupport);

// // API End-Points (Routes)
application.use("/users", userRoutes);
application.use("/auth", authRoutes);

// 404 Handler for undefined routes
application.use((request, response) => {
    response.status(404).json({ message: "Endpoint not found" });
});

// Error Handler Middleware (should be last)
application.use(errorHandler);

export default application;