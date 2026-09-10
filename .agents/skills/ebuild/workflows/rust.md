# Rust Ebuild Workflow

## New package

After scaffold (digest + unpack done), splice the crate list into the skeleton:

```bash
/usr/local/portage/.agents/skills/ebuild/scripts/update-crates EBUILD
```

It runs pycargoebuild on the unpacked source and splices ONLY `CRATES` /
`GIT_CRATES` into the ebuild — never run `pycargoebuild -f -o` directly, it
would overwrite every hand-maintained field.

Then edit the ebuild (the script's `next` field reminds you):

1. `inherit cargo`
2. Append `${CARGO_CRATE_URIS}` to SRC_URI:
   ```ebuild
   SRC_URI="
       https://github.com/OWNER/REPO/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
       ${CARGO_CRATE_URIS}
   "
   ```
3. `LICENSE` — start from the script's `license` output (union of all crate
   licenses), verify the package's own license file is included
4. `src_install()` — `cargo_src_install` for binaries, plus `dodoc README.md`
5. Re-run digest (downloads the crates):
   ```bash
   ebuild EBUILD digest
   ```

See `templates/rust-cargo.ebuild` for the final shape.

## System library dependencies (-sys crates)

pycargoebuild does NOT add system lib deps. Check `Cargo.toml`/`Cargo.lock`
for `-sys` crates and map them:

| Crate pattern | Gentoo atom |
|---|---|
| `openssl-sys` | `dev-libs/openssl:=` |
| `libz-sys` | `sys-libs/zlib:=` |
| `libgit2-sys` | `dev-libs/libgit2:=` |
| `sqlite3-sys` | `dev-db/sqlite:3=` |
| `libssh2-sys` | `net-libs/libssh2:=` |

Add to both `DEPEND` and `RDEPEND`:
```ebuild
DEPEND="dev-libs/openssl:="
RDEPEND="${DEPEND}"
```

## Optional features

Check `[features]` in `Cargo.toml`. Significant optional deps become `IUSE`:

```ebuild
IUSE="feature-name"

src_compile() {
    local myfeatures=( $(usev feature-name) )
    cargo_src_compile --features "${myfeatures[*]}"
}
```

## Version bump

`scaffold --bump` already clears `CRATES`/`GIT_CRATES` (so digest+unpack stay
fast) and reports `crates_pending: true`. Then:

```bash
/usr/local/portage/.agents/skills/ebuild/scripts/update-crates EBUILD
```

Since the bumped ebuild already has `inherit cargo` and
`${CARGO_CRATE_URIS}`, the script runs the final digest automatically. All
hand-crafted fields survive untouched.
