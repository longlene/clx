# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Plain text formatting tools"
HOMEPAGE="http://www.cs.upt.ro/~gseba"
SRC_URI="mirror://gentoo/${P}.tgz
	 http://www.cs.upt.ro/~gseba/dev/${P}.tgz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND=""
RDEPEND="app-shells/bash"
S="${WORKDIR}/${PN}"

src_install() {
	dobin bin/justify bin/reframe
	dodoc readme
	dodir /usr/share/txtfmt
	insinto /usr/share/txtfmt
	doins src/functions
}
