# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit latex-package

DESCRIPTION="A LaTeX Class for Typesetting Flash Cards."
SRC_URI="mirror://gentoo/${P}.tar.bz2"
HOMEPAGE="http://www.ctan.org/tex-archive/macros/latex/contrib/flashcards/"
LICENSE="GPL-2"

KEYWORDS="~alpha ~amd64 ~ppc ~ppc-macos ~sparc ~x86"

DEPEND="!>=app-text/tetex-2.96"

src_unpack() {

	unpack ${A}
	cd "${S}"

	epatch "${FILESDIR}/${P}-paperwidth.diff"

}

src_install() {

	latex-package_src_doinstall styles

	dodoc flashcards.{dvi,pdf} README

}
