# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

JAVA_PKG_IUSE="source"

inherit java-pkg-2 java-pkg-simple

MY_PN="StreamNameAlias"

DESCRIPTION="Stream Name Alias plugin for the Wowza Media Server."
SRC_URI="http://www.wowzamedia.com/downloads/forums/streamnamealias/${MY_PN}_${PV}.zip"
HOMEPAGE="http://www.wowzamedia.com/forums/showthread.php?t=1505"
LICENSE="WowzaMediaServerEULA-2.0"
SLOT="0"
RESTRICT=""
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=">=virtual/jdk-1.6
	 >=dev-java/wowza-media-server-2.0.0"

S="${WORKDIR}/${MY_PN}"

JAVA_SRC_DIR="${S}/src"
JAVA_GENTOO_CLASSPATH="wowza-media-server,log4j"

src_install() {
	java-pkg-simple_src_install

	insinto /etc/wowza-media-server/conf
	doins conf/*

	dodoc README.html header.gif style.css || die

	use source && java-pkg_dosources src
}

pkg_postinst() {
	einfo "========================================"
	einfo "Add the module name into the /etc/conf.d/wowza-media-server file:"
	einfo "MODULE=\"${PN}\""
	einfo "========================================"
}
