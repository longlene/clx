# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="6522d495a67a615f1adfbc87ed553ef5fa663e58"

DESCRIPTION="Gregorian calendar date library in Common Lisp"
HOMEPAGE="https://github.com/takagi/calendar-date"
SRC_URI="https://github.com/takagi/calendar-date/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/local-time
"

src_prepare() {
	default
	use test || rm t ${PN}-test.asd
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
