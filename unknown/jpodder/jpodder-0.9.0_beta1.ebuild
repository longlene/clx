# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils 
inherit versionator

JARFILE="install.jar"
MY_PN="jPodder"
MY_PV=$(get_version_component_range 1-2)beta1-unix
S="${WORKDIR}/${MY_PN}-${MY_PV}"
DESCRIPTION="A java-based cross-platform Podcast receiver."
HOMEPAGE="http://www.jpodder.com"
SRC_URI="mirror://sourceforge/${PN}/${MY_PN}-${MY_PV}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND=">=virtual/jdk-1.4.1"

izpack_gen_autoinstall() {
	local pre='<AutomatedInstallation langpack="eng">
	    <HelloPanel/>
	    <LicencePanel/>
	    <TargetPanel>
        <installpath>'
	local post='</installpath>
	    </TargetPanel>
	    <PacksPanel>
        <pack name="Base" index="0" selected="true"/>
        <pack name="API Docs" index="1" selected="false"/>
        <pack name="Sources" index="2"
		selected="false"/>
	    </PacksPanel>
	    <InstallPanel/>
	    <ShortcutPanel/>
	    <FinishPanel/>
		</AutomatedInstallation>'
	echo ${pre}${1}${post}
}

izpack_install() {
	# Tries to use iZpack's auto-installer
	# Set install dir using insinto().

	local inst_dir=$(echo ${D}/${INSDESTTREE}|sed -e 's/\/\/\//\//g')
	echo $(izpack_gen_autoinstall ${inst_dir}) >${WORKDIR}/auto-install.xml
	java -jar ${S}/${JARFILE} ${WORKDIR}/auto-install.xml 
}

src_install() {
	insinto /opt/jPodder
	izpack_install || die "Install failed!"

	# Got tired of messing with this. Can't get it to work!
	#newbin ${S}/bin/jpodder jpodder
	#insinto /usr/share/pixmaps
	#doins ${S}/imaging/jpodder32.png

	mkdir ${D}/usr
	mkdir ${D}/usr/bin
	mkdir ${D}/usr/share
	mkdir ${D}/usr/share/pixmaps
	echo -e "#!/bin/sh\ncd /opt/jPodder/bin/\n./jpodder" > ${D}/usr/bin/jpodder
	chmod 755 ${D}/usr/bin/jpodder
	cp ${D}/${INSDESTTREE}/imaging/jpodder32.png ${D}/usr/share/pixmaps/jpodder32.png
	make_desktop_entry "jpodder" "jPodder" "jpodder32.png" "AudioVideo;Player"
}
