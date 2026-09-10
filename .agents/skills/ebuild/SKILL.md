---
name: ebuild
description: This skill should be used when the user wants to "create an ebuild", "package a project for Gentoo", "write an ebuild", provides a GitHub URL or PyPI URL and wants to package it, asks about ebuild structure or testing, mentions packaging Rust/Python/CMake/Meson projects for Gentoo, or provides a local overlay path (e.g. "dev-util/jcode") to check for a version bump.
version: 2.0.0
---

# Gentoo Ebuild Generator

You are an expert Gentoo developer. Given a package source (GitHub/PyPI URL, package name, or `CATEGORY/NAME`), create or bump an EAPI=8 ebuild and validate it.

**Default overlay:** `/usr/local/portage`. Scripts live in `scripts/` and print JSON. The mechanical work (fetching metadata, skeleton, digest/unpack, install test, pkgcheck, dep-existence checks) is all scripted; your judgment covers category choice, dependency mapping, IUSE, and fixing build failures.

Pipeline: **route → scaffold → complete the ebuild → metadata.xml → validate → report.**

## Step 1 — Route

```bash
/usr/local/portage/.agents/skills/ebuild/scripts/route <input>
```

`<input>`: GitHub URL, PyPI URL, bare package name, or `CATEGORY/NAME` (bump check). Erlang/Hex.pm only: use `scripts/hex-info` instead (GitHub-hosted Erlang goes through the normal pipeline).

The JSON is also saved to a per-package file — pass its `json_path` value to scaffold in Step 3.

| `action` | What to do |
|---|---|
| `new` | Continue with Step 2 |
| `bump` | Jump to **Version Bump** below |
| `up_to_date` | Report `message`, stop |
| `existing` | Already in portage — report `message`, confirm with user |
| `error` | Read `message`. Unsupported host (GitLab/Codeberg/SourceForge/…) → hand-write the route JSON and continue the pipeline: `references/complex-cases.md` |

## Step 2 — Choose category/name (judgment)

Python → `dev-python` · C/C++ libs → `dev-libs`/`dev-cpp` · Rust CLI → `app-misc` or by function (`sys-apps`, `net-misc`) · Rust libs → `dev-libs` · Erlang → `dev-erlang` · system tools → `sys-apps`. Use route's `language`/`description` to decide. Name: lowercase, hyphens not underscores, no leading digit.

## Step 3 — Scaffold

```bash
/usr/local/portage/.agents/skills/ebuild/scripts/scaffold CATEGORY/NAME <json_path>
```

Writes a minimal skeleton ebuild, runs `ebuild digest` + `unpack`, inspects the source. Safe to re-run (never overwrites an existing ebuild). Act on the JSON:

| Field | Action |
|---|---|
| `ebuild` | The skeleton to complete in Step 4 |
| `srcdir` | Extracted source — read all files from here; never curl upstream, never use `gh`, never `tar tzf`/`tar xf` a distfile (it is already unpacked here) |
| `s_line` | S override, already inserted into skeletons scaffold wrote itself |
| `workflow` | Load this file and follow it in Step 4. `null` (Go/Makefile/other) or several `build_systems` → `references/complex-cases.md` |
| `python` | pyproject facts: `pep517`, `dependencies`, `urls`, `needs_setuptools_scm` |
| `license_files` | Read them, translate via `references/license-mapping.md` |
| `bundled` | Submodules/vendored dirs — see `references/common-mistakes.md` "Bundled Dependencies" |
| `notes` | Things to verify by hand |

`status: "error"` → read `stage` + `log_tail`, fix the cause (usually SRC_URI/tag), re-run.

## Step 4 — Complete the ebuild (judgment)

Load the `workflow` file and follow it. Fill in `inherit`, `LICENSE`, deps, `IUSE`, `src_*` overrides. `templates/` has final-shape examples.

Anything unfamiliar — no workflow doc, exotic eclass territory, unusual layout — look for **prior art first**: a ::gentoo package with the same language and build system is a working template (`references/complex-cases.md` has the search commands).

**Dependency rule: declare ALL upstream deps as best-guess Gentoo atoms in RDEPEND/DEPEND/BDEPEND.** Do not pre-check existence with eix, and never drop a dep because you think Gentoo lacks it — Step 6 is the only judge of missing deps, and a dep that never enters the ebuild corrupts that report.

## Step 5 — metadata.xml

Use `templates/metadata.xml`, place next to the ebuild.

## Step 6 — Validate

```bash
/usr/local/portage/.agents/skills/ebuild/scripts/validate "${OVERLAY}/CATEGORY/NAME/NAME-VER.ebuild"
```

One script does all four checks: the install test (`ebuild clean install` — full build into the image dir, merges nothing), dependency resolution + distfile fetch (`emerge --pretend` then `--fetchonly` — the only stage that exercises RDEPEND, which `ebuild install` never checks), `pkgcheck scan`, and confirmation of every `NonexistentDeps` atom against all local overlays. Act on the JSON:

| Field | Action |
|---|---|
| `install: "fail"` | Read `log_tail` (full log at `log_path`). For interactive debugging, run individual phases manually (`ebuild unpack`, `prepare`, `configure`, `compile`, `install`) to isolate the failure — see `references/ebuild-command.md`. Fix the ebuild, re-run validate. Two failed fixes for the same error → escalation ladder in `references/complex-cases.md` (re-check assumptions, prior art, patch, honest stop) |
| `image_files` | Sanity-check what would be installed |
| `deps_resolve: "fail"` | Resolver can't satisfy the dep graph (bad atom/version/USE) — read `deps_log_tail`, fix the dep, re-run |
| `deps_pretend` | What a real emerge would pull in — sanity-check it |
| `deps_fetch: "fail"` | A dep's distfile failed to download — read `deps_log_tail` |
| `pkgcheck` | Fix findings; `references/common-mistakes.md` covers the usual ones |
| `fixable_deps` | Package exists under a different atom (`exists_as`) — correct the dep, re-run |
| `missing_deps` | Genuinely missing — feeds Step 7 |

- Long builds or heavy dep downloads: run validate in a background Bash call (`--skip-deps` skips the emerge stage on quick re-runs after small fixes).
- Skipping the install test (`--skip-install`) is allowed ONLY when a required toolchain/build dep is absent from this system — confirm with `eix -I PKG` and name the missing packages in your report.
- No `sudo` unless `ebuild install` fails with a permission error on the build dir.

## Step 7 — Report

End with a "Missing dependencies" section ONLY when validate's `missing_deps` is non-empty — it is the sole legitimate source; never add packages from prior knowledge, and omit the section entirely (without comment) when empty. Offer to package the missing deps next — each one is a natural next `/ebuild` run.

```
## Missing dependencies

| Package | Needed by | Notes |
|---|---|---|
| dev-python/foo | RDEPEND | upstream dep, no Gentoo ebuild yet |
```

## Completion message

One short sentence naming package and version (mention if the install test was skipped and why), then stop. No bullet-point summaries, no `emerge` hints — the audience is Gentoo developers who read the ebuild directly.

## Version Bump

When route returns `action: "bump"`:

```bash
/usr/local/portage/.agents/skills/ebuild/scripts/scaffold --bump <json_path>
```

Renames the ebuild to the new version, re-digests, unpacks, inspects — same JSON as Step 3. Rust: it clears `CRATES`/`GIT_CRATES` first and sets `crates_pending: true`; then run:

```bash
/usr/local/portage/.agents/skills/ebuild/scripts/update-crates EBUILD
```

Then review with the source in `srcdir`:

1. Dep changes — read the new `pyproject.toml` / `requirements*.txt` / `CMakeLists.txt`, update RDEPEND/DEPEND constraints and `PYTHON_COMPAT`.
2. Check `s_line`/`s_current` in the JSON still agree.
3. Run validate (Step 6) and report (Step 7) as usual.

## Key rules (always)

1. `EAPI=8`; TABs inside functions; `|| die` after every fallible command
2. Never hardcode versions — use `${PV}`/`${P}`/`${PN}`; never redefine P/PV/PN, use `MY_P`
3. `SLOT="0"` always; new ebuilds `KEYWORDS="~amd64"` only
4. `DESCRIPTION` ≤80 chars, no trailing period, don't repeat the package name
5. GitHub archives always `-> ${P}.gh.tar.gz`, GitLab `-> ${P}.gl.tar.gz`
6. Cleanup via `ebuild EBUILD clean`, never `rm` on the build dir
7. Use direct absolute paths in Bash commands, not intermediate shell variables
8. Inspect source trees only via the unpacked workdir (`srcdir`, under `/var/tmp/portage/.../work/`) — never run `tar` on distfiles. After changing SRC_URI, re-run `ebuild EBUILD digest clean unpack` and look at the workdir

References: `references/complex-cases.md` (off-pipeline: manual route JSON, unknown build systems, prior art, failure escalation) · `references/common-mistakes.md` (full pitfall list) · `references/dep-syntax.md` (atom syntax) · `references/license-mapping.md` · `references/ebuild-command.md` (phases/paths) · `references/eclasses.md` · `references/overlay-setup.md`.
