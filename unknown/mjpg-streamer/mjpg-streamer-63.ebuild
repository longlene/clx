# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="MJPG-Streamer - Grabs images from a v4l and v4l2 webcam devices."
HOMEPAGE="http://sourceforge.net/projects/mjpg-streamer"
SRC_URI="mirror://sourceforge/${PN}/${PN}-r${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-libs/jpeg"
DEPEND="${RDEPEND}"

MY_PN="${PN//-/_}"
S="${WORKDIR}/${PN}-r${PV}"

src_unpack() {
	unpack ${A}
	cd ${S}

	sed -i -e "s/-O2//" ${S}/Makefile 
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	into /usr
	dobin "${S}"/${MY_PN}
	dolib.so "${S}"/*.so

	dodir /usr/share/${PN}
	cp -R "${S}"/www "${D}"/usr/share/${PN}

	dodoc LICENSE README

	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newconfd "${FILESDIR}"/${PN}.confd ${PN}
}

pkg_postinst() {
	einfo "Remember to set an input and output plugin for mjpg-streamer!"
	einfo "An example webinterface has been installed into"
	einfo "/usr/share/mjpg-streamer/www for your usage!"
}

