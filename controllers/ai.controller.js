import { OpenAI } from 'openai';
import { env } from "../configurations/env.js";

export class AiController {
    constructor() {
        this.aiClient = new OpenAI({
            baseURL: "https://openrouter.ai/api/v1",
            apiKey: env.API_KEY
        });
    }

    async sendPrompt(prompt) {
        const response = await this.aiClient.chat.completions.create({
            model: "deepseek/deepseek-chat",
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
