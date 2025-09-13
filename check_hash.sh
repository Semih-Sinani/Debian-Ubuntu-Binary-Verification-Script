#!/bin/bash
set -euo pipefail
echo "== Start: Package/binary verification =="


FILES=(
    #example 

#   "/usr/bin/passwd"
#   "/usr/bin/chfn"
#   "/opt/google/chrome/chrome-sandbox"
#   "/usr/share/code/chrome-sandbox"
#   "/usr/lib/virtualbox/VBoxHeadless"

)

declare -A PKG
PKG["/usr/bin/passwd"]="passwd"
PKG["/usr/bin/chfn"]="passwd"
PKG["/opt/google/chrome/chrome-sandbox"]="google-chrome-stable"
PKG["/usr/share/code/chrome-sandbox"]="code"
PKG["/usr/lib/virtualbox/VBoxHeadless"]="virtualbox-7.2"

echo "[*] Installing debsums (if needed)..."
sudo apt update -y
sudo apt install -y debsums >/dev/null 2>&1 || true

