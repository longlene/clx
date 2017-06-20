# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="310ec1667e7c28dc6fd7cee48baea2ed8291915b"

DESCRIPTION="A small utility library inspired by Python.s string template"
HOMEPAGE="https://github.com/macdavid313/trivial-string-template/"
SRC_URI="https://github.com/macdavid313/trivial-string-template/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/proc-parse
	dev-lisp/closer-mop
	dev-lisp/cl-ppcre
"

src_prepare() {
	eapply_user
	use test || rm -rf ${PN}-test.asd t
}
