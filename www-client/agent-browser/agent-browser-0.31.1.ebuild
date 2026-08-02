# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cargo

DESCRIPTION="Fast browser automation CLI for AI agents"
HOMEPAGE="https://agent-browser.dev"
SRC_URI="
	https://github.com/vercel-labs/agent-browser/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

S="${WORKDIR}/${P}"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

src_unpack() {
	default
}

src_configure() {
	# Sync version from package.json into Cargo.toml before building.
	node scripts/sync-version.js || die "sync-version.js failed"
}

src_compile() {
	cargo build --release --manifest-path "${S}/cli/Cargo.toml" || die "cargo build failed"
}

src_install() {
	dobin "cli/target/release/agent-browser"
}
