# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="d4fd6f3541e0a45ff3e44556125f5d0c3e3db86a"

DESCRIPTION="Thin wrapper over nanovg for Common Lisp"
HOMEPAGE="https://github.com/borodust/bodge-nanovg"
SRC_URI="https://github.com/borodust/bodge-nanovg/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/nanovg
	media-libs/libepoxy
"
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cffi
	dev-lisp/cl-autowrap
"

src_compile() {
	emake -C lib
}

src_install() {
	common-lisp-3_src_install
	common-lisp-install-sources -t all spec lib/{bodge_nanovg.h,libnanovg.so}
	exeinto ${CLSOURCEROOT}/${CLPACKAGE}/lib
	doexe lib/libnanovg.so
}
