clx -- Overlay For Funtoo/Gentoo Linux
==============================================

## DESCRIPTION

Goal: make funtoo/gentoo Linux a more developer-friendly platform

This overlay stores some ebuilds for Common Lisp, Ruby and Lua developer and other interesting ebuilds.

some ebuilds are collected from the Internet and others are wrote by myself.


## INSTALLATION

At first, install the layman
```bash
emerge -v layman
```

```bash
echo 'source /var/lib/layman/make.conf' >> /etc/portage/make.conf
```

Add this overlay with your layman: 

```bash
layman -f -a clx -o https://raw.github.com/longlene/clx/master/repo.xml
```

Some ebuilds may be on bleeing edge. Take care if you wanna to use them.
Please issue or mail me if you encounter a problem.

