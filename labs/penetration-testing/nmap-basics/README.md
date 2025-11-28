# Nmap Basics - Network Reconnaissance

## Overview

This lab introduces you to Nmap, one of the most popular network reconnaissance tools used by security professionals. You will learn how to perform network scans, identify open ports, detect services, and gather valuable information about target systems.

## Learning Objectives

After completing this lab, you will be able to:

- Understand the fundamentals of network reconnaissance
- Install and configure Nmap
- Perform basic network scans
- Interpret scan results
- Identify open ports and running services
- Use Nmap scripting engine (NSE) for advanced scanning

## Prerequisites

- Basic understanding of networking concepts (IP addresses, ports, protocols)
- Linux/Unix command-line familiarity
- Root or sudo access for advanced scans

## Difficulty Level

**Beginner**

## Time Estimate

2-3 hours

## Required Tools

- Nmap (version 7.80+)
- Docker (optional but recommended)
- Linux terminal

## Setup Instructions

### Option 1: Docker (Recommended)

```bash
docker build -t nmap-lab .
docker run -it nmap-lab
```

### Option 2: Manual Setup

```bash
chmod +x setup.sh
./setup.sh
```

The setup script will install Nmap and required dependencies.

## Lab Exercises

### Exercise 1: Basic Port Scanning

**Objective:** Learn how to perform a basic TCP port scan on a target system.

**Instructions:**

1. Start a simple HTTP server in the background:
   ```bash
   python3 -m http.server 8080 &
   ```

2. In another terminal, perform a basic scan of localhost:
   ```bash
   nmap localhost
   ```

3. Observe the output and identify:
   - Which ports are open
   - What services are running
   - The state of each port

4. Perform a more specific scan on port 8080:
   ```bash
   nmap -p 8080 localhost
   ```

**Expected Output:**

```
Starting Nmap 7.80 ( https://nmap.org ) at 2024-01-15 10:00 UTC
Nmap scan report for localhost (127.0.0.1)
Host is up (0.00012s latency).

PORT     STATE SERVICE
8080/tcp open  http-proxy

Nmap done at 2024-01-15 10:00 UTC; 1 IP address (1 host up) scanned in 0.25 seconds
```

**Hints:**

- Use `nmap --help` to see all available options
- The `-p` flag allows you to specify specific ports
- By default, Nmap scans the 1000 most common ports

### Exercise 2: Service Version Detection

**Objective:** Learn how to detect service versions running on open ports.

**Instructions:**

1. Perform a service version detection scan:
   ```bash
   nmap -sV localhost
   ```

2. Compare the output with the basic scan from Exercise 1

3. Note the service versions detected

4. Scan a specific port with version detection:
   ```bash
   nmap -sV -p 8080 localhost
   ```

**Expected Output:**

```
PORT     STATE SERVICE VERSION
8080/tcp open  http    SimpleHTTP/0.6 Python/3.9.x
```

**Hints:**

- The `-sV` flag enables service version detection
- This scan is slower than basic scans but provides more information
- Version information helps identify vulnerabilities

### Exercise 3: OS Detection

**Objective:** Learn how to detect the operating system of a target.

**Instructions:**

1. Perform an OS detection scan:
   ```bash
   nmap -O localhost
   ```

2. Analyze the output to identify:
   - Detected operating system
   - Confidence percentage
   - Device type

3. Combine OS detection with service detection:
   ```bash
   nmap -O -sV localhost
   ```

**Expected Output:**

```
Running: Linux 5.x|6.x
OS details: Linux 5.10 - 6.1
Aggressive OS guesses: Linux 5.15 - 6.1 (95%)
```

**Hints:**

- The `-O` flag enables OS detection
- OS detection requires root/sudo privileges
- Confidence percentages indicate accuracy

### Exercise 4: Aggressive Scanning

**Objective:** Learn how to perform comprehensive scans with multiple detection methods.

**Instructions:**

1. Perform an aggressive scan:
   ```bash
   nmap -A localhost
   ```

2. Analyze the comprehensive output

3. Compare with previous scan results

4. Perform an aggressive scan on a specific port range:
   ```bash
   nmap -A -p 8000-9000 localhost
   ```

**Expected Output:**

Comprehensive output including service versions, OS detection, and script results.

**Hints:**

- The `-A` flag combines multiple scan options
- This scan is the most comprehensive but slowest
- Useful for thorough reconnaissance

### Exercise 5: NSE (Nmap Scripting Engine)

**Objective:** Learn how to use Nmap scripts for advanced scanning.

**Instructions:**

1. List available NSE scripts:
   ```bash
   ls /usr/share/nmap/scripts/ | head -20
   ```

2. Run a basic HTTP script:
   ```bash
   nmap --script http-title localhost
   ```

3. Run multiple scripts:
   ```bash
   nmap --script http-title,http-headers -p 8080 localhost
   ```

4. Use script categories:
   ```bash
   nmap --script default localhost
   ```

**Expected Output:**

```
PORT     STATE SERVICE
8080/tcp open  http-proxy
| http-title: Directory listing for /
|_Requested resource was moved to http://localhost:8080/
```

**Hints:**

- NSE scripts provide advanced functionality
- Scripts are organized by categories (default, discovery, vuln, etc.)
- Use `--script-help` to learn about specific scripts

## Expected Output Summary

After completing all exercises, you should understand:

- How to perform basic network scans
- How to detect services and versions
- How to identify operating systems
- How to use advanced scanning techniques
- How to leverage NSE scripts for reconnaissance

## Troubleshooting

### Issue: Permission Denied Error

**Error Message:**

```
nmap: must be run by root or with --unprivileged flag
```

**Solution:**

Use sudo for OS detection and advanced scans:

```bash
sudo nmap -O localhost
```

Or use the unprivileged flag:

```bash
nmap --unprivileged localhost
```

**Prevention:**

Always use appropriate privileges for your scans.

### Issue: Port Already in Use

**Error Message:**

```
Address already in use
```

**Solution:**

Kill the existing process:

```bash
lsof -i :8080
kill -9 <PID>
```

**Prevention:**

Check available ports before starting services.

### Issue: Nmap Not Found

**Error Message:**

```
command not found: nmap
```

**Solution:**

Install Nmap:

```bash
sudo apt-get update
sudo apt-get install nmap
```

**Prevention:**

Run the setup script before starting exercises.

## Solutions

Complete solutions and detailed explanations are available in the `solutions/` directory.

```bash
cat solutions/solution.md
```

## Additional Resources

Expand your knowledge with these resources:

- [Nmap Official Documentation](https://nmap.org/docs.html) - Comprehensive Nmap guide
- [Nmap Book](https://nmap.org/book/) - Free online Nmap book
- [HackTheBox](https://www.hackthebox.com) - Practice labs with Nmap
- [OWASP Network Reconnaissance](https://owasp.org/www-community/attacks/Footprinting) - Security reconnaissance guide

## Cleanup

To remove the lab environment:

```bash
./cleanup.sh
```

This will remove Docker containers, temporary files, and background processes.

## Contributing

Found an issue or have suggestions? Please:

1. Open an issue on GitHub
2. Submit a pull request with improvements
3. Share feedback in GitHub Discussions

See [CONTRIBUTING.md](../../CONTRIBUTING.md) for detailed guidelines.

## Questions?

If you have questions about this lab:

1. Check the troubleshooting section above
2. Review the resources listed
3. Open a GitHub Discussion
4. Email: contact@icdfa.com

---

**Happy Learning!** 
