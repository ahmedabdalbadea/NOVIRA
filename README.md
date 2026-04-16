# Usage

## API Endpoints:

### `/users/signup` :
Request Type -> `POST`\
Expected Request Body Structure: 

```
{
    full_name: String,
    password: String,
    email: String
}
```

Expected Response Body Structure: \
if success: 
```
{
    Success:true,
    msg: "User Registered Successfully! We have sent a confirmation email to your email address"
}
```
### `/users/login` : 
Request Type -> `POST`\
Expected Request Body Structure:
```
{
    email: String,
    password: String
}
```
Expected Response Body Structure:
```
{
    success: true,
    msg: `Welcome Back ${user}`
}
```

### `/users/assessment?lang='ar|en'`: 
Request Type -> `GET` \
Expected Response Body Structure: \
`lang=ar` : Arabic Questions   
`lang=en` : English Questions 

both have this structure: \
```
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

