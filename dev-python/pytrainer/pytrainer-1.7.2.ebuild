# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Pytrainer is a tool to log all your sport excursion."
HOMEPAGE="http://sourceforge.net/projects/pytrainer"
SRC_URI="mirror://sourceforge/pytrainer/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="garmintools"

DEPEND="
        garmintools? ( app-misc/garmintools )
        >=dev-lang/python-2.6
	dev-libs/libxml2
        dev-libs/libxslt
	dev-python/pygtk
	dev-util/glade
        dev-python/matplotlib
        dev-python/soappy
        dev-python/pysqlite
        <=sci-geosciences/gpsbabel-1.3.5
        dev-python/gtkmozembed-python
	gnome-extra/zenity"

src_install() {
        distutils_src_install
        dodoc CHANGES INSTALL PLUGINS.README || die "dodoc failed"
}
