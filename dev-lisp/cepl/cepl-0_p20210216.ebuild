# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d1a10b6c8f4cedc07493bf06aef3a56c7b6f8d5b"

DESCRIPTION="Code Evaluate Play Loop"
HOMEPAGE="https://github.com/cbaggers/cepl"
SRC_URI="https://github.com/cbaggers/cepl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	dev-lisp/cl-opengl
	dev-lisp/cl-ppcre
	dev-lisp/documentation-utils
	dev-lisp/ieee-floats
	dev-lisp/varjo
	dev-lisp/bordeaux-threads
	dev-lisp/alexandria
	dev-lisp/split-sequence
	dev-lisp/float-features
"

src_prepare() {
	default
	rm -r docs
}
