# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit versionator
MY_P=$(delete_all_version_separators ${P})

DESCRIPTION="ECM prepares CD images (BIN, ISO, etc.) so that they'll compress far better"
HOMEPAGE="http://www.neillcorlett.com/ecm/"
SRC_URI="http://www.neillcorlett.com/downloads/${MY_P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"

src_unpack() {
	mkdir "${S}"
	unzip -d "${S}" "${DISTDIR}"/${MY_P}.zip
}

src_compile() {
	gcc ${CFLAGS} -o ecm ecm.c || die "ecm compilation failed"
	gcc ${CFLAGS} -o unecm unecm.c || die "unecm compilation failed"
}

src_install() {
	dobin ecm unecm
	dodoc format.txt readme.txt
}
