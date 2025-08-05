# List all available commands
_default:
    @just --list --unsorted

# Build the Docker image
build:
    docker compose -f docker-compose.yaml build
