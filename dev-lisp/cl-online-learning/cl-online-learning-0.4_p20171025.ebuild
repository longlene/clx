# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="99fa888e629012a79903f785b6858ceaab89297c"

DESCRIPTION="A collection of online learning algorithms for Linear classification written in pure Common Lisp"
HOMEPAGE="https://github.com/masatoi/cl-online-learning"
SRC_URI="https://github.com/masatoi/cl-online-learning/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/split-sequence
	dev-lisp/parse-number
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -f ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.org
}
