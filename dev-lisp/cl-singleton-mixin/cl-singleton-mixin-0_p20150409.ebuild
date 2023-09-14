# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="901f834b345fbcbd3e8ebf8915330edfbb15f533"

DESCRIPTION="Cl-singleton-mixin provides singleton mixin in Common Lisp"
HOMEPAGE="https://github.com/hipeta/cl-singleton-mixin"
SRC_URI="https://github.com/hipeta/cl-singleton-mixin/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/metap
	test? ( dev-lisp/fiveam )
"

src_prepare() {
	eapply_user
	use test || rm ${PN}-test.lisp ${PN}-test.asd
}
