# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="Fonts for the Tamil, Malayam, Oriya, Gujarati and Devanagari scripts"
HOMEPAGE="http://sarovar.org/projects/samyak/"
SRC_URI="http://sarovar.org/frs/download.php/1226/${P}.tar.gz"

LICENSE="GPL-3-with-font-exception"
SLOT="0"
KEYWORDS="~x86"

FONT_S="${S}"
FONT_SUFFIX="ttf"

src_compile() {
	#The unified fontfile is outdated
	#Just delete it and use the seperate files.
	rm ./Samyak.ttf
	find ./ -name '*ttf' -exec  cp {} . \;
}

DOCS="AUTHORS README Changelog COPYING"
