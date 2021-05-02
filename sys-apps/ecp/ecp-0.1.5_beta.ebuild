# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

MY_P="${P/_beta/beta}"
MY_P="${MY_P/-/.}"

DESCRIPTION="A feature rich version of the coreutils tool cp"
HOMEPAGE="http://www.nongnu.org/ecp/"
SRC_URI="http://download.savannah.nongnu.org/releases/${PN}/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_compile() {
	cd ${WORKDIR}/${MY_P}
	emake
}

src_install() {
	exeinto /usr/bin
	doexe ${WORKDIR}/${MY_P}/${PN}
	doman ${WORKDIR}/${MY_P}/doc/${PN}.1.gz
	dodoc ${WORKDIR}/${MY_P}/{AUTHORS,ChangeLog,README,TODO}
}
