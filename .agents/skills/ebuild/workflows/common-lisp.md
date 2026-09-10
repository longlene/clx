# Common Lisp Ebuild Workflow

## Category & Naming

- Libraries and ASDF systems → `dev-lisp/`
- Standalone CLI applications built to a binary → `dev-lisp/` (or `app-misc/` if non-Lisp users would install it)
- Package name: lowercase, hyphens not underscores, drop `cl-` prefix only when the remaining name is unambiguous

## Two distinct package shapes

### A) Library / ASDF system (most packages)

Install source files so other CL implementations can load the system. Use `common-lisp-3` eclass.

```ebuild
EAPI=8
inherit common-lisp-3

RDEPEND="
    dev-lisp/dep-one
    dev-lisp/dep-two
    virtual/commonlisp
"
# No src_compile needed — common-lisp-3_src_compile is a no-op.
# common-lisp-3_src_install installs all sources + symlinks .asd to
#   /usr/share/common-lisp/systems/
```

The eclass automatically adds `PDEPEND="virtual/commonlisp"`.

Override `src_install` when you need to drop test systems or rename files:

```ebuild
src_prepare() {
    default
    use test || rm -f "${PN}-tests.asd" tests.lisp
}

src_install() {
    common-lisp-install-sources .    # install all .lisp / .asd recursively
    common-lisp-install-asdf         # symlink *.asd into /usr/share/common-lisp/systems/
    einstalldocs
}
```

### B) Standalone binary (application)

Uses SBCL's `save-lisp-and-die` to produce a self-contained executable. No `common-lisp-3` needed — all Lisp deps go in BDEPEND (baked into the image), only C FFI libs in RDEPEND.

```ebuild
EAPI=8
# No common-lisp-3 — this installs a binary, not an ASDF source tree

BDEPEND="
    dev-lisp/sbcl
    dev-lisp/dep-one
    dev-lisp/dep-two
"
RDEPEND="
    dev-db/sqlite:3    # or whatever C library the binary dlopen's via CFFI
"

src_compile() {
    sbcl --script build.lisp || die
}

src_install() {
    dobin bin/${PN}
}
```

SBCL finds ASDF systems via `/etc/common-lisp/source-registry.conf` →
`/usr/share/common-lisp/systems/` (symlinks installed by `common-lisp-3`).
The build script must call `(asdf:initialize-source-registry ... :inherit-configuration)` to
pick those up; the project's `build.lisp` usually already does this.

## ASDF system name → Gentoo atom mapping

The ASDF system name (string in `:depends-on`) often differs from the Gentoo package name. Common mappings in this overlay:

| ASDF system name    | Gentoo atom              |
|---------------------|--------------------------|
| `com.inuoe.jzon`    | `dev-lisp/jzon`          |
| `sqlite`            | `dev-lisp/cl-sqlite`     |
| `cl-ppcre`          | `dev-lisp/cl-ppcre` (also in ::gentoo) |
| `ironclad`          | `dev-lisp/ironclad`      |
| `cl-base64`         | `dev-lisp/cl-base64`     |
| `drakma`            | `dev-lisp/drakma`        |
| `3bmd`              | `dev-lisp/3bmd`          |
| `colorize`          | `dev-lisp/colorize`      |
| `cl-difflib`        | `dev-lisp/cl-difflib`    |
| `let-over-lambda`   | `dev-lisp/let-over-lambda` |

To find which Gentoo package installs a given ASDF system, check the symlink in
`/usr/share/common-lisp/systems/<system>.asd` and follow it:
```bash
readlink -f /usr/share/common-lisp/systems/sqlite.asd
```

## vcs-snapshot for GitHub-pinned deps (qlfile patterns)

When the upstream pins a dependency to a GitHub commit (common in `qlfile`), and
that dep isn't yet in the overlay, use `vcs-snapshot` to fetch the commit archive:

```ebuild
inherit common-lisp-3 vcs-snapshot
EGIT_COMMIT="abc123..."
SRC_URI="https://github.com/owner/repo/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
```

## The `qlot` / `qlfile` pattern

Many CL projects use `qlot` for reproducible builds. For Gentoo, you skip qlot entirely:
- Quicklisp-dist deps in `qlfile` → map to existing Gentoo atoms
- GitHub-pinned deps → may need separate overlay ebuilds or be bundled via SRC_URI
- Vendored deps → include in `SRC_URI` as separate tarballs

`qlfile` is for development; the Gentoo ebuild replaces qlot with proper dep atoms.

## C FFI runtime deps

CL libraries that use CFFI with a C library load it via `dlopen` at runtime, even
in standalone binaries. Declare the C library in `RDEPEND`:

| CFFI usage        | RDEPEND atom        |
|-------------------|---------------------|
| SQLite            | `dev-db/sqlite:3`   |
| OpenSSL           | `dev-libs/openssl:=` |
| libusb            | `dev-libs/libusb:1` |

## Installed paths

`common-lisp-3` installs to:
- Sources: `/usr/share/common-lisp/source/${CLPACKAGE}/`
- ASDF symlinks: `/usr/share/common-lisp/systems/*.asd -> ../source/${CLPACKAGE}/...`

The `CLPACKAGE` variable defaults to `${PN}`. Override if the package name and
system name diverge:
```ebuild
inherit common-lisp-3
CLPACKAGE="cl-sqlite"   # when PN is something different
```
