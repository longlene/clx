# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit python

DESCRIPTION="enables risky operations that version-control systems don't want to let you do"
HOMEPAGE="http://www.catb.org/~esr/reposurgeon/"
SRC_URI="${HOMEPAGE}${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

PYTHON_DEPEND=2
RDEPEND=""
DEPEND="${RDEPEND}"

src_install() {
	python_convert_shebangs ${PYTHON_DEPEND} ${PN}
	exeinto ${EPREFIX}/usr/bin
	doexe ${PN}
	doman *.1
}
