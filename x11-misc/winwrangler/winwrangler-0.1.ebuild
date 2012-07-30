# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator

MY_CRV=$(get_version_component_range 1-2)

DESCRIPTION="Small desktop daemon to perform advanced window manipulations not commonly found in window managers"
HOMEPAGE="http://launchpad.net/winwrangler"
SRC_URI="http://launchpad.net/${PN}/${MY_CRV}/${PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-libs/glib-2.16
	>=x11-libs/gtk+-2.12
	>=x11-libs/libwnck-2.22
	>=x11-libs/gtkhotkey-0.2"

DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.20
	>=dev-util/intltool-0.35.0
	sys-devel/gettext"

src_install(){
	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc AUTHORS ChangeLog HACKING NEWS README
}

