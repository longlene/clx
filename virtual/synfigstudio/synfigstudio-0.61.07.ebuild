# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Synfig: Film-Quality Vector Animation (main UI)"
HOMEPAGE="http://www.synfig.com/"
SRC_URI="mirror://sourceforge/synfig/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="fmod"

RDEPEND="	>=dev-cpp/gtkmm-2.4.0
			>=media-gfx/synfig-${PV}
			>=dev-libs/libsigc++-2.0
			>=sys-devel/libtool-1.3.5
			fmod? ( media-libs/fmod )"

src_compile() {
	econf \
		$(use_with fmode libfmod ) \
		|| die "Configure failed!"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install	failed!"
}
