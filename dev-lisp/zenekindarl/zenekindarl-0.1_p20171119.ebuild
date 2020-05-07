# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="ea8cfa8b6e6039043f1a1495b6978224e940bc1b"

DESCRIPTION="A fast template engine for Common Lisp"
HOMEPAGE="https://github.com/KeenS/zenekindarl"
SRC_URI="https://github.com/KeenS/zenekindarl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/anaphora
	dev-lisp/babel
	dev-lisp/optima
	dev-lisp/cl-ppcre
	dev-lisp/html-encode
	dev-lisp/fast-io
	dev-lisp/maxpc
	dev-lisp/cl-annot
	test? ( dev-lisp/prove )
"
BDEPEND=""

src_prepare() {
	default
	use test || rm -r ${PN}-test.asd t
}
