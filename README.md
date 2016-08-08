# paRdot
A simple R wrapper for the Pardot API

### Getting Started:
Set up your environment variables
```
Sys.setenv("PARDOT_EMAIL" = "your pardot email")
Sys.setenv("PARDOT_PASSWORD" = "your pardot password")
Sys.setenv("PARDOT_USER_KEY" = "your pardot_user_key")
```

Next, make a **paRdot** api call. Will return a `httr` response with the XML doc
```
paRdot('object', 'operator', 'identifier_field', 'identifier')
```
