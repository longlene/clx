# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="71096cd3a5550516db8dbd3d596b279d734e5a25"

DESCRIPTION="Automated parameter tuner for CL"
HOMEPAGE="https://github.com/guicho271828/dynotune"
SRC_URI="https://github.com/guicho271828/dynotune/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/iterate
	dev-lisp/alexandria
	dev-lisp/trivia
	dev-lisp/introspect-environment
	dev-lisp/type-r
	dev-lisp/lparallel
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}.test.asd t
}
