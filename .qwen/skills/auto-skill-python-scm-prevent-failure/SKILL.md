---
name: python-scm-prevent-failure
description: Handle setuptools_scm / use_scm_version failures with GitHub archives in Python ebuilds
source: auto-skill
extracted_at: '2026-07-14T17:30:56.263Z'
---

When a Python package uses `use_scm_version` (in `setup.py` via `setuptools`) or lists `setuptools_scm` in `pyproject.toml` `build-system.requires`, building from a GitHub tarball fails because the archive has no `.git` directory — setuptools-scm cannot detect the version.

## The Fix

In `src_prepare()`, set `SETUPTOOLS_SCM_PRETEND_VERSION=${PV}` before calling `distutils-r1_src_prepare`:

```ebuild
src_prepare() {
    export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
    distutils-r1_src_prepare
}
```

You also need `dev-python/setuptools-scm` in `BDEPEND`.

## How to detect this situation

Three signals that a package needs this:

1. `setup.py` contains `use_scm_version` keyword argument (check `workdir/setup.py`)
2. `pyproject.toml` lists `setuptools_scm` in `[build-system].requires` (check `workdir/pyproject.toml`)
3. The validate output mentions `LookupError: setuptools-scm was unable to detect version`

## Why this happens

GitHub download links produce a `.tar.gz` archive, not a git repository. setuptools-scm looks for `.git` data (tags, commit history) to infer the version. Without it, the build fails at the wheel compilation stage (not the dependency resolution stage).

## When NOT to use it

If the package has a `setup.cfg` or `pyproject.toml` `[options]` with explicit `version = "..."` (static version, not scm-based), no SETUPTOOLS_SCM_PRETEND_VERSION is needed.

## Checklist when building Python packages from GitHub archives

1. Check `setup.py` for `use_scm_version` keyword
2. Check `pyproject.toml` `[build-system].requires` for `setuptools_scm`
3. If either is present → add `BDEPEND="dev-python/setuptools-scm"` and `src_prepare()` with `SETUPTOOLS_SCM_PRETEND_VERSION=${PV}`
4. Declare `PYTHON_COMPAT` explicitly (distutils-r1 requires it, omission causes sandbox deny errors)
5. Use `<pkgmetadata>` (not `<metadata>`) as root element in metadata.xml with the Gentoo DTD — the newer `<metadata>` root triggers `PkgInvalidXml` schema errors
6. Close the `</pkgmetadata>` tag — omitting it causes `PkgBadlyFormedXml` errors

## Error signatures

| Symptom | Cause | Fix |
|---|---|---|
| `LookupError: setuptools-scm was unable to detect version` | GitHub tarball, no `.git` | `SETUPTOSETS_SCM_PRETEND_VERSION=${PV}` in `src_prepare` |
| `PYTHON_COMPAT not declared` | Missing `PYTHON_COMPAT=` line | Add `PYTHON_COMPAT=( python3_{13..15} )` |
| `PkgInvalidXml: element 'metadata'` | Root is `<metadata>` not `<pkgmetadata>` | Use `<pkgmetadata>` root + DTD from template |
| `PkgBadlyFormedXml: Premature end of data` | `</pkgmetadata>` missing | Close the tag |
