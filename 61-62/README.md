# Secrets, configmaps, Persistent Volumes, Persistent Volume Claims

## base64 encode 
Secrets are bas64 encoded. To encode a string to base64 run the command:
`echo STRING | base64`
To decode a base64 encoded string run:
`echo BASE64ENCODEDSTRING | base64 -d`