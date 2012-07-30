# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit toolchain-funcs

DESCRIPTION="ZOOM .aud or .zaf to WAV file converter for Zoom PS-02, PS-04, or MRS-8"
HOMEPAGE="http://www.engens.com/dwight/software.html"
SRC_URI="http://www.engens.com/dwight/dl/zoom2wav.c"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack() {
	cp ${DISTDIR}/${A} ${WORKDIR}/${A} || die 
}

src_compile() {
	$(tc-getCC) ${WORKDIR}/${A} -v -o ${WORKDIR}/zoom2wav || die "Compilation failed."
}

src_install() {
	dobin ${WORKDIR}/zoom2wav || die "dobin failed."
}
