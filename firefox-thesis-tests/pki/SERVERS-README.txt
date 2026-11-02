Server certificates for app.thesis.test
===================================

Layout:
  cas/ca-a/       CA-A key, certificate, DER/Base64 forms, SPKI fingerprint
  cas/ca-b/       CA-B key, certificate, DER/Base64 forms, SPKI fingerprint
  servers/ca-a/   Server material issued by CA-A
    ca-a-server.key       Server private key
    ca-a-server.csr       Certificate signing request (CSR)
    ca-a-server-ext.cnf   Certificate extensions configuration
    ca-a-server.crt       Server certificate signed by CA-A
  servers/ca-b/   Server material issued by CA-B
    ca-b-server.key       Server private key
    ca-b-server.csr       Certificate signing request (CSR)
    ca-b-server-ext.cnf   Certificate extensions configuration
    ca-b-server.crt       Server certificate signed by CA-B

spki-fingerprints.txt contains SHA-256 fingerprints of each CA's SPKI.
Use CA-A's fingerprint as the allowed anchor in your example policy if you
want CA-A to be approved for the protected hostname.

Both server certificates identify app.thesis.test, but are signed by different
CAs. CA-A and CA-B are just test labels; policy determines which is approved.

IMPORTANT:
- These files are not trusted by Firefox automatically.
- For a meaningful policy test, configure a dedicated test profile so both
  CAs pass baseline certificate verification, then enable the domain policy.
- Never use these test keys for real services.
