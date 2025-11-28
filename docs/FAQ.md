# Frequently Asked Questions (FAQ)

## General Questions

### What is ICDFA Open Labs?

ICDFA Open Labs is an open-source collection of cybersecurity and digital forensics labs and educational materials. It provides hands-on learning resources for students, professionals, and enthusiasts interested in cybersecurity.

### Who can use ICDFA Open Labs?

Anyone! The labs are free and open-source. They're designed for:

- Students learning cybersecurity
- Professionals seeking to expand their skills
- Educators looking for teaching materials
- Hobbyists interested in security
- Organizations training their teams

### Is ICDFA Open Labs free?

Yes! All labs and materials are completely free to use, modify, and distribute under the Creative Commons Attribution-ShareAlike 4.0 (CC BY-SA 4.0) license.

### What license does ICDFA Open Labs use?

ICDFA Open Labs uses the **Creative Commons Attribution-ShareAlike 4.0 International License (CC BY-SA 4.0)**. This means:

- You can use and modify the materials freely
- You must provide attribution to ICDFA
- Any derivative works must use the same license
- You can use it for commercial purposes

See the [LICENSE](../LICENSE) file for full details.

## Getting Started

### How do I get started with ICDFA Open Labs?

1. Clone the repository: `git clone https://github.com/aivtic/ICDFA-Open-Labs.git`
2. Read the [Getting Started Guide](getting-started.md)
3. Choose a lab that interests you
4. Follow the setup instructions
5. Complete the exercises

### What are the prerequisites for using the labs?

Prerequisites vary by lab, but generally you need:

- Basic networking knowledge
- Familiarity with Linux/command-line
- Understanding of the specific topic
- A computer with adequate resources

Check each lab's README for specific prerequisites.

### Do I need Docker to run the labs?

No, but it's recommended. Docker provides:

- Isolated environments
- Consistent setup across systems
- Easy cleanup
- Better reproducibility

However, most labs can be run manually following the setup instructions.

### Can I use the labs on Windows?

Yes! You can:

- Use Windows Subsystem for Linux (WSL)
- Use Docker Desktop for Windows
- Use virtual machines
- Use cloud-based Linux environments

### How much disk space do I need?

This depends on the labs you use. Generally:

- Base repository: ~50 MB
- Each lab: 100 MB - 1 GB
- Docker images: 500 MB - 2 GB

Check individual lab documentation for specific requirements.

## Using the Labs

### How long does each lab take?

Time estimates vary:

- **Beginner labs:** 1-3 hours
- **Intermediate labs:** 3-5 hours
- **Advanced labs:** 5+ hours

Check each lab's README for specific time estimates.

### Can I skip exercises?

While you can skip exercises, we recommend completing them in order. Each exercise builds on previous knowledge.

### What if I get stuck?

1. Check the troubleshooting section in the lab README
2. Review the solutions (after attempting the exercise)
3. Check the additional resources
4. Open a GitHub Discussion
5. Email: contact@icdfa.com

### Can I modify the labs?

Yes! The labs are open-source. You can:

- Modify exercises for your needs
- Create variations
- Adapt for your organization
- Share improvements with the community

Just follow the CC BY-SA 4.0 license requirements.

### Can I use the labs in my organization?

Yes! You can use the labs for:

- Employee training
- Educational programs
- Certification preparation
- Team skill development

Just ensure you follow the license requirements (attribution and same license for derivatives).

## Contributing

### How can I contribute?

You can contribute by:

- Creating new labs
- Improving existing labs
- Fixing bugs or errors
- Improving documentation
- Translating materials
- Providing feedback

See [CONTRIBUTING.md](../CONTRIBUTING.md) for detailed guidelines.

### How do I submit a new lab?

1. Fork the repository
2. Create a feature branch
3. Follow the lab creation guidelines
4. Test thoroughly
5. Submit a pull request
6. Address feedback from reviewers

See the [Lab Creation Guide](lab-creation-guide.md) for detailed instructions.

### What makes a good lab?

A good lab should:

- Have clear learning objectives
- Include hands-on exercises
- Provide step-by-step instructions
- Include expected output
- Have comprehensive documentation
- Include troubleshooting guidance
- Provide solutions for reference

### How are contributions reviewed?

All contributions go through a review process:

1. **Initial Review:** Check completeness and guidelines adherence
2. **Technical Review:** Verify accuracy and functionality
3. **Documentation Review:** Ensure clarity and completeness
4. **Final Approval:** Merge and publish

The process typically takes 1-2 weeks.

### Can I get credit for my contributions?

Yes! Contributors are recognized:

- In the commit history
- In the contributors list
- In lab documentation
- In release notes

## Technical Questions

### What operating systems are supported?

ICDFA Open Labs is designed for:

- **Linux:** Ubuntu, Debian, CentOS, Fedora, etc.
- **macOS:** Intel and Apple Silicon
- **Windows:** Via WSL, Docker, or virtual machines

### What Python version is required?

Most labs require Python 3.7 or later. Check individual lab requirements.txt files for specific versions.

### Can I use the labs offline?

Yes! Once you've cloned the repository and set up the labs, you can use them offline. However, some labs may require internet access for:

- Downloading resources
- Connecting to external services
- Accessing documentation

### How do I update the labs?

To get the latest updates:

```bash
cd ICDFA-Open-Labs
git pull origin master
```

### What if I find a bug?

1. Check if it's already reported in [Issues](https://github.com/aivtic/ICDFA-Open-Labs/issues)
2. Open a new issue with:
   - Clear description
   - Steps to reproduce
   - Expected vs. actual behavior
   - Your environment details

## Security Questions

### Is it safe to use these labs?

Yes, when used properly:

- Use isolated environments (Docker, VMs)
- Don't run labs with elevated privileges unless necessary
- Only scan systems you own or have permission to test
- Follow the security guidelines

See [Security Best Practices](security-best-practices.md) for details.

### Are the labs tested for security?

Yes! All labs go through:

- Security code review
- Vulnerability scanning
- Testing on multiple systems
- Community feedback

### What if I find a security vulnerability?

Please report it responsibly:

1. **Do not** open a public issue
2. Email: security@icdfa.com
3. Include vulnerability details
4. Allow 90 days for patching

See [Security Best Practices](security-best-practices.md) for details.

### Can I use these labs for ethical hacking?

Yes, but only with proper authorization:

- Only test systems you own
- Get written permission before testing others' systems
- Follow all applicable laws
- Document your testing activities
- Use the knowledge responsibly

## Legal Questions

### Can I use these labs commercially?

Yes! The CC BY-SA 4.0 license allows commercial use. You must:

- Provide attribution to ICDFA
- Use the same license for any modifications
- Comply with all license requirements

### Can I sell courses based on these labs?

Yes, but you must:

- Provide attribution to ICDFA
- Use the same license for any modifications
- Make the source materials available
- Comply with all license requirements

### What about liability?

The labs are provided "as-is" without warranty. See the [LICENSE](../LICENSE) file for full legal terms.

### Can I use these labs in my school/university?

Yes! Educational use is encouraged. You can:

- Use labs in courses
- Modify for your curriculum
- Share with students
- Contribute improvements back

Just follow the license requirements.

## Troubleshooting

### I'm getting permission errors

Try:

```bash
# Make scripts executable
chmod +x setup.sh cleanup.sh

# Use sudo if needed
sudo ./setup.sh
```

### Docker build is failing

Try:

```bash
# Build without cache
docker build --no-cache -t lab-name .

# Check Docker is running
docker ps
```

### Port already in use

Try:

```bash
# Find process using port
lsof -i :8080

# Kill the process
kill -9 <PID>
```

### Lab setup is slow

Try:

```bash
# Use Docker for faster setup
docker build -t lab-name .
docker run -it lab-name

# Or check your internet connection
```

## Getting Help

### Where can I get help?

1. **Documentation:** Check the lab README and guides
2. **Troubleshooting:** See the troubleshooting section in each lab
3. **GitHub Issues:** Search for similar problems
4. **GitHub Discussions:** Ask the community
5. **Email:** contact@icdfa.com

### How do I report a problem?

1. Check if it's already reported
2. Provide clear details:
   - What you were trying to do
   - What went wrong
   - Steps to reproduce
   - Your environment (OS, Python version, etc.)
   - Error messages or logs

### How do I suggest improvements?

1. Open a GitHub Discussion
2. Describe your suggestion
3. Explain the benefits
4. Provide examples if possible

## Community

### How can I get involved?

- Use the labs and provide feedback
- Contribute new labs or improvements
- Help answer questions in Discussions
- Share the project with others
- Participate in the community

### Is there a community forum?

Yes! Use [GitHub Discussions](https://github.com/aivtic/ICDFA-Open-Labs/discussions) to:

- Ask questions
- Share ideas
- Discuss labs
- Connect with other learners

### Can I translate the labs?

Yes! Translations are welcome. Please:

1. Fork the repository
2. Create translated versions
3. Submit a pull request
4. Follow the same structure and formatting

---

## More Questions?

If your question isn't answered here:

1. Check the [Getting Started Guide](getting-started.md)
2. Review the [Lab Creation Guide](lab-creation-guide.md)
3. Open a [GitHub Discussion](https://github.com/aivtic/ICDFA-Open-Labs/discussions)
4. Email: contact@icdfa.com

We're here to help! 🙌
