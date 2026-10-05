# Copyright 2023 Gentoo Foundation
# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Support library for manipulating Web protocols"
HOMEPAGE="https://github.com/ninenines/cowlib"
SRC_URI="https://github.com/ninenines/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-lang/erlang-27"
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
