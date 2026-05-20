import path from "path";
import fs from "fs";
import { fileURLToPath } from "url";
import winston from "winston";
import morgan from "morgan";
import { env } from "../configurations/env.js";
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Create logs directory
const logDir = path.join(__dirname, "../logs");
if (!fs.existsSync(logDir)) {
  fs.mkdirSync(logDir, { recursive: true });
}

const logger = winston.createLogger({
  level: "info",
  format: winston.format.combine(
    winston.format.timestamp({ format: "YYYY-MM-DD HH:mm:ss" }),
    winston.format.errors({ stack: true }),
    winston.format.printf(({ timestamp, level, message, stack }) => {
      return `${timestamp} [${level.toUpperCase()}] ${stack || message}`;
    })
  ),
  transports: [
    new winston.transports.File({ filename: path.join(logDir, "errors.log"), level: "error" }),
    new winston.transports.File({ filename: path.join(logDir, "application.log") }),
  ],
});

// Morgan sends HTTP request logs to Winston
const morganMiddleware = morgan(
  ":remote-addr :method :url :status :res[content-length] - :response-time ms",
  {
    stream: {
      write: (message) => logger.info(message.trim()),
    },
  }
);

if (env.NODE_ENV !== "production") {
  logger.add(new winston.transports.Console({
    format: winston.format.combine(winston.format.colorize(), winston.format.simple()),
  }));
}

export { logger, morganMiddleware };