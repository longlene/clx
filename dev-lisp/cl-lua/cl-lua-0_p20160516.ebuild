# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a2776a6ebced15f91fef769beece61a7a65b4cfd"

DESCRIPTION="Lua in Common Lisp"
HOMEPAGE="https://github.com/cxxxr/cl--lua"
SRC_URI="https://github.com/cxxxr/cl--lua/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/alexandria
	dev-lisp/babel
	test? ( dev-lisp/prove )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd test
}
