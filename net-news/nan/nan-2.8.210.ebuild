# Copyright 1999-2004 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

SLOT="0"
LICENSE="BSD mindterm"
KEYWORDS="x86 ppc sparc"

DESCRIPTION="An NNTP news client in Java"
SRC_URI="http://resume.technoplaza.net/download/java/nan-${PV}-source.tar.bz2"
HOMEPAGE="http://resume.technoplaza.net/nan/"
IUSE="jikes doc"

RDEPEND=">=virtual/jdk-1.4"
DEPEND="${RDEPEND}
	>=dev-java/ant-1.5.4
	jikes? ( >=dev-java/jikes-1.17 )"
	
src_compile() {
	local antflags=""

	if use jikes ; then
		einfo "you can safely ignore these jikes errors"
		einfo "jikes is just too pedantic..."
		antflags="${antflags} -Dbuild.compiler=jikes"
	fi
	
	use doc && antflags="${antflags} javadoc"
	ant jar ${antflags} || die "compilation error"
}

src_install() {
	dodir /usr/share/nan
	dodir /usr/share/nan/documentation
	dodir /usr/bin
	
	dodoc documentation/history.txt
	cp documentation/index.html documentation/*.png ${D}/usr/share/doc/nan-${PV}/
	use doc && cp -R documentation/javadoc ${D}/usr/share/doc/chtdecoder-${PV}/
	
	cp -R NaN.jar library license ${D}/usr/share/nan
	cp documentation/internal.html ${D}/usr/share/nan/documentation
	
	cat >${D}/usr/share/nan/nan.sh <<-EOF
		#! /bin/sh
		
		cd /usr/share/nan ; java -jar NaN.jar \$@
	EOF
	chmod 755 ${D}/usr/share/nan/nan.sh
	
	ln -s ../share/nan/nan.sh ${D}/usr/bin/nan
}

