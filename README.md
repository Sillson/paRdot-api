# paRdot
A simple R wrapper for the Pardot API

### Getting Started:

Add paRdot to your working directory
```
source("R/paRdot.R", local=TRUE)
set_username('insert-your-username')
set_password('insert-your-password')
set_user_key('insert-your-user-key')
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
