# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

JAVA_PKG_IUSE="source"

inherit java-pkg-2 java-pkg-simple

MY_PN="TextChat"
MY_PV_ORIG="${PV/_p*}"
MY_WPN="WowzaMediaServer"
MY_PKG="${MY_WPN}-${MY_PV_ORIG}.tar.bin"

DESCRIPTION="Text Chat plugin for the Wowza Media Server."
SRC_URI="http://www.wowzamedia.com/downloads/${MY_WPN}-${MY_PV_ORIG//./-}/${MY_PKG}"
HOMEPAGE="http://www.wowzamedia.com"
LICENSE="WowzaMediaServerEULA-2.0"
SLOT="0"
RESTRICT=""
KEYWORDS="~amd64 ~x86"
IUSE="examples"

DEPEND="app-arch/unzip"
RDEPEND=">=dev-java/wowza-media-server-2.0.0"

S="${WORKDIR}/examples/${MY_PN}"

JAVA_PKG_WANT_SOURCE="1.6"
JAVA_PKG_WANT_TARGET="1.6"

JAVA_SRC_DIR="${S}/src"
JAVA_GENTOO_CLASSPATH="wowza-media-server,log4j"

src_unpack() {
	# create and unpack main release
	tail -n +697 ${DISTDIR}/${MY_PKG} > ${T}/${PN}.tar.gz || die 'Can not create tar.gz file!'
	unpack "../temp/${PN}.tar.gz"
}

src_install() {
	java-pkg-simple_src_install

	use source && java-pkg_dosources src

	if use examples; then
		# install example
		java-pkg_doexamples client* conf README.html

		# create new installation script
		INST="install.sh"

		echo '#!/bin/sh' > ${INST} || die
		echo "echo 'Installing ${MY_PN}...'" >> ${INST} || die
		echo "cp -r /usr/share/doc/${PF}/examples/conf/* /etc/wowza-media-server/conf/" >> ${INST} || die
		echo "mkdir /etc/wowza-media-server/applications/textchat" >> ${INST} || die

		# install the install.sh script
		exeinto /usr/share/doc/${PF}/examples
		doexe ${INST}
	fi
}

pkg_postinst() {
	einfo "========================================"
	einfo "Add the module name into the /etc/conf.d/wowza-media-server file:"
	einfo "MODULE=\"${PN}\""
	einfo "========================================"
}
