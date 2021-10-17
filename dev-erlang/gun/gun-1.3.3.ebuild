# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

#inherit rebar

DESCRIPTION="HTTP/1.1, HTTP/2 and Websocket client for Erlang/OTP"
HOMEPAGE="https://github.com/ninenines/gun"
SRC_URI="https://github.com/ninenines/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	>=dev-erlang/cowlib-2.5.1
	>=dev-lang/erlang-17.1"
DEPEND="${RDEPEND}"

src_prepare() {
	eapply_user
	emake clean
}

src_install() {
	insinto /usr/lib/erlang/lib/${P}
	doins -r ebin
	dodoc README.asciidoc
}
