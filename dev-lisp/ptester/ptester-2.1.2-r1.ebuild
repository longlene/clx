# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

DESCRIPTION="A Common Lisp test harness based on the Franz, Inc. tester module."
HOMEPAGE="http://www.cliki.net/ptester"
SRC_URI="http://files.kpe.io/${PN}/${P}.tar.gz"

LICENSE="LLGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

RDEPEND="!dev-lisp/cl-${PN}"

src_install() {
	common-lisp-install-sources *.lisp
	common-lisp-install-asdf
	dohtml tester.html
}
