clx -- Overlay For Funtoo/Gentoo Linux
==============================================

## DESCRIPTION

To make Funtooo the best meta-platform for developers.

This overlay stores fresh ebuilds for C, C++, Ruby, Common Lisp, Lua and other interesting stuff.


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

Some ebuilds may be on bleeing edge. Take care if you wanna use them.
Please issue or mail me if you encounter a problem.

