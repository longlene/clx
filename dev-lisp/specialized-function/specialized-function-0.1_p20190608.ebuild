# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="89b1b6e37a1248ffa003fd4d3db9c55ba209e60b"

DESCRIPTION="Julia-like dispatch for Common Lisp"
HOMEPAGE="https://github.com/numcl/specialized-function"
SRC_URI="https://github.com/numcl/specialized-function/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivia
	dev-lisp/alexandria
	dev-lisp/iterate
	dev-lisp/lisp-namespace
	dev-lisp/type-r
	test? ( dev-lisp/fiveam )
"
BDEPEND=""

src_prepare() {
	default
	rm asd-generator-data.asd
	use test || rm -r ${PN}.test.asd t
}
