# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="761db78c0d60360737823e1fc9bf07c14b1386f0"

DESCRIPTION="ACM random number generator"
HOMEPAGE="https://github.com/brown/random"
SRC_URI="https://github.com/brown/random/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/base
	test? ( dev-lisp/stefil )
"

src_prepare() {
	eapply_user
	use test || rm -rf random-test.asd acm-random-test.asd random_test.lisp acm-random_test.lisp
}
