# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="7037f2c20d5bbf7a789bd9fe2e85eb1ed3ef247c"

DESCRIPTION="A web framework for Common Lisp"
HOMEPAGE="https://github.com/eudoxia0/lucerne"
SRC_URI="https://github.com/eudoxia0/lucerne/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clack
	dev-lisp/myway
	dev-lisp/cl-annot
	dev-lisp/trivial-types
	dev-lisp/clack-errors
	dev-lisp/djula
	dev-lisp/log4cl
	dev-lisp/alexandria
	dev-lisp/cl-mustache
	dev-lisp/local-time
	dev-lisp/cl-pass
	test? ( dev-lisp/fiveam dev-lisp/drakma )
"

src_prepare() {
	default
	use test || rm -r ${PN}-hello-world.asd ${PN}-test.asd examples t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
