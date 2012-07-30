# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 

DESCRIPTION="Object REXX GTK+ Project"
HOMEPAGE="https://sourceforge.net/project/showfiles.php?group_id=106456"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz" 

S="${WORKDIR}/${PN}"

LICENSE="CPL-1.0"

SLOT="0"
KEYWORDS="~x86"
IUSE="doc"

DEPEND=">=dev-lang/ooRexx-3
	>=x11-libs/gtk+-2"

src_compile() 
{
	cd ${S}/src
	sed -i "s%-lrexx%-L/usr/lib/ooRexx -lrexx%" makefile
	emake || die "emake failed"
}

src_install() 
{
	dolib.so ${S}/src/libgtkrxdlg*
	dobin ${S}/scripts/gtkrxdlg.cls
	if use doc; then
		docinto scripts
		dodoc ${S}/scripts/*
		dohtml ${S}/docs/*
	fi
}

