job "hello-devops" {
  datacenters = ["dc1"]

  group "hello-group" {

    task "hello-task" {
      driver = "docker"

      config {
        image = "devops-hello:latest"
      }

      resources {
        cpu    = 100
        memory = 128
      }
    }
  }

  type = "service"
}
