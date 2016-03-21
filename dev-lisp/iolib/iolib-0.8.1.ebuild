# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=3
inherit common-lisp-3

DESCRIPTION="A Common Lisp I/O library."
HOMEPAGE="http://common-lisp.net/project/iolib/"
SRC_URI="https://github.com/sionescu/iolib/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~sparc ~x86 ~arm"
IUSE="example test"

RDEPEND="
	>dev-lisp/asdf-2.31.1
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
	>=dev-lisp/cffi-0.10.6
	dev-lisp/trivial-features
	dev-lisp/fiveam
	dev-lisp/trivial-garbage
	dev-lisp/bordeaux-threads
	dev-lisp/babel
	dev-lisp/idna
"

CLSYSTEMS="iolib"

src_install() {
	common-lisp-install-sources src *.asd
	use example && common-lisp-install-sources examples
	common-lisp-install-sources -t all version.sexp
	use test && common-lisp-install-sources -t all tests
	common-lisp-install-asdf
	dodoc CHANGES README.md
}
