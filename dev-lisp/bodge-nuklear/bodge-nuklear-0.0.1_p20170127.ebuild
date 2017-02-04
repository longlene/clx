# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="da3c2ae3d9d0134b9b2e5bc697f5372288b52d41"

DESCRIPTION="Thin wrapper over nuklear for Common Lisp"
HOMEPAGE="https://github.com/borodust/bodge-nuklear"
SRC_URI="https://github.com/borodust/bodge-nuklear/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	dev-libs/nuklear
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
	exeinto ${CLSOURCEROOT}/${CLPACKAGE}/lib
	doexe lib/libnuklear.so
	common-lisp-install-sources -t all lib/bodge_nuklear.h spec
}
