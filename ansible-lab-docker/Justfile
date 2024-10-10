# Define the variable for docker compose
DOCKER_COMPOSE := "docker compose"

# Show available options
default:
	@just -l
# Phony tasks (they won't refer to actual files or directories)
# In Just, you don't explicitly need .PHONY, but you can comment it out for clarity

# Stop services
stop +args:
    {{ DOCKER_COMPOSE }} stop {{ args }}

# stop all services
stopall:
    {{ DOCKER_COMPOSE }} stop

# Run services
run +args:
    {{ DOCKER_COMPOSE }} up {{ args }} -d

# Run all services
runall:
    {{ DOCKER_COMPOSE }} up -d

# Pull the latest images
pull:
    {{ DOCKER_COMPOSE }} pull

# Restart services
restart +args:
    {{ DOCKER_COMPOSE }} restart {{ args }}

#restart all services
restartall:
    {{ DOCKER_COMPOSE }} restart
# Show logs
logs +args:
    {{ DOCKER_COMPOSE }} logs {{ args }}

# Show all logs
logsall:
    {{ DOCKER_COMPOSE }} logs

# Build service(s) and run
build +args:
    {{ DOCKER_COMPOSE }} up {{ args }} --build -d

# Build service(s) and run
buildall:
    {{ DOCKER_COMPOSE }} up --build -d

# Show running containers
ps:
    {{ DOCKER_COMPOSE }} ps

