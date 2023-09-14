# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

EAPI=8
ESVN_REPO_URI="https://lincetorrent.svn.sourceforge.net/svnroot/lincetorrent/trunk"

inherit subversion


#MY_PV="${PV/_}"
#MY_P="Lince-${MY_PV}"

DESCRIPTION="a light, powerfull and full feature gtkmm bittorrent client"
HOMEPAGE="http://lincetorrent.sourceforge.net"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE="dbus libnotify"

RDEPEND="dev-cpp/gtkmm:2.4
	dev-cpp/cairomm
	>=dev-cpp/glibmm-2.16
	>=net-libs/rb_libtorrent-0.14.1
	dev-libs/libxml2
	sys-devel/gettext
	dbus? ( dev-libs/dbus-glib )
	libnotify? ( x11-libs/libnotify )"
DEPEND="${RDEPEND}
	dev-util/intltool"

S=${WORKDIR}/${PN}

src_unpack() {
	subversion_src_unpack

	cd "${S}"

}

src_compile() {
	autoreconf -i --force
	econf \
		$(use_with dbus) \
		$(use_with libnotify) || die "econf failed"
	emake || die "emake failed"
}

src_install () {
	emake DESTDIR="${D}" install || die "emake install failed"
}
