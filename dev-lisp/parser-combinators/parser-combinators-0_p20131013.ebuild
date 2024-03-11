# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9c7569a4f6af5e60c0d3a51d9c15c16d1714c845"

DESCRIPTION="An experimental implementation of parser combinators in Common Lisp"
HOMEPAGE="https://github.com/Ramarren/cl-parser-combinators"
SRC_URI="https://github.com/Ramarren/cl-parser-combinators/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/iterate
"
BDEPEND=""

src_prepare() {
	default
	rm -rf ${PN}-tests.asd test*.lisp
}
