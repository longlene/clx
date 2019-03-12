# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="f390a18c023267c5b40d5d407fdffa1b2ab7d3b8"

DESCRIPTION="A project-local library installer for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/qlot"
SRC_URI="https://github.com/fukamachi/qlot/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/archive
	dev-lisp/salza2
	dev-lisp/gzip-stream
	dev-lisp/cl-ppcre
	dev-lisp/split-sequence
	dev-lisp/alexandria
	dev-lisp/ironclad
	test? ( dev-lisp/prove )
"

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd tests
}
