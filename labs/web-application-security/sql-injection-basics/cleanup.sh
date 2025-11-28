#!/bin/bash

set -e

GREEN='\033[0;32m'
NC='\033[0m'

print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

main() {
    print_status "Cleaning up SQL Injection Basics lab..."
    
    # Kill Flask servers
    pkill -f "flask run" || true
    pkill -f "vulnerable_app.py" || true
    pkill -f "secure_app.py" || true
    
    # Remove database files
    rm -f resources/users.db resources/users_secure.db
    rm -f analysis.txt test_results.txt
    
    print_status "${GREEN}Cleanup complete!${NC}"
}

main "$@"
