# Define colors for use in Makefile output
YELLOW="\033[33m"
GREEN="\033[32m"
BLUE="\033[34m"
RED="\033[31m"
RESET="\033[0m"



# Define targets for each service
APP := app
TEST := test
DEV := dev
DB := database
DEMO := demo.database
NGINX := nginx

# Define the docker-compose command to run
DOCKER_COMPOSE := docker compose

# Define the help command
help:
	@echo ${YELLOW} Makefile Usage:${RESET}
	@echo ${GREEN} make build${RESET} - Build Docker Compose stack
	@echo ${GREEN} make up${RESET} - Start Docker Compose stack
	@echo ${GREEN} make restart [services]${RESET} - Restarting service...
	@echo ${RED} make down${RESET} - Stop Docker Compose stack
	@echo ${BLUE} make logs [service]${RESET} - View logs
	@echo ${BLUE} make ip${RESET} - Show IP address of running containers
	@echo ${BLUE} make status${RESET} - Show status of running containers
	@echo ${BLUE} make connect${RESET} - connect to database
	@echo ${BLUE} make rebuild${RESET} - Rebuild all containers
	@echo ${BLUE} make shell [service]${RESET} - Access shell of a service


# Define the command to build the Docker Compose stack
build:
	@echo $(GREEN)Building Docker Compose stack...$(RESET)
	$(DOCKER_COMPOSE) build

# Define the command to start the Docker Compose stack
up:
	@echo $(GREEN)Starting Docker Compose stack...$(RESET)
	$(DOCKER_COMPOSE) up -d
	@ufw-docker allow nginx

# Define the command to stop the Docker Compose stack
down:
	@echo $(RED)Stopping Docker Compose stack...$(RESET)
	$(DOCKER_COMPOSE) down

# Define the command to view the logs of a service
logs:
	@echo $(BLUE)Viewing logs...$(RESET)
	$(DOCKER_COMPOSE) logs -f $(filter-out $@,$(MAKECMDGOALS))

# Define the command to access shell of a service
shell:
	@echo $(BLUE)Accessing shell...$(RESET)
	$(DOCKER_COMPOSE) exec $(filter-out $@,$(MAKECMDGOALS)) /bin/sh

# Define the command to connect to a database
connect:
	@echo $(BLUE)Connecting to database...$(RESET)
	$(DOCKER_COMPOSE) exec $(DB) mysql -uroot -p


# Define the command to restart a service
restart:
	@echo $(GREEN)Restarting service...$(RESET)
	$(DOCKER_COMPOSE) restart $(filter-out $@,$(MAKECMDGOALS))
	@ufw-docker allow nginx

# Define the command to rebuild and start the Docker Compose stack
rebuild:
	@echo $(BLUE)Rebuilding and starting Docker Compose stack...$(RESET)
	$(DOCKER_COMPOSE) up -d --build

# Define the command to view the status of all services
status:
	@echo $(BLUE)Viewing status of all services...$(RESET)
	$(DOCKER_COMPOSE) ps

# Define the command to view the IP address of a service
ip:
	@echo $(BLUE)Viewing IP address of service...$(RESET)
	$(DOCKER_COMPOSE) exec $(filter-out $@,$(MAKECMDGOALS)) hostname -i
