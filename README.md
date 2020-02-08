clx -- Overlay For Gentoo Linux
==============================================

## DESCRIPTION

To make Gentoo the best meta-platform for developer.

This overlay stores fresh ebuilds for C, C++, Erlang, Ruby, Common Lisp, Lua and other interesting stuffs.


## INSTALLATION
```bash
cat > /etc/portage/repos.conf/clx.conf <<EOF
[clx]
location = /var/db/repos/clx
sync-type = git
sync-uri = https://github.com/longlene/clx.git
auto-sync = yes
EOF

emerge --sync
```

Some ebuilds may be on bleeing edge. Take care if you try them.
Please create an issue or mail me if you encounter a problem.

