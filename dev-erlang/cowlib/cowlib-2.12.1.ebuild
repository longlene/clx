# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Support library for manipulating Web protocols"
HOMEPAGE="https://github.com/ninenines/cowlib"
SRC_URI="https://github.com/ninenines/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	>=dev-lang/erlang-17.1"
DEPEND="${RDEPEND}"

src_prepare() {
	eapply_user
	emake clean
}

src_install() {
	insinto /usr/lib/erlang/lib/${P}
	doins -r ebin include
	dodoc README.asciidoc
}
