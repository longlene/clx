# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A hierarchical scaffolder"
HOMEPAGE="http://amos.sourceforge.net/docs/bambus/"
SRC_URI="mirror://sourceforge/amos/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
IUSE=""
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND=""

src_compile() {
	sed -i 's|\(BASEDIR =\).*|\1 /usr|; s|\(INSTDIR =\).*|\1 '${D}'|; s|\(PERL =\).*|\1 /usr/bin/perl|' Makefile || die
	sed -i 's|\(TARGET_LIB =\).*|\1 '${D}'/usr/lib|; s|\(TARGET_INC =\).*|\1 '${D}'/usr/include|' src/TIGR_Foundation_CC/Makefile || die
	sed -i 's|$(INSTDIR)/doc|'${D}'/usr/share/doc/'${P}'|' doc/Makefile || die
	emake || die "emake failed"
}

src_install() {
	mkdir -p "${D}/usr/share/doc/${P}"
	emake DESTDIR="${D}" install || die "install failed"
}
