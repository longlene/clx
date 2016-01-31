# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit multilib

DESCRIPTION="Lua in Erlang"
HOMEPAGE="https://github.com/rvirding/luerl"
SRC_URI="mirror://github/rvirding/luerl/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""

DEPEND="dev-lang/erlang"
RDEPEND="${DEPEND}"

src_prepare() {
	mkdir ebin
}

src_compile() {
	erl -make || die "compile failed"
}

src_install() {
	insinto /usr/$(get_libdir)/luerl
	doins -r ebin
	dodoc README
}
