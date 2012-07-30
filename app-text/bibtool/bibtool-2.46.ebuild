# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit flag-o-matic

MY_P="${P/bibtool/BibTool}"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="BibTool is a powerful command-line tool to manipulate BibTeX databases."
HOMEPAGE="http://www.gerd-neugebauer.de/software/TeX/BibTool.en.html"
SRC_URI="http://www.gerd-neugebauer.de/software/TeX/BibTool/${MY_P}.tar.gz"

LICENSE="GPL-1"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc"

DEPEND="virtual/libc
		doc? ( virtual/tetex )"
RDEPEND=""

src_unpack()
{
	unpack ${A}
	cd ${S}
	sed -i -e 's,^INSTALL_DIR.*\./mkdirchain,INSTALL_DIR = install -d,g' \
		-e 's,^BIBTOOL_DEFAULT.*$,BIBTOOL_DEFAULT = \\"\.:/usr/share/bibtool\\",g' \
		-e 's,^LIBDIR.*$,LIBDIR = @libdir@/bibtool,g' \
		-e 's,^NON_ANSI_DEFS.*,NON_ANSI_DEFS = @DEFS@ -DSTDC_HEADERS,g' \
		AutoConf/makefile.in || die
}

src_compile()
{
	append-flags -fno-strict-aliasing
	econf --prefix=${D}/usr --libdir=${D}/usr/share || die "econf failed"
	emake CFLAGS="${CFLAGS}" || die "emake failed"
	if use doc ; then
		emake doc
	fi
}

src_install()
{
	emake DESTDIR="${D}" install || die "emake install failed"

	doman Doc/bibtool.1 || die

	if use doc ; then
		dodoc Doc/{bibtool.dvi,c_lib.dvi,ref_card.dvi} || die
	fi
}

