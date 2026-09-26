# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar3

# The app is named barrel_embed (underscore), PN has a hyphen.
REBAR_APP_SRC="src/barrel_embed.app.src"

DESCRIPTION="Lightweight embedding generation for Erlang applications"
HOMEPAGE="https://github.com/barrel-db/barrel
	https://docs.barrel-db.eu/embed/"
SRC_URI="https://repo.hex.pm/tarballs/barrel_embed-${PV}.tar"
S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	dev-erlang/hackney
"

src_unpack() {
	# Hex tarballs wrap the app source in contents.tar.gz.
	unpack "${A}"
	tar -xzf contents.tar.gz || die
}

src_install() {
	# rebar3_src_install looks for _build/default/lib/${PN}; the app
	# directory is named barrel_embed.
	pushd "_build/default" || die
	ln -s barrel_embed "lib/${PN}" || die
	popd
	rebar3_src_install

	# priv/ holds the Python port server; the build tree's priv/ is a
	# symlink, so install it from the source tree.
	local dest
	dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins -r "${S}"/priv/.
}
