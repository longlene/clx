# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3

DESCRIPTION="Generic function interface to standard Common Lisp functions"
HOMEPAGE="https://github.com/alex-gutev/generic-cl/"
SRC_URI="https://github.com/alex-gutev/generic-cl/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/cl-arrows
	dev-lisp/trivia
	dev-lisp/cl-fad
	dev-lisp/cl-custom-hash-table
	dev-lisp/agutil
	dev-lisp/static-dispatch
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem #:generic-cl.test/,$d' ${PN}.asd
		rm -r test
	fi
}
