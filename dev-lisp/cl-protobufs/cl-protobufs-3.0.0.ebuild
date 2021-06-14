# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3

DESCRIPTION="Common Lisp protocol buffer implementation"
HOMEPAGE="https://gitlab.common-lisp.net/qitab/cl-protobufs"
SRC_URI="https://github.com/qitab/cl-protobufs/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/protobuf
"
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
	dev-lisp/babel
	dev-lisp/trivial-garbage
"

src_compile() {
	PROTOC_ROOT=/usr emake -C protoc
}

src_install() {
	common-lisp-3_src_install
	dobin protoc/protoc-gen-lisp
}
