# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit common-lisp-3

EGIT_COMMIT="d2b753e7fdd0dbeada9721380cf410186a85535b"

DESCRIPTION="A lightweight database library for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/datafly"
SRC_URI="https://github.com/fukamachi/datafly/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/optima
	dev-lisp/trivial-types
	dev-lisp/closer-mop
	dev-lisp/cl-syntax
	dev-lisp/sxql
	dev-lisp/cl-dbi
	dev-lisp/alexandria
	dev-lisp/babel
	dev-lisp/local-time
	dev-lisp/function-cache
	dev-lisp/jonathan
	dev-lisp/kebab
	dev-lisp/log4cl
	test? ( dev-lisp/cl-test-more )
"

src_prepare() {
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
