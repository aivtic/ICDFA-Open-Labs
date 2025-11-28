#!/bin/bash

# Nmap Basics Lab Cleanup Script

set -e

GREEN='\033[0;32m'
NC='\033[0m'

print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

main() {
    print_status "Cleaning up Nmap Basics lab..."
    
    # Kill any running HTTP servers
    pkill -f "http.server" || true
    
    # Remove temporary files
    rm -f *.log
    rm -rf __pycache__/
    
    print_status "${GREEN}Cleanup complete!${NC}"
}

main "$@"
