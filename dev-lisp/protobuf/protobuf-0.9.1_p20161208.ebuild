# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="971c10bd35860cc77e09af2b69aabc7bb6d15779"

DESCRIPTION="Common Lisp implementation of Google's protocol buffers"
HOMEPAGE="http://common-lisp.net/project/protobuf/"
SRC_URI="https://github.com/brown/protobuf/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

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
	eapply_user
	use test || rm -r varint/varint-test.asd varint/varint_test.lisp protoc/protoc-test.asd protoc/protoc_test.lisp ${PN}-test.asd *-test.lisp
}

src_compile() {
	emake -C protoc/lisp
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all COPYING README TODO
	use test || common-lisp-install-sources -t all golden
	dobin protoc/lisp/protoc-gen-lisp
}
