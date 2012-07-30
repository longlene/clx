# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/gvdown/gvdown-0.6.5.ebuild, 2008/04/15

inherit python

DESCRIPTION="(g)vdown is an application that can download videos from video sharing websites like YouTube, Google Video, Stage6 and so on."
SRC_URI="http://vdown.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"

IUSE=""

KEYWORDS="~amd64 ~x86"

DEPEND=">=dev-lang/python-2.5
	>=dev-python/pygtk-2"

src_install() { 
	insinto "/usr/$(get_libdir)/gvdown"
	doins "gvdown.glade"
	exeinto "/usr/$(get_libdir)/gvdown"
	doexe "cli.py" "gui.py" "main.py"
	doins -r po/
	insinto /usr/share/pixmaps/
	doins nonsrc/gvdown.xpm
	insinto /usr/share/applications/
	doins nonsrc/gvdown.desktop
	dosym "/usr/$(get_libdir)/gvdown/cli.py" /usr/bin/vdown
	dosym "/usr/$(get_libdir)/gvdown/gui.py" /usr/bin/gvdown
}
pkg_postinst() {
	elog "You can now start vdown with 'vdown URL1 URL2' and so on, you can"
	elog "start gvdown with Applications->Internet->GVDOWN or 'gvdown'."
}
