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

# Function to start the conduit container
print_status "Conduit container..."
docker compose up -d
print_status "Conduit container will be accessible at Frontend: localhost_or_ip_server_address:8282 and Backend: localhost_or_ip_server_address:8021"
