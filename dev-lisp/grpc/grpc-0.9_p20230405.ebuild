# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="c27be163a6a350c12040323c25d3d1833f45213e"

DESCRIPTION="gRPC implementation for Common Lisp"
HOMEPAGE="https://github.com/qitab/grpc"
SRC_URI="https://github.com/qitab/grpc/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="net-libs/grpc"
RDEPEND="${DEPEND}
	dev-lisp/cl-protobufs
	dev-lisp/cffi
	dev-lisp/bordeaux-threads
"
BDEPEND=""

src_prepare() {
	default
	sed -e '/defsystem :grpc\/tests,$d' \
		-i ${PN}.asd
}

src_compile() {
	emake GRPC_ROOT=/usr
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all grpc.so version.sexp
}
