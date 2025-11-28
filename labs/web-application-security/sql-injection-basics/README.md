# SQL Injection Basics - Web Application Security

## Overview

This lab teaches you about SQL injection, one of the most critical web application vulnerabilities. You will learn how SQL injection attacks work, how to identify vulnerable code, and how to implement proper defenses.

## Learning Objectives

After completing this lab, you will be able to:

- Understand SQL injection vulnerability mechanisms
- Identify vulnerable SQL code
- Perform basic SQL injection attacks
- Implement parameterized queries
- Use input validation and sanitization
- Test for SQL injection vulnerabilities

## Prerequisites

- Basic SQL knowledge
- Understanding of web applications
- Python or similar programming experience

## Difficulty Level

**Beginner**

## Time Estimate

2-3 hours

## Required Tools

- Python 3.7+
- SQLite3
- Docker (optional)

## Setup Instructions

### Option 1: Docker (Recommended)

```bash
docker build -t sql-injection-lab .
docker run -it sql-injection-lab
```

### Option 2: Manual Setup

```bash
chmod +x setup.sh
./setup.sh
```

## Lab Exercises

### Exercise 1: Understanding SQL Injection

**Objective:** Learn how SQL injection vulnerabilities occur.

**Instructions:**

1. Start the vulnerable application:
   ```bash
   python3 resources/vulnerable_app.py
   ```

2. In another terminal, test normal login:
   ```bash
   curl "http://localhost:5000/login?username=admin&password=password123"
   ```

3. Test SQL injection:
   ```bash
   curl "http://localhost:5000/login?username=admin' OR '1'='1&password=anything"
   ```

4. Observe the difference in responses

**Expected Output:**

Normal login: Authentication failed or success based on credentials.

SQL injection: Bypasses authentication by manipulating the query.

**Hints:**

- SQL injection works by breaking out of string literals
- The `OR '1'='1` condition is always true
- This bypasses authentication logic

### Exercise 2: Identifying Vulnerable Code

**Objective:** Learn to identify SQL injection vulnerabilities in code.

**Instructions:**

1. Examine the vulnerable code:
   ```bash
   cat resources/vulnerable_app.py
   ```

2. Identify the vulnerable line:
   ```python
   query = f"SELECT * FROM users WHERE username='{username}' AND password='{password}'"
   ```

3. Analyze why this is vulnerable:
   - Direct string concatenation
   - No input validation
   - No parameterized queries

4. Document your findings:
   ```bash
   cat > analysis.txt << EOF
   Vulnerable Code Analysis:
   - Line X: Uses f-string formatting
   - Issue: Direct user input in SQL query
   - Risk: Complete database compromise
   EOF
   ```

**Expected Output:**

Clear identification of vulnerability.

**Hints:**

- Look for string concatenation in queries
- Check for missing input validation
- Verify use of parameterized queries

### Exercise 3: Exploiting SQL Injection

**Objective:** Learn various SQL injection attack techniques.

**Instructions:**

1. Union-based injection:
   ```bash
   curl "http://localhost:5000/login?username=admin' UNION SELECT 1,2,3 -- &password=x"
   ```

2. Time-based blind injection:
   ```bash
   curl "http://localhost:5000/login?username=admin' AND SLEEP(5) -- &password=x"
   ```

3. Boolean-based blind injection:
   ```bash
   curl "http://localhost:5000/login?username=admin' AND '1'='1&password=x"
   ```

4. Document each attack method

**Expected Output:**

Different responses based on injection technique.

**Hints:**

- Different databases require different syntax
- Blind injection reveals information through timing/behavior
- Union-based injection requires knowing table structure

### Exercise 4: Implementing Defenses

**Objective:** Learn how to prevent SQL injection.

**Instructions:**

1. Review the secure code:
   ```bash
   cat resources/secure_app.py
   ```

2. Identify the key differences:
   ```python
   cursor.execute("SELECT * FROM users WHERE username=? AND password=?", (username, password))
   ```

3. Understand parameterized queries:
   - Separates SQL code from data
   - Database driver handles escaping
   - Prevents injection attacks

4. Test the secure version:
   ```bash
   python3 resources/secure_app.py
   ```

5. Attempt SQL injection on secure version:
   ```bash
   curl "http://localhost:5000/login?username=admin' OR '1'='1&password=x"
   ```

**Expected Output:**

Injection attempt fails; treated as literal string.

**Hints:**

- Parameterized queries are the primary defense
- Input validation is a secondary defense
- Never trust user input

### Exercise 5: Testing for SQL Injection

**Objective:** Learn how to test applications for SQL injection.

**Instructions:**

1. Create a test script:
   ```bash
   python3 resources/test_injection.py
   ```

2. Test various injection payloads:
   ```bash
   cat resources/payloads.txt
   ```

3. Analyze results:
   ```bash
   cat > test_results.txt << EOF
   Test Results:
   
   Vulnerable Application:
   - Payload 1: VULNERABLE
   - Payload 2: VULNERABLE
   
   Secure Application:
   - Payload 1: SAFE
   - Payload 2: SAFE
   EOF
   ```

**Expected Output:**

Clear test results showing vulnerable vs. secure code.

**Hints:**

- Automated testing tools like SQLMap can help
- Manual testing is important for understanding
- Document all findings

## Troubleshooting

### Issue: Port Already in Use

**Error Message:**

```
Address already in use
```

**Solution:**

Kill the existing process:

```bash
lsof -i :5000
kill -9 <PID>
```

**Prevention:**

Check available ports before starting services.

### Issue: Database Locked

**Error Message:**

```
database is locked
```

**Solution:**

Remove the database file and recreate:

```bash
rm -f resources/users.db
python3 resources/vulnerable_app.py
```

**Prevention:**

Ensure proper database cleanup.

## Solutions

Complete solutions are available in the `solutions/` directory.

```bash
cat solutions/solution.md
```

## Additional Resources

- [OWASP SQL Injection](https://owasp.org/www-community/attacks/SQL_Injection) - OWASP guide
- [CWE-89: SQL Injection](https://cwe.mitre.org/data/definitions/89.html) - CWE definition
- [SQLMap](http://sqlmap.org/) - Automated SQL injection testing tool

## Cleanup

```bash
./cleanup.sh
```

## Contributing

See [CONTRIBUTING.md](../../CONTRIBUTING.md) for guidelines.

## Questions?

Email: contact@icdfa.com

---

**Happy Learning!** 🔐
