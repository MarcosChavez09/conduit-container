#!/bin/bash

# Conduit Container Management Script
set -e

# Colors for output.
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Copy environment config file if .env doesn't exist
if [ ! -f "conduit-backend/conduit/.env" ]; then
    print_warning ".env file not found, creating .env file from template..."
    cp conduit-backend/conduit/simple_env_config.env conduit-backend/conduit/.env
fi

# Load environment variables from .env file
if [ -f "conduit-backend/conduit/.env" ]; then
    export $(cat conduit-backend/conduit/.env | grep -v '^#' | xargs)
else
    print_error "Error: conduit-backend/conduit/.env file not found"
    exit 1
fi

# Function to start the conduit container
print_status "Conduit container..."
docker compose up -d
print_status "Conduit container will be accessible at Frontend: localhost_or_ip_server_address:8282 and Backend: localhost_or_ip_server_address:8021"
