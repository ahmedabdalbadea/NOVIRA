import { Model, Document } from 'mongoose';

export interface IUser extends Document{
    full_name: string,
    password: string,
    gender: 'male' | 'female' | 'other',
    email: string
}

/**
 * get the user data in a mongoDB document format
 * @param email the email associated with the user whose data to be fetched
 */

export declare const getUser: (email: string, password: string) => Promise<Document>;
export declare const User: Model<IUser>;