# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Python address-label creator, generating Postscript"
HOMEPAGE="http://www.red-bean.com/labelnation/"
SRC_URI="http://www.red-bean.com/labelnation/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND=""
RDEPEND="dev-lang/python"

src_install() {
	dobin ${PN} || die "dobin"

	dodoc README

	docinto examples
	dodoc examples/*
}
