# File Carving Basics - Digital Forensics

## Overview

This lab introduces you to file carving, a fundamental digital forensics technique used to recover deleted or fragmented files from storage media. You will learn how to identify file signatures, use carving tools, and recover data from disk images.

## Learning Objectives

After completing this lab, you will be able to:

- Understand file signatures and magic bytes
- Perform file carving on disk images
- Use tools like Foremost and Scalpel
- Identify and recover deleted files
- Analyze recovered file integrity

## Prerequisites

- Basic understanding of file systems
- Linux command-line familiarity
- Understanding of hexadecimal notation

## Difficulty Level

**Beginner**

## Time Estimate

2-3 hours

## Required Tools

- Foremost or Scalpel
- Hexdump or xxd
- Docker (optional)

## Setup Instructions

### Option 1: Docker (Recommended)

```bash
docker build -t file-carving-lab .
docker run -it file-carving-lab
```

### Option 2: Manual Setup

```bash
chmod +x setup.sh
./setup.sh
```

## Lab Exercises

### Exercise 1: Understanding File Signatures

**Objective:** Learn how to identify files by their magic bytes.

**Instructions:**

1. Create a test file with known content:
   ```bash
   echo "This is a test file" > test.txt
   ```

2. View the hexadecimal representation:
   ```bash
   xxd test.txt | head -5
   ```

3. Create a JPEG file:
   ```bash
   dd if=/dev/urandom of=test.jpg bs=1024 count=10
   ```

4. Compare the hex signatures:
   ```bash
   xxd test.jpg | head -5
   ```

5. Research common file signatures:
   ```bash
   cat resources/file-signatures.txt
   ```

**Expected Output:**

```
00000000: 5468 6973 2069 7320 6120 7465 7374 2066  This is a test f
00000010: 696c 6500                                ile.
```

**Hints:**

- File signatures are typically at the beginning of files
- Different file types have different signatures
- Magic bytes help identify file types

### Exercise 2: Creating a Test Disk Image

**Objective:** Create a disk image with files for carving practice.

**Instructions:**

1. Create a test disk image:
   ```bash
   dd if=/dev/zero of=test_disk.img bs=1M count=10
   ```

2. Create a filesystem:
   ```bash
   mkfs.ext4 test_disk.img
   ```

3. Mount the image:
   ```bash
   mkdir -p /tmp/test_mount
   sudo mount -o loop test_disk.img /tmp/test_mount
   ```

4. Copy test files:
   ```bash
   sudo cp resources/test-files/* /tmp/test_mount/
   ```

5. Delete some files:
   ```bash
   sudo rm /tmp/test_mount/file1.txt
   sudo rm /tmp/test_mount/image1.jpg
   ```

6. Unmount the image:
   ```bash
   sudo umount /tmp/test_mount
   ```

**Expected Output:**

Successfully created and prepared disk image.

**Hints:**

- Use `dd` to create disk images
- `mkfs` creates filesystems
- Deleted files remain on disk until overwritten

### Exercise 3: File Carving with Foremost

**Objective:** Use Foremost to recover deleted files.

**Instructions:**

1. Run Foremost on the disk image:
   ```bash
   foremost -i test_disk.img -o carving_output
   ```

2. Examine the results:
   ```bash
   ls -la carving_output/
   ```

3. Check recovered files:
   ```bash
   ls -la carving_output/jpg/
   ls -la carving_output/txt/
   ```

4. Verify recovered file integrity:
   ```bash
   file carving_output/jpg/*
   ```

**Expected Output:**

```
Processing: test_disk.img
|--jpg: 5 files recovered
|--txt: 3 files recovered
|--png: 2 files recovered
```

**Hints:**

- Foremost uses file signatures to recover files
- Results are organized by file type
- Not all recovered files may be complete

### Exercise 4: Custom Carving Configuration

**Objective:** Create custom carving configurations for specific file types.

**Instructions:**

1. View the default configuration:
   ```bash
   cat /etc/foremost.conf
   ```

2. Create a custom configuration:
   ```bash
   cp /etc/foremost.conf custom.conf
   ```

3. Edit to target specific file types:
   ```bash
   # Edit custom.conf to enable only jpg and png
   ```

4. Run with custom configuration:
   ```bash
   foremost -c custom.conf -i test_disk.img -o custom_output
   ```

**Expected Output:**

Carving results using custom configuration.

**Hints:**

- Custom configurations improve carving efficiency
- Reduce false positives by targeting specific types
- Useful for large disk images

### Exercise 5: Analysis and Verification

**Objective:** Analyze and verify recovered files.

**Instructions:**

1. Compare recovered files with originals:
   ```bash
   md5sum resources/test-files/* > original_hashes.txt
   md5sum carving_output/*/* > recovered_hashes.txt
   ```

2. Check file integrity:
   ```bash
   file carving_output/jpg/*
   ```

3. Document findings:
   ```bash
   cat > analysis.txt << EOF
   # File Carving Analysis
   
   Total files recovered: X
   Files with matching hashes: Y
   Corrupted files: Z
   EOF
   ```

**Expected Output:**

Analysis report of recovered files.

**Hints:**

- Hash comparison verifies file integrity
- Some files may be partially recovered
- Document all findings

## Troubleshooting

### Issue: Permission Denied

**Error Message:**

```
Permission denied
```

**Solution:**

Use sudo for mount operations:

```bash
sudo mount -o loop test_disk.img /tmp/test_mount
```

**Prevention:**

Always use appropriate privileges.

### Issue: Foremost Not Found

**Error Message:**

```
command not found: foremost
```

**Solution:**

Install Foremost:

```bash
sudo apt-get install foremost
```

**Prevention:**

Run setup script before starting.

## Solutions

Complete solutions are available in the `solutions/` directory.

```bash
cat solutions/solution.md
```

## Additional Resources

- [Foremost Documentation](http://foremost.sourceforge.net/) - Official Foremost guide
- [File Signatures Reference](https://en.wikipedia.org/wiki/List_of_file_signatures) - Common file signatures
- [Digital Forensics Basics](https://www.nist.gov/publications/guidelines-cell-phone-forensics) - NIST guidelines

## Cleanup

```bash
./cleanup.sh
```

## Contributing

See [CONTRIBUTING.md](../../CONTRIBUTING.md) for guidelines.

## Questions?

Email: contact@icdfa.com

---

**Happy Learning!** 
