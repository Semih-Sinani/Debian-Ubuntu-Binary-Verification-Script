# Verify Binaries Script

This Bash script is designed to **verify the integrity of critical system binaries** on Debian/Ubuntu systems.  
It checks file metadata, compares installed files with the official `.deb` packages (if available), and scans for suspicious content.

---

## Features

- Checks if a file exists and identifies its owning package.
- Shows file metadata (`ls -l`, `stat`).
- Displays `apt-cache policy` for the package.
- Downloads `.deb` files (if available) and compares the installed file using `sha256sum`.
- Uses `debsums` and `dpkg -V` to check for changes.
- Performs a quick scan of the file content with `strings`.
- Suggests a reinstall command if differences are found.

---

## Files Checked by Default

- `/usr/bin/passwd`
- `/usr/bin/chfn`
- `/opt/google/chrome/chrome-sandbox`
- `/usr/share/code/chrome-sandbox`
- `/usr/lib/virtualbox/VBoxHeadless`

You can modify the `FILES` array in the script to add more binaries.

---

## Requirements

- Debian or Ubuntu-based system.
- `sudo` privileges.
- `debsums` (the script will install it if missing).
- Internet connection for downloading `.deb` files (optional).

---

## Security Warning

- Run at your own risk. The script uses sudo and can access critical system files.

- Do not run on production servers or systems exposed to the internet without reviewing the script.

- The script does not contain malware, but improper modifications could be risky.

- Only use in trusted environments.

---


## Contribution

- Contributions are welcome! Please make sure to:

- Keep the script safe and general.

- Avoid including personal or sensitive data.

- Test new additions on a local or virtual machine.

---

## Usage

```bash
chmod +x check_hash.sh
./check_hash.sh
