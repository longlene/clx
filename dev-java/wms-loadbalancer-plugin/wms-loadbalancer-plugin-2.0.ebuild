# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

JAVA_PKG_IUSE="source examples doc"

inherit java-pkg-2

MY_PN="LoadBalancer"

DESCRIPTION="Dynamic Load Balancing plugin for the Wowza Media Server."
SRC_URI="http://www.wowzamedia.com/downloads/forums/loadbalancer/${MY_PN}_${PV}.zip"
HOMEPAGE="http://www.wowzamedia.com/forums/showthread.php?t=4637"
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

src_install() {
	java-pkg_newjar lib/wms-plugin-loadbalancer.jar ${PN}.jar

	insinto /etc/wowza-media-server/conf
	doins conf/*

	dodoc README.html header.gif style.css || die

	use doc && java-pkg_dojavadoc documentation/javaapi

	use examples && java-pkg_doexamples client
}

pkg_postinst() {
	einfo "========================================"
	einfo "Add the module name into the /etc/conf.d/wowza-media-server file:"
	einfo "MODULE=\"${PN}\""
	einfo "========================================"
}
