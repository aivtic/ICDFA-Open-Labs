# Lab Docker Image
# This Dockerfile creates a containerized environment for the [Lab Name] lab

FROM ubuntu:22.04

# Metadata
LABEL maintainer="ICDFA <contact@icdfa.com>"
LABEL description="[Lab Name] - ICDFA Open Labs"
LABEL version="1.0"

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /lab

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    curl \
    wget \
    vim \
    nano \
    htop \
    net-tools \
    iputils-ping \
    dnsutils \
    telnet \
    openssh-client \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy lab files
COPY . /lab/

# Install Python dependencies (if requirements.txt exists)
RUN if [ -f "requirements.txt" ]; then \
        pip3 install --no-cache-dir -r requirements.txt; \
    fi

# Make scripts executable
RUN chmod +x *.sh

# Create non-root user (optional but recommended)
RUN useradd -m -s /bin/bash student && \
    chown -R student:student /lab

# Switch to non-root user
USER student

# Set up the lab environment
RUN ./setup.sh || true

# Default command
CMD ["/bin/bash"]

# Health check (optional)
# HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
#     CMD curl -f http://localhost:8000/health || exit 1
