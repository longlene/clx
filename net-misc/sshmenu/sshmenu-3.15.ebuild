# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="A gnome applet for connecing to hosts using SSH.\
	Works without gnome as well."
HOMEPAGE="http://sshmenu.sourceforge.net"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE="gnome"

DEPEND=""
RDEPEND="=dev-lang/ruby-1.8*
	dev-ruby/ruby-gtk2
	dev-ruby/ruby-gconf2
	dev-ruby/ruby-panel-applet2
	|| ( net-misc/x11-ssh-askpass net-misc/getk2-ssh-askpass )"

src_unpack() {
	unpack ${A}
	cd ${S}
}

src_install() {
	insinto /usr/lib/ruby/1.8
	use gnome && doins lib/gnome-sshmenu.rb
	use gnome || doins lib/sshmenu.rb
	use gnome && dobin bin/sshmenu-gnome
	use gnome || dobin bin/sshmenu
	
	insinto /usr/lib/gnome-panel
	doins sshmenu-applet

	insinto /usr/share/icons/hicolor/48x48/apps
	doins gnome-sshmenu-applet.png
	insinto /usr/lib/bonobo/servers
	doins sshmenu-applet.server

	doman sshmenu.1
	dodoc README Changes License.txt
}
pkg_postinst() {
	elog "See http://sshmenu.sourceforge.net/setup/ for further configuration."
}
