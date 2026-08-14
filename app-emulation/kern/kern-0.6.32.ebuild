# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	libc@0.2.189
"

inherit cargo

DESCRIPTION="Fast, rootless sandbox and virtual resource runtime, no daemon"
HOMEPAGE="https://github.com/getkern/kern"
SRC_URI="
	https://github.com/getkern/kern/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	cargo_src_install --path ./crates/kern-cli --bin kern
	dodoc README.md
}
