#!/bin/bash
set -e

# Start a simple health check server in the background
cd /app
python3 -c '
import http.server
import socketserver
import threading
import time
import os

def run_server():
    class HealthHandler(http.server.SimpleHTTPRequestHandler):
        def do_GET(self):
            if self.path == "/health":
                self.send_response(200)
                self.send_header("Content-type", "text/plain")
                self.end_headers()
                self.wfile.write(b"OK")
            else:
                self.send_response(404)
                self.end_headers()
    
    port = int(os.environ.get("NODE_PORT", 8080))
    with socketserver.TCPServer(("", port), HealthHandler) as httpd:
        print(f"Health check server running on port {port}")
        httpd.serve_forever()

thread = threading.Thread(target=run_server)
thread.daemon = True
thread.start()
print("Health check server started in background")
' &

# Log startup
echo "Health check server started"
echo "Starting blockchain node..."

# Run the actual blockchain node
cd /app
./build/blockchain_node
