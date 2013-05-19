# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils java-pkg

DESCRIPTION="Ptplot is a set of two dimensional signal plotters components written in Java"

# Homepage
HOMEPAGE="http://ptolemy.eecs.berkeley.edu/java/ptplot5.5/ptolemy/plot/doc/index.htm"

SRC_URI="http://ptolemy.eecs.berkeley.edu/java/ptplot${PV}/ptolemy/plot/${PN}${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE="doc source"

RDEPEND=">=virtual/jre-1.4"
DEPEND=">=virtual/jdk-1.4"

S=${WORKDIR}/${PN}${PV}

src_compile() {
	export PTII=${S}
	# remove all the jar and class files to force source compilation
	make clean 
	econf || die "econf failed"
    # usefull ?
	# make -C com/microstar/
	emake || die "emake failed"
}

src_install() {
	# "installs" everiting in the work dir 
	make install 

    # usefull ?
	# make install -C com/microstar/

	if use doc ; then
		java-pkg_dohtml -r doc
	fi

	dobin bin/ptinvoke
	dosym /usr/bin/ptinvoke  /usr/bin/histogram
	dosym /usr/bin/ptinvoke  /usr/bin/ptplot
	dosym /usr/bin/ptinvoke  /usr/bin/pxgraph
	
	
	if use source; then 
		java-pkg_dosrc ptolemy/*
		# usefull ?
		# java-pkg_dosrc com/*
	fi
	
	java-pkg_dojar ${S}/ptolemy/gui/gui.jar || die " installing gui.jar"
	java-pkg_dojar ${S}/ptolemy/plot/*.jar || die "installingptolemy/plot/*.jar " 
	java-pkg_dojar ${S}/ptolemy/util/*.jar || die " installing ptolemy/util/*.jar"

	# usefull ?
    # java-pkg_dojar ${S}/com/microstar/xml/xml.jar || die " installing xml.jar"
}
