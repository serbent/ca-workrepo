# 77. Logging. Web Server.

## Excercises

### 01. 

Create a web server with 3 endpoint 
* home (/)
* * Use a simple HTML to format your page.
* about (/about)
* * Output the IP of the client (you can use `r.RemoteAddr`)
* people (/people)
* * Display the list of people (use file from lecture 72)

### 02.

Upgrade your application with logging
* Handle different types of messages. 
* * Errors - should have the PrefiX ERROR
* * Info - should have prefix INFO
* Output logs to a file. 
