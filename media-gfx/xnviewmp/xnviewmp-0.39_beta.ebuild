# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=1

inherit eutils versionator

DESCRIPTION="XnView MP image viewer/converter"
HOMEPAGE="http://www.xnview.com/"
CH_PV="$(get_major_version  $(replace_version_separator '.' '' ${PV}))"
SRC_URI="x86? ( http://download.xnview.com/XnViewMP-${CH_PV}-linux.tgz )
       amd64? ( http://download.xnview.com/XnViewMP-${CH_PV}-linux-x64.tgz )"

SLOT="0"
LICENSE="free-noncomm as-is"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=">=dev-libs/glib-2
	x11-libs/libX11
	x11-libs/libXi
	x11-libs/libXt
	|| ( >=x11-libs/qt-4.3.0:4 ( x11-libs/qt-gui:4 ) )"
DEPEND=""

RESTRICT="strip"
S="${WORKDIR}/XnViewMP"

src_install() {
	declare XNVIEW_HOME=/opt/XnView

	# Install XnView in /opt
	dodir ${XNVIEW_HOME%/*}
	mv "${S}" "${D}"${XNVIEW_HOME} || die "Unable to install XnView folder"

	# Create /opt/bin/xnview
	dodir /opt/bin/
	cat <<EOF >"${D}"/opt/bin/xnview
#!/bin/sh
LD_LIBRARY_PATH=/opt/XnView/lib
export LD_LIBRARY_PATH
QT_PLUGIN_PATH=/opt/XnView/lib
export QT_PLUGIN_PATH
exec /opt/XnView/xnview "\$@"
EOF
	fperms 0755 /opt/bin/xnview


	# Install icon and .desktop for menu entry
	newicon "${D}"${XNVIEW_HOME}/xnview.png ${PN}.png
	make_desktop_entry xnview XnviewMP ${PN} "Graphics" || die "desktop file sed failed"


}

