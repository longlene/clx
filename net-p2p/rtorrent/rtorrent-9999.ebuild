# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit subversion

DESCRIPTION=""
HOMEPAGE="http://libtorrent.rakshasa.no"
ESVN_REPO_URI="svn://rakshasa.no/libtorrent/trunk/rtorrent"
ESVN_BOOTSTRAP="autogen.sh"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="daemon debug ipv6 xmlrpc"

DEPEND=">=net-libs/libtorrent-0.12.3-r2
>=dev-libs/libsigc++-2.2.2
>=net-misc/curl-7.19.1
sys-libs/ncurses
xmlrpc? ( dev-libs/xmlrpc-c )"
RDEPEND="${DEPEND}
daemon? ( app-misc/screen )"

src_unpack() {
subversion_src_unpack
}

src_configure() {
econf \
$(use_enable debug debug extra-debug werror) \
$(use_enable ipv6) \
$(use_with xmlrpc xmlrpc-c) \
|| die "econf failed"
}

src_install() {
emake DESTDIR="${D}" install || die "make install failed"
dodoc AUTHORS README TODO doc/rtorrent.rc

if use daemon; then
newinitd "${FILESDIR}/rtorrentd.init" rtorrentd || die "newinitd failed"
newconfd "${FILESDIR}/rtorrentd.conf" rtorrentd || die "newconfd failed"
fi
}
