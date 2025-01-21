# Secrets, configmaps, Persistent Volumes, Persistent Volume Claims

## base64 encode 
Secrets are bas64 encoded. To encode a string to base64 run the command:
`echo STRING | base64`
To decode a base64 encoded string run:
`echo BASE64ENCODEDSTRING | base64 -d`


## Add dotfiles 

Add these lines to ~/.bashrc to use functions and aliases from dotfiles.

```
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi
```
