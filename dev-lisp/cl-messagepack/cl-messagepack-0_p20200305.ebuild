# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0bd25831feb0c2494fde2eeae1b26ae2f7d44a1d"

DESCRIPTION="A Common Lisp implementation of Message Pack"
HOMEPAGE="https://github.com/mbrezu/cl-messagepack"
SRC_URI="https://github.com/mbrezu/cl-messagepack/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/flexi-streams
	dev-lisp/babel
	dev-lisp/closer-mop
	test? ( dev-lisp/cl-json dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm ${PN}-tests.asd benchmark.lisp tests.lisp
}
