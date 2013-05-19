# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

JAVA_PKG_IUSE="source"

inherit java-pkg-2 java-pkg-simple

MY_PN="MediaSecurity"

DESCRIPTION="Media Security plugin for the Wowza Media Server."
SRC_URI="http://www.wowzamedia.com/downloads/forums/mediasecurity/${MY_PN}_${PV}.zip"
HOMEPAGE="http://www.wowzamedia.com/forums/showthread.php?t=1281"
LICENSE="WowzaMediaServerEULA-2.0"
SLOT="0"
RESTRICT=""
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=">=dev-java/wowza-media-server-2.0.0"

S="${WORKDIR}/${MY_PN}"

JAVA_PKG_WANT_SOURCE="1.6"
JAVA_PKG_WANT_TARGET="1.6"

JAVA_SRC_DIR="${S}/src"
JAVA_GENTOO_CLASSPATH="wowza-media-server"

src_install() {
	java-pkg-simple_src_install
	java-pkg_dojar lib/wms-plugin-security.jar

	dodoc WowzaMediaServerMediaSecurity_UsersGuide.pdf || die

	use source && java-pkg_dosources src
}

pkg_postinst() {
	einfo "========================================"
	einfo "Add the module name into the /etc/conf.d/wowza-media-server file:"
	einfo "MODULE=\"${PN}\""
	einfo "========================================"
}
