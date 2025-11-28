#!/bin/bash

# Lab Setup Script
# This script sets up the [Lab Name] lab environment

set -e  # Exit immediately if a command exits with a non-zero status

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Functions
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

check_command() {
    if ! command -v "$1" &> /dev/null; then
        print_error "$1 is not installed"
        return 1
    fi
    return 0
}

# Main setup
main() {
    print_status "Setting up [Lab Name] lab..."
    
    # Check prerequisites
    print_status "Checking prerequisites..."
    
    if ! check_command "bash"; then
        print_error "Bash is required"
        exit 1
    fi
    
    # Add more prerequisite checks as needed
    # if ! check_command "python3"; then
    #     print_error "Python 3 is required"
    #     exit 1
    # fi
    
    # Create necessary directories
    print_status "Creating directories..."
    mkdir -p resources/data
    mkdir -p resources/config
    mkdir -p resources/scripts
    mkdir -p solutions
    mkdir -p docs
    
    # Download resources (if needed)
    print_status "Downloading resources..."
    # wget -O resources/data/file.txt https://example.com/file.txt
    
    # Install Python dependencies (if applicable)
    if [ -f "requirements.txt" ]; then
        print_status "Installing Python dependencies..."
        if check_command "pip3"; then
            pip3 install -r requirements.txt
        else
            print_warning "pip3 not found, skipping Python dependencies"
        fi
    fi
    
    # Build Docker image (if applicable)
    if [ -f "Dockerfile" ]; then
        print_status "Building Docker image..."
        if check_command "docker"; then
            docker build -t [lab-name] .
        else
            print_warning "Docker not found, skipping Docker setup"
        fi
    fi
    
    # Set permissions on scripts
    print_status "Setting permissions..."
    chmod +x *.sh
    
    # Additional setup steps
    print_status "Configuring lab environment..."
    # Add custom setup logic here
    
    # Verify setup
    print_status "Verifying setup..."
    # Add verification logic here
    
    print_status "${GREEN}Setup complete!${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Read the README.md for lab instructions"
    echo "2. Follow the exercises in order"
    echo "3. Check your work against expected output"
    echo "4. Review solutions in the solutions/ directory"
    echo ""
    echo "To clean up: ./cleanup.sh"
}

# Run main function
main "$@"
