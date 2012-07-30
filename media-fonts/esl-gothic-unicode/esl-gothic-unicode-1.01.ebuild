# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit font

DESCRIPTION="A font for Shavian"
HOMEPAGE="http://www.30below.com/~ethanl/fonts.html"
SRC_URI="http://www.30below.com/~ethanl/files/fonts/${PN//-/_}-${PV}.otf"

LICENSE="free-noncomm"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

FONT_S="${WORKDIR}"
S="${WORKDIR}"
FONT_SUFFIX="otf"

src_unpack() {
	cp -a "${DISTDIR}"/"${PN//-/_}"-${PV}.otf "${S}"
}

DOCS=""
