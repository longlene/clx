# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9c077eb652dd108a30726154f46b9a7d482f5474"

DESCRIPTION="HTTP cookie manager"
HOMEPAGE="https://github.com/fukamachi/cl-cookie"
SRC_URI="https://github.com/fukamachi/cl-cookie/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/proc-parse
	dev-lisp/cl-ppcre
	dev-lisp/quri
	dev-lisp/local-time
	dev-lisp/alexandria
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all src README.markdown
}
