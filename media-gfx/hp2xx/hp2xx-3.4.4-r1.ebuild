# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Versatile tool to convert vector-oriented graphics data given in Hewlett-Packard's HP-GL plotter language into a variety of popular graphics formats."
HOMEPAGE="http://www.gnu.org/software/hp2xx/"
SRC_URI="ftp://ftp.gnu.org/pub/gnu/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 ~sparc ~ppc amd64 ~alpha ~ia64 ~mips"

DEPEND="media-libs/libpng media-libs/tiff media-libs/pdflib sys-libs/zlib"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/${P}-r1.patch
	cp -abv makes/generic.mak sources/Makefile
}

src_compile() {
	cd ${S}/sources

	emake all || die
}

src_install() {
	mkdir -p ${D}/usr/bin ${D}/usr/share/info ${D}/usr/share/man/man1

	make prefix=${D}/usr \
		mandir=${D}/usr/share/man \
		infodir=${D}/usr/share/info \
		install || die
}
