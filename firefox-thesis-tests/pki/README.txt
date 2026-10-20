Local Firefox domain-to-CA binding test PKI
===========================================

Hostname: app.scone.cloud

Layout:
  cas/ca-a/      CA-A files
    ca-a.key              Private CA key (keep private; test only)
    ca-a.crt              CA certificate
    ca-a.der              CA certificate in DER format
    ca-a.der.base64       Base64-encoded DER certificate
    spki-sha256.txt       SPKI SHA-256 fingerprint of CA-A
  cas/ca-b/      CA-B files (same set as above)
  servers/ca-a/  Server material issued by CA-A (after step 2)
  servers/ca-b/  Server material issued by CA-B (after step 2)
  spki-fingerprints.txt   Combined SPKI SHA-256 fingerprints of both CAs

Use the fingerprint of the CA you intend to approve in your test policy.

Next step:
  Run create_test_server_certs.sh with this output directory as its argument
  to generate server keys, CSRs, certificates, and extension configuration
  files for app.scone.cloud.

IMPORTANT:
- CA-A and CA-B are just test labels; neither is inherently approved.
- These files are not trusted by Firefox automatically.
- Never use these test keys for real services.
