# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a2b48b6e46fbb29a3a9ca637b7204145bf847b65"

DESCRIPTION="Run JavaScript in a browser from Common Lisp"
HOMEPAGE="https://github.com/ceramic/remote-js"
SRC_URI="https://github.com/ceramic/remote-js/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clack
	dev-lisp/trivial-ws
	dev-lisp/cl-markup
	dev-lisp/find-port
	test? ( dev-lisp/fiveam dev-lisp/trivial-open-browser dev-lisp/bordeaux-threads )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.md
}
