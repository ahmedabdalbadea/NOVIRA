import 'dotenv/config';

export const env = {
    PORT: process.env.PORT || 3000,
    MONGODB_URI: process.env.MONGODB_URI,
    NODE_ENV: process.env.NODE_ENV || 'development',
    ACCESS_TOKEN_SECRET: process.env.ACCESS_TOKEN_SECRET || 'default_secret',
    REFRESH_TOKEN_SECRET: process.env.REFRESH_TOKEN_SECRET || 'default_refresh_secret',
    CLIENT_URL: process.env.CLIENT_URL || '*',
    API_KEY: process.env.API_KEY || 'your_openrouter_api_key_here'
}