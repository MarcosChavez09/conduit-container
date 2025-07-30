# Conduit Containerization.

## Description.

A repository with a step-by-step guide on how to dockerize a Django backend and Angular frontend multi-container app and deploy it to a V-Server.

## Table of Contents.

1. [Prerequisites](#prerequisites)
2. [Quick start](#quick-start)
3. [Usage](#usage)
    - [Configure the environment variables](#configure-the-environment-variables)
    - [Create a docker container](#create-a-docker-container)
    - [Starting and stopping the containers](#starting-and-stopping-the-containers)
    - [Deploy the app to a V-Server](#deploy-the-app-to-a-v-server)
    - [Manual usage](#manual-usage)

4. [Project Checklist](#project-checklist)

## Prerequisites

- A user with `sudo` rights to a V-Server
- Docker and Docker Compose installed in your V-Server
- The pip package manager in your V-Server
- GitHub account to connect via `SSH keys`
- Connection from your V-Server to GitHub with `SSH Keys

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

Run the [start.sh](start.sh) script to start the DB and Web containers locally:

```
bash start.sh
```

or
```
./start.sh
```

The `start.sh` script will create the `.env` file from `simple_env_config.env`, load the env vars, create the DB volume, create the docker network, build the web image, start the DB and the web containers.

## Usage.

### Configure the environment variables.

To configure your **environments variables**, you just have to run the `start.sh` scritp. The **scritp** will detect if the `.env` file exists, if not, it will create the file for you from the template.

### Create docker container.

To create the docker containers use the `start.sh` script, type the following in your terminal:

```bash
bash start.sh
```

or
```bash
./start.sh
```
The script will run the `docker-compose.yml` and create the frontend, backend containers and the database volume for persistance.

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

To rebuild both services (containers):

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

### Deploy the app to a V-Server.

1. Login to your V-Server
```bash
ssh -i ~/.ssh/<name_of_your_key> <your_user_name>@<ip_server_address>
```
2. Create a new folder in your `home` directory and clone this repository there
```bash
mkdir -p ~/projects
cd ~/projects
git clone git@github.com:MarcosChavez09/conduit-container.git
cd conduit-container
```

3. Install Docker on your V-Server if you haven't done so yet. 

4. Start the `start.sh` script.
```bash
./start.sh start
```

5. Visit the link for the frontend at `http://<ip_server_address>:8282`

6. Visit the link for the backend Django admin at `http://<ip_server_address>:8021/admin`