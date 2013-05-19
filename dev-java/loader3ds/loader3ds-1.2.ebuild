# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="Java3D 3DS FileLoader."
HOMEPAGE="http://sourceforge.net/projects/java3dsloader/"
SRC_URI="mirror://sourceforge/java3dsloader/Loader3DS${PV/./_}src.jar"
LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

COMMON_DEPEND="
	dev-java/ant-core
	>=dev-java/sun-java3d-bin-1.5.0"

DEPEND=">=virtual/jdk-1.4
	app-arch/unzip
	${COMMON_DEPEND}"

RDEPEND=">=virtual/jre-1.4
	${COMMON_DEPEND}"

S="${WORKDIR}/${PN}"

src_unpack() {
	unpack ${A}

	mkdir ${PN}
	mv ./com ./META-INF ./EVGREEN.JPG ./bounce.3DS ${PN}

	cd "${S}"

	# copy new build.xml
	cp -f ${FILESDIR}/build.xml ./

	# create directory for dependencies
	mkdir lib
	cd lib

	# add dependencies into the lib dir
	java-pkg_jar-from sun-java3d-bin j3dcore.jar
	java-pkg_jar-from sun-java3d-bin j3dutils.jar
	java-pkg_jar-from sun-java3d-bin vecmath.jar
}

src_install() {
	java-pkg_dojar ${S}/target/${PN}.jar
}
