# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils
# like the classic version
MY_VERSION="4.2"
MY_P="eclipse-SDK-${MY_VERSION}-linux-gtk"
MY_PN="eclipse-classic"

#SRC_BASE="http://www.eclipse.org/downloads/download.php?file=/eclipse/downloads/drops4/R-${MY_VERSION}-201206081400/${MY_P}"
# &r=1 #downloading speed too slow 
SRC_BASE="http://developer.eclipsesource.com/technology/epp/juno4/${MY_P}"

DESCRIPTION="Eclipse SDK Classic"
HOMEPAGE="http://www.eclipse.org"
SRC_URI="
	amd64? ( ${SRC_BASE}-x86_64.tar.gz -> ${MY_P}-x86_64.tar.gz )
	x86? ( ${SRC_BASE}.tar.gz -> ${MY_P}.tar.gz )"

LICENSE="EPL-1.0"
SLOT="4.2"
KEYWORDS="~*"
IUSE=""

# some files may conflict with eclipse-sdk-bin,
RDEPEND="
	>=virtual/jdk-1.6
	x11-libs/gtk+:2"

S=${WORKDIR}/eclipse

src_install() {
	local dest=/opt/${MY_PN}-${SLOT}

	insinto ${dest}
	doins -r features icon.xpm plugins artifacts.xml p2 eclipse.ini configuration dropins

	exeinto ${dest}
	doexe eclipse

	dohtml -r about.html about_files epl-v10.html notice.html readme/*

	insinto /etc
	doins "${FILESDIR}"/eclipserc-bin-${SLOT}

	dobin "${FILESDIR}"/eclipse-bin-${SLOT}
	make_desktop_entry "eclipse-bin-${SLOT}" "Eclipse Classic ${PV} (bin)" "${dest}/icon.xpm"
}
