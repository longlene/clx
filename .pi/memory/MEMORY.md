# Project memory

- [convention] This repo is the `clx` Gentoo overlay (github.com/longlene/clx); /usr/local/portage is the working copy.
- [convention] For ebuild creation or version bumps, follow the ebuild skill pipeline (.agents/skills/ebuild/: route → scaffold → complete → metadata → validate); its validate script is the only judge of dependency resolution.
- [convention] New ebuilds in this overlay: EAPI=8, KEYWORDS="~amd64" only, SLOT="0".
- [correction] Keep ~arm64 keywords on clx overlay ebuilds even when pkgcheck reports arm64 NonsolvableDeps (e.g. slixmpp-omemo with ::gentoo slixmpp amd64/~riscv) — the user deliberately added arm64 to these packages; do not drop keywords on that basis.
- [tool-quirk] This system runs a slim non-root portage (helpers are standalone scripts under /usr/lib/portage/python3.14/ebuild-helpers/): dolibso and domem DO NOT EXIST — use dolib.so (no symlink creation) + dosym for versioned links, doheader for /usr/include, and $(get_libdir) for libdir. dobin/doexe/dosbin hardcode `install -o 0 -g 0` and fail unprivileged; use insinto+doins+fperms instead.
- [preference] Ignore pkgcheck DeprecatedDep findings for dev-python/httpx in clx overlay ebuilds — the user explicitly said not to check/act on httpx deprecation warnings.
