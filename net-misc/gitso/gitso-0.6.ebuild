# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Gitso connects one person to another's screen."
HOMEPAGE="http://code.google.com/p/gitso/"
SRC_URI="http://gitso.googlecode.com/files/${PN}_${PV}_src.tar.bz2"

LICENSE="GPL-3"
KEYWORDS="~x86"
SLOT="0"
IUSE=""

RDEPEND="dev-python/wxpython
	net-misc/tightvnc
	x11-misc/x11vnc"

MY_P="${PN}-${PV}"
S="${WORKDIR}/${MY_P}"
src_install() {
	cd "${S}"

	insinto "/usr/share/applications/"
	doins "arch/linux/gitso.desktop"

	sed -i "s?'..', 'share', 'doc', 'gitso', 'copyright'?'..', '..', '${PORTDIR}/licenses/GPL-3'?g" Gitso.py
	insinto "/usr/share/gitso"
	doins "AboutWindow.py" "ArgsParser.py" "ConnectionWindow.py" "Gitso.py" "GitsoThread.py" "hosts.txt" "icon.ico" "__init__.py" "NATPMP.py" "Processes.py"

	mv "arch/linux/README.txt" "arch/linux/README"
	dodoc "arch/linux/README" "arch/linux/changelog"

	dobin "arch/linux/gitso"
}
