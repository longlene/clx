# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="7059b2548512b1ff238cb1fb732932b224e96cea"

DESCRIPTION="A simple web system framework"
HOMEPAGE="https://github.com/lisp-mirror/cl-wfx"
SRC_URI="https://github.com/lisp-mirror/cl-wfx/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-ppcre
	dev-lisp/ironclad
	dev-lisp/bordeaux-threads
	dev-lisp/cl-naive-store
	dev-lisp/hunchentoot
	dev-lisp/cl-who
	dev-lisp/split-sequence
	dev-lisp/ht-simple-ajax
	dev-lisp/cl-json
	dev-lisp/cl-smtp
	dev-lisp/kunru-sandbox
	dev-lisp/csv-parser
	dev-lisp/local-time
"
BDEPEND=""

src_prepare() {
	default
	use test || rm ${PN}-test.asd test
}
