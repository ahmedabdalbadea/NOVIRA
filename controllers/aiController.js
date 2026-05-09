// controllers/ai.controller.js

const {OpenAI} = require('openai');

class AiController {
    constructor() {
        this.aiClient = new OpenAI({
            baseURL: "https://openrouter.ai/api/v1",
            apiKey: process.env.API_KEY   // your OpenRouter key in .env
        });
    }

    async sendPrompt(prompt) {
        const response = await this.aiClient.chat.completions.create({
            model: "deepseek/deepseek-chat",   // DeepSeek on OpenRouter
            messages: [
                { role: "user", content: prompt }
            ]
        });

        return response.choices[0].message.content;
    }

    async chat(messages) {
        const response = await this.aiClient.chat.completions.create({
            model: "deepseek/deepseek-chat",
            messages
        });
        return response.choices[0].message.content;
    }
}

module.exports = AiController;