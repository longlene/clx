# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="FreeRapid is a simple Java downloader that supports downloading from Rapidshare and other file-sharing services."
HOMEPAGE="http://wordrider.net/freerapid/"
SRC_URI="http://wordrider.net/download.php?file=FreeRapiD-${PV}.zip"

LICENSE="GPL"
KEYWORDS="x86 amd64"
RESTRICT="nomirror"

IUSE=""
SLOT="0"
DEPEND=">=virtual/jdk-1.6"
RDEPEND=">=virtual/jre-1.6
	app-misc/realpath"

S="${WORKDIR}/FreeRapid-${PV%%0}"
INSTALLDIR="/opt/${PN}"

pkg_setup () {
	# create the group for update plugins (och meens One Click Hosting)
	enewgroup och
}


src_unpack() {
	unpack ${A}
	# remove Windows and shell files
	find "${S}" -regex '.*\.\(exe\|bat\|chm\|ico\|sh\)$' | xargs rm --verbose
	# copy executor
	cp "${FILESDIR}/${PN}.sh" "${S}/${PN}" || die "Cannot copy an executor!"
	chmod 755 "${S}/${PN}"
#	# replace RapidShare Free with Premium account
#	if use premium; then
#		rm "${S}/plugins/rapidshare.frp" && \
#		cp "${DISTDIR}/rapidshare_premium.frp" "${S}/plugins/" || die "Unable to replace with RapidShare Premium!"
#	fi
	# update paths in logger configuration
	cd "${S}" && \
	cp "${FILESDIR}/logger.properties" "${S}/logdebug.properties" && \
	cp "${FILESDIR}/logger.properties" "${S}/logdefault.properties" && \
	zip -m -D "${S}/frd.jar" "logdebug.properties" "logdefault.properties" || die "Unable to reconfigure logger!"
}

src_compile() {
	if [ -e "${FILESDIR}/${PV}/MainApp.java" ]; then
		einfo "Recompiling MainApp.java ..."
		javac -cp "${S}/frd.jar" -d "${WORKDIR}" "${FILESDIR}/${PV}/MainApp.java" && \
		jar -uf "${S}/frd.jar" -C "${WORKDIR}" cz/vity/freerapid/core || \
		die "Unable to recompile MainApp.java"
		einfo "... OK"
	else
		ewarn "No MainApp.java to recompile"
	fi
}

src_install() {
	dodir "${INSTALLDIR}"
	mv "${S}/lib" "${S}/lookandfeel" "${S}/plugins" "${S}"/*.jar "${S}"/*.png "${S}/${PN}" "${D}/${INSTALLDIR}/" || die "Cannot install core-files"
	dodoc "${S}"/*.txt
	# env
	dodir /etc/env.d
	echo -e "PATH=${INSTALLDIR}\nROOTPATH=${INSTALLDIR}" > "${D}/etc/env.d/10${PN}"

	fowners -R root:och ${INSTALLDIR}/plugins
	fperms 775 ${INSTALLDIR}/plugins
	fperms 664 ${INSTALLDIR}/plugins/*
}
