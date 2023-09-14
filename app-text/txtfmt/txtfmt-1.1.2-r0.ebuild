# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

RESTRICT="primaryuri"

DESCRIPTION="Plain text formatting tools"
HOMEPAGE="http://w3.cs.upt.ro/~gseba"
SRC_URI=" http://w3.cs.upt.ro/~gseba/dev/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="app-shells/bash"

src_test() {
	cd tst
	local i
	for i in 1 2; do
		./justify-test${i} || die "test $i failed"
	done
}

src_install() {
	dobin bin/justify bin/reframe
	dodoc readme
	dodir /usr/share/txtfmt
	insinto /usr/share/txtfmt
	doins src/functions
}
