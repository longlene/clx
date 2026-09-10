# Complex Cases — when the pipeline doesn't fit

The scripts cover GitHub/PyPI sources and six build systems. Everything else
lands here. The pipeline is still worth salvaging piece by piece — scaffold's
mechanical work (skeleton, digest, unpack, inspect, S detection) runs fine on
hand-written input, and validate works on any ebuild regardless of how it was
written.

## Unsupported host (GitLab, Codeberg, SourceForge, crates.io, plain tarball)

route returns `error` (or a confusing PyPI lookup failure) for anything that
isn't GitHub or PyPI. Do NOT abandon the pipeline — hand-write the route JSON
and continue with scaffold as normal. scaffold only needs these fields:

```json
{
  "action": "new",
  "source": "manual",
  "version": "1.2.3",
  "description": "Short upstream description",
  "github_url": "https://gitlab.com/owner/proj",
  "source_uri": "https://gitlab.com/owner/proj/-/archive/v${PV}/proj-v${PV}.tar.gz -> ${P}.gl.tar.gz"
}
```

- `github_url` becomes HOMEPAGE (any URL is fine despite the name).
- Write `source_uri` already parametrized with `${PV}` — it is pasted into the
  ebuild verbatim and `ebuild digest` expands it. Verify the URL downloads
  first: `curl -sIL <url with real version> | head -3`.
- Save to `/tmp/route-NAME.json`, then `scaffold CATEGORY/NAME /tmp/route-NAME.json`
  — digest, unpack, source inspection, and the S override all work as usual.

Find the tarball endpoint per host: GitLab `/-/archive/TAG/NAME-TAG.tar.gz`,
Codeberg/Gitea `/archive/TAG.tar.gz`, cgit `/snapshot/NAME-TAG.tar.gz`,
crates.io `https://crates.io/api/v1/crates/NAME/VER/download -> NAME-VER.crate`.
Git-only upstream with no tarball endpoint at all: prefer pinning a commit via
any archive URL the host offers; a live ebuild (`git-r3`, PV=9999, empty
KEYWORDS) is the last resort and skips most of validate's value.

**Version bump** for a manual-source package: route can't detect the upstream,
so check the latest version yourself, then hand-write the bump JSON —
`{"action": "bump", "source": "manual", "category": ..., "name": ...,
"current_version": ..., "latest_version": ..., "ebuild_path": ...}` — and run
`scaffold --bump` as usual.

## No workflow doc (`workflow: null` from scaffold)

scaffold only detects erlang/python/rust/meson/cmake/autotools. For anything
else (Go, plain Makefile, Node, Java, Zig, shell scripts, Common Lisp):

1. Identify the build entry point in `srcdir`: `go.mod`, `Makefile`,
   `package.json`, `build.zig`, or just scripts/binaries to install.
2. Check `references/eclasses.md` "Other useful eclasses", then read the eclass
   source itself — `/var/db/repos/gentoo/eclass/NAME.eclass` documents every
   variable and function in its header comments (e.g. `go-module.eclass`,
   `shell-completion.eclass`).
3. **Find prior art** (see below) — a ::gentoo package with the same language
   and build system is a working template for eclass choice, deps, and `src_*`
   phases. This beats guessing every time.
4. Plain Makefile, no eclass: `src_compile() { emake; }` and
   `src_install() { emake DESTDIR="${D}" PREFIX=/usr install; }` — or skip
   upstream's install target and use the helpers in
   `references/install-helpers.md` (`dobin`, `doins`, `dodoc`) directly.
5. Script-only packages (no compile step): no `src_compile`, just `src_install`
   with helpers.
6. **Common Lisp** (`.asd` file present): load `workflows/common-lisp.md` —
   two shapes: ASDF library (`common-lisp-3` eclass) vs standalone binary
   (`sbcl --script build.lisp`). Map `:depends-on` system names to Gentoo atoms
   using the table in that workflow.

## Multiple build systems detected

`build_systems` lists everything found; the primary is what produces the
artifacts you install. Common combinations:

- **pyproject.toml + Cargo.toml, backend `maturin`** — a Python package with a
  Rust core. Follow the python workflow (`DISTUTILS_USE_PEP517=maturin`) AND
  the rust workflow's crate handling: `inherit cargo distutils-r1`, run
  update-crates, add `${CARGO_CRATE_URIS}` to SRC_URI. Prior art:
  `dev-python/cryptography`, `dev-python/pydantic-core` in ::gentoo.
- **CMake/C core + Python bindings** — decide what you're packaging. Usually:
  package the C library; expose bindings behind `IUSE="python"` or as a
  separate follow-up package. Don't try to drive both build systems blind —
  find how ::gentoo packages the same layout.
- **Makefile wrapping the real build system** — read the Makefile: if it just
  calls cmake/cargo/meson, use that eclass directly and ignore the wrapper.

## Prior art — the strongest tool for anything unfamiliar

All of ::gentoo is checked out locally. Before inventing structure, find a
package that already solved the same problem and read its ebuild:

```bash
eix -S "keyword"                                  # search descriptions
eix --only-names -C dev-go                        # list a whole category
grep -rl "inherit go-module" /var/db/repos/gentoo --include="*.ebuild" | head
cat /var/db/repos/gentoo/CATEGORY/PKG/PKG-*.ebuild
```

Match on build system + language, not package purpose. Also read the eclass
source (`/var/db/repos/gentoo/eclass/`) — header comments are full API docs.
Prior art means local repos only; the no-curl/no-gh rule still applies.

## Escalation ladder — validate keeps failing

Work down the ladder; don't loop on step 0.

1. **Read the full log** (`log_path`), not the tail — the root cause is often
   hundreds of lines above the final error. Search for the first `error:`,
   `undefined reference`, `No such file`, `ModuleNotFoundError`.
2. **Reproduce phase-by-phase** (`ebuild ... unpack prepare configure compile`,
   see `references/ebuild-command.md`) and inspect the workdir between phases.
3. **After 2 failed fixes for the same error, stop patching symptoms** and
   re-check the assumptions: right eclass? right `DISTUTILS_USE_PEP517`? right
   `S`? a bundled dep or vendored dir interfering? Re-read the build files —
   the first reading may have been wrong.
4. **Find prior art** (above) — how does ::gentoo build the closest analogue?
5. **Patch upstream** when the build system itself is broken for packaging
   (hardcoded paths, missing find_package): `references/eclasses.md`
   "Generating a patch", `workflows/cmake.md` Step E.
6. **Know when to stop.** If a third distinct approach also fails, report
   honestly: what works, the exact failure and log path, what was tried, and
   the most likely cause. A truthful partial result is the deliverable —
   never drop deps, never use `--skip-install` outside its toolchain-missing
   exception, and never present a fudged pass as success.
