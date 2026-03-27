import { Model, Document } from 'mongoose';

export interface IUser extends Document{
    fName: string;
    lName: string;
    password: string;
    gender?: 'male' | 'female' | 'other';
    email: string;
}

export declare const User: Model<IUser>;