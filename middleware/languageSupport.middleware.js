export const languageSupport = (request, response, next) => {
    const supportedLangs = ['en', 'ar'];
    const requested = request.query.lang;

    request.lang = supportedLangs.includes(requested) ? requested : 'en';
    next();
}
