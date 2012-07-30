# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit latex-package

DESCRIPTION="This package enables subnumbering of floats (figures and tables) similar to the subequations environment of the amsmath package."
HOMEPAGE="http://www.ctan.org/tex-archive/macros/latex/contrib/subfloat/"
SRC_URI="ftp://tug.ctan.org/tex-archive/macros/latex/contrib/${PN}.zip"

KEYWORDS="x86"
LICENSE="LPPL-1.2"
SLOT="0"

RDEPEND="virtual/tetex"
DEPEND="${RDEPEND}
	app-arch/unzip"

src_unpack() {
	unzip ${DISTDIR}/${PN}.zip \
		|| die Unpacking failed.
}

S="${WORKDIR}/${PN}"

src_install() {

	latex-package_src_install

	dodoc ChangeLog README subfloat.dvi\
		|| einfo Installing the documentation failed.

}
