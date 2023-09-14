# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_IN_SOURCE_BUILD=1
inherit cmake

DESCRIPTION="Dynamic-playlist will search for similar songs/artists on last.fm"
HOMEPAGE="http://gmpc.wikia.com/wiki/GMPC_PLUGIN_DYNAMIC_PLAYLIST"
SRC_URI="http://bitbucket.org/misery/dynamic-playlist/downloads/${P}.tar.gz"
LICENSE="GPL-2"

SLOT=0
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~ppc-macos ~s390 ~sh ~sparc ~sparc-fbsd ~x86 ~x86-fbsd"
IUSE=""
DEPEND=">=dev-util/cmake-2.6.0
	>=x11-libs/gtk+-2.12
	>=media-libs/libmpd-0.18.0
	>=media-sound/gmpc-0.18.1"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
