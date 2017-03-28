# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2d0133217745bbd90e46468abb9da24ebdf407e5"

DESCRIPTION="Environment for knowledge representation, reasoning, and engineering"
HOMEPAGE="https://github.com/own-pt/cl-krr"
SRC_URI="https://github.com/own-pt/cl-krr/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-fad
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
	dev-lisp/optima
	dev-lisp/graph-algorithms
	dev-lisp/fare-memoization
	dev-lisp/fare-quasiquote-optimas
	dev-lisp/fare-quasiquote-readtable
	dev-lisp/fiveam
"

src_prepare() {
	eapply_user
	rm -r development
}
