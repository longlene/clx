# CMake / Meson / Autotools Ebuild Workflow

Load `references/eclasses.md` for eclass variable details.
`SRCDIR` below is scaffold's `srcdir` output.

## Step A: Read build files from the source

Read the build system files to find deps, options, and bundled libraries:
`CMakeLists.txt` + `cmake/*.cmake` (CMake), `meson.build` +
`meson_options.txt`/`meson.options` (Meson), `configure.ac` (Autotools).

Look for:
- `find_package(FOO)` / `dependency('foo')` → external dep, map to Gentoo atom
- `FetchContent_Declare` / `subproject()` → bundled dep, must be pre-supplied (see below)
- `option(USE_FOO ...)` / `option('foo', ...)` → candidate for `IUSE`

## Step B: Map find_package → DEPEND atoms

Common mappings:

| CMake / pkg-config name | Gentoo atom |
|---|---|
| `OpenSSL` | `dev-libs/openssl:=` |
| `ZLIB` | `sys-libs/zlib` |
| `HDF5` | `sci-libs/hdf5:=` |
| `MPI` | `virtual/mpi` |
| `Boost` | `dev-libs/boost` |
| `Python3` | `dev-lang/python` (usually BDEPEND) |
| `CUDA` | `dev-util/nvidia-cuda-toolkit` |

Use `eix` to find unknown atoms: `eix -S "library name"`.

## Step C: Handle CMake FetchContent (critical)

FetchContent downloading fails in portage's network sandbox. Any `FetchContent_Declare` that is NOT preceded by a successful `find_package` for the same dep must be pre-supplied.

**Detection:**
```bash
grep -n "FetchContent_Declare\|FetchContent_MakeAvailable" "${SRCDIR}/CMakeLists.txt"
```

**Fix pattern** — add the dep's tarball to SRC_URI and point cmake at it:

```ebuild
MY_DEPNAME_VER="1.2.3"
SRC_URI="
    https://github.com/OWNER/REPO/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
    https://github.com/DEP_OWNER/DEP_REPO/archive/refs/tags/v${MY_DEPNAME_VER}.tar.gz
        -> depname-${MY_DEPNAME_VER}.tar.gz
"

src_configure() {
    local mycmakeargs=(
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON
        -DFETCHCONTENT_SOURCE_DIR_DEPNAME="${SRCDIR}/DEP_REPO-${MY_DEPNAME_VER}"
    )
    cmake_src_configure
}
```

The variable name is `FETCHCONTENT_SOURCE_DIR_<NAME>` where `<NAME>` is the **uppercased** first argument to `FetchContent_Declare(name ...)`.

After adding tarballs to SRC_URI, re-digest, re-unpack, and verify the
extracted dir name in the workdir (never `tar tzf` the distfile):
```bash
ebuild "${EBUILD}" digest clean unpack
ls /var/tmp/portage/CATEGORY/PKGNAME-VERSION/work/
# GitHub archives extract to <repo>-<tag>/
# If tag = "foo-1.2.3" in repo "foo": extracts to foo-foo-1.2.3/
```

## Step D: IUSE from build options

**CMake `option()`:**
```bash
grep "^option(" "${SRCDIR}/CMakeLists.txt"
```
```ebuild
IUSE="cuda openmp tests"

src_configure() {
    local mycmakeargs=(
        -DENABLE_CUDA=$(usex cuda)
        -DENABLE_OPENMP=$(usex openmp)
        -DBUILD_TESTS=$(usex tests)
    )
    cmake_src_configure
}
```

**Meson `option()`:**
```bash
cat "${SRCDIR}/meson_options.txt"
```
```ebuild
IUSE="doc tests"

src_configure() {
    local emesonargs=(
        $(meson_use doc docs)
        $(meson_use tests tests)
    )
    meson_src_configure
}
```

## Step E: EXTERNAL_FOO options without find_package (patch required)

A common upstream pattern: `option(EXTERNAL_FOO ...)` skips the bundled subdirectory but **never calls `find_package` or `pkg_check_modules`**, so the system library is linked by name with no include dirs propagated.

**Detection** — look for EXTERNAL options that lack a matching find_package:
```bash
grep -n "EXTERNAL_\|option.*[Ee]xternal" /var/tmp/portage/CATEGORY/PKGNAME-VERSION/work/REPO-TAG/CMakeLists.txt
```

If the pattern is:
```cmake
if(NOT EXTERNAL_FOO)
    add_subdirectory(src/foo)
endif()
...
target_link_libraries(${PROJECT_NAME} PUBLIC foo)
```
with **no** `find_package(foo)` or `pkg_check_modules(FOO ...)` anywhere — a patch is needed.

**Patch pattern** (add an `else()` branch):
```cmake
if(NOT EXTERNAL_FOO)
    add_subdirectory(src/foo)
else()
    find_package(PkgConfig REQUIRED)
    pkg_check_modules(FOO REQUIRED IMPORTED_TARGET foo)
    add_library(foo ALIAS PkgConfig::FOO)
endif()
```

Add `dev-util/pkgconf` to `BDEPEND` and the system library atom to `DEPEND`/`RDEPEND`.

**How to generate the patch correctly** — always diff against the extracted source, never write the patch file by hand (hand-written patches break on missing newlines):
```bash
# 1. Make the modified copy
python3 -c "
txt = open('/var/tmp/portage/CATEGORY/PKGNAME-VERSION/work/REPO-TAG/CMakeLists.txt').read()
old = '''if(NOT EXTERNAL_FOO)
    add_subdirectory(src/foo)
endif()'''
new = '''if(NOT EXTERNAL_FOO)
    add_subdirectory(src/foo)
else()
    find_package(PkgConfig REQUIRED)
    pkg_check_modules(FOO REQUIRED IMPORTED_TARGET foo)
    add_library(foo ALIAS PkgConfig::FOO)
endif()'''
open('/tmp/CMakeLists.txt.new', 'w').write(txt.replace(old, new))
"

# 2. Generate the unified diff
diff -u /var/tmp/portage/CATEGORY/PKGNAME-VERSION/work/REPO-TAG/CMakeLists.txt \
        /tmp/CMakeLists.txt.new \
    > /usr/local/portage/CATEGORY/PKGNAME/files/PKGNAME-PV-external-foo.patch
```

The diff headers show absolute paths — `eapply` uses `-p1` by default, so rename them to `a/CMakeLists.txt` / `b/CMakeLists.txt` if needed. Verify with a dry run:
```bash
patch -p1 --dry-run -i /usr/local/portage/CATEGORY/PKGNAME/files/PKGNAME-PV-external-foo.patch \
    -d /var/tmp/portage/CATEGORY/PKGNAME-VERSION/work/REPO-TAG/
```

## Step F: Conditional cmake args to avoid QA warnings

Only pass cmake variables that are actually used by the current cmake configuration — unused vars trigger a QA notice. Guard USE-flag-conditional args:

```ebuild
src_configure() {
    local mycmakeargs=(
        -DBUILD_TESTING=$(usex test)
        -DEXTERNAL_FOO=ON
    )
    # EXTERNAL_GTEST only read when BUILD_TESTING=ON
    use test && mycmakeargs+=( -DEXTERNAL_GTEST=ON )
    cmake_src_configure
}
```

## Special cases

### OpenMP (CMake)

On Gentoo with GCC, OpenMP is `libgomp` — part of GCC itself. No `DEPEND` entry needed:
```ebuild
IUSE="openmp"
# no DEPEND/RDEPEND for openmp

src_configure() {
    local mycmakeargs=(
        -DKokkos_ENABLE_OPENMP=$(usex openmp)
    )
    cmake_src_configure
}
```

### Header-only / interface libraries

If the project installs only headers (no shared libs), use `SLOT="0"` and no need for `:=` slots. Verify with:
```bash
grep -r "INSTALL.*HEADERS\|install.*INTERFACE" "${SRCDIR}/CMakeLists.txt" | head -5
```

### Hardcoded `DESTINATION lib` (multilib-strict failure)

If `cmake_src_install` triggers a `multilib-strict check failed!` error with `.so` files landing in `usr/lib/` instead of `usr/lib64/`, the CMakeLists.txt likely hardcodes `DESTINATION lib` instead of using `${CMAKE_INSTALL_LIBDIR}`. Passing `-DCMAKE_INSTALL_LIBDIR=$(get_libdir)` will NOT help in this case. Fix with sed in `src_prepare`:

```ebuild
src_prepare() {
    sed -i "s|DESTINATION lib$|DESTINATION $(get_libdir)|g" CMakeLists.txt || die
    cmake_src_prepare
}
```

Always use `$(get_libdir)` — never hardcode `lib64`.

### out-of-source builds (cmake eclass default)

The cmake eclass always does out-of-source builds. `${S}` is the source dir, build happens in `${BUILD_DIR}`. Do not set `CMAKE_BUILD_DIR` manually.

Final-shape examples: `templates/cmake.ebuild`, `templates/meson.ebuild`,
`templates/autotools.ebuild`.
