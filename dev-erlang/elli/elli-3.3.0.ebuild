# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit rebar

DESCRIPTION="Simple, robust and performant Erlang web server"
HOMEPAGE="https://github.com/elli-lib/elli"
SRC_URI="https://github.com/elli-lib/elli/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /usr/lib/erlang/lib/${P}
	doins -r_build/default/lib/elli/ebin
	doins -r priv include
	dodoc README.md
}
