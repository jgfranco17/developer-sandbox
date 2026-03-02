# Docker Sandbox Variables for Nomad

# Container configuration
variable "image" {
  type    = string
  default = "ghcr.io/jgfranco17/ubuntu-sandbox:latest"
  description = "The Docker image to use for the sandbox."
}
