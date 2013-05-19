# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header $

JAVA_PKG_IUSE="examples"

inherit java-pkg-2 java-pkg-simple

MY_PN="GeoIPJava"

DESCRIPTION="Java library for lookup countries by IP addresses."
SRC_URI="http://geolite.maxmind.com/download/geoip/api/java/${MY_PN}-${PV}.zip"
HOMEPAGE="http://www.maxmind.com/app/ip-location"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND=">=virtual/jre-1.4"
DEPEND=">=virtual/jdk-1.4"

S="${WORKDIR}/${MY_PN}-${PV}"

JAVA_SRC_DIR="${S}/source"


src_install() {
	java-pkg-simple_src_install

	dodoc README LICENSE Changes || die

	use examples && java-pkg_doexamples *.java
}

pkg_postinst() {
	einfo "Country and City data files can be downloaded here:"
	einfo "  http://www.maxmind.com/app/geolitecountry"
	einfo "  http://www.maxmind.com/app/geolitecity"
}
