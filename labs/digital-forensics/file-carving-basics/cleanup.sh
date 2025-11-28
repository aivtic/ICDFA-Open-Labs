#!/bin/bash

set -e

GREEN='\033[0;32m'
NC='\033[0m'

print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

main() {
    print_status "Cleaning up File Carving Basics lab..."
    
    # Unmount if mounted
    sudo umount /tmp/test_mount 2>/dev/null || true
    
    # Remove test files
    rm -f test_disk.img
    rm -f test.txt test.jpg
    rm -rf carving_output custom_output
    rm -f original_hashes.txt recovered_hashes.txt
    rm -f analysis.txt custom.conf
    
    print_status "${GREEN}Cleanup complete!${NC}"
}

main "$@"
