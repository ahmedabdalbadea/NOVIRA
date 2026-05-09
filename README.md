# Usage

## API Endpoints:

### Authentication (/auth)
These routes handle user registration and sessions.

#### `/auth/signUp` :
- **Request Type**: POST
- **Expected Request Body Structure**: 
```json
{
    "name": "String",
    "password": "String",
    "email": "String"
}
```
- **Expected Response Body Structure**: 
```json
{
    "accessToken": "String",
    "email": "String",
    "fName": "String",
    "lName": "String"
}
```
#### `/auth/login` : 
- **Request Type**: POST
- **Expected Request Body Structure**:
```json
{
    "email": "String",
    "password": "String"
}
```
- **Expected Response Body Structure**:
```json
{
    "accessToken": "String",
    "email": "String",
    "name": "String"
}
```
---

### User Assessment & Scores (/users/assessment)
Endpoints for retrieving and updating user-specific assessment data.

#### `/users/assessment?lang='ar|en'`: 
- **Request Type**: GET
- **Expected Response Body Structure**: 
`lang=ar` : Arabic Questions   
`lang=en` : English Questions 

Both have this structure: 
```json
[
    {
      "desc": "Assessing core interest levels and daily engagement.",
      "question": "Over the last 2 weeks, how often have you been bothered by little interest or pleasure in doing things?",
      "answer": [
        { "Not at all": false },
        { "Several days": false },
        { "More than half the days": false },
        { "Nearly every day": false }
      ]
    }, ....
]
```
#### `/users/assessment/updateScore` :
- **Request Type**: POST
- **Security**: Requires Authorization Bearer Token (verifyJWT).
- **Expected Request Body Structure**:
```json
{
  "profile_image": null,
  "name": "",
  "email": "",
  "password": "",
  "phone": "",
  "date_of_birth": "",
  "short_bio": "",
  "current_mode": "",
  "weekly_scores": [
    {
      "date": "",
      "score": null
    }
  ],
  "monthly_scores": [],
  "moods": [
    "happy"
  ]
}
```
#### `/users/assessment/getScore` :
- **Request Type**: GET
- **Security**: Requires Authorization Bearer Token (verifyJWT).
- **Expected Response Body Structure**:
```json
{
    "_id": "String",
    "current_mood": "Array",
    "weekly_scores": "Array",
    "monthly_scores": "Array"
}
```