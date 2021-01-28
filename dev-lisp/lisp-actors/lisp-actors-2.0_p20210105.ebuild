# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ea9db9d57b6f85c533f22a0c366b3ede8b78a698"

DESCRIPTION="Thread-agnostic Actors in Common Lisp"
HOMEPAGE="https://github.com/dbmcclain/Lisp-Actors"
SRC_URI="https://github.com/dbmcclain/Lisp-Actors/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivia
	dev-lisp/optima
	dev-lisp/alexandria
	dev-lisp/ironclad
	dev-lisp/babel
	dev-lisp/zlib
	dev-lisp/cl-ppcre
	dev-lisp/cffi
"
BDEPEND=""

src_prepare() {
	default
	rm -r lisp-object-encoder/'Prevaylor paper.pdf' data-objects/Papers
}
