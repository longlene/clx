# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="44ae62a0509878fe3c2d0de95ccc82cbe7de8bab"

DESCRIPTION="Common Lisp Machine Learning Library"
HOMEPAGE="https://github.com/mmaul/clml"
SRC_URI="https://github.com/mmaul/clml/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LLGPL"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-store
	dev-lisp/cffi
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/lparallel
	dev-lisp/clod
	dev-lisp/cl-ppcre
	dev-lisp/split-sequence
	dev-lisp/introspect-environment
	dev-lisp/array-operations
	dev-lisp/uiop
	dev-lisp/parse-number
	dev-lisp/cl-fad
	dev-lisp/drakma
	dev-lisp/trivial-garbage
	test? ( dev-lisp/lisp-unit )
"

src_prepare() {
	default
	use test || rm -rf test
}
