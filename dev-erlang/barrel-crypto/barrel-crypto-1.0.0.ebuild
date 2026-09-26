# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

DESCRIPTION="Encryption primitives and key providers for Barrel"
HOMEPAGE="https://github.com/barrel-db/barrel"
SRC_URI="https://repo.hex.pm/tarballs/barrel_crypto-${PV}.tar"
S="${WORKDIR}"

# The app is named barrel_crypto (underscore), PN has a hyphen.
REBAR_APP_SRC="src/barrel_crypto.app.src"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

src_unpack() {
	# Hex tarballs wrap the app source in contents.tar.gz.
	unpack "${A}"
	tar -xzf contents.tar.gz || die
}

src_install() {
	# rebar3_src_install looks for _build/default/lib/${PN}; the app
	# directory is named barrel_crypto.
	pushd "_build/default" || die
	ln -s barrel_crypto "lib/${PN}" || die
	popd
	rebar3_src_install
}
