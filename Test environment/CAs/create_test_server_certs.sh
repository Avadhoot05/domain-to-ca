#!/usr/bin/env bash
set -Eeuo pipefail
umask 077

# Creates server certificates for app.scone.cloud, one signed by CA-A and
# one signed by CA-B. Run create_test_cas.sh first.
#
# Each server certificate is written to its own directory:
#   <OUT_DIR>/servers/ca-a/   ca-a-server.key, .csr, .crt, -ext.cnf
#   <OUT_DIR>/servers/ca-b/   ca-b-server.key, .csr, .crt, -ext.cnf
# CA material is read from <OUT_DIR>/cas/ca-a/ and <OUT_DIR>/cas/ca-b/.
#
# WARNING: TEST ONLY. These keys/certificates are not for production.

OUT_DIR="${1:-$HOME/firefox-thesis-tests/pki}"
OUT_DIR="${OUT_DIR%/}"
HOSTNAME="app.thesis.test"
DAYS_SERVER=90

if ! command -v openssl >/dev/null 2>&1; then
  echo "ERROR: OpenSSL is not installed. Install it with: sudo apt install openssl" >&2
  exit 1
fi

if [[ ! -d "$OUT_DIR" ]]; then
  echo "ERROR: Output directory does not exist: $OUT_DIR" >&2
  echo "Run create_test_cas.sh first." >&2
  exit 1
fi

for required in \
  cas/ca-a/ca-a.key cas/ca-a/ca-a.crt \
  cas/ca-b/ca-b.key cas/ca-b/ca-b.crt \
  spki-fingerprints.txt; do
  if [[ ! -f "$OUT_DIR/$required" ]]; then
    echo "ERROR: Missing $OUT_DIR/$required" >&2
    echo "Run create_test_cas.sh first and use the same output directory." >&2
    exit 1
  fi
done

cd "$OUT_DIR"

issue_server_cert() {
  local ca="$1"
  local ca_lower="${ca,,}"
  local ca_dir="$OUT_DIR/cas/${ca_lower}"
  local server_dir="$OUT_DIR/servers/${ca_lower}"
  local server="${ca_lower}-server"

  mkdir -p "$server_dir"

  for generated in \
    "${server_dir}/${server}.key" \
    "${server_dir}/${server}.csr" \
    "${server_dir}/${server}.crt" \
    "${server_dir}/${server}-ext.cnf" \
    "${ca_dir}/${ca_lower}.srl"; do
    if [[ -e "$generated" ]]; then
      echo "ERROR: Refusing to overwrite existing file: $generated" >&2
      exit 1
    fi
  done

  echo "== Issuing ${server_dir}/${server}.crt from ${ca} =="

  openssl genrsa -out "${server_dir}/${server}.key" 2048

  openssl req -new \
    -key "${server_dir}/${server}.key" \
    -out "${server_dir}/${server}.csr" \
    -subj "/CN=${HOSTNAME}"

  cat > "${server_dir}/${server}-ext.cnf" <<EOF
basicConstraints = critical,CA:FALSE
keyUsage = critical,digitalSignature
extendedKeyUsage = serverAuth
subjectAltName = DNS:${HOSTNAME}
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid,issuer
EOF

  openssl x509 -req \
    -in "${server_dir}/${server}.csr" \
    -CA "${ca_dir}/${ca_lower}.crt" \
    -CAkey "${ca_dir}/${ca_lower}.key" \
    -CAcreateserial \
    -out "${server_dir}/${server}.crt" \
    -days "$DAYS_SERVER" \
    -sha256 \
    -extfile "${server_dir}/${server}-ext.cnf"

  # Verify the chain and hostname against the issuing CA.
  openssl verify \
    -CAfile "${ca_dir}/${ca_lower}.crt" \
    -verify_hostname "$HOSTNAME" \
    "${server_dir}/${server}.crt"

  openssl x509 -in "${server_dir}/${server}.crt" -noout -subject -issuer -dates
  echo
}

issue_server_cert "CA-A"
issue_server_cert "CA-B"

cat > SERVERS-README.txt <<EOF
Server certificates for ${HOSTNAME}
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

Both server certificates identify ${HOSTNAME}, but are signed by different
CAs. CA-A and CA-B are just test labels; policy determines which is approved.

IMPORTANT:
- These files are not trusted by Firefox automatically.
- For a meaningful policy test, configure a dedicated test profile so both
  CAs pass baseline certificate verification, then enable the domain policy.
- Never use these test keys for real services.
EOF

echo "== CA SPKI SHA-256 fingerprints =="
cat spki-fingerprints.txt
echo
echo "== Generated files =="
find "$OUT_DIR" -type f | sed "s|^$OUT_DIR/||" | sort
echo
echo "Done. Server certificates were verified against their issuing CAs."
echo "Output directory: $OUT_DIR"
echo "Remember: creating these files does not automatically trust either CA in Firefox."
