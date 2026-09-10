# Erlang / rebar3 Ebuild Workflow

## Category & Naming

- All Erlang libraries → `dev-erlang/`
- Package name: strip the common `erlang-` / `erlang_` prefix from the repo name
  - `benoitc/erlang_quic` → `dev-erlang/quic`
  - `benoitc/erlang_h2` → `dev-erlang/h2`
  - `benoitc/erlang-quickjs` → `dev-erlang/quickjs`
  - `benoitc/erlang-webtransport` → `dev-erlang/webtransport`
- Exception: keep the full name if the stripped form would be too generic or clash

## Hex.pm Package Name Mapping

Erlang packages on Hex often have a different name from their GitHub repo.
Use `hex-info` to resolve:

```bash
/usr/local/portage/.agents/skills/ebuild/scripts/hex-info HEXNAME
/usr/local/portage/.agents/skills/ebuild/scripts/hex-info HEXNAME VERSION
```

Also note: **hex release versions ≠ GitHub tags**. A hex package may be
published at version 1.4.2 while the latest GitHub tag is only 1.3.0. Always
cross-check both. If no GitHub tag exists for the required version, consider
using the hex tarball or a commit-based snapshot.

## SRC_URI Tag Rules

| GitHub tag | Ebuild filename | SRC_URI |
|---|---|---|
| `v0.2.4` | `pkgname-0.2.4.ebuild` | `…/tags/v${PV}.tar.gz` |
| `0.6.0` | `pkgname-0.6.0.ebuild` | `…/tags/${PV}.tar.gz` |

When the GitHub archive filename collides with other distfiles, add a unique
prefix in the rename arrow:

```ebuild
SRC_URI="https://github.com/benoitc/erlang_h2/archive/refs/tags/${PV}.tar.gz
    -> erlang_${P}.tar.gz"
```

## S Path Override

GitHub archives extract to `REPO-TAG/`, not `${PN}-${PV}/` — with the
stripped package names above, an S override is almost always needed.
scaffold's `s_line` computes it; keep it **before** `LICENSE` (pkgcheck
enforces this order). Do **not** set `S` if it equals `${WORKDIR}/${P}`.

## Minimal Pure-Erlang Ebuild

```ebuild
# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Short description without trailing period"
HOMEPAGE="https://github.com/OWNER/REPO"
SRC_URI="https://github.com/OWNER/REPO/archive/refs/tags/v${PV}.tar.gz
    -> erlang_${P}.gh.tar.gz"
S="${WORKDIR}/REPO-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Runtime-only deps (Erlang resolves calls lazily — no compile-time check)
RDEPEND="dev-erlang/some-dep"
```

**The `rebar3` eclass already adds:**
- `RDEPEND="dev-lang/erlang:="`
- `DEPEND="${RDEPEND}"`
- `BDEPEND="dev-util/rebar:3 >=sys-apps/gawk-4.1"`

Do not duplicate these.

## Dependency Declaration

In Erlang, inter-module function calls are resolved at runtime via `ERL_LIBS`,
**not** at compile time. Even if source files call `hackney:request/5`, the
build succeeds without hackney installed. Therefore:

- Deps listed in `{deps, [...]}` of `rebar.config` → **`RDEPEND`** only
- Do NOT add them to `DEPEND` unless the dep provides headers for a C NIF
- Do NOT verify dep existence with `eix` before writing the ebuild — the
  validate script (main SKILL.md Step 6) is the judge of missing deps

## rebar3 Eclass Internals

### What `rebar3_src_prepare` does
1. Calls `rebar_set_vsn` — replaces `{vsn, git}` with `{vsn, "${PV%_*}"}` in
   `src/${PN}.app.src`. No-op if vsn is already hardcoded.
2. Removes `rebar.lock` if present (prevents network fetches).
3. Calls `rebar_remove_deps` — replaces `{deps, [...]}` with `{deps, []}` in
   `rebar.config`. Does **not** touch `pre_hooks`, `post_hooks`, or profiles.

### What `rebar3_src_compile` does
Runs: `rebar3 as default release --all`

### What `rebar3_src_install` does
Looks for `_build/default/rel/${PN}` (release) or `_build/default/lib/${PN}`
(library). For libraries calls `rebar3_install_lib` which installs:
- `ebin/` — BEAM files + .app
- `include/` — .hrl headers (only if NOT a symlink)
- `priv/` — native libraries (only if NOT a symlink)

**Critical**: rebar3 creates `priv/` and `include/` as symlinks pointing back
into the source tree. The eclass skips symlinks. Any NIF `.so` files and
`.hrl` headers must be installed manually in `src_install()`.

## C NIF Pattern (CMake via rebar3 hooks)

Many Erlang packages compile a C NIF using CMake called from rebar3's
`pre_hooks`/`post_hooks` (via `do_cmake.sh` + `do_build.sh`). The NIF is
built into `priv/*.so`. Since `priv/` is a symlink in the build tree, it is
skipped by `rebar3_install_lib`.

```ebuild
BDEPEND="dev-build/cmake"

src_install() {
    rebar3_src_install
    # priv/ in _build/ is a symlink — install NIF manually
    local dest="$(get_erl_libs)/${P}"
    insinto "${dest}/priv"
    doins "${S}"/priv/*.so
    # If the package also has include/*.hrl:
    insinto "${dest}/include"
    doins "${S}"/include/*.hrl
}
```

## Git Submodule Pattern

When `rebar.config` pre_hooks contain:
```erlang
{compile, "git submodule update --init --recursive c_src/SUBMODULE"}
```

The git submodule is absent from the GitHub tarball. Steps:

**1. Find the submodule commit:**
```bash
curl -s "https://api.github.com/repos/OWNER/REPO/contents/c_src/SUBMODULE?ref=TAG" \
| python3 -c "import json,sys; d=json.load(sys.stdin); print(d['sha'])"
```

**2. Add the snapshot to SRC_URI:**
```ebuild
SUBMODULE_COMMIT="<40-char sha>"

SRC_URI="
    https://github.com/OWNER/REPO/archive/refs/tags/v${PV}.tar.gz
        -> ${P}.tar.gz
    https://github.com/SUBMODULE_OWNER/SUBMODULE_REPO/archive/${SUBMODULE_COMMIT}.tar.gz
        -> submodule-name-${SUBMODULE_COMMIT}.tar.gz
"
```

**3. Populate the directory and remove the git hook in `src_prepare()`:**
```ebuild
src_prepare() {
    rebar3_src_prepare

    # Populate submodule from separately-fetched snapshot
    cp -r "${WORKDIR}/SUBMODULE_REPO-${SUBMODULE_COMMIT}/." \
        "${S}/c_src/SUBMODULE/" || die

    # Remove the git submodule pre_hook — directory is already populated
    sed -i 's|{compile, "git submodule update --init --recursive c_src/SUBMODULE"},||' \
        rebar.config || die
}
```

## Variable Order (enforced by pkgcheck)

```
SRC_URI
S              ← before LICENSE
LICENSE
SLOT
KEYWORDS
IUSE
RDEPEND
DEPEND
BDEPEND
```

## LICENSE When No LICENSE File Exists

Some packages declare their license only in `src/${PN}.app.src`:
```erlang
{licenses, ["Apache-2.0"]}
```

Use that value. pkgcheck does not require a LICENSE file to be present in the
repo — only that the `LICENSE` variable in the ebuild is valid.

When a package bundles third-party code under a different license (e.g., a
C submodule under MIT while the Erlang code is Apache-2.0), list both:
```ebuild
LICENSE="Apache-2.0 MIT"
```

## pkgcheck Common Warnings

| Warning | Fix |
|---|---|
| `VariableOrderWrong: S should occur before LICENSE` | Move `S=` above `LICENSE=` |
| `VariableOrderWrong: S should occur before SLOT` | Move `S=` above `SLOT=` |
| `RedundantVersion` | Old version shadowed by new — safe to delete old ebuild |
| `NonexistentDeps` | Dep package not in tree/overlay — create it or drop if optional |
| `PkgInvalidXml: longdesc` | Use `<longdescription lang="en">…</longdescription>` (no nested `<longdesc>`) |
| `OldPackageNameDep: dev-util/cmake` | Rename to `dev-build/cmake` |

## metadata.xml Template for Erlang

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE pkgmetadata SYSTEM "https://www.gentoo.org/dtd/metadata.dtd">
<pkgmetadata>
  <maintainer type="person">
    <email>longlene@gmail.com</email>
    <name>loong0</name>
  </maintainer>
  <longdescription lang="en">
    One-paragraph description.
  </longdescription>
  <upstream>
    <remote-id type="github">OWNER/REPO</remote-id>
  </upstream>
</pkgmetadata>
```
