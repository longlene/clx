# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="aa0914253f659c22d6043dce22c9a0b2b5471e6d"

DESCRIPTION="Common Lisp implementation of Google's protocol buffers"
HOMEPAGE="http://common-lisp.net/project/protobuf/"
SRC_URI="https://github.com/brown/protobuf/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE="example test"

DEPEND="
	dev-libs/protobuf
"
RDEPEND="${DEPEND}
	dev-lisp/base
	dev-lisp/cl-ppcre
	dev-lisp/nibbles
	dev-lisp/trivial-utf8
	test? ( dev-lisp/setfil )
"

src_prepare() {
	default
	use example || rm -r example
	use test || rm -r varint/varint-test.asd varint/varint_test.lisp protoc/protoc-test.asd protoc/protoc_test.lisp ${PN}-test.asd *-test.lisp
	sed -i 's#strutil.h##' protoc/lisp/Makefile
}

src_compile() {
	emake -C protoc/lisp
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all COPYING README TODO
	dobin protoc/lisp/protoc-gen-lisp
}
