# Copyright 2025 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="aa7fbad3770814d488ff9a55d17895f3ca40b76b"

DESCRIPTION="An ORM for Common Lisp with migrations, relationships and PostgreSQL support"
HOMEPAGE="https://github.com/fukamachi/mito"
SRC_URI="https://github.com/fukamachi/mito/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-reexport
	dev-lisp/cl-ppcre
	dev-lisp/closer-mop
	dev-lisp/cl-dbi
	dev-lisp/dissect
	dev-lisp/esrap
	dev-lisp/local-time
	dev-lisp/optima
	dev-lisp/sxql
	test? ( dev-lisp/prove )
"

src_prepare() {
	default
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
