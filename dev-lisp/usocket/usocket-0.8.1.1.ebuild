# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3

DESCRIPTION="Usocket is a universal socket library for Common Lisp."
HOMEPAGE="http://common-lisp.net/project/usocket/"
SRC_URI="https://github.com/usocket/usocket/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

RDEPEND="
	dev-lisp/split-sequence
	dev-lisp/bordeaux-threads
	test? ( dev-lisp/rt )
"

src_prepare() {
	default
	use test || rm -rf ${PN}-test.asd test
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp
}
