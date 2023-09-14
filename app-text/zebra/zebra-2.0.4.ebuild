# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P="id${P}"

DESCRIPTION="Zebra is a high-performance, general-purpose structured text indexing and retrieval engine"
HOMEPAGE="http://www.indexdata.dk/zebra/"
SRC_URI="http://ftp.indexdata.dk/pub/${PN}/${MY_P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~x86"

IUSE="doc threads expat tcltk"

RDEPEND=">=dev-libs/yaz-2.1.35
		 expat? ( dev-libs/expat )"
DEPEND="${RDEPEND}
		doc? ( app-text/docbook-xml-dtd
			   app-text/docbook-dsssl-stylesheets
			   app-text/docbook-xsl-stylesheets )"

S="${WORKDIR}/${MY_P}"

src_compile() {
	use_conf="$(use_with expat)
			  $(use_with doc docbook-dtd)
			  $(use_with doc docbook-dsssl)
			  $(use_with doc docbook-xsl)
			  $(use_enable threads)"

	econf ${use_conf} --enable-shared || die "econf failed"

	emake || die "emake failed"
}

src_install() {
	docdir="/usr/share/doc/${PF}"
	make DESTDIR="${D}" docdir="${docdir}" install || die "einstall failed"

	docinto html
	mv -f ${D}${docdir}/*.{html,png} ${D}${docdir}/html/ || die "Failed to move HTML docs"
}
