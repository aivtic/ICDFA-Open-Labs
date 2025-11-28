#!/bin/bash

set -e

GREEN='\033[0;32m'
NC='\033[0m'

print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

main() {
    print_status "Setting up SQL Injection Basics lab..."
    
    # Install Python dependencies
    if [ -f "requirements.txt" ]; then
        print_status "Installing Python dependencies..."
        pip3 install -r requirements.txt
    fi
    
    # Create directories
    mkdir -p solutions resources
    
    # Create vulnerable application
    cat > resources/vulnerable_app.py << 'EOF'
from flask import Flask, request, jsonify
import sqlite3
import os

app = Flask(__name__)
app.config['DATABASE'] = 'users.db'

def init_db():
    if not os.path.exists(app.config['DATABASE']):
        conn = sqlite3.connect(app.config['DATABASE'])
        cursor = conn.cursor()
        cursor.execute('''CREATE TABLE users (
            id INTEGER PRIMARY KEY,
            username TEXT,
            password TEXT
        )''')
        cursor.execute("INSERT INTO users VALUES (1, 'admin', 'password123')")
        cursor.execute("INSERT INTO users VALUES (2, 'user', 'user123')")
        conn.commit()
        conn.close()

@app.route('/login')
def login():
    username = request.args.get('username', '')
    password = request.args.get('password', '')
    
    conn = sqlite3.connect(app.config['DATABASE'])
    cursor = conn.cursor()
    
    # VULNERABLE: Direct string concatenation
    query = f"SELECT * FROM users WHERE username='{username}' AND password='{password}'"
    
    try:
        cursor.execute(query)
        result = cursor.fetchone()
        conn.close()
        
        if result:
            return jsonify({'status': 'success', 'message': 'Login successful'})
        else:
            return jsonify({'status': 'failed', 'message': 'Invalid credentials'})
    except Exception as e:
        return jsonify({'status': 'error', 'message': str(e)})

if __name__ == '__main__':
    init_db()
    app.run(debug=True, port=5000)
EOF
    
    # Create secure application
    cat > resources/secure_app.py << 'EOF'
from flask import Flask, request, jsonify
import sqlite3
import os

app = Flask(__name__)
app.config['DATABASE'] = 'users_secure.db'

def init_db():
    if not os.path.exists(app.config['DATABASE']):
        conn = sqlite3.connect(app.config['DATABASE'])
        cursor = conn.cursor()
        cursor.execute('''CREATE TABLE users (
            id INTEGER PRIMARY KEY,
            username TEXT,
            password TEXT
        )''')
        cursor.execute("INSERT INTO users VALUES (1, 'admin', 'password123')")
        cursor.execute("INSERT INTO users VALUES (2, 'user', 'user123')")
        conn.commit()
        conn.close()

@app.route('/login')
def login():
    username = request.args.get('username', '')
    password = request.args.get('password', '')
    
    conn = sqlite3.connect(app.config['DATABASE'])
    cursor = conn.cursor()
    
    # SECURE: Parameterized query
    query = "SELECT * FROM users WHERE username=? AND password=?"
    
    try:
        cursor.execute(query, (username, password))
        result = cursor.fetchone()
        conn.close()
        
        if result:
            return jsonify({'status': 'success', 'message': 'Login successful'})
        else:
            return jsonify({'status': 'failed', 'message': 'Invalid credentials'})
    except Exception as e:
        return jsonify({'status': 'error', 'message': str(e)})

if __name__ == '__main__':
    init_db()
    app.run(debug=True, port=5001)
EOF
    
    chmod +x *.sh
    
    print_status "${GREEN}Setup complete!${NC}"
}

main "$@"
