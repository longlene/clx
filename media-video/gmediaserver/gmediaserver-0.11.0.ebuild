# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="a UPnP compatible media server"
HOMEPAGE="http://www.gnu.org/software/gmediaserver/"
SRC_URI="http://download.savannah.gnu.org/releases/gmediaserver/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="id3lib taglib nls"

RDEPEND=">=net-misc/upnp-1.2.1
	id3lib? ( >=media-libs/id3lib-3.8 )
	taglib? ( >=media-libs/taglib-1.4 )"

DEPEND="$RDEPEND
	>=dev-lang/perl-5.6
	sys-devel/flex
	dev-util/yacc
	nls? ( sys-devel/gettext )"

src_unpack() {
	unpack ${P}.tar.gz
	cd "${S}/.."
	epatch "${FILESDIR}"/${P}-upnp-1.3.x.patch
}

src_compile() {
	econf $(use_enable nls) || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	newconfd "${FILESDIR}"/gmediaserver.conf.d gmediaserver
	newinitd "${FILESDIR}"/gmediaserver.init.d gmediaserver
	dodoc NEWS README TODO AUTHORS
}

pkg_postinst() {
	einfo "Make sure you set up the network interface for GMediaServer and the"
	einfo "path to your media directories in /etc/conf.d/gmediaserver correctly."
}
