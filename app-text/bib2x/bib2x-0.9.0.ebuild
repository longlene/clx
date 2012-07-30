# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Bib2x - The Tool For Manipulating and Converting BibTeX-Libraries"
HOMEPAGE="http://www.xandi.eu/bib2x/"
SRC_URI="http://www.xandi.eu/bib2x/files/dist/bib2x_0.9_src.tgz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack(){
	unpack ${A} || die "unpack failed"
	cd ${S}
}

src_compile(){
	econf || die "econf failed"
	emake || die "emake failed"
}

src_install(){
	emake DESTDIR="${D}" install || die "emake install failed"
}
