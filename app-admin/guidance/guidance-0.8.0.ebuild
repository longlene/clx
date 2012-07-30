# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils distutils

DESCRIPTION="Collection of system administration tools for Linux/KDE systems"
HOMEPAGE="http://www.simonzone.com/software/guidance/"
SRC_URI="http://www.simonzone.com/software/guidance/${P}.tar.bz2"
LICENSE="GPL"
SLOT="0"

KEYWORDS="~x86"

IUSE=""

DEPEND="dev-lang/python
		>=dev-python/pykde-3.7
		dev-python/PyQt
		dev-python/pykdeextensions"

RDEPEND="${DEPEND}
		dev-python/notify-python
		dev-python/dbus-python"

PATCHES="guidance-powermanager.patch"

src_unpack(){
	distutils_src_unpack

	epatch ${FILESDIR}/guidance-powermanager.patch
}

src_install(){
	cd ${S}/powermanager
		kdepyuic guidance_power_manager_ui.ui
		kdepyuic tooltip.ui
		kdepyuic notify.ui
	
	cd ${S}
	insinto /usr/kde/3.5/share/apps/${PN}
		doins powermanager/*.py
	
	distutils_src_install

	cd ${D}/usr/kde/3.5/bin
	for k in serviceconfig \
				userconfig \
				mountconfig \
				displayconfig \
				displayconfig-restore \
				wineconfig \
				grubconfig
			do
		rm $k
		echo -e "#!/bin/sh\n/usr/kde/3.5/share/apps/guidance/$k.py" > $k
		chmod 755 $k
	done

	echo "#!/bin/sh" > guidance-power-manager
	echo "/usr/kde/3.5/share/apps/guidance/guidance-power-manager.py" > \
		guidance-power-manager

	chmod 755 guidance-power-manager

	cd ${D}
	chmod 755 usr/kde/3.5/share/apps/guidance/guidance-power-manager.py
}


