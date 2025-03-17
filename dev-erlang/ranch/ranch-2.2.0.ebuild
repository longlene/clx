# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Socket acceptor pool for TCP protocols"
HOMEPAGE="https://github.com/ninenines/ranch"
SRC_URI="https://github.com/ninenines/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	>=dev-lang/erlang-17.1"
DEPEND="${RDEPEND}"

src_prepare() {
	default
	emake clean
}

src_install() {
	insinto /usr/lib/erlang/lib/${P}
	doins -r ebin
	dodoc README.asciidoc
}
