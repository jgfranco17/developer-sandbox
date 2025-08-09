# List all available commands
_default:
    @just --list --unsorted

# Reset the mounted directory
reset-mount:
    #!/usr/bin/env bash
    echo "Resetting mount..."
    rm -rf ./mount
    mkdir -p ./mount
    echo "Mount reset complete."

# Build the Docker image
build:
    docker compose -f docker-compose.yaml build --no-cache

# Start up the sandbox environment
up:
    docker compose run --rm ubuntu-box
