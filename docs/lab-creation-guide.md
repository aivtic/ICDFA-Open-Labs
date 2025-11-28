# Lab Creation Guide

This guide will help you create high-quality labs for ICDFA-Open-Labs.

## Lab Structure

Every lab should follow this directory structure:

```
lab-name/
├── README.md                 # Lab overview and instructions
├── setup.sh                  # Automated setup script
├── cleanup.sh                # Cleanup script
├── requirements.txt          # Python dependencies (if applicable)
├── Dockerfile                # Docker configuration (if applicable)
├── docker-compose.yml        # Docker Compose (if applicable)
├── solutions/                # Solution files (optional)
│   └── solution.md
├── resources/                # Supporting files
│   ├── config/
│   ├── scripts/
│   └── data/
└── docs/                     # Additional documentation
    ├── troubleshooting.md
    └── learning-objectives.md
```

## Step-by-Step Lab Creation

### Step 1: Plan Your Lab

Before creating, define:

- **Learning Objectives:** What will students learn?
- **Target Audience:** Beginner, intermediate, or advanced?
- **Prerequisites:** What knowledge is required?
- **Time Estimate:** How long should it take?
- **Tools Required:** What software/tools are needed?
- **Difficulty Level:** Rate the difficulty

### Step 2: Create the Lab Directory

```bash
cd labs/[category]/
mkdir lab-name
cd lab-name
```

### Step 3: Write the README.md

The README is the most important file. Use this template:

```markdown
# [Lab Name]

## Overview
Brief 2-3 sentence description of what this lab covers.

## Learning Objectives
After completing this lab, you will be able to:
- Objective 1
- Objective 2
- Objective 3

## Prerequisites
- Prerequisite 1
- Prerequisite 2
- Prerequisite 3

## Difficulty Level
Beginner / Intermediate / Advanced

## Time Estimate
X hours

## Required Tools
- Tool 1
- Tool 2
- Tool 3

## Setup Instructions

### Option 1: Docker (Recommended)
```bash
docker build -t lab-name .
docker run -it lab-name
```

### Option 2: Manual Setup
Step-by-step setup instructions...

## Lab Exercises

### Exercise 1: [Title]
**Objective:** What should students accomplish?

**Instructions:**
1. Step 1
2. Step 2
3. Step 3

**Expected Output:**
```
Expected result here
```

### Exercise 2: [Title]
[Same format as Exercise 1]

## Expected Output
Describe what successful completion looks like.

## Troubleshooting

### Issue: [Common Problem]
**Solution:** How to fix it

### Issue: [Another Common Problem]
**Solution:** How to fix it

## Additional Resources
- [Resource 1](https://example.com)
- [Resource 2](https://example.com)
- [Resource 3](https://example.com)

## Solutions
Solutions are available in the `solutions/` directory.

## Cleanup
To clean up the lab environment:
```bash
./cleanup.sh
```

## Contributing
Found an issue? Have suggestions? Please open an issue or submit a PR!
```

### Step 4: Create Setup Script (setup.sh)

```bash
#!/bin/bash

# Lab Setup Script
# This script sets up the lab environment

set -e  # Exit on error

echo "Setting up [Lab Name]..."

# Check prerequisites
if ! command -v [required-tool] &> /dev/null; then
    echo "Error: [required-tool] is not installed"
    exit 1
fi

# Create necessary directories
mkdir -p resources/data
mkdir -p solutions

# Download resources (if needed)
# wget -O resources/data/file.txt https://example.com/file.txt

# Install dependencies (if Python)
if [ -f "requirements.txt" ]; then
    pip3 install -r requirements.txt
fi

# Build Docker image (if Docker)
if [ -f "Dockerfile" ]; then
    docker build -t lab-name .
fi

# Set permissions
chmod +x *.sh

echo "Setup complete! Run 'cat README.md' to get started."
```

Make it executable:

```bash
chmod +x setup.sh
```

### Step 5: Create Cleanup Script (cleanup.sh)

```bash
#!/bin/bash

# Lab Cleanup Script
# This script removes lab artifacts

echo "Cleaning up [Lab Name]..."

# Remove Docker containers/images (if applicable)
docker rm -f lab-name 2>/dev/null || true
docker rmi lab-name 2>/dev/null || true

# Remove generated files
rm -f output.txt
rm -rf .cache/
rm -rf __pycache__/

# Remove virtual environment (if applicable)
rm -rf venv/

echo "Cleanup complete!"
```

Make it executable:

```bash
chmod +x cleanup.sh
```

### Step 6: Create Dockerfile (if applicable)

```dockerfile
FROM ubuntu:22.04

# Set working directory
WORKDIR /lab

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy lab files
COPY . /lab/

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Set up lab
RUN chmod +x setup.sh && ./setup.sh

# Default command
CMD ["/bin/bash"]
```

### Step 7: Create requirements.txt (if Python)

```
requests==2.28.1
paramiko==2.12.0
cryptography==38.0.4
scapy==2.4.5
```

### Step 8: Create Solutions (Optional)

Create a `solutions/solution.md` file:

```markdown
# [Lab Name] - Solutions

## Exercise 1: [Title]

### Solution
Detailed solution with code examples.

```bash
# Example code
command here
```

### Explanation
Explain why this solution works.

## Exercise 2: [Title]
[Same format]
```

### Step 9: Create Supporting Resources

Organize supporting files in `resources/`:

```
resources/
├── config/
│   └── example.conf
├── scripts/
│   └── helper.py
└── data/
    └── sample.txt
```

### Step 10: Create Documentation

Create `docs/troubleshooting.md`:

```markdown
# Troubleshooting

## Issue: [Common Problem]
**Error Message:**
```
Error message here
```

**Solution:**
Step-by-step solution

**Prevention:**
How to avoid this issue

## Issue: [Another Problem]
[Same format]
```

Create `docs/learning-objectives.md`:

```markdown
# Learning Objectives

## Knowledge
Students should understand:
- Concept 1
- Concept 2

## Skills
Students should be able to:
- Skill 1
- Skill 2

## Hands-On Experience
Students will practice:
- Practice 1
- Practice 2
```

## Quality Checklist

Before submitting your lab, verify:

- [ ] README.md is comprehensive and clear
- [ ] All learning objectives are specific and measurable
- [ ] Prerequisites are clearly listed
- [ ] Setup script works without errors
- [ ] Lab has been tested on multiple systems
- [ ] All exercises have clear instructions
- [ ] Expected output is documented
- [ ] Troubleshooting guide covers common issues
- [ ] Solutions are provided and correct
- [ ] Code is well-commented
- [ ] Resources are organized logically
- [ ] Cleanup script removes all artifacts
- [ ] No sensitive information is included
- [ ] All links are working
- [ ] Difficulty level is accurate

## Best Practices

### 1. Clear Instructions

- Use numbered steps
- Be specific about commands
- Include expected output
- Provide screenshots if helpful

### 2. Hands-On Learning

- Include practical exercises
- Avoid just reading material
- Encourage experimentation
- Provide challenges

### 3. Progressive Difficulty

- Start with basics
- Build on previous knowledge
- Gradually increase complexity
- Provide scaffolding

### 4. Real-World Scenarios

- Use realistic situations
- Include actual tools and techniques
- Reference industry standards
- Connect to practical applications

### 5. Accessibility

- Avoid jargon or explain it
- Provide multiple learning paths
- Include visual aids
- Consider different learning styles

### 6. Documentation

- Write clear, professional documentation
- Use consistent formatting
- Include examples
- Provide references

### 7. Testing

- Test on multiple systems
- Verify all commands work
- Check all links
- Validate expected output

## Common Lab Types

### Guided Lab
Step-by-step instructions with expected output.

**Structure:**
1. Overview
2. Detailed steps
3. Expected results
4. Verification

### Challenge Lab
Minimal guidance; students solve problems independently.

**Structure:**
1. Scenario description
2. Objectives
3. Hints (optional)
4. Solution

### CTF Lab
Capture The Flag style challenges.

**Structure:**
1. Challenge description
2. Hints
3. Flag format
4. Solution

### Sandbox Lab
Open-ended exploration with guided learning objectives.

**Structure:**
1. Environment description
2. Learning objectives
3. Suggested activities
4. Resources

## Submission Process

1. **Create Your Lab:** Follow the steps above
2. **Test Thoroughly:** Ensure everything works
3. **Fork the Repository:** Create your own copy
4. **Create a Branch:** `git checkout -b feature/your-lab-name`
5. **Commit Changes:** `git add . && git commit -m "Add: Your Lab Name"`
6. **Push to GitHub:** `git push origin feature/your-lab-name`
7. **Open a Pull Request:** Submit for review
8. **Address Feedback:** Make requested changes
9. **Merge:** Your lab is published!

## Examples

For examples of well-structured labs, browse the `labs/` directory in the repository.

## Support

Need help creating your lab?

- Check existing labs for examples
- Review the CONTRIBUTING.md guide
- Open a GitHub Discussion
- Email: contact@icdfa.com

---

Thank you for creating quality educational content! 🙏
