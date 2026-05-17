# Development Sandbox

A  lightweight, configurable sandbox environment for developing with Linux inside Docker containers.
Supports quick setup with ZSH + [Oh My Zsh](https://ohmyz.sh/), along with some starter CLI tools.

## Quick Starts

1. Clone the repository.

   ```bash
   git clone https://github.com/jgfranco17/developer-sandbox.git
   cd developer-sandbox
   ```

2. Build the Docker image.

   ```bash
   # Manually
   docker compose -f docker-compose.yaml build

   # Or use Just
   just build
   ```

3. Start the sandbox environment.

   ```bash
   docker compose run --rm ubuntu-sandbox
   ```

Running the above command will start the container and open a terminal session inside it.
You can then use the tools installed in the container.

## Mounted Workspace

If you wish to mount files from your host machine into the container, you can do so by
adding them to the `mount` directory in the root of the project. This directory is mounted
as read-only to `/home/devuser/workspace` inside the container.
