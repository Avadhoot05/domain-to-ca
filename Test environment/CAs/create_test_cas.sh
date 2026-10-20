#!/usr/bin/env bash
set -Eeuo pipefail
umask 077

# Creates two independent test CAs for the Firefox domain-to-CA binding test.
# Each CA lives in its own directory. The companion create_test_server_certs.sh
# script uses these CAs to issue server certificates for app.scone.cloud, each
# into its own per-CA server directory.
#
# Resulting layout:
#   <OUT_DIR>/
#     cas/
#       ca-a/   ca-a.key, ca-a.crt, ca-a.der, ca-a.der.base64, spki-sha256.txt
#       ca-b/   ca-b.key, ca-b.crt, ca-b.der, ca-b.der.base64, spki-sha256.txt
#     servers/  (filled by create_test_server_certs.sh)
#       ca-a/
#       ca-b/
#     spki-fingerprints.txt   (combined)
#     README.txt
#
# WARNING: TEST ONLY. These keys/certificates are not for production.

OUT_DIR="${1:-$HOME/firefox-thesis-tests/pki}"
OUT_DIR="${OUT_DIR%/}"

if ! command -v openssl >/dev/null 2>&1; then
  echo "ERROR: OpenSSL is not installed. Install it with: sudo apt install openssl" >&2
  exit 1
fi

if [[ -e "$OUT_DIR" ]]; then
  echo "ERROR: Output directory already exists: $OUT_DIR" >&2
  echo "To avoid overwriting keys, choose another directory or move the existing one first." >&2
  exit 1
fi

mkdir -p "$OUT_DIR/cas" "$OUT_DIR/servers"
cd "$OUT_DIR"

: > spki-fingerprints.txt

create_ca() {
  local name="$1"
  local lower="${name,,}"
  local dir="$OUT_DIR/cas/${lower}"

  echo "== Creating ${name} in ${dir} =="
  mkdir -p "$dir"

  openssl genrsa -out "${dir}/${lower}.key" 3072

  openssl req -x509 -new \
    -key "${dir}/${lower}.key" \
    -sha256 \
    -days 365 \
    -out "${dir}/${lower}.crt" \
    -subj "/CN=Thesis Test ${name}" \
    -addext "basicConstraints=critical,CA:TRUE" \
    -addext "keyUsage=critical,keyCertSign,cRLSign" \
    -addext "subjectKeyIdentifier=hash"

  # Fingerprint of the SubjectPublicKeyInfo (SPKI), not the whole certificate.
  local fp
  fp="$(openssl x509 -in "${dir}/${lower}.crt" -pubkey -noout |
    openssl pkey -pubin -outform DER |
    openssl dgst -sha256 |
    awk '{print $NF}')"

  echo "${name}_SPKI_SHA256=${fp}" > "${dir}/spki-sha256.txt"
  echo "${name}_SPKI_SHA256=${fp}" >> "$OUT_DIR/spki-fingerprints.txt"

  # Save DER and Base64-encoded DER forms for policy experiments.
  openssl x509 -in "${dir}/${lower}.crt" -outform DER -out "${dir}/${lower}.der"
  base64 -w 0 "${dir}/${lower}.der" > "${dir}/${lower}.der.base64"
  printf '\n' >> "${dir}/${lower}.der.base64"

  # Server directory for this CA (populated by create_test_server_certs.sh).
  mkdir -p "$OUT_DIR/servers/${lower}"
}

create_ca "CA-A"
create_ca "CA-B"

cat > README.txt <<'EOF'
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
EOF

echo
echo "== CA SPKI SHA-256 fingerprints =="
cat spki-fingerprints.txt
echo
echo "== Generated files =="
find "$OUT_DIR" -type f | sed "s|^$OUT_DIR/||" | sort
echo
echo "Done. Created CA-A and CA-B."
echo "Output directory: $OUT_DIR"
echo "Next, run create_test_server_certs.sh \"$OUT_DIR\"."
