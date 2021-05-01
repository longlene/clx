# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a35559ea2af9f26759ee220ee1855811ca22730c"

DESCRIPTION="A color data type for Common Lisp"
HOMEPAGE="https://github.com/ralph-schleicher/rs-colors"
SRC_URI="https://github.com/ralph-schleicher/rs-colors/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/alexandria
	dev-lisp/closer-mop
	dev-lisp/read-number
"
