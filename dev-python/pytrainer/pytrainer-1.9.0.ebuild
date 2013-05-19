# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.6"

inherit autotools distutils

DESCRIPTION="Pytrainer is a tool to log all your sport excursion."
HOMEPAGE="http://sourceforge.net/projects/pytrainer"
SRC_URI="mirror://sourceforge/pytrainer/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="gpsbabel garmintools gdal dotclear"

DEPEND="
        gpsbabel? ( =sci-geosciences/gpsbabel-1.3.5 )
        garmintools? ( app-misc/garmintools )
        gdal? ( sci-libs/gdal )
        dotclear? ( dev-python/soappy )
        >=dev-lang/python-2.6
	dev-libs/libxml2
        dev-python/lxml
        dev-python/pysqlite
	dev-util/glade
	dev-python/pygtk
        dev-python/matplotlib
        dev-python/numpy
        dev-libs/libxslt
        dev-python/pywebkitgtk
        dev-python/gtkmozembed-python
	dev-python/sqlalchemy
        dev-python/sqlalchemy-migrate
	gnome-extra/zenity"

src_prepare() {
	cp "${S}"/man/manpage_pytrainer.src "${S}"/man/pytrainer.7
}

src_install() {
        distutils_src_install
        dodoc CHANGES INSTALL PLUGINS.README || die "dodoc failed"
	doman man/pytrainer.7 || die "doman failed"
}
