# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="MOD only (XM, IT, S3M, MOD, MTM, UMX) version of BASS"
HOMEPAGE="http://www.un4seen.com/bassmod.html"
SRC_URI="http://www.un4seen.com/files/bassmod20-linux.zip
	http://www.un4seen.co.uk/files/bassmod20-linux.zip"

LICENSE=""
SLOT="0"
KEYWORDS="-* ~x86"
IUSE="doc"
RESTRICT="mirror strip"

DEPEND="app-arch/unzip"
RDEPEND=""

S=${WORKDIR}

src_compile() {
	:;
}

src_install() {
	insinto /usr/include
	doins bassmod.h

	use doc && dodoc bassmod.pdf

	dolib.so libbassmod.so
}
