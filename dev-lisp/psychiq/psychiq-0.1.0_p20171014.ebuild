# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c871e0db1c7dd7484c8f31af553c68bda88a04b6"

DESCRIPTION="Background job processing for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/psychiq"
SRC_URI="https://github.com/fukamachi/psychiq/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/bordeaux-threads
	dev-lisp/cl-redis
	dev-lisp/cl-reexport
	dev-lisp/dissect
	dev-lisp/jonathan
	dev-lisp/local-time
	dev-lisp/uiop
	dev-lisp/vom
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -rf t ${PN}-test.asd
}

# roswell
src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
