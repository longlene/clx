# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit java-pkg-2

At="javamp3-1_0.zip"
DESCRIPTION="Enables MP3 Decoding in Java"
HOMEPAGE="http://java.sun.com/products/java-media/jmf/mp3/download.html"
SRC_URI="${At}"

LICENSE="sun-bcla-jmf"
SLOT="0"
KEYWORDS="x86"

IUSE=""

COMMON_DEP="dev-java/jmf-bin"

RDEPEND=">=virtual/jre-1.4
	${COMMON_DEP}"
DEPEND=">=virtual/jdk-1.4
	app-arch/unzip
	${COMMON_DEP}"
RESTRICT="fetch"

pkg_nofetch() {
	einfo
		einfo " Due to license restrictions, we cannot fetch the"
		einfo " distributables automagically."
		einfo
		einfo " 1. Visit ${HOMEPAGE} and select 'Cross Platform Java'"
		einfo " 2. Download ${At}"
		einfo " 3. Move file to ${DISTDIR}"
		einfo " 4. Run emerge on this package again to complete"
		einfo
}

src_unpack() {
	unzip -qq ${DISTDIR}/${At} || die
}

src_install() {
	  java-pkg_dojar ${WORKDIR}/lib/ext/*.jar
	  dodoc ${WORKDIR}/copyright.txt ${WORKDIR}/license.txt
}
