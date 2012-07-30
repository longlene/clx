# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit versionator autotools

MY_PV_1=$(get_version_component_range 1-3)
MY_PV_2=$(get_version_component_range 4-)

DESCRIPTION="a Gtk+ theming engine for Gtk+ 3"
HOMEPAGE="https://launchpad.net/unico"
SRC_URI="https://launchpad.net/ubuntu/+archive/primary/+files/gtk3-engines-unico_${MY_PV_1}%2Br${MY_PV_2}.orig.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug"

RDEPEND=">=x11-libs/gtk+-3.0.12
	dev-libs/glib
	>=x11-libs/cairo-1.10"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	sys-apps/sed"

S="${WORKDIR}"/unico-${MY_PV_1}+r${MY_PV_2}

src_prepare() {
	sed -i -e "s:gtk_req, 3.1.6:gtk_req, 3.0.12:" configure.ac
	eautoreconf
}

src_configure() {
	econf $(use_enable debug) || die "econf failed"
}
