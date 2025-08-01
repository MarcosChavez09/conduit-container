# syntax=docker/dockerfile:1
FROM python:3.6-slim

# Set environment variables to optimize Python
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        gcc \
        python3-dev \
        python3-distutils \
        build-essential \
        libjpeg-dev \
        zlib1g-dev \
        libffi-dev \
        libpq-dev \
        netcat-openbsd \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Copy requirements first to leverage Docker cache
COPY requirements.txt /app/requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r /app/requirements.txt

# Create non-root user
RUN adduser --disabled-password --no-create-home appuser

# Create static and media directories
RUN mkdir -p /app/media \
    /app/staticfiles

# Copy project files
COPY . /app

RUN ls -la /app

# Set proper permissions
RUN chown -R appuser:appuser /app

# Copy and rename env file if present
COPY conduit/simple_env_config.env /app/conduit/.env

# Copy the entrypoint.sh and set permissions
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Switch to non-root user
USER appuser

# Expose port
EXPOSE 8021

# Entrypoint: run migrations and start server
CMD ["./entrypoint.sh"]