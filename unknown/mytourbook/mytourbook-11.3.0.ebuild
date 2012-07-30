# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="2"

inherit eutils

MY_PN="MyTourbook"

DESCRIPTION="Visualize and analyze tours which are recorded by a GPS device, bike- or exercise computer and ergometer."
HOMEPAGE="http://mytourbook.sourceforge.net/mytourbook/"
SRC_URI="amd64? ( mirror://sourceforge/${PN}/${PN}_${PV}.linux.gtk.x86_64.zip )
	x86? ( mirror://sourceforge/${PN}/${PN}_${PV}.linux.gtk.x86.zip )"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=">=virtual/jdk-1.6.0
	dev-java/swt[cairo]"

S="${WORKDIR}/${PN}"

src_prepare() {
	# remove bundled cairo-swt with its licenses
	rm "libcairo-swt.so"
	rm "about.html"
	rm -rf "about_files"
}

src_install() {
	dodir /opt/${PN}
	cp -r {configuration,features,plugins,mytourbook*,.eclipseproduct} "${D}"/opt/${PN}/ || die "Install failed"

	dosym "${D}"/opt/${PN}/${PN} "/usr/bin/${PN}"

	newicon icon.xpm ${PN}.xpm
	make_desktop_entry ${PN} ${MY_PN} ${PN} "Utility"
}
