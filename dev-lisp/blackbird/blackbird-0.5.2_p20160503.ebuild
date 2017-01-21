# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d361f81c1411dec07f6c2dcb11c78f7aea9aaca8"

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
