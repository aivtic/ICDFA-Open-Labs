#!/bin/bash

# Nmap Basics Lab Setup Script

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

main() {
    print_status "Setting up Nmap Basics lab..."
    
    # Check for Nmap
    if ! command -v nmap &> /dev/null; then
        print_status "Installing Nmap..."
        sudo apt-get update
        sudo apt-get install -y nmap
    else
        print_status "Nmap is already installed"
    fi
    
    # Create directories
    mkdir -p solutions resources/data
    
    # Create necessary files
    print_status "Creating lab resources..."
    
    # Set permissions
    chmod +x *.sh
    
    print_status "${GREEN}Setup complete!${NC}"
    echo ""
    echo "Next steps:"
    echo "1. Read README.md for lab instructions"
    echo "2. Follow the exercises in order"
    echo "3. Use 'cat solutions/solution.md' to view solutions"
    echo ""
}

main "$@"
