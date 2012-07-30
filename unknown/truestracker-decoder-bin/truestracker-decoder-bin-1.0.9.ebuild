# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Decoder for truestracker.de (German)"
HOMEPAGE="http://truestracker.de/"
SRC_URI="http://truestracker.de/decoder/Decoder_${PV}.jar"
LICENSE="as-is"

SLOT="0"
KEYWORDS="~x86 ~amd64"

RDEPEND=">=virtual/jre-1.5"

RESTRICT="strip"

S=${WORKDIR}

src_unpack() {
	cp ${DISTDIR}/${A} ${S}/Decoder.jar
}

src_install() {
	dodir /opt/${PN}

	cp Decoder.jar ${D}/opt/${PN}/ || die "jar-file missing"

	cat >truesdecoder<<EOF
#!/bin/sh
java -jar /opt/${PN}/Decoder.jar -nogui $@
EOF
	dobin truesdecoder
	
	cat >truesdecoder-gui<<EOF
#!/bin/sh
java -jar /opt/${PN}/Decoder.jar $@
EOF
	dobin truesdecoder-gui
}
