alias c='clear'
alias checkSsl='check_ssl_function() { echo | openssl s_client -servername "$1" -connect "$1":443 2>/dev/null | openssl x509 -noout -dates; }; check_ssl_function'
alias createConfigEntry='gcloud config configurations create $1' 			                                # create a new entry in config
alias createMakefile="~/bin/create_makefile.sh"                                                             # Create a Makefile from a template.
alias docker-unset='unset DOCKER_TLS_VERIFY && unset DOCKER_HOST && unset DOCKER_CERT_PATH && unset DOCKER_MACHINE_NAME'
alias gauth='gcloud auth application-default login'					                                        # Authenticate with google for application use
alias genPass='openssl rand -base64 16 | tr -dc 'a-zA-Z0-9' | head -c 16'		                            # Generate a random password
alias getBinding='__getBinding'                                                                             # See functions.
alias getBuckets='gcloud alpha storage ls'						                                            # Get list of buckets
alias getClusters='gcloud container clusters list' 					                                        # get a list of GKE clusters form current project
alias getProjects='gcloud projects list' 						                                            # Get all projects
alias getSecret="__getSecret"                                                                               # Get Kubernetes secret. See functions for more info.
alias gitb="GIT_SSH_COMMAND='ssh -i ~/.ssh/bank_github_id_ecdsa' git"                                       #
alias glogin='gcloud auth login'							                                                # Authenticate with google for CLI use
alias grep='grep --color=auto'
alias k='kubectl'                                                                                           # 
alias kcns='kubectl-ns'                                                                                     # Switch kubernetes namespace.
alias kexec='__kexec'                                                                                       # get to POD shell. See functions
alias ll='ls -la --color=auto'                                                                              # 
alias rsync='rsync -Przvh'                                                                                  # some default rsync options
alias setAccount='gcloud config set account $1' 					                                        # set current account
alias setProject='gcloud projects list | fzf | awk '\''{print $1}'\'' | xargs gcloud config set project'    # set current project
alias setRegion='gcloud config set compute/region $1' 					                                    # set default region
alias vi='nvim'                                                                                             # Use NeoVIM as a VI editor
alias az='docker exec -it azure az $1'
alias t='terraform'
alias k='kubectl'
