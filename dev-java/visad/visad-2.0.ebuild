# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils java-pkg

DESCRIPTION="Library for interactive visualization and analysis of numerical data"
HOMEPAGE="http://www.ssec.wisc.edu/~billh/visad.html"
SRC_URI="ftp://ftp.ssec.wisc.edu/pub/visad-2.0/visad_src-${PV}.jar"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc source"

DEPEND=">=virtual/jdk-1.4
	>=dev-java/blackdown-java3d-bin-1.3
	source? ( app-arch/zip )"
RDEPEND=">=virtual/jre-1.4
	>=dev-java/blackdown-java3d-bin-1.3"

src_unpack() {
	mkdir -p ${P}/src
	cd ${P}/src
	jar -xf ${DISTDIR}/visad_src-${PV}.jar || die "Cannot unpack the source"
}

src_compile() {
	mkdir build dist
	find src/ -name "*.java" | xargs javac -J"-mx128m" -d build \
		-classpath $(java-pkg_getjars blackdown-java3d-bin) \
		-sourcepath src/ -nowarn || die "Failed to compile ${i}"
	
	if use doc ; then
		mkdir -p dist/doc
		find src/ -name "*.java" | xargs javadoc -J"-Xmx128m" -d dist/doc/ \
		-sourcepath src/ -quiet \
		-classpath $(java-pkg_getjars blackdown-java3d-bin) \
		|| die "Failed to generate javadoc"
	fi
}

src_install() {
	echo "Creating JAR"
	jar cf dist/${PN}.jar -C build .
	java-pkg_dojar dist/*.jar

	if use source ; then
		java-pkg_dosrc src/*
	fi

	if use doc ; then
		java-pkg_dohtml -r dist/doc/*
	fi
}
