# Overlay Setup

Only needed when initializing a new overlay for the first time.

```bash
OVERLAY=/usr/local/portage
[[ -f "${OVERLAY}/profiles/repo_name" ]] || {
    mkdir -p "${OVERLAY}/profiles" "${OVERLAY}/metadata"
    echo "local" > "${OVERLAY}/profiles/repo_name"
    cat > "${OVERLAY}/metadata/layout.conf" <<'EOF'
masters = gentoo
auto-sync = false
EOF
}

[[ -f /etc/portage/repos.conf/local.conf ]] || cat <<'EOF'
# Add as root — /etc/portage/repos.conf/local.conf:
# [local]
# location = /usr/local/portage
# masters = gentoo
# auto-sync = false
EOF
```
