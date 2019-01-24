# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Static generic function dispatch for Common Lisp"
HOMEPAGE="https://github.com/alex-gutev/static-dispatch"
SRC_URI="https://github.com/alex-gutev/static-dispatch/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/cl-arrows
	dev-lisp/iterate
	dev-lisp/trivia
	dev-lisp/closer-mop
	dev-lisp/agutil
	dev-lisp/cl-environments
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	if ! use test ; then
		sed -i '/defsystem #:static-dispatch-test/,$d' ${PN}.asd
		rm test.lisp
	fi
}
