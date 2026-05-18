export const corsOptions = {
    origin: process.env.CLIENT_URL || '*',
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
    allowedHeaders: ['Content-Type', 'Authorization', 'x-no-compression']
};

export const compressionOptions = {
    threshold: 1024,
    filter: (request) => (request.headers["x-no-compression"] ? false : true),
}