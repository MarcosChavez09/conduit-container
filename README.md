# Conduit Containerization.

## Description.

A repository that shows how to deploy a multi-container app to a V-Server.

## Table of Contents.

1. [Prerequisites](#prerequisites)
2. [Quick start](#quick-start)
3. [Usage](#usage)
    - [Deployment configuration](#deployment-configuration)
4. [Project Checklist](#project-checklist)

## Prerequisites

- Docker and Docker Compose installed
- Git installed

## Quick start.

Clone this repository to your local machine. Open your terminal and run the following commands:

With SSH configured (if SSH Keys are provided to GitHub)
```
git clone git@github.com:MarcosChavez09/conduit-container.git
```
Classic HTTPS (if no SSH Keys are provided to GitHub)
```
git clone https://github.com/MarcosChavez09/conduit-container.git
```
After cloning the repository, navigate to:

```
cd conduit-container
```

To configure the **environments variables**, you just have to update the variables in the `docker-compose.yml`.

```yml
environment:
      DJANGO_SETTINGS_MODULE: "<project_name.settings_file>"
      DJANGO_SUPERUSER_USERNAME: "<super_user_name>"
      DJANGO_SUPERUSER_EMAIL: "<super_user_email>"
      DJANGO_SUPERUSER_PASSWORD: "<super_user_pass>"
      ALLOWED_HOSTS: "<your_localhost>"
      DEBUG: "False"
```

Run the [start.sh](start.sh) script to start the backend, frontend containers and DB volume locally:

```
bash start.sh
```

or
```
./start.sh
```

The `start.sh` script creates the DB volume, creates the docker network, and builds the frontend and backend images.

## Usage.

### Deployment configuration.

For the deployment you will need to create the following **secrets** in your **GitHub repository**:

1. Go to your repository → Settings → Secrets and variables → Actions
2. Click "New repository secret" and add:

### Starting and stopping the containers.

To stop the containers: 
```bash
docker-compose stop
```

To start the containers:
```bash
docker-compose start
```

To remove the containers:
```bash
docker-compose down
```

To start existing containers (use this when you make changes to the code):
```bash
docker-compose up --build -d
```

To just start existing containers:
```bash
docker-compose up -d
```

To check the logs:
```bash
docker-compose logs backend
```

```bash
docker-compose logs frontend
```
To save the logs for the backend or for frontend, use:

```bash
docker-compose logs backend > backend-logs.txt
```

```bash
docker-compose logs frontend > frontend-logs.txt
```

**Required Secrets:**
- `DJANGO_SUPERUSER_USERNAME`: Your Django admin username
- `DJANGO_SUPERUSER_EMAIL`: Your Django admin email
- `DJANGO_SUPERUSER_PASSWORD`: Your Django admin password
- `ALLOWED_HOSTS`: Comma-separated list of allowed hosts
- `V_SERVER_HOST`: Your V-Server IP address
- `V_SERVER_USERNAME`: SSH username for your V-Server
- `V_SERVER_SSH_KEY`: SSH private key for authentication

**Optional Variables:**
- `WORKING_BRANCH`: Your deployment branch name (e.g., "conduit-cicd-pipeline")

Visit http://<server_address_ip>:8021/admin for the backend. You can log in as admin with the provided values provided for the secrets previously added.

Visit http://<server_address_ip>:8282 for the frontend app.

## Project Checklist

- 📄 [Checklist (PDF)](documentation/checklist_deploy.pdf)