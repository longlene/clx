# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a55eaf0394edcbf1f7738768ccb78e0a39d68dc8"

DESCRIPTION="An implementation of Python in Common Lisp"
HOMEPAGE="http://common-lisp.net/project/clpython/"
SRC_URI="https://github.com/metawilm/cl-python/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/cl-yacc
	dev-lisp/cl-fad
	dev-lisp/cl-custom-hash-table
	test? ( dev-lisp/ptester )
"

src_prepare() {
	eapply_user
	if ! use test ; then
		sed -i '/defsystem\ "clpython\/test/,$d' clpython.asd
		rm -r test
	fi
}
