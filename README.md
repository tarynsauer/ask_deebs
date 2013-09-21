# Ask Deebs

This application allows DBC students/teachers/TAs (anyone with a Socrates login) to support each other by providing a platform to ask, answer, and follow questions on any issue or topic they are interested in. 

## Setup 

This application uses oauth2 for authentication, so you will need to set up your environment accordingly.

1. Make sure that `dbc-ruby` and `oauth2` are both included in your Gemfile
2. Create an `auth.yaml` file in the `config` directory. 

### Example `auth.yaml` file:

If you need a token/secret please email us at askdeebs@gmail.com to request one. 

```
OAUTH_TOKEN : YOUR_OAUTH_TOKEN_HERE
OAUTH_SECRET : YOUR_OAUTH_SECRET_HERE
OAUTH_REDIRECT : http://localhost:3000/auth
DBC_API : YOUR_DBC_API_KEY_HERE
```



