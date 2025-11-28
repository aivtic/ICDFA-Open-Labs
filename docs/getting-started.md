# Getting Started with ICDFA-Open-Labs

Welcome to ICDFA-Open-Labs! This guide will help you get started with using and exploring our cybersecurity labs.

## Prerequisites

Before you begin, ensure you have the following installed:

- **Git:** For cloning the repository
  ```bash
  # Ubuntu/Debian
  sudo apt-get install git
  
  # macOS
  brew install git
  ```

- **Docker (Optional but Recommended):** For containerized lab environments
  ```bash
  # Visit https://docs.docker.com/get-docker/ for installation instructions
  ```

- **Python 3.7+:** For running Python-based labs
  ```bash
  # Ubuntu/Debian
  sudo apt-get install python3 python3-pip
  
  # macOS
  brew install python3
  ```

- **Bash:** For running setup scripts (included in most systems)

## Installation

### Step 1: Clone the Repository

```bash
git clone https://github.com/aivtic/ICDFA-Open-Labs.git
cd ICDFA-Open-Labs
```

### Step 2: Choose Your First Lab

Browse the available labs:

```bash
ls -la labs/
```

You'll see the following categories:

- `penetration-testing/` - Ethical hacking and vulnerability assessment
- `digital-forensics/` - Digital investigation and evidence analysis
- `network-security/` - Networking fundamentals and security
- `web-application-security/` - Web security and secure coding
- `ctf-challenges/` - Capture The Flag competitions

### Step 3: Navigate to Your Lab

```bash
cd labs/[category]/[lab-name]
```

### Step 4: Read the Lab README

Every lab includes a comprehensive README.md:

```bash
cat README.md
```

### Step 5: Run the Setup Script

Most labs include an automated setup script:

```bash
# Make the script executable
chmod +x setup.sh

# Run the setup
./setup.sh
```

If the lab uses Docker:

```bash
docker build -t lab-name .
docker run -it lab-name
```

### Step 6: Follow the Lab Instructions

Each lab includes detailed exercises and learning objectives. Follow the instructions in the README.

### Step 7: Verify Your Work

Check the expected output section in the README to verify you've completed the lab correctly.

## Lab Difficulty Levels

Labs are categorized by difficulty:

| Level | Description | Recommended For |
|-------|-------------|-----------------|
| **Beginner** | Fundamental concepts, guided exercises | New to cybersecurity |
| **Intermediate** | Building practical skills, some independence | Some experience |
| **Advanced** | Complex scenarios, minimal guidance | Experienced professionals |

## Common Commands

### List All Labs

```bash
find labs/ -name "README.md" | head -20
```

### Search for Labs by Topic

```bash
grep -r "Learning Objectives" labs/ | grep -i "penetration"
```

### Clean Up a Lab

Most labs include a cleanup script:

```bash
cd labs/[category]/[lab-name]
./cleanup.sh
```

### View Lab Documentation

```bash
# View README in terminal
less README.md

# View troubleshooting guide
cat docs/troubleshooting.md
```

## Recommended Learning Path

### For Beginners

1. Start with **Network Security Fundamentals**
2. Move to **Introduction to Linux**
3. Progress to **Basic Penetration Testing**
4. Try **Web Application Security Basics**

### For Intermediate Learners

1. **Advanced Penetration Testing**
2. **Digital Forensics Fundamentals**
3. **Network Traffic Analysis**
4. **Secure Coding Practices**

### For Advanced Learners

1. **Advanced Forensics Techniques**
2. **Red Team Operations**
3. **Threat Intelligence**
4. **CTF Challenges**

## Troubleshooting

### Lab Setup Fails

1. Check the `docs/troubleshooting.md` file in the lab directory
2. Review the lab README for prerequisites
3. Check Docker/system requirements
4. Open an issue on GitHub with error details

### Permission Denied Errors

```bash
# Make scripts executable
chmod +x *.sh

# Run with proper permissions
sudo ./setup.sh  # if required
```

### Docker Issues

```bash
# Check Docker is running
docker ps

# View Docker logs
docker logs [container-id]

# Rebuild image
docker build --no-cache -t lab-name .
```

### Python Dependency Issues

```bash
# Install dependencies
pip3 install -r requirements.txt

# Create virtual environment (recommended)
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip3 install -r requirements.txt
```

## Best Practices

### 1. Use Virtual Environments

```bash
# Create a virtual environment
python3 -m venv lab-env

# Activate it
source lab-env/bin/activate  # Linux/macOS
lab-env\Scripts\activate      # Windows
```

### 2. Keep Labs Isolated

Use Docker or virtual machines to isolate lab environments from your main system.

### 3. Document Your Progress

Keep notes on what you learn:

```bash
# Create a learning journal
echo "## Lab: [Lab Name]" >> learning-journal.md
echo "Date: $(date)" >> learning-journal.md
echo "Key Learnings:" >> learning-journal.md
```

### 4. Review Solutions

After completing a lab, review the solution:

```bash
cat solutions/solution.md
```

### 5. Experiment and Extend

Don't just follow instructions—try variations:

- Change parameters
- Combine techniques
- Create your own challenges

## Getting Help

### Documentation

- **Lab README:** Detailed instructions and learning objectives
- **Troubleshooting Guide:** Common issues and solutions
- **Contributing Guide:** How to contribute to the project

### Community

- **GitHub Issues:** Report bugs or ask questions
- **GitHub Discussions:** General questions and community support
- **Email:** contact@icdfa.com

### Additional Resources

- [ICDFA Official Website](https://www.icdfa.com)
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [NIST Cybersecurity Framework](https://www.nist.gov/cyberframework)
- [HackTheBox](https://www.hackthebox.com)
- [TryHackMe](https://www.tryhackme.com)

## Next Steps

1. **Choose Your First Lab:** Pick a beginner lab that interests you
2. **Set Up Your Environment:** Follow the setup instructions
3. **Complete the Exercises:** Work through all exercises
4. **Review Solutions:** Compare your work with provided solutions
5. **Contribute:** Share your improvements with the community

## Tips for Success

- **Start Small:** Begin with beginner labs before advancing
- **Be Patient:** Cybersecurity takes time to master
- **Practice Regularly:** Consistent practice is key
- **Join Communities:** Connect with other learners
- **Stay Updated:** Keep up with security news and trends
- **Document Learning:** Keep detailed notes
- **Ask Questions:** Don't hesitate to ask for help

---

Happy learning! If you have any questions, please reach out to the community or open an issue on GitHub. 
