# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="66eb75edd0506fc1a22819a4f15546c35ac429c7"

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
	default
	if ! use test ; then
		sed -i '/defsystem\ "clpython\/test/,$d' clpython.asd
		rm -r test
	fi
}

