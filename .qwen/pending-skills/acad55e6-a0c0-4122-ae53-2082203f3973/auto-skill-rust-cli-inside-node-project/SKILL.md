---
name: rust-cli-inside-node-project
description: Ebuild pattern for a Rust CLI binary living in a subdirectory of a Node.js/pnpm project (e.g. `cli/Cargo.toml` inside a monorepo with `package.json` at the root).
source: auto-skill
extracted_at: '2026-07-12T02:04:22.728Z'
---

# Rust CLI Inside a Node.js Project

Apply when the source tarball contains **both** a top-level `package.json` (or `pnpm-lock.yaml`) **and** a Rust `Cargo.toml` in a subdirectory (commonly `cli/Cargo.toml` or `crates/*/Cargo.toml`). The Rust binary is the install target; the Node.js side is just a wrapper or build helper.

## Why the standard cargo eclass trick fails

The `cargo` eclass's `cargo_src_unpack` auto-discovers crates by looking for `Cargo.toml` at **`${S}/Cargo.toml`**. When the real manifest is at `${S}/cli/Cargo.toml`, the eclass's catalog stays empty, and `--offline` cargo can't resolve any dep → build fails with `no matching package named 'X' found`.

## Required ebuild shape

```bash
EAPI=8

inherit cargo

DESCRIPTION="..."
HOMEPAGE="..."
SRC_URI="
    https://.../archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
    ${CARGO_CRATE_URIS}
"

S="${WORKDIR}/${P}"        # project root, NOT the cli/ subdir
LICENSE="..."
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

# Override: skip the cargo eclass's crate catalog (it can't find sub-root Cargo.toml)
src_unpack() {
    default
}

# Optional but common: run a Node.js version-sync step before cargo builds.
# Many such projects (e.g. agent-browser) require this or the build fails to resolve the lockfile.
src_configure() {
    node scripts/sync-version.js || die "sync-version.js failed"
}

# Point cargo directly at the subdirectory manifest.
src_compile() {
    cargo build --release --manifest-path "${S}/cli/Cargo.toml" || die "cargo build failed"
}

src_install() {
    # Binary name comes from the cargo [package] name field.
    dobin "cli/target/release/agent-browser"
}
```

## Decision checklist

1. **Is there a top-level `package.json` AND a `Cargo.toml` in a subdirectory?** → this skill applies.
2. **Where is the Cargo.toml?** Replace `cli/` in the ebuild above with whatever subdirectory holds it.
3. **Is there a pre-build script** (e.g. `scripts/sync-version.js`) that patches `Cargo.toml` version? Call it from `src_configure` with `|| die`.
4. **What does `package.json` install?** For CLI packages the answer is usually just the compiled binary → `dobin` from cargo's output. Skip the JS wrapper unless the project explicitly ships it as a dependency.
5. **Any heavy upstream deps** (e.g. `image` crate pulls in exr, tiff, ravif)? These are pure-Rust; no system libs needed.
6. **`S` must point at the project root**, never the cargo subdirectory, so `--manifest-path` can be resolved correctly.

## When NOT to apply

- Cargo.toml is at the source root → use the standard cargo eclass flow.
- The project has no Rust component → standard npm/pnpm ebuild pattern.
- The Node.js side is the primary install target and Rust is only a build-time tool (e.g. `neon` bindings) → different pattern.

## Example projects using this pattern

- `vercel-labs/agent-browser` — CLI in `cli/`, Node.js wrapper in `bin/`.
- Any project with a monorepo layout where a Rust binary lives under `crates/<name>/Cargo.toml` and a JS/pnpm workspace wraps it.
