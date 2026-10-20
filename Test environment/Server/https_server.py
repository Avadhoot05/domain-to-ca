from http.server import HTTPServer, SimpleHTTPRequestHandler
import ssl
server = HTTPServer(("127.0.0.1", 8443), SimpleHTTPRequestHandler)
context = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
# Choose which CA's server certificate to present.
context.load_cert_chain(certfile="ca-a-server.crt", keyfile="ca-a-server.key")
server.socket = context.wrap_socket(server.socket, server_side=True)
print("HTTPS server running at https://app.thesis.test:8443")
server.serve_forever()

