# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="abe3696e1a128bd082fb5d3e211f33d8feb25bc8"

DESCRIPTION="A promise implementation for Common Lisp"
HOMEPAGE="https://github.com/orthecreedence/blackbird/"
SRC_URI="https://github.com/orthecreedence/blackbird/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/vom
	test? ( dev-lisp/async dev-lisp/fiveam )
"

src_prepare() {
	use test || rm -rf ${PN}-test.asd test
}
