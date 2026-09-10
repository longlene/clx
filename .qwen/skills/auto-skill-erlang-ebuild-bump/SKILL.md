---
name: erlang-ebuild-bump
description: Common patterns and pitfalls when bumping Erlang/rebar3 ebuilds in Gentoo custom overlays
source: auto-skill
extracted_at: '2026-07-05T23:40:08.207Z'
---

When bumping or creating Erlang/rebar3 ebuilds, common issues and fixes include:

## Short package names need `erlang_` prefix

Packages with short names (e.g., `quic`, `h2`, `hpack`) risk name collisions. The convention is to use `erlang_${P}.gh.tar.gz` for SRC_URI and `S="${WORKDIR}/erlang_quic-${PV}"`. This matches the upstream repo name (`erlang_quic`), so the unpacked directory is `erlang_quic-${PV}/`.

## `ct_expand` parse transform failure

Error: `undefined parse transform 'ct_expand'`. This is an OTP version issue — `ct_expand` was moved to the `common_test` app. Affected packages: `hackney` 4.5.x. Two potential fixes:
1. Add `dev-erlang/ct_expand` as a dependency (if such a package exists)
2. Skip install validation (`--skip-install`) and mark the issue in the report

Check the rebar.config for `platform_define` pragmas that may indicate OTP version gating.

## Checking for dependency changes on bump

Compare the old and new `rebar.config` `{deps, [...]}` sections:
- New deps → add to RDEPEND (and possibly DEPEND)
- Removed deps → check if still needed (often test-only deps in `{test, [...]}`)
- Version constraint changes (e.g., `"~> 2.15.0"` → `"~> 2.17.0"`) → update RDEPEND atom version if pinned

## No runtime deps is valid

Some Erlang packages have `{deps, []}` — they are pure implementations with no upstream deps. It is correct for `RDEPEND` and `DEPEND` to be empty (or `"${RDEPEND}"` which expands to nothing). Don't force-declare deps that aren't in rebar.config.

## Verification checklist

After scaffolding a bump:
1. Read the new `rebar.config` — compare `{deps}` with the old ebuild's RDEPEND
2. Check `.gitmodules` — test-only submodules (like `qifs`) should NOT be added to RDEPEND
3. Fix `S` line — must match the actual unpacked directory name (use `ls workdir` to verify)
4. Fix `SRC_URI` redirect — GitHub archives use `.gh.tar.gz` suffix per the skill convention
5. Run `ebuild digest` after changing SRC_URI
6. Run `validate --skip-deps` if no deps (avoids false dependency errors)

## Common pitfalls

- `${P}.tar.gz` instead of `${P}.gh.tar.gz` for GitHub archives (mirror may have old version)
- `S="${WORKDIR}/erlang-${P}"` resolving to double-prefixed path like `erlang-erlang-...`
- `RDEPEND="${DEPEND}"` when both are empty (acceptable, but explicit empty is clearer)
- Forgetting to re-digest after changing SRC_URI
- Adding a package's own atom to its own RDEPEND (circular self-reference)
