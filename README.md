# Conduit Containerization.

## Description.

A repository with a step-by-step guide on how to dockerize a Django backend and Angular frontend multi-container app.

## Table of Contents.

1. [Prerequisites](#prerequisites)
2. [Quick start](#quick-start)
3. [Usage](#usage)
    - [Configure the environment variables](#configure-the-environment-variables)
    - [Create docker container](#create-docker-container)
    - [Starting and stopping the containers](#starting-and-stopping-the-containers)

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

Run the [start.sh](start.sh) script to start the backend, frontend containers and DB volume locally:

```
bash start.sh
```

or
```
./start.sh
```

The `start.sh` script will create the `.env` file from `simple_env_config.env`, load the env vars, create the DB volume, create the docker network, build the frontend and backend image.

## Usage.

### Configure the environment variables.

To configure your **environments variables**, you just have to update the variables in the `docker-compose.yml`. This example already has some test-ready variables to use, but you can modify them to your needs.

```yml
environment:
      DJANGO_SETTINGS_MODULE: "<project_name.settings_file>"
      PYTHONUNBUFFERED: 1
      DJANGO_SUPERUSER_USERNAME: "<super_user_email>"
      DJANGO_SUPERUSER_EMAIL: "<super_user_email>"
      DJANGO_SUPERUSER_PASSWORD: "<super_user_pass>"
      ALLOWED_HOSTS: "<your_ip_addresses>"
      DEBUG: "False"
```

### Create docker container.

To create the docker containers use the `start.sh` script, type the following in your terminal:

```bash
bash start.sh
```

or
```bash
./start.sh
```

Visit http://localhost:8021/admin for the backed. You can log in as admin with the provided values in `conduit-backedn/conduit/.env` for the `django superuser`.

Visit http://localhost:8282 for the frontend app.

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

## Project Checklist

- 📄 [Checklist (PDF)](documentation/checklist.pdf)