### Functions for aliases.

# Get decoded secret data from secret
function __getSecret {
	 if [ -n "$1" ]; then
		 kubectl get secret $1 -o go-template='{{range $k,$v := .data}}{{printf "%s: " $k}}{{if not $v}}{{$v}}{{else}}{{$v | base64decode}}{{end}}{{"\n"}}{{end}}'
         fi
}
# Enter shell in pod
function __kexec {
	           if [ -n "$1" ]; then
	           kubectl exec --stdin --tty "$1" -- /bin/sh
	           fi
	         }
# Get service account bindings in k8s cluster.
function __getBinding
	{
	  if [ -n "$1" ]; then
		gcloud iam service-accounts get-iam-policy "$1"@"$2".iam.gserviceaccount.com
	  fi
	}

# Helper function to easily set KUBECONFIG
# Usage: setkube <TAB>
function kctx {
	local CONFIG_PATH="$HOME/.kube/configs/"
	local YAML_FILE=$(ls $CONFIG_PATH | fzf)
    # Check if file exists
    if test -f "$CONFIG_PATH/$YAML_FILE"
    then
        export KUBECONFIG=$CONFIG_PATH/$YAML_FILE
    else
        >&2 echo "File does not exist " $YAML_FILE
    fi
}

function setkube_completions {
    # Get all .yaml files from ~/.kube directory
    local FILES=$(find "$HOME/.kube" -name '*.yaml' -type f -printf '%P\n')
    # Cut out .yaml extension
    local OPTIONS=$(echo "$FILES" | sed 's/.yaml//g' | tr '\n' ' ')

    # Set available options for autocomplete
    COMPREPLY=($(compgen -W "$OPTIONS"))
}

# Get creentials for a specific cluster in GCP 
function getCredentials {
	export KUBECONFIG=~/.kube/configs/$1.yaml
	gcloud container clusters get-credentials $1
}

# Git to pull/commit/push
function lazygit {
    echo "Git pull:"
    git pull
    echo "Git add:"
    git add .
    echo "git commit -am :"
    git commit -a -m "$1"
    echo "git push"
    git push
}