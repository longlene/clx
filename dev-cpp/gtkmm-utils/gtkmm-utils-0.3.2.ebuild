# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils versionator

MY_PVM=$(get_version_component_range 1-2)

DESCRIPTION="Utility functions, classes and widgets written on top of gtkmm and glibmm."
HOMEPAGE="http://live.gnome.org/gtkmm_utils"
SRC_URI="http://download.savannah.gnu.org/releases/${PN}/${MY_PVM}/${P}.tar.bz2"
LICENSE="LGPL-2"

SLOT="0"
KEYWORDS="~x86"
IUSE="doc"

DEPEND="doc? ( app-doc/doxygen )
	dev-util/pkgconfig
	${DEPEND}"
RDEPEND=">=dev-cpp/gtkmm-2.10.0"

src_compile() {
	econf $(use_enable doc documentation) || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}