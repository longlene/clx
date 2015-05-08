clx -- Overlay For Funtoo/Gentoo Linux
==============================================

## 描述

让Funtoo/Gentoo成为开发者最棒的开发环境。

这里有C, C++，Ruby，Common Lisp，Lua等其他新鲜有趣的ebuild。

优先支持amd64, x86, arm


## 安装

首先，安装layman
```bash
emerge -v layman
```

```bash
echo 'source /var/lib/layman/make.conf' >> /etc/portage/make.conf
```

通过layman添加此overlay
```bash
layman -f -a clx -o https://raw.github.com/longlene/clx/master/repo.xml
```

Some ebuilds may be on bleeing edge. Take care if you wanna to use them.
Please issue or mail me if you encounter a problem.

