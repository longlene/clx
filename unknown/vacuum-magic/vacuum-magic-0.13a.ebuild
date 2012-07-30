# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils games versionator

MY_PN="vacuum"
DESCRIPTION="Defend against monsters using a magical vacuum field"
HOMEPAGE="http://apocalypse.rulez.org/vacuum"
SRC_URI="mirror://sourceforge/${MY_PN}/${MY_PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-perl/sdl-perl
	virtual/perl-Compress-Raw-Zlib"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}-$(get_version_component_range 1-2 ${PV})"

src_unpack() {
	unpack ${A}
	cd "${S}"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
	dodoc AUTHORS ChangeLog NEWS README TODO
	newicon data/${MY_PN}.ico ${PN}.xpm
	make_desktop_entry ${MY_PN} "Vacuum Magic" ${PN}.xpm
	prepgamesdirs
}
