FROM python:3.9-slim

WORKDIR /app

# Create the python script for the web server
RUN echo "\
from http.server import HTTPServer, BaseHTTPRequestHandler\n\
class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):\n\
    def do_GET(self):\n\
        self.send_response(200)\n\
        self.end_headers()\n\
        self.wfile.write(b'Hello from Simple Web App (Docker Image)!')\n\
httpd = HTTPServer(('0.0.0.0', 8080), SimpleHTTPRequestHandler)\n\
httpd.serve_forever()\n\
" > app.py

EXPOSE 8080

CMD ["python", "app.py"]