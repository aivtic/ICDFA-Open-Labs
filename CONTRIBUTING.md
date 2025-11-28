# Contributing to ICDFA-Open-Labs

Thank you for your interest in contributing to ICDFA-Open-Labs! We welcome contributions from everyone, regardless of experience level. This guide will help you get started.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How to Contribute](#how-to-contribute)
- [Reporting Bugs](#reporting-bugs)
- [Suggesting Enhancements](#suggesting-enhancements)
- [Pull Request Process](#pull-request-process)
- [Lab Creation Guidelines](#lab-creation-guidelines)
- [Documentation Standards](#documentation-standards)
- [Questions?](#questions)

## Code of Conduct

This project and everyone participating in it is governed by our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## How to Contribute

There are many ways to contribute to ICDFA-Open-Labs:

1. **Create New Labs** - Develop and share new cybersecurity labs
2. **Improve Existing Labs** - Enhance, fix, or optimize existing content
3. **Fix Documentation** - Improve README files, guides, and tutorials
4. **Report Issues** - Identify and report bugs or problems
5. **Suggest Features** - Propose new labs or improvements
6. **Review Pull Requests** - Help review and provide feedback on submissions

## Reporting Bugs

Before creating a bug report, please check the [issue list](https://github.com/aivtic/ICDFA-Open-Labs/issues) to avoid duplicates.

When creating a bug report, include:

- **Title:** Clear and descriptive title
- **Description:** Detailed description of the bug
- **Steps to Reproduce:** Exact steps to reproduce the issue
- **Expected Behavior:** What you expected to happen
- **Actual Behavior:** What actually happened
- **Environment:** OS, Python version, Docker version, etc.
- **Screenshots/Logs:** If applicable

**Example:**

```
Title: Lab setup script fails on Ubuntu 22.04

Description:
The setup.sh script in labs/penetration-testing/nmap-basics fails with permission errors.

Steps to Reproduce:
1. Clone the repository
2. Navigate to labs/penetration-testing/nmap-basics
3. Run ./setup.sh

Expected Behavior:
The lab environment should be set up without errors.

Actual Behavior:
Permission denied error on line 15.

Environment:
- OS: Ubuntu 22.04
- Bash version: 5.1.16
```

## Suggesting Enhancements

We love feature suggestions! When suggesting an enhancement:

- **Title:** Clear and descriptive title
- **Description:** Detailed description of the enhancement
- **Motivation:** Explain why this enhancement would be useful
- **Examples:** Provide examples of how it would work
- **Additional Context:** Any other relevant information

**Example:**

```
Title: Add Docker support for all labs

Description:
Create Docker containers for each lab to ensure consistent environments across different systems.

Motivation:
This would reduce setup issues and make labs more accessible to beginners.
```

## Pull Request Process

1. **Fork the Repository**
   ```bash
   gh repo fork aivtic/ICDFA-Open-Labs --clone
   ```

2. **Create a Feature Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **Make Your Changes**
   - Follow the guidelines below (Lab Creation, Documentation Standards)
   - Keep commits atomic and descriptive
   - Reference any related issues in commit messages

4. **Test Your Changes**
   - Ensure all labs work as intended
   - Test on multiple systems if possible
   - Verify documentation is accurate

5. **Commit and Push**
   ```bash
   git add .
   git commit -m "Add: descriptive commit message"
   git push origin feature/your-feature-name
   ```

6. **Create a Pull Request**
   - Use the PR template provided
   - Link related issues
   - Provide clear description of changes
   - Be responsive to feedback

7. **Code Review**
   - Address feedback from reviewers
   - Make requested changes
   - Once approved, your PR will be merged

## Lab Creation Guidelines

### Lab Structure

Each lab should follow this directory structure:

```
lab-name/
├── README.md                 # Lab overview and instructions
├── setup.sh                  # Automated setup script
├── cleanup.sh                # Cleanup script
├── requirements.txt          # Python dependencies (if applicable)
├── Dockerfile                # Docker configuration (if applicable)
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

### Lab README Template

Every lab must include a comprehensive README.md:

```markdown
# [Lab Name]

## Overview
Brief description of what students will learn.

## Learning Objectives
- Objective 1
- Objective 2
- Objective 3

## Prerequisites
- Requirement 1
- Requirement 2

## Setup Instructions
Step-by-step setup guide.

## Lab Exercises
### Exercise 1: [Title]
Instructions and tasks.

### Exercise 2: [Title]
Instructions and tasks.

## Expected Output
What successful completion looks like.

## Troubleshooting
Common issues and solutions.

## Additional Resources
Links to relevant documentation and tutorials.

## Difficulty Level
Beginner / Intermediate / Advanced

## Time Estimate
X hours
```

### Lab Quality Standards

- **Clarity:** Instructions must be clear and easy to follow
- **Accuracy:** All technical content must be accurate and tested
- **Safety:** Labs should not cause harm to systems or networks
- **Accessibility:** Consider different skill levels and backgrounds
- **Documentation:** Comprehensive README and inline comments
- **Reproducibility:** Labs should work consistently across systems

## Documentation Standards

### General Guidelines

- Use clear, professional language
- Write in second person (you, your)
- Use active voice
- Keep paragraphs short and focused
- Use headers to organize content
- Include code examples where relevant

### Markdown Formatting

```markdown
# Main Heading (H1)
## Section Heading (H2)
### Subsection (H3)

**Bold** for emphasis
*Italic* for terms
`code` for inline code

- Bullet points
- For lists

1. Numbered
2. For steps

[Links](https://example.com)

> Blockquotes for important notes

```bash
code blocks for commands
```
```

### Code Comments

```python
# Use clear, descriptive comments
# Explain the "why", not just the "what"

def important_function():
    """
    Docstring explaining what the function does.
    
    Args:
        param1: Description of param1
        
    Returns:
        Description of return value
    """
    pass
```

## File Naming Conventions

- **Directories:** Use kebab-case (e.g., `penetration-testing`, `lab-name`)
- **Files:** Use kebab-case (e.g., `setup.sh`, `requirements.txt`)
- **Scripts:** Use lowercase with .sh extension
- **Documentation:** Use CamelCase for clarity (e.g., `README.md`, `LICENSE`)

## Commit Message Guidelines

Use clear, descriptive commit messages:

```
[Type]: Brief description

Optional longer description explaining the changes.

Fixes #123
```

**Types:**
- `Add:` New lab or feature
- `Fix:` Bug fix
- `Improve:` Enhancement or optimization
- `Docs:` Documentation changes
- `Refactor:` Code restructuring
- `Remove:` Deletion of files or features

**Examples:**
- `Add: Nmap basics penetration testing lab`
- `Fix: Setup script permission issues on Ubuntu 22.04`
- `Improve: Add Docker support to digital forensics labs`
- `Docs: Update README with new lab categories`

## Review Process

All submissions go through a review process:

1. **Initial Review:** Check for completeness and adherence to guidelines
2. **Technical Review:** Verify accuracy and functionality
3. **Documentation Review:** Ensure clarity and completeness
4. **Final Approval:** Merge and publish

## Questions?

- Check existing [Issues](https://github.com/aivtic/ICDFA-Open-Labs/issues)
- Join our [Discussions](https://github.com/aivtic/ICDFA-Open-Labs/discussions)
- Email: contact@icdfa.com

---

Thank you for contributing to ICDFA-Open-Labs! Your efforts help make cybersecurity education accessible to everyone. 🙏
