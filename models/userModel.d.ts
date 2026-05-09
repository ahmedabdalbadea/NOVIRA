import { Model, Document } from 'mongoose';

export interface IUser extends Document{
    name: string;
    password: string;
    email: string;
    weekly_scores: object,
    monthly_scores: object,
    current_mood: string
}

/**
 * get the user data in a mongoDB document format
 * @param email the email associated with the user whose data to be fetched
 */

export declare const getUser: (email: string, password: string) => Promise<Document>;
export declare const User: Model<IUser>;





