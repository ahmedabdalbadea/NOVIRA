import mongoose from "mongoose";

const userSchema = new mongoose.Schema(
    {
        name: { type: String, required: true }, 
        password: { type: String, required: true },
        email: { type: String, required: true, unique: true },
        
        // Profiles details you were updating
        phone: { type: String },
        date_of_birth: { type: Date },
        short_bio: { type: String },

        // Scores and Moods
        weekly_scores: { type: Object, default: {} },
        monthly_scores: { type: Object, default: {} },
        current_mood: { type: String }
    },
    { timestamps: true }
);

export const User = mongoose.model('User', userSchema);