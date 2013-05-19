# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

JAVA_PKG_IUSE="source"

inherit java-pkg-2 java-pkg-simple

MY_PN="IdleDisconnect"

DESCRIPTION="Wowza Media Server plugin which disconnects idle client connections after timeout period."
SRC_URI="http://www.wowzamedia.com/downloads/forums/idledisconnect/${MY_PN}.zip"
HOMEPAGE="http://www.wowzamedia.com/forums/showthread.php?t=2338"
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
JAVA_GENTOO_CLASSPATH="wowza-media-server,log4j"

src_unpack() {
	unpack ${A}
	sed -i "s/import com\.wowza\.wms\.plugin\.test\.stream\.\*;//" ${S}/src/ModuleIdleDisconnect.java || die 'Can not sed file!'
}

src_install() {
	java-pkg-simple_src_install

	dodoc README.html header.gif style.css || die
}

pkg_postinst() {
	einfo "========================================"
	einfo "Add the module name into the /etc/conf.d/wowza-media-server file:"
	einfo "MODULE=\"${PN}\""
	einfo "========================================"
}
