# ebuild Command Reference

`ebuild <path>.ebuild <phase> [phase2 ...]` — run specific build phases manually.
Used for development and debugging only; normal installation uses `emerge`.

## Phase Execution Order

```
pkg_pretend → pkg_setup
→ src_unpack → src_prepare → src_configure → src_compile → src_test → src_install
→ pkg_preinst → pkg_postinst
```

Uninstall: `pkg_prerm → pkg_postrm`

## Commands

| Command | What it does | Writes to |
|---------|-------------|-----------|
| `fetch` | Download SRC_URI files to DISTDIR | `/var/cache/distfiles/` |
| `digest` | Fetch + update Manifest checksums | Manifest file |
| `unpack` | Run `src_unpack` — extract sources | `${WORKDIR}` |
| `prepare` | Run `src_prepare` — apply patches | `${S}` |
| `configure` | Run `src_configure` | `${S}` or build dir |
| `compile` | Run `src_compile` | `${S}` or build dir |
| `test` | Run `src_test` | build dir |
| `install` | Run `src_install` — install into image | `${D}` |
| `qmerge` | Merge image into live system (skip Manifest check) | `/` |
| `merge` | Full install: fetch+unpack+…+qmerge | `/` |
| `clean` | Remove `${PORTAGE_BUILDDIR}` for this package | |
| `cleanrm` | `clean` + remove distfiles | |

## Typical Debug Workflow

```bash
EBUILD=/usr/local/portage/category/pkg/pkg-1.0.ebuild

# 1. Download source
ebuild "${EBUILD}" fetch

# 2. Generate Manifest (also fetches if needed)
ebuild "${EBUILD}" digest

# 3. Extract source
ebuild "${EBUILD}" unpack
# Now inspect: ls /var/tmp/portage/category/pkg-1.0/work/

# 4. Iterate on configure/compile/install
ebuild "${EBUILD}" configure
ebuild "${EBUILD}" compile
ebuild "${EBUILD}" install
# Inspect installed files: ls -R /var/tmp/portage/category/pkg-1.0/image/

# 5. Merge to system (development only)
ebuild "${EBUILD}" qmerge   # skips Manifest check
# or: emerge --ask category/pkg (production)
```

## Preserving Workdir for Debugging

`ebuild` does not clean `${PORTAGE_BUILDDIR}` after running — cleanup only
happens after a full `emerge` merge. So inspection is always available after
`ebuild ... install` without any special flags:

```bash
# Run install, then inspect freely
ebuild "${EBUILD}" install

# Inspect installed files
ls -R /var/tmp/portage/category/pkg-1.0/image/

# Re-run make manually inside the build env
cd /var/tmp/portage/category/pkg-1.0/work/pkg-1.0/
make V=1
```

## Running Tests

```bash
# Directly invoke the test phase (bypasses RESTRICT=test)
ebuild "${EBUILD}" test
```

## Manual Validation (if the `validate` script itself is unavailable)

`ebuild ... install` (above) only covers the install-test half of Step 6.
`validate` also runs three more checks that `ebuild install` never exercises
— if the script is broken or you need to debug one check in isolation, run
them directly:

```bash
CATPKG="category/pkg"          # e.g. dev-python/hpsv2
ATOM="=${CATPKG}-1.0"          # exact version, e.g. =dev-python/hpsv2-1.2.0

# 1. Dependency resolution — the only stage that exercises RDEPEND
#    (ebuild install never touches other packages' dependency graph)
ACCEPT_KEYWORDS="~amd64" ACCEPT_LICENSE="*" \
    emerge --pretend --verbose --color=n "${ATOM}"

# 2. Distfile fetch for the whole dep tree (binpkg fetching disabled —
#    binhost writes to a root-owned cache dir we don't have)
ACCEPT_KEYWORDS="~amd64" ACCEPT_LICENSE="*" FEATURES="-getbinpkg" \
    emerge --fetchonly --color=n "${ATOM}"

# 3. pkgcheck — scan the whole package directory, not just one ebuild,
#    so cross-version checks (e.g. stale Manifest) still run
pkgcheck scan "/usr/local/portage/${CATPKG}"

# 4. For any "NonexistentDeps" atom pkgcheck reports, classify it:
#    genuinely missing vs. exists under a different/wrong atom
/usr/local/portage/.agents/skills/ebuild/scripts/check-deps "dev-python/some-atom"
```

Read `deps_resolve`/`deps_fetch` failures the same way as the scripted
version: dependency-graph errors (bad atom/version/USE) come from step 1,
a single dep's distfile failing to download comes from step 2. Fix the
ebuild and re-run only the step that failed — no need to redo the install
test unless RDEPEND/DEPEND itself changed.

## Environment Variables

```bash
# Skip distfile mirrors — fetch directly from upstream (useful for new packages)
GENTOO_MIRRORS="" ebuild "${EBUILD}" fetch

# Verbose compiler output (if not already forced by eclass)
MAKEOPTS="-j1" ebuild "${EBUILD}" compile

# Keep work on failure only
PORTAGE_KEEP_WORKDIR=failed ebuild "${EBUILD}" install
```

## Key Paths

| Path | Contents |
|------|----------|
| `/var/tmp/portage/CAT/PKG-VER/work/` | `${WORKDIR}` — extracted sources |
| `/var/tmp/portage/CAT/PKG-VER/work/PKG-VER/` | `${S}` — main source dir (default) |
| `/var/tmp/portage/CAT/PKG-VER/image/` | `${D}` — install sandbox root |
| `/var/tmp/portage/CAT/PKG-VER/temp/` | `${T}` — temp dir |
| `/var/cache/distfiles/` | `${DISTDIR}` — downloaded tarballs |
| `/var/tmp/portage/CAT/PKG-VER/build-info/` | Phase logs, environment dump |

## Reading Build Logs

```bash
# Phase logs land in build-info/ (split-log FEATURE) or temp/
ls /var/tmp/portage/category/pkg-1.0/temp/
```
