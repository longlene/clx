# EAPI=8 Variables Reference

## Read-Only (set by package manager, never redefine)

| Variable | Value Example | Notes |
|---|---|---|
| `P` | `foo-1.2.3` | `${PN}-${PV}` |
| `PN` | `foo` | Package name only |
| `PV` | `1.2.3` | Version without revision |
| `PR` | `r0`, `r1` | Revision (r0 = no revision) |
| `PVR` | `1.2.3-r1` | Version + revision |
| `PF` | `foo-1.2.3-r1` | Full name: `${PN}-${PVR}` |
| `CATEGORY` | `dev-python` | |
| `WORKDIR` | `${PORTAGE_BUILDDIR}/work` | All source extraction goes here |
| `T` | `${PORTAGE_BUILDDIR}/temp` | Temp dir safe for ebuild use |
| `D` | `${PORTAGE_BUILDDIR}/image` | Install sandbox root |
| `ED` | `${D}${EPREFIX}` | Use instead of `D` for prefix compat |
| `FILESDIR` | `.../files/` | Local files/ directory |
| `DISTDIR` | Portage distfiles dir | Downloaded source tarballs |
| `EPREFIX` | Usually empty | Gentoo Prefix offset |
| `ROOT` | `/` or custom | Only valid in pkg_* phases |
| `EROOT` | `${ROOT}${EPREFIX}` | Use instead of ROOT |
| `MERGE_TYPE` | `source`/`binary`/`buildonly` | Check to skip unnecessary steps |

## Ebuild-Defined Variables

### Mandatory
| Variable | Description | Example |
|---|---|---|
| `EAPI` | Always `8` | `EAPI=8` |
| `DESCRIPTION` | ≤80 chars, no trailing period | `"Fast JSON parser for Python"` |
| `HOMEPAGE` | Project URL(s), one per line if multiple | see below |
| `LICENSE` | Exact name(s) from `/var/db/repos/gentoo/licenses/` | `"MIT"`, `"MIT Apache-2.0"` |
| `SLOT` | Usually `"0"` | `SLOT="0"` |

### Commonly Required
| Variable | Description | Notes |
|---|---|---|
| `SRC_URI` | Download URLs | Not needed if eclass sets it (pypi, cargo) |
| `KEYWORDS` | `"~amd64"` for new ebuilds | Space-separated arch list |
| `IUSE` | Optional USE flags | Exclude arch flags |
| `DEPEND` | CHOST compile-time deps | Headers, static libs |
| `BDEPEND` | CBUILD build tools | Compilers, pkg-config, code generators |
| `RDEPEND` | Runtime deps | Shared libs, interpreters |
| `S` | Source directory | Default: `${WORKDIR}/${P}` — omit if default |

### Optional
| Variable | Description |
|---|---|
| `REQUIRED_USE` | USE flag constraints: `"foo? ( bar )"` |
| `RESTRICT` | `"fetch"`, `"mirror"`, `"strip"`, `"test"` |
| `PROPERTIES` | `"interactive"`, `"live"`, `"test_network"` |
| `DOCS` | Files for `dodoc` |
| `HTML_DOCS` | Files/dirs for `dodoc -r` |
| `PATCHES` | Array of patches for default `src_prepare` |

## HOMEPAGE Multi-line Format (EAPI=8)
```ebuild
HOMEPAGE="
    https://github.com/owner/repo/
    https://pypi.org/project/pkgname/
"
```

## SRC_URI Patterns

```ebuild
# GitHub release tarball (named consistently)
SRC_URI="https://github.com/OWNER/REPO/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

# GitHub release asset (exact filename)
SRC_URI="https://github.com/OWNER/REPO/releases/download/v${PV}/${P}.tar.gz"

# Rust: cargo eclass adds crate URIs
SRC_URI="
    https://github.com/OWNER/REPO/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
    ${CARGO_CRATE_URIS}
"

# PyPI: pypi eclass auto-sets SRC_URI (just inherit pypi, no SRC_URI needed)
# Manual PyPI:
SRC_URI="https://files.pythonhosted.org/packages/source/${PN:0:1}/${PN}/${PN}-${PV}.tar.gz"

# Rename on download (when upstream name is ambiguous)
SRC_URI="https://example.com/v${PV}.tar.gz -> ${P}.tar.gz"
```

## KEYWORDS

- `~amd64` — testing on amd64 (always start here)
- `amd64` — stable (only after testing and stabilization request)
- `~amd64 ~arm64 ~x86` — multiple testing arches
- `""` (empty) — live ebuild (9999)
- `-* ~amd64` — only tested on amd64, broken elsewhere

Current system: `ACCEPT_KEYWORDS="~amd64"` (from make.conf)
