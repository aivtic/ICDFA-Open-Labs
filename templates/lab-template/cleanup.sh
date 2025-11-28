#!/bin/bash

# Lab Cleanup Script
# This script removes lab artifacts and cleans up the environment

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

# Main cleanup
main() {
    print_status "Cleaning up [Lab Name] lab..."
    
    # Stop and remove Docker containers (if applicable)
    if command -v docker &> /dev/null; then
        print_status "Cleaning up Docker containers..."
        docker rm -f [lab-name] 2>/dev/null || true
        docker rmi [lab-name] 2>/dev/null || true
    fi
    
    # Remove generated files
    print_status "Removing generated files..."
    rm -f output.txt
    rm -f *.log
    rm -rf .cache/
    rm -rf __pycache__/
    rm -rf *.pyc
    
    # Remove virtual environment (if applicable)
    if [ -d "venv" ]; then
        print_status "Removing Python virtual environment..."
        rm -rf venv/
    fi
    
    # Remove downloaded resources (if applicable)
    # print_status "Removing downloaded resources..."
    # rm -rf resources/data/*
    
    # Remove temporary files
    print_status "Removing temporary files..."
    rm -rf /tmp/[lab-name]-*
    
    # Additional cleanup steps
    print_status "Performing additional cleanup..."
    # Add custom cleanup logic here
    
    print_status "${GREEN}Cleanup complete!${NC}"
    echo ""
    echo "Lab environment has been cleaned up."
    echo "To set up again: ./setup.sh"
}

# Run main function
main "$@"
