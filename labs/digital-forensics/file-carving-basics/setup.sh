#!/bin/bash

set -e

GREEN='\033[0;32m'
NC='\033[0m'

print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

main() {
    print_status "Setting up File Carving Basics lab..."
    
    # Install required tools
    if ! command -v foremost &> /dev/null; then
        print_status "Installing Foremost..."
        sudo apt-get update
        sudo apt-get install -y foremost
    fi
    
    # Create directories
    mkdir -p solutions resources/test-files
    
    # Create test files
    print_status "Creating test files..."
    echo "Test text file 1" > resources/test-files/file1.txt
    echo "Test text file 2" > resources/test-files/file2.txt
    dd if=/dev/urandom of=resources/test-files/image1.jpg bs=1024 count=5 2>/dev/null
    dd if=/dev/urandom of=resources/test-files/image2.png bs=1024 count=5 2>/dev/null
    
    # Create file signatures reference
    cat > resources/file-signatures.txt << 'EOF'
Common File Signatures (Magic Bytes):

PDF:     25 50 44 46 (%PDF)
JPEG:    FF D8 FF
PNG:     89 50 4E 47 (.PNG)
GIF:     47 49 46 38 (GIF8)
ZIP:     50 4B 03 04 (PK..)
ELF:     7F 45 4C 46 (.ELF)
GZIP:    1F 8B
TAR:     1F 9D
BZIP2:   42 5A (BZ)
MP3:     FF FB or FF FA
MP4:     00 00 00 18 66 74 79 70
EOF
    
    chmod +x *.sh
    
    print_status "${GREEN}Setup complete!${NC}"
}

main "$@"
