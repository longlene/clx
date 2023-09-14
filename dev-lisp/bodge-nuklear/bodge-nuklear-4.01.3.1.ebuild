# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="Thin wrapper over nuklear for Common Lisp"
HOMEPAGE="https://github.com/borodust/bodge-nuklear"
SRC_URI="https://github.com/borodust/bodge-nuklear/archive/v${PV}.tar.gz -> ${P}.tar.gz"

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
	dev-lisp/claw
	dev-lisp/claw-utils
	dev-lisp/cffi-c-ref
"

src_prepare() {
	default
	sed -i '/defsystem :bodge-nuklear\/example/,$d' ${PN}.asd
}

src_compile() {
	emake -C src/lib
}

src_install() {
	common-lisp-3_src_install
	exeinto ${CLSOURCEROOT}/${CLPACKAGE}/src/lib
	doexe src/lib/libnuklear.so
	common-lisp-install-sources -t all src/bodge_nuklear.h src/spec
}
