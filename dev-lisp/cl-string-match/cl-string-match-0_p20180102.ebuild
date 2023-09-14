# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e4a549b14df965a59de95522b6879e6d3f972e6d"

DESCRIPTION="Implementation of a number of string search algorithms in Common Lisp"
HOMEPAGE="https://github.com/vityok/cl-string-match"
SRC_URI="https://github.com/vityok/cl-string-match/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-yacc
	dev-lisp/jpl-queues
	dev-lisp/iterate
	dev-lisp/mgl-pax
	dev-lisp/proc-parse
	dev-lisp/parse-float
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-test.asd t
}
