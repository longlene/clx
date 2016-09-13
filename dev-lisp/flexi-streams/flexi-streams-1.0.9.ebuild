# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit common-lisp-3

DESCRIPTION="FLEXI-STREAMS implements \"virtual\" bivalent streams that can be layered atop real binary or bivalent streams."
HOMEPAGE="http://weitz.de/flexi-streams/
		http://www.cliki.net/flexi-streams/"
SRC_URI="https://github.com/edicl/flexi-streams/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE=""

RDEPEND="!dev-lisp/cl-${PN}
		>=dev-lisp/trivial-gray-streams-20060925"

src_install() {
	common-lisp-install *.{lisp,asd}
	common-lisp-symlink-asdf
	dodoc CHANGELOG
	dohtml doc/index.html
	insinto /usr/share/doc/${P}/html
	doins doc/foo.txt
}
