# paRdot
A simple R wrapper for the Pardot API

### Getting Started:
Set up your environment variables
```
Sys.setenv("PARDOT_EMAIL" = "your pardot email")
Sys.setenv("PARDOT_PASSWORD" = "your pardot password")
Sys.setenv("PARDOT_USER_KEY" = "your pardot_user_key")
```

Next, make a **paRdot** api call. Will return a XML response
```
paRdot('object', 'operator', 'identifier_field', 'identifier')
```

### To Do:
- Extend to use optional request params, and JSON format
- Stick to one XML library
- Clean up string concatenation functions
- Extend to make pre-baked api calls that we can use to return lists, strings, etc. 
