# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION=""
HOMEPAGE="http://www.sirlab.de/linux/download_vocoder.html"
SRC_URI="http://www.sirlab.de/linux/download/${P}.tgz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND="media-libs/ladspa-sdk"
RDEPEND=""

src_compile() {
	cd ${WORKDIR}/vocoder-${PV}
	emake || die
}

src_install() {
	cd ${WORKDIR}/vocoder-${PV}
	insinto /usr/lib/ladspa
	insopts -m0755
	doins vocoder.so
}
