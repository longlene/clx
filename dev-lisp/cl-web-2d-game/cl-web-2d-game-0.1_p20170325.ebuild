# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ea83e64a92fe34f7d778b157c91f946f3c8d350b"

DESCRIPTION="A library to create 2d game using Parenscript and three.js"
HOMEPAGE="https://github.com/eshamster/cl-web-2d-game"
SRC_URI="https://github.com/eshamster/cl-web-2d-game/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/parenscript
	dev-lisp/ps-experiment
	dev-lisp/dexador
	dev-lisp/cl-ps-ecs
	test? ( dev-lisp/cl-ppcre dev-lisp/prove dev-lisp/alexandria dev-lisp/ps-experiment[test] )
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd t
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all README.markdown
}
