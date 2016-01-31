# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3

DESCRIPTION="Enable ANSI colors printing"
HOMEPAGE="https://github.com/pnathan/cl-ansi-text"
SRC_URI="mirror://github/pnathan/cl-ansi-text/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-colors
"

src_prepare() {
	use test || rm -r test cl-ansi-text-test.asd
}
