# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="172807db9a32617cd2a03fbc323a99e76badec8d"

DESCRIPTION="Sinatra-compatible URL routing library for Common Lisp"
HOMEPAGE="https://github.com/fukamachi/myway"
SRC_URI="https://github.com/fukamachi/myway/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/quri
	dev-lisp/map-set
	dev-lisp/alexandria
	dev-lisp/cl-utilities
	test? ( dev-lisp/prove )
"

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
