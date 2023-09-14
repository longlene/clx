# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="48fed005c1a55d6ff03f6f295dbcac3a3da183a0"

DESCRIPTION="Automatically validating formlets for Hunchentoot + cl-who"
HOMEPAGE="https://github.com/inaimathi/formlets"
SRC_URI="https://github.com/inaimathi/formlets/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-who
	dev-lisp/drakma
	dev-lisp/hunchentoot
	dev-lisp/cl-ppcre
"

src_prepare() {
	eapply_user
	use test || rm -r ${PN}-test.asd test-package.lisp test.lisp
}
