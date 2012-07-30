# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_P=${P/hydrogen-millo-drums/MilloDrums}
DESCRIPTION="Hydrogen multi-layer drumkit, based on a Ludwig drum"
HOMEPAGE="http://www.hydrogen-music.org/?p=drumkits"
SRC_URI="mirror://sourceforge/hydrogen/${MY_P}.zip"

# LICENSE subject to verification
# No mention except on http://www.hydrogen-music.org/?p=drumkits
LICENSE="freedist"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="media-sound/hydrogen"

src_unpack() {
	unpack ${A}
	cd MilloDrums-3
	tar xvfz *.h2drumkit
}

src_compile() { 
	# Recode in FLAC with best parameters
	cd ${WORKDIR}/MilloDrums-3/Millo_MultiLayered3
	for i in *.wav; do
		flac --best -es "${i}"
	done
	sed -i "s/<filename>\(.*\)\.wav<\/filename>/<filename>\\1.flac<\/filename>/" drumkit.xml

}

src_install() {
	dodir /usr/share/hydrogen/data/drumkits/Millo_MultiLayered3
	insinto /usr/share/hydrogen/data/drumkits/Millo_MultiLayered3
	doins ${WORKDIR}/MilloDrums-3/Millo_MultiLayered3/*.flac
	doins ${WORKDIR}/MilloDrums-3/Millo_MultiLayered3/*.xml
	dodir /usr/share/hydrogen/data/demo_songs
	insinto /usr/share/hydrogen/data/demo_songs
	doins ${WORKDIR}/MilloDrums-3/*.h2song
}

