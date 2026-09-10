# Install Helper Functions

All helpers below run inside `src_install()` (or `pkg_preinst`/`pkg_postinst` where noted).
They write into `${ED}` automatically — never hardcode `${D}` or `${ED}` yourself.

## File Installation

### Executables

```bash
dobin foo bar          # install to /usr/bin, mode 0755
dosbin foo             # install to /usr/sbin, mode 0755
newbin foo foo-renamed # install and rename in one step
newsbin foo foo-s      # same for sbin
```

### Libraries

```bash
dolib.so libfoo.so.1.2.3              # install shared lib to /usr/lib
dosym libfoo.so.1.2.3 /usr/lib/libfoo.so.1   # create soname symlink
dosym libfoo.so.1 /usr/lib/libfoo.so          # create linker symlink
dolib.a libfoo.a                      # static lib (only with static-libs USE)
```

### Headers

```bash
doheader include/foo.h                # install to /usr/include
doheader -r include/                  # recursive: install entire include/ tree
insinto /usr/include/foo
doins include/foo/*.h                 # manual: install to custom subdir
```

### Arbitrary Files

```bash
insinto /etc/foo                      # set target directory for doins
doins foo.conf                        # install file preserving name
doins -r conf/                        # recursive directory install
newins foo.conf.example foo.conf      # install and rename

exeinto /usr/libexec/foo             # set target dir for doexe (preserves +x)
doexe helper-script                   # install executable to exeinto path
newexe script.sh helper-renamed
```

### Symlinks

```bash
dosym /etc/foo/config /etc/foo.conf               # absolute target
dosym -r /usr/share/foo/data /usr/lib/foo/data    # relative symlink (EAPI 8)
```

Use `dosym -r` (EAPI 8) when both paths are inside `${ED}` — generates relative
symlinks that survive prefix installs.

### Man Pages

```bash
doman foo.1 bar.5          # auto-detects section from extension
doman -i18n=de foo.de.1   # localized man page
newman foo.man foo.1       # install and rename
```

### Documentation

```bash
dodoc README.md CHANGES    # install to /usr/share/doc/${PF}/
dodoc -r docs/             # recursive: install docs/ subtree
newdoc README.md README    # install and rename

dohtml docs/index.html     # install HTML doc (deprecated; use dodoc -r)
```

**EAPI 8 preferred pattern** — set variables before `src_install`, then call `einstalldocs`:

```bash
DOCS=( README.md CHANGES )        # plain docs
HTML_DOCS=( docs/html/ )          # HTML docs (installed under html/ subdir)

src_install() {
    cmake_src_install
    einstalldocs     # reads DOCS and HTML_DOCS, calls dodoc appropriately
}
```

`einstalldocs` is the EAPI 8 way: it's called by `default` in autotools/cmake/meson
eclasses, but must be called explicitly when you override `src_install`.

### Init Scripts & Service Files

```bash
doinitd "${FILESDIR}"/foo.initd      # OpenRC: install to /etc/init.d/foo
doconfd "${FILESDIR}"/foo.confd      # OpenRC: install to /etc/conf.d/foo

# systemd — requires inherit systemd
systemd_dounit "${FILESDIR}"/foo.service
systemd_newunit "${FILESDIR}"/foo.service foo-alt.service
```

### Desktop / Icons

```bash
# requires inherit xdg (or desktop)
domenu "${FILESDIR}"/foo.desktop
doicon images/foo.png

# xdg eclass: handles cache update in pkg_postinst automatically
inherit xdg
```

---

## Directory Control

```bash
insinto /path/to/target   # set target for doins / newins
exeinto /path/to/target   # set target for doexe / newexe
into /usr                 # set prefix for dobin/dolib/etc (rarely needed)
keepdir /var/lib/foo      # create empty dir and keep it (via .keep file)
```

---

## USE Flag Query Helpers

These are used anywhere in an ebuild, not just in `src_install`.

```bash
use ssl               # returns 0 (true) if ssl USE flag is set; 1 otherwise
                      # use in if-conditions: if use ssl; then ...; fi

usex ssl yes no       # prints "yes" if ssl enabled, "no" otherwise
usex ssl              # shorthand: prints "ssl" / "" (empty)

use_enable ssl        # prints "--enable-ssl" or "--disable-ssl" (for econf)
use_enable ssl tls    # prints "--enable-tls" or "--disable-tls" (different flag name)

use_with ssl          # prints "--with-ssl" or "--without-ssl"
use_with ssl openssl  # prints "--with-openssl" or "--without-openssl"

use_if_iuse ssl && echo "ssl is on"  # safe: no-op if ssl not in IUSE
```

### Common Patterns

```bash
# autotools
src_configure() {
    econf \
        $(use_enable nls) \
        $(use_enable debug) \
        $(use_with ssl openssl) \
        --disable-static
}

# cmake
src_configure() {
    local mycmakeargs=(
        -DENABLE_NLS=$(usex nls ON OFF)
        -DBUILD_TESTS=$(usex test ON OFF)
    )
    cmake_src_configure
}

# conditional block
src_install() {
    cmake_src_install
    if use doc; then
        dodoc -r "${S}"/docs/html
    fi
}
```
