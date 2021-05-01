# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="31342a5eca8e48d16d1a476c0627553e4f8ea55b"

DESCRIPTION="Data-flowish computation tree library for non-blocking concurrent Common Lisp"
HOMEPAGE="https://github.com/borodust/cl-flow"
SRC_URI="https://github.com/borodust/cl-flow/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	test? ( dev-lisp/fiveam dev-lisp/cl-muth dev-lisp/simple-flow-dispatcher )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem\ cl-flow/tests/,$d' ${PN}.asd
		rm -r t
	fi
}
