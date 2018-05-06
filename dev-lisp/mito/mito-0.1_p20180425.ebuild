# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c4aa1768cec64c1d2e79d291e45450fe8cfd6784"

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
	eapply_user
	use test || rm -rf ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
