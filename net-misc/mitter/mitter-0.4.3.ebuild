# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

inherit distutils eutils

DESCRIPTION="A maemo/GTK+ client for twitter"
HOMEPAGE="http://code.google.com/p/mitter/"
SRC_URI="http://mitter.googlecode.com/files/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE="+gtk tty cmd"

RDEPEND="gtk? ( dev-python/pygtk )
	dev-python/simplejson"

DEPEND="${RDEPEND}
	dev-python/setuptools"

preinst() {
	use gtk || rm "${WORKDIR}/${P}/mitterlib/ui/ui_pygtk.py"
	use tty || rm "${WORKDIR}/${P}/mitterlib/ui/ui_tty.py"
	use cmd || rm "${WORKDIR}/${P}/mitterlib/ui/ui_cmd.py"
	(! use gtk) && (! use tty) && (! use cmd) && die "You should select something interface"
}

src_install() {
	distutils_src_install
	use gtk && (make_desktop_entry "mitter" "Mitter" "mitter.png" "Application;Network" || die "make_desktop_entry failed")
}
