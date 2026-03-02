job "docker-sandbox" {
  datacenters = ["dc1"]

  group "sandbox" {
    count = 1

    task "sandbox-container" {
      driver = "docker"

      config {
        image = var.image
        ports = ["http"]
      }

      resources {
        cpu    = 500
        memory = 512
      }

      # Post-setup hook
      lifecycle {
        hook    = "poststart"
        sidecar = false
        command = ["/bin/bash", "/scripts/post_setup.sh"]
      }

      artifact {
        source = "https://raw.githubusercontent.com/YOUR_USER/docker-sandbox/main/scripts/post_setup.sh"
        destination = "local/"
      }

      volume_mount {
        volume      = "scripts"
        destination = "/scripts"
      }
    }
  }
}
