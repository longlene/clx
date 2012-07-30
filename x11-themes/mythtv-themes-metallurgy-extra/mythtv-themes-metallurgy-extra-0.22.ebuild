# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion

RESTRICT=nomirror

MY_PV=1.0
MY_PN=metallurgy
MY_P=${MY_PN}_${MY_PV}

DESCRIPTION="Metallurgy theme for MythTV 0.22"
HOMEPAGE="http://miffteevee.co.uk/themes/metallurgy.html"
SRC_URI="http://miffteevee.co.uk/themes/metallurgy/${MY_P}_red.tar.gz
	http://miffteevee.co.uk/themes/metallurgy/${MY_P}_green.tar.gz
	http://miffteevee.co.uk/themes/metallurgy/${MY_P}_purple.tar.gz
"
ESVN_REPO_URI="http://svn.mythtv.org/svn/branches/release-0-22-fixes/myththemes/metallurgy"
ESVN_UP_FREQ=128

LICENSE="CCPL-Attribution-NonCommercial-NoDerivs-2.5"
SLOT="0"
KEYWORDS="x86"
IUSE=""

DEPEND=">=media-tv/mythtv-themes-0.22"


src_unpack()
{
	subversion_src_unpack
	cd ${WORKDIR}/
	unpack ${A}

	# the colour packs are "binary patches" to be copied over the original.
	# give each its own directory and a new name in themeinfo.xml
	for col in red green purple ; do
	  cp -R ${P} ${MY_PN}-${col}
	  cp -R ${col}/* ${MY_PN}-${col}
	  sed -i "s/Metallurgy/Metallurgy-${col}/" ${MY_PN}-${col}/themeinfo.xml
	done
}

src_install()
{
	cd ${WORKDIR}
	for col in red green purple; do
		dodir /usr/share/mythtv/themes/${MY_PN}-${col}
		cp -R  ${MY_PN}-${col}/* ${D}/usr/share/mythtv/themes/${MY_PN}-${col} || die "install of ${MY_PN}-${col} failed."
	done
}
