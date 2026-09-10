# Common Ebuild Mistakes (from devmanual)

## Structure & Formatting
- **Wrong indentation**: Use TABs inside functions, never spaces
- **Trailing whitespace**: Remove it
- **Missing SLOT**: Always include `SLOT="0"` even if unused
- **Redundant S**: Don't set `S="${WORKDIR}/${P}"` — it's the default
- **Outdated EAPI**: Always use `EAPI=8`

## Variables
- **Redefining P/PV/PN/PF**: Never. Use `MY_P`, `MY_PV`, `MY_PN` instead
- **Hardcoded versions**: Use `${PV}`, `${P}`, `${PN}` in SRC_URI and S
- **Wrong ROOT usage**: Never use `ROOT` in `src_*` phases; only in `pkg_*`

## Dependencies
- **Missing category**: Write `dev-libs/foo`, not just `foo`
- **Missing build tools**: `pkg-config` → `virtual/pkgconfig` in BDEPEND; `intltool`, `gettext` → BDEPEND
- **Wrong dep variable**: Shared libs → `DEPEND` + `RDEPEND`; build tools → `BDEPEND` only
- **Direct pkg-config call**: Use `$(tc-getPKG_CONFIG)` from `toolchain-funcs` eclass, not `pkg-config`
- **Incomplete deps**: Check configure.in/.ac, CMakeLists.txt, and .spec files for all deps
- **Omitting deps not yet in Portage**: Always declare ALL upstream deps in RDEPEND/DEPEND, even if the package doesn't exist in Portage yet. `NonexistentDeps` findings are acceptable — the validate script classifies them (fixable atom vs genuinely missing), and they resolve once the dep gets packaged. Never silently drop a dep because validate or pkgcheck reports it missing.
- **Missing dep triggers new ebuild**: When a new ebuild has a `NonexistentDeps` warning for a missing package, proactively offer to package that dep next (run the ebuild skill on it). This naturally builds up the dependency tree — the current package's unresolved dep becomes the next `/ebuild` invocation.
- **`DeprecatedDep` on `dev-python/httpx` or `dev-python/orjson`**: both are marked deprecated in Gentoo (`profiles/package.deprecated` — httpx: upstream no longer accepts bug reports; orjson: unsafe-Rust concerns) but still exist and are installable. pkgcheck reports `DeprecatedDep` for any package depending on either — this is a known, accepted warning. Do not try to fix or remove these deps; declare them as-is and skip the finding.

## LICENSE
- **Vague license**: Write `GPL-2+` not `GPL`; `MIT` not `MIT License`
- **Wrong license name**: Must exactly match a file in `/var/db/repos/gentoo/licenses/`
- **Missing crate licenses**: For Rust, pycargoebuild handles this — don't skip it

## Bundled Dependencies (git submodules / vendored libs)

Projects that use git submodules or vendor copies of libraries in `third_party/`, `extern/`, `vendor/`, `deps/` should have those replaced with system-provided packages, not bundled as-is. Portage's network sandbox blocks git at build time, and bundling defeats the purpose of Gentoo's dep tracking.

**Detection:**
```bash
# git submodules
cat /var/tmp/portage/CATEGORY/PKGNAME-VERSION/work/REPO-TAG/.gitmodules

# vendored dirs
ls /var/tmp/portage/CATEGORY/PKGNAME-VERSION/work/REPO-TAG/third_party/
ls /var/tmp/portage/CATEGORY/PKGNAME-VERSION/work/REPO-TAG/extern/
```

**Strategy (prefer in this order):**
1. **Use the upstream system-dep option** — many projects have a cmake option like `-DUSE_SYSTEM_FOO=ON` or `option(EXTERNAL_FOO ...)`. Enable it and add the system package to `DEPEND`/`RDEPEND`.
2. **Patch in a `find_package`** — if no system option exists, patch `CMakeLists.txt` to call `find_package` / `pkg_check_modules` instead of `add_subdirectory`. See `workflows/cmake.md` Step E.
3. **Pre-supply via SRC_URI** — last resort when the dep cannot be replaced (header-only lib with no Gentoo package, or the project patches it). Add the submodule tarball to `SRC_URI` and point cmake at it via `FETCHCONTENT_SOURCE_DIR_<NAME>`. See `workflows/cmake.md` Step C.

**Never** clone submodules or run `git submodule update` in an ebuild — network access is blocked in `src_*` phases.

## RESTRICT

Valid values (EAPI=8): `binchecks`, `fetch`, `installsources`, `mirror`, `primaryuri`, `splitdebug`, `strip`, `test`.

- **`network-sandbox` should NOT be used** — pkgcheck reports `UnknownRestrict`. Remove it. Portage handles network sandboxing at the OS level, not via RESTRICT.
- Any unrecognised value in RESTRICT causes an `UnknownRestrict` pkgcheck warning and should be removed.

## Compilation & Testing
- **-Werror present**: Remove it — breaks across GCC versions. Use `append-flags -Wno-error`
- **Non-verbose build**: Logs must be verbose. CMake: eclass handles it. Autotools: `econf` disables silent rules
- **Missing `|| die`**: Every external command that can fail needs `|| die`
- **Network access in src_***: Never access network in src_* phases; everything must be in SRC_URI
- **CMake FetchContent silently downloading**: If `CMakeLists.txt` uses `FetchContent_Declare` with `GIT_REPOSITORY` or `URL`, those deps must be pre-supplied via SRC_URI + `FETCHCONTENT_SOURCE_DIR_<NAME>` + `-DFETCHCONTENT_FULLY_DISCONNECTED=ON`. Read cmake files before writing the ebuild.
- **CMake conda env detection**: Some projects call `find_package` inside a conda detection block that can override `CMAKE_INSTALL_PREFIX`. Disable with `-DDETECT_CONDA_ENV=OFF` if available.

## Python-specific
- **Wrong DISTUTILS_USE_PEP517**: Check actual `pyproject.toml` build-backend
- **Redundant build backend in BDEPEND**: `distutils-r1` automatically adds the build backend to BDEPEND based on `DISTUTILS_USE_PEP517` — do NOT add it manually. E.g. never write `dev-python/hatchling` or `dev-python/setuptools` in BDEPEND; the eclass handles it. This applies to all supported backends (hatchling, setuptools, flit, pdm-backend, maturin, etc.).
- **Missing `${PYTHON_USEDEP}`**: All Python runtime deps need `[${PYTHON_USEDEP}]`. Every `dev-python/*` entry in RDEPEND must end with `[${PYTHON_USEDEP}]` — forgetting it means portage won't enforce that the dep is built for the matching Python implementation.
- **`DEPEND="${RDEPEND}"` for pure Python**: Wrong. Pure Python packages have no compile-time C/C++ deps. Do NOT mirror RDEPEND into DEPEND. Leave DEPEND unset (the eclass handles its own build deps via BDEPEND automatically).
- **Manual test setup instead of `distutils_enable_tests pytest`**: Do NOT write `IUSE="test"` + `RESTRICT="!test? ( test )"` + `BDEPEND="test? ( dev-python/pytest[${PYTHON_USEDEP}] )"` manually. Use `distutils_enable_tests pytest` — it handles IUSE, RESTRICT, BDEPEND, and **actually runs** pytest in the test phase. The manual approach sets up RESTRICT but never runs the tests.
- **`setuptools-scm` + GitHub archive**: GitHub archives have no `.git` directory, so `setuptools-scm` cannot determine the version. Fix requires two things: (1) override `src_prepare` to export `SETUPTOOLS_SCM_PRETEND_VERSION=${PV}` before calling `distutils-r1_src_prepare`, (2) add `dev-python/setuptools-scm` to BDEPEND (it's still imported even with the pretend version). pkgcheck reports `PythonMissingSCMDependency` if (2) is missing. Detection: `pyproject.toml` `[build-system].requires` contains `setuptools-scm`.
  ```ebuild
  BDEPEND="dev-python/setuptools-scm"
  
  src_prepare() {
      export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
      distutils-r1_src_prepare
  }
  ```
- **Missing `eapply_user`**: When overriding `src_prepare`, always call `distutils-r1_src_prepare` or add `eapply_user`
- **Missing test restrict**: Use `distutils_enable_tests pytest` which auto-sets RESTRICT
- **Missing `.gh.tar.gz` suffix**: When the package is also on PyPI (metadata.xml has `<remote-id type="pypi">`), GitHub archive SRC_URI **must** use `-> ${P}.gh.tar.gz` to avoid filename collisions with PyPI sdists. pkgcheck reports `PythonGHDistfileSuffix`. Fix: `SRC_URI="https://github.com/OWNER/REPO/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"`

## Rust-specific
- **Hand-writing CRATES**: Never — use `pycargoebuild` to generate from Cargo.lock
- **Missing -sys crate deps**: Check for `*-sys` crates in CRATES and add system library deps
- **Forgetting src_install**: `cargo_src_install` installs binaries; call it explicitly

## DESCRIPTION & HOMEPAGE
- **Too long description**: Max 80 characters
- **Trailing period**: Remove it from DESCRIPTION
- **Repeating package name**: Don't start with the package name
- **Wrong HOMEPAGE**: Must be the actual project page, not just github.com

## KEYWORDS
- **Using stable keywords for new ebuilds**: Always start with `~amd64`
- **Untested arches**: Only keyword arches you've actually tested on
- **Missing ~ for version bumps**: When bumping version, reset stable → `~arch`

## Quick checklist before submitting
```
[ ] EAPI=8
[ ] Header copyright present
[ ] DESCRIPTION ≤80 chars, no trailing period
[ ] LICENSE matches /var/db/repos/gentoo/licenses/ exactly
[ ] SLOT="0" present
[ ] KEYWORDS="~amd64" only
[ ] S not set if it equals ${WORKDIR}/${P}
[ ] No hardcoded version numbers
[ ] TAB indentation in functions
[ ] No trailing whitespace
[ ] pkgcheck scan passes
```
