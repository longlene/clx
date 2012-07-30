# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit latex-package

DESCRIPTION="A LaTeX package for shaded membrane protein topology plots."
HOMEPAGE="http://homepages.uni-tuebingen.de/beitz/tte.html"
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

	dodoc textopo.txt textopo.pdf \
		|| einfo Installing the documentation failed.

}
