# DevOps Intern Final Assessment

[![CI Pipeline](https://github.com/rozana09/devops-intern-final/actions/workflows/ci.yml/badge.svg)](https://github.com/rozana09/devops-intern-final/actions/workflows/ci.yml)

## Name

Rozana IM

## Date

17 June 2026

## GitHub Repository

https://github.com/rozana09/devops-intern-final

---

# Project Description

This repository contains my DevOps Intern Final Assessment project.

The objective of this project is to demonstrate practical knowledge and hands-on implementation of:

* Git and GitHub
* Linux Shell Scripting
* Docker Containerization
* CI/CD using GitHub Actions
* Nomad Job Deployment
* Grafana Loki Monitoring
* DevOps Documentation and Best Practices

All source code, scripts, configuration files, and setup instructions are included in this repository.

---

# Repository Structure

```text
devops-intern-final/
│
├── README.md
├── hello.py
├── Dockerfile
│
├── scripts/
│   └── sysinfo.sh
│
├── nomad/
│   └── hello.nomad
│
├── monitoring/
│   └── loki_setup.txt
│
├── vm/
│   └── vm_setup.txt
│
└── .github/
    └── workflows/
        └── ci.yml
```

---

# Step 1 - Git & GitHub Setup

Created a public GitHub repository and initialized the project.

Files added:

* README.md
* hello.py

## hello.py

```python
print("Hello, DevOps!")
```

## Run

```bash
python3 hello.py
```

## Expected Output

```text
Hello, DevOps!
```

---

# Step 2 - Linux & Scripting Basics

Created a shell script to display system information.

File:

```text
scripts/sysinfo.sh
```

## Script Contents

```bash
#!/bin/bash

echo "===== System Information ====="

echo ""
echo "Current User:"
whoami

echo ""
echo "Current Date:"
date

echo ""
echo "Disk Usage:"
df -h
```

## Make Executable

```bash
chmod +x scripts/sysinfo.sh
```

## Run

```bash
./scripts/sysinfo.sh
```

## Output

Displays:

* Current User
* Current Date and Time
* Disk Usage Information

---

# Step 3 - Docker Basics

The Python application was containerized using Docker.

## Dockerfile

```dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY hello.py .

CMD ["python", "hello.py"]
```

## Build Docker Image

```bash
docker build -t devops-hello .
```

## Run Docker Container

```bash
docker run --rm devops-hello
```

## Expected Output

```text
Hello, DevOps!
```

---

# Step 4 - CI/CD with GitHub Actions

A GitHub Actions workflow was created to automatically run the application whenever code is pushed to the repository.

Workflow File:

```text
.github/workflows/ci.yml
```

## Workflow Configuration

```yaml
name: CI Pipeline

on:
  push:
    branches:
      - main

jobs:
  run-python:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Setup Python
        uses: actions/setup-python@v5
        with:
          python-version: '3.11'

      - name: Run Application
        run: python hello.py
```

## CI/CD Validation

Every push to the main branch automatically:

1. Checks out the repository
2. Installs Python
3. Executes hello.py
4. Reports workflow status

The workflow completed successfully and the status badge is displayed at the top of this README.

---

# Step 5 - Nomad Job Deployment

A Nomad job definition was created to deploy the Docker container.

File:

```text
nomad/hello.nomad
```

## Nomad Job Configuration

```hcl
job "hello-devops" {
  datacenters = ["dc1"]
  type = "service"

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
}
```

## Run Nomad Job

```bash
nomad job run nomad/hello.nomad
```

## Resources Allocated

CPU:

```text
100 MHz
```

Memory:

```text
128 MB
```

---

# Step 6 - Monitoring with Grafana Loki

Grafana Loki was configured locally using Docker and connected to Grafana for log visualization.

Detailed setup documentation is available in:

```text
monitoring/loki_setup.txt
```

## Start Loki

```bash
docker run -d -p 3100:3100 grafana/loki:3.0.0
```

## Verify Loki

Open:

```text
http://localhost:3100/ready
```

Expected Output:

```text
ready
```

## Start Grafana

```bash
docker run -d -p 3000:3000 grafana/grafana
```

## Grafana Access

```text
http://localhost:3000
```

Default Credentials:

```text
Username: admin
Password: admin
```

## View Logs

Logs were viewed using:

```text
Grafana → Explore → Loki
```

---

# Extra Credit - Virtual Machine Deployment

Documentation:

```text
vm/vm_setup.txt
```

A VirtualBox Ubuntu virtual machine was used to test Docker deployments.

Activities performed:

* Ubuntu VM creation
* Docker installation
* GitHub repository cloning
* Docker image build
* Docker container execution

---

# Technologies Used

* Git
* GitHub
* Linux
* Bash
* Docker
* GitHub Actions
* Nomad
* Grafana
* Grafana Loki
* VirtualBox
* Ubuntu Linux

---

# Author

Rozana IM

DevOps Intern Final Assessment

June 2026

