# License Name Mapping

Gentoo license names must exactly match files in `/var/db/repos/gentoo/licenses/`.
Verify: `ls /var/db/repos/gentoo/licenses/ | grep -i NAME`

## Common Mappings

| Upstream says | Gentoo LICENSE |
|---|---|
| MIT | `MIT` |
| Apache 2.0 / Apache-2.0 | `Apache-2.0` |
| GPL v2 / GPLv2 / GPL-2.0 | `GPL-2` |
| GPL v2 or later / GPL-2.0+ | `GPL-2+` |
| GPL v3 / GPL-3.0 | `GPL-3` |
| GPL v3 or later / GPL-3.0+ | `GPL-3+` |
| LGPL v2 / LGPL-2.0 | `LGPL-2` |
| LGPL v2 or later / LGPL-2.0+ | `LGPL-2+` |
| LGPL v2.1 / LGPL-2.1 | `LGPL-2.1` |
| LGPL v2.1 or later / LGPL-2.1+ | `LGPL-2.1+` |
| LGPL v3 / LGPL-3.0 | `LGPL-3` |
| LGPL v3 or later / LGPL-3.0+ | `LGPL-3+` |
| BSD 2-Clause | `BSD-2` |
| BSD 3-Clause | `BSD` |
| BSD 4-Clause | `BSD-4` |
| ISC | `ISC` |
| MPL 2.0 / Mozilla Public License 2.0 | `MPL-2.0` |
| CDDL | `CDDL` |
| EPL 1.0 | `EPL-1.0` |
| EPL 2.0 | `EPL-2.0` |
| PSF / Python Software Foundation | `PSF-2` |
| Artistic License 1.0 | `Artistic` |
| Artistic License 2.0 | `Artistic-2` |
| Perl (dual Artistic/GPL) | `\|\| ( Artistic GPL-1+ )` |
| Unlicense | `Unlicense` |
| CC0 1.0 | `CC0-1.0` |
| CC BY 4.0 | `CC-BY-4.0` |
| CC BY-SA 4.0 | `CC-BY-SA-4.0` |
| CC BY-NC 4.0 | `CC-BY-NC-4.0` |
| WTFPL | `WTFPL-2` |
| AGPL v3 | `AGPL-3` |
| AGPL v3+ | `AGPL-3+` |
| Boost Software License 1.0 | `Boost-1.0` |
| zlib | `ZLIB` |
| OpenSSL | `openssl` |

## Multiple Licenses

```ebuild
LICENSE="MIT"                    # single
LICENSE="MIT Apache-2.0"         # both apply (AND)
LICENSE="|| ( MIT Apache-2.0 )"  # either (OR, user's choice)
LICENSE="MIT GPL-2+ tools? ( GPL-3+ )"   # conditional
```

## Rust (pycargoebuild handles this)

pycargoebuild reads `Cargo.lock` and computes the combined license expression automatically. The result is usually something like:
```ebuild
LICENSE="MIT Apache-2.0 BSD ISC"
```

## Finding Unknown Licenses

```bash
# Search existing licenses
ls /var/db/repos/gentoo/licenses/ | grep -i "keyword"

# Check what similar packages use
grep "^LICENSE=" /var/db/repos/gentoo/CATEGORY/similar-pkg/*.ebuild

# Read the upstream LICENSE file directly
gh api repos/OWNER/REPO/contents/LICENSE --jq '.content' | base64 -d | head -5
```

## No License / Unclear

- If truly no license (all rights reserved): `LICENSE="all-rights-reserved"` + `RESTRICT="mirror"`
- If license is not in Gentoo tree: file a bug or add it to the overlay's `licenses/` dir
