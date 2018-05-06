# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ca68530b9cd4bccaa603d70d16623eb66204ee3c"

DESCRIPTION="An RSS generator"
HOMEPAGE="https://github.com/xach/westbrook/"
SRC_URI="https://github.com/xach/westbrook/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cxml
	test? ( dev-lisp/fiasco )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-tests.asd tests.lisp
}
