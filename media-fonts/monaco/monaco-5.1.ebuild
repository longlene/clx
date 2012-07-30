# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit font

DESCRIPTION="A monospaced sans-serif typeface, used in Mac OS X"
HOMEPAGE="http://www.gringod.com/2006/11/01/new-version-of-monaco-font/"
SRC_URI="http://www.gringod.com/wp-upload/software/Fonts/Monaco_Linux.ttf"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"
FONT_S="${S}"
FONT_SUFFIX="ttf"

src_unpack() {
	cp -a "${DISTDIR}/${A}" "${S}/${A}"
}
