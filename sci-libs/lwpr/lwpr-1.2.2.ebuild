# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: 2009/10/06 florent.teichteil@onera.fr Exp $

EAPI=2

DESCRIPTION="The Locally Weighted Projection Regression Library"
HOMEPAGE="http://www.ipab.inf.ed.ac.uk/slmc/software/lwpr/"
SRC_URI="http://www.ipab.inf.ed.ac.uk/slmc/software/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="octave doc examples"

DEPEND="octave? ( >=sci-mathematics/octave-2.9.12 )
		doc? ( app-doc/doxygen )"
RDEPEND="${DEPEND}"

src_configure() {
	local octaveconf
	
	if use octave; then
		octaveconf="${octaveconf} --with-octave=`octave-config -p PREFIX`"
	fi
	
	econf \
		${octaveconf} \
		|| die "configure failed"
}

src_compile() {
	emake || die "make failed"
	
	if use doc; then
		doxygen Doxyfile || die "doxygen failed"
	fi
}

src_install() {
	einstall || die "einstall failed."
	dodoc COPYING INSTALL.TXT README.TXT doc/lwpr_doc.pdf
	if use doc; then
		dohtml html/* || die "installing doxygen documentation"
	fi
	if use examples ; then
		insinto /usr/share/doc/${PF}/examples
		doins example_c/cross.c example_cpp/cross.cc || die "installing examples"
	fi
}

