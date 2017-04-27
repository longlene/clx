# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit common-lisp-3

DESCRIPTION="A Common Lisp I/O library"
HOMEPAGE="http://common-lisp.net/project/iolib/"
SRC_URI="https://github.com/sionescu/iolib/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example test"

RDEPEND="
	dev-lisp/trivial-features
	dev-lisp/cffi
	dev-lisp/bordeaux-threads
	dev-lisp/babel
	dev-lisp/idna
	dev-lisp/swap-bytes
	dev-lisp/alexandria
	dev-lisp/split-sequence
	dev-lisp/libfixposix
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use example || rm -r ${PN}.examples.asd examples
	use test || rm -r ${PN}.tests.asd tests
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all version.sexp src/grovel/grovel-common.h
}
