# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="84e95d635a5196bac0e4db3f0f4426c867eb59f1"

DESCRIPTION="Parsing, AST and \"walking\" for Common Lisp code"
HOMEPAGE="https://sourceforge.net/projects/clast/"
SRC_URI="https://github.com/lisp-mirror/clast/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default
	sed -e '/defsystem :clast\/tests/,$d' \
		-i ${PN}.asd
	rm -rf tests
}
