# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="A project-local library installer for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/qlot"
SRC_URI="https://github.com/fukamachi/qlot/archive/${PV}.tar.gz -> ${P}.tar.gz"

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
	if ! use  test ; then
		sed -i '/defsystem "qlot\/tests/,$d' ${PN}.asd
	fi
}
