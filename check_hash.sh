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

for f in "${FILES[@]}"; do
  echo
  echo "--------------------------------------------------"
  echo "File: $f"
  if [ ! -e "$f" ]; then
    echo "  -> ERROR: File does not exist!"
    continue
  fi

  pkg=${PKG[$f]:-}
  if [ -z "$pkg" ]; then
    pkg=$(dpkg -S "$f" 2>/dev/null | awk -F: '{print $1}' | head -n1 || true)
  fi
  echo "  Package: ${pkg:-(not found)}"


  ls -l "$f" || true
  stat -c "  Size: %s  Mtime: %y  Mode: %a  UID:GID: %u:%g" "$f" || true

  if [ -n "$pkg" ]; then
    echo "  apt-cache policy ->"
    apt-cache policy "$pkg" | sed -n '1,6p'
  fi
