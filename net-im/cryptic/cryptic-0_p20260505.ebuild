# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_COMMIT="4e9ef819dd73549b213a538c074766d1e666b26a"

inherit rebar3

DESCRIPTION="End-to-end encrypted chat system with GPG key management"
HOMEPAGE="https://github.com/etnt/cryptic https://etnt.github.io/cryptic/readme.html"
SRC_URI="https://github.com/etnt/cryptic/archive/${MY_COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${MY_COMMIT}"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-erlang/cowboy
	dev-erlang/ranch
	dev-erlang/cowlib
	dev-erlang/gun
	dev-erlang/jsx
	dev-erlang/uuid
	dev-erlang/esqlite
	dev-erlang/erl_gpg
	dev-libs/libsodium
"
BDEPEND="virtual/pkgconfig"

src_prepare() {
	eapply "${FILESDIR}"/${P}-nif-ldflags.patch
	eapply "${FILESDIR}"/${P}-unsafe-port-var.patch
	rebar3_src_prepare
	sed -i 's/, warnings_as_errors//' rebar.config || die
}

src_compile() {
	erebar3 compile
}

src_install() {
	rebar3_src_install
	local dest="$(get_erl_libs)/${P}"
	insinto "${dest}/priv"
	doins "${S}"/priv/*.so
	insinto "${dest}/include"
	doins "${S}"/include/*.hrl
}
