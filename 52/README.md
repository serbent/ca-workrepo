# 52/53 tfstate, import, workspaces, backend

* Create infra with local backend
* Delte tfstate file
* Import resource to terraform 
* Migrate tfstate to remote backend
* Create workspaces (dev/test/prod)(localy)
* Observe the structure for created statefiles
* Migrate to remote backend.
* Write simple tests for yout infra:
    1. Test that the name has an environment suffix
    2. Check that there is a "environment" tag. 
    3. Check the machine type is of type t2.micro. 
* Try to write code that doens't pass test, see results.  